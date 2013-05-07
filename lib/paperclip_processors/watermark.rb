module Paperclip
  class Watermark < Processor
 
    ##
    # A Paperclip::Processor for watermarking images with imagemagick's
    # composite command.
    #
    # Place this code in lib/paperclip_processors/watermark.rb or into a Rails initializer.
    #
    #   Example:  All orginal files are resized to be at most 480 pixels in
    #             height.
    #
    #   class User < ActiveRecord::Base
    #     has_attached_file :avatar, :processors => [:thumbnail, :watermark],
    #                                :styles => { :original => "x480>" }
    #
    #     attr_accessor :watermark
    #   end
    #
    #   Creation: the watermark attribute *must* be set on the new instance
    #   before a file is assigned to the attachment e.g.
    #
    #   user = User.create! do |user|
    #            user.watermark = Rails.root.join('public/images/rails.png').to_s
    #            user.avatar = File.new('/home/mike/Desktop/photo.jpg')
    #          end
 
    def initialize file, options = {}, attachment = nil
      @file       = file
      @options    = options
      @attachment = attachment
 
      @enabled        = attachment.content_type =~ /^image\/.*/
      @whiny          = options[:whiny].nil? ? true : options[:whiny]
      @format         = options[:format]
      @current_format = File.extname(@file.path)
      @basename       = File.basename(@file.path, @current_format)
 
      @watermark = options[:watermark_path]
    end
 
    def make
      if @enabled
        watermark
      else
        noop
      end
    end
 
    def watermark
      src = @file
      format = @format.blank? ? @current_format : @format
      basename = @basename.blank? ? 'file' : @basename
 
      dst = Tempfile.new([basename, format].compact.join("."))
      dst.binmode
 
      parameters = "-gravity southeast :watermark :source :dest"
      begin
        success = Paperclip.run("composite", parameters,
                    :watermark => @watermark,
                    :source => File.expand_path(src.path),
                    :dest => File.expand_path(dst.path))
 
      rescue Cocaine::CommandLineError
        raise PaperclipError, "There was an command line error with imagemagick's composite command for #{@basename}" if @whiny
      rescue Cocaine::ExitStatusError => e
        raise PaperclipError, "There was an error processing the watermark for #{@basename}" if @whiny
      rescue Cocaine::CommandNotFoundError => e
        raise Paperclip::CommandNotFoundError.new("Could not run the `convert` command. Please install imagemagick.")
      end
 
      dst
    end
 
    def noop
      src = @file
      format = @format.blank? ? @current_format : @format
      basename = @basename.blank? ? 'file' : @basename
 
      dst = Tempfile.new([@basename, format].compact.join("."))
      dst.binmode
 
      src.rewind
      dst.write(src.read)
      dst.flush
      dst.rewind
 
      dst
    end
 
  end
end
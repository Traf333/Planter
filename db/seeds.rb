#encoding: UTF-8

# Initialize system roles.
p 'Загрузка ролей...'
Role.delete_all

empty_role = {

    :users => {
        :edit => true,
        :show => true,
        :update => true
    },
}

admin_role = {

    :system => {
        :administrator => true
    }
}

admin_title = 'Администратор'
Role.create(:name => 'admin',
            :title => admin_title, :description => admin_title,
            :the_role => admin_role.to_json)

user_title = 'Пользователь'
Role.create(:name => 'user',
            :title => user_title, :description => user_title,
            :the_role => empty_role.to_json)

seller_title = 'Продавец'
Role.create(:name => 'seller',
            :title => seller_title,
            :description => seller_title,
            :the_role => empty_role.to_json)

nursery_title = 'Питомник'
Role.create(:name => 'nursery',
            :title => nursery_title, :description => nursery_title,
            :the_role => empty_role.to_json)

professional_title = 'Профессионал рынка'
Role.create(:name => 'professional',
            :title => professional_title, :description => professional_title,
            :the_role => empty_role.to_json)

p 'Роли загружены'


# Initialize countries.
p 'Загрузка стран...'
Country.delete_all

Country.create(:name => "Россия")
Country.create(:name => "Абхазия")
Country.create(:name => "Австралия")
Country.create(:name => "Австрия")
Country.create(:name => "Азербайджан")
Country.create(:name => "Аргентина")
Country.create(:name => "Армения")
Country.create(:name => "Беларусь")
Country.create(:name => "Белиз")
Country.create(:name => "Бельгия")
Country.create(:name => "Болгария")
Country.create(:name => "Бразилия")
Country.create(:name => "Великобритания")
Country.create(:name => "Венгрия")
Country.create(:name => "Вьетнам")
Country.create(:name => "Гаити")
Country.create(:name => "Гваделупа")
Country.create(:name => "Германия")
Country.create(:name => "Голландия")
Country.create(:name => "Греция")
Country.create(:name => "Грузия")
Country.create(:name => "Дания")
Country.create(:name => "Израиль")
Country.create(:name => "Египет")
Country.create(:name => "Индия")
Country.create(:name => "Иран")
Country.create(:name => "Ирландия")
Country.create(:name => "Испания")
Country.create(:name => "Италия")
Country.create(:name => "Казахстан")
Country.create(:name => "Камерун")
Country.create(:name => "Канада")
Country.create(:name => "Кипр")
Country.create(:name => "Киргызстан")
Country.create(:name => "Китай")
Country.create(:name => "Коста-Рика")
Country.create(:name => "Кувейт")
Country.create(:name => "Латвия")
Country.create(:name => "Ливия")
Country.create(:name => "Литва")
Country.create(:name => "Люксембург")
Country.create(:name => "Мексика")
Country.create(:name => "Молдова")
Country.create(:name => "Монако")
Country.create(:name => "Новая Зеландия")
Country.create(:name => "Норвегия")
Country.create(:name => "Польша")
Country.create(:name => "Португалия")
Country.create(:name => "Реюньон")
Country.create(:name => "Сальвадор")
Country.create(:name => "Словакия")
Country.create(:name => "Словения")
Country.create(:name => "Суринам")
Country.create(:name => "США")
Country.create(:name => "Таджикистан")
Country.create(:name => "Туркменистан")
Country.create(:name => "Туркс и Кейкос")
Country.create(:name => "Турция")
Country.create(:name => "Уганда")
Country.create(:name => "Узбекистан")
Country.create(:name => "Украина")
Country.create(:name => "Финляндия")
Country.create(:name => "Франция")
Country.create(:name => "Чехия")
Country.create(:name => "Швейцария")
Country.create(:name => "Швеция")
Country.create(:name => "Эстония")
Country.create(:name => "Югославия")
Country.create(:name => "Южная Корея")
Country.create(:name => "Япония")

p 'Страны загружены'


p 'Загрузка тарифных планов'

MemberTariff.create(:name => "Простой", :description => "Самый дешевый тарифный план.")
MemberTariff.create(:name => "Оптовик", :description => "Хороший, багатый тарифный план.")
MemberTariff.create(:name => "Оптовик PRO", :description => "Очень очень хорошо.")

p 'Тарифные планы загружены'


p 'Загрузка типов адресов участников'

MemberAddressType.create(:name => "Офис")
MemberAddressType.create(:name => "Площадка")
MemberAddressType.create(:name => "Теплица")
MemberAddressType.create(:name => "Питомник")

p 'Адреса загружены'
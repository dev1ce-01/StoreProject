create database StoreDB;

use StoreDB;


create table Users(
	id int identity(1,1) primary key,
	[user_name] nvarchar(50) not null,
	[password] nvarchar(50) not null
);

create table Categories(
	id_category int primary key not null,
	[name] nvarchar(50) not null
)

create table Products(
	id_category int foreign key references Categories(id_category),
	id_product int not null,
	product_name nvarchar(50) not null,
	price float not null,
	primary key(id_category,id_product)
);

create table Product_Description(
id_category int not null,
id_product int not null,
[description] nvarchar(max),
);

create table Comments(
id_category int not null,
id_product int not null,
comment nvarchar(max)
)

alter table Product_Description
add constraint FK_id_product foreign key (id_category,id_product) references Products(id_category,id_product);

alter table Comments
add constraint FK_id_product_category foreign key (id_category,id_product) references Products(id_category,id_product);


insert into Users values('Mike',123456);

insert into Categories values(1,'Смартфоны и Планшеты');
insert into Categories values(2,'Телевизоры и Мониторы');
insert into Categories values(3,'Ноутбуки и компьютеры');
insert into Categories values(4,'Компьютерные оборудовании');
insert into Categories values(5,'Фототехника и гаджеты');
insert into Categories values(6,'Бытовая Техника');
insert into Categories values(7,'Спортивные товары');

-----

insert into Products values(1,1,'Samsung Galaxy A02 Red 16gb',49900);
insert into Products values(1,2,'Samsung Galaxy A12 White 32gb',79900);
insert into Products values(1,3,'Samsung Galaxy U21 Ultra',121990);
insert into Products values(1,4,'Samsung Galaxy A41 White 64gb',109900);
insert into Products values(1,5,'Samsung Galaxy A51 Black 32gb',104990);
insert into Products values(1,6,'Samsung Galaxy S20 Black 128gb',219900);
insert into Products values(1,7,'Apple IPhone XR Slim Box Black 64gb',333990);
insert into Products values(1,8,'Apple IPhone 12 Pro Max Black 256gb',399990);
insert into Products values(1,9,'Apple IPhone 11 Black 128gb',389990);
insert into Products values(1,10,'Apple IPhone SE 2020 Grey 128gb',274990);
insert into Products values(1,11,'Xiaomi Poco M3 Black 64gb',69990);
insert into Products values(1,12,'Xiaomi Redmi Note 9 Black 128gb',99990);
insert into Products values(1,13,'Xiaomi Redmi Note 9 Pro 128gb',139990);

insert into Products values(2,1,'TV SAMSUNG UE75TU7100UXCE Smart 4K UHD',449900);
insert into Products values(2,2,'TV LG 43UN71006LB Smart 4K UHD',184990);
insert into Products values(2,3,'TV LG 55UN73506LB Smart 4K UHD',239990);
insert into Products values(2,4,'TV SAMSUNG UE43TU7100UXCE Smart 4K UHD',194990);
insert into Products values(2,5,'TV TCL 32S60A, HD',79990);
insert into Products values(2,6,'M Samsung LC24F396FHIXCI, HD',63990);
insert into Products values(2,7,'M AOC G2790PX 27',160990);
insert into Products values(2,8,'M HP OMEN 25',110900);
insert into Products values(2,9,'M Samsung LS24R350FHI',57990);

insert into Products values(3,1,'Ноутбук Acer A315-57G',279900);
insert into Products values(3,2,'Ноутбук Acer A515-55G',279900);
insert into Products values(3,3,'Ноутбук Lenovo IP 5 14ARE05',319900);
insert into Products values(3,4,'Ноутбук Asus UX425JA',359990);
insert into Products values(3,5,'Ноутбук Asus TUF Gaming A15',359990);	
insert into Products values(3,6,'Ноутбук Acer Nitro 5 AN515-43',379990);
insert into Products values(3,7,'Ноутбук HP Gaming Pavilion 15-ec0058ur',339990);
insert into Products values(3,8,'Ноутбук Lenovo IdeaPad Gaming 3 15IMH05',349990);
insert into Products values(3,9,'Ноутбук Lenovo Legion Y540(81SY0)',339990);

insert into Products values (4,1,'Клавиатура беспроводная SVEN KB-C2200W',6990);
insert into Products values (4,2,'Клавиатура игровая Oklick 700G',8990);
insert into Products values (4,3,'Мышка беспроводная SVEN RX-510SW',3990);
insert into Products values (4,4,'Мышь игровая Bloody W60-Max',9990);
insert into Products values (4,5,'Игровая мышка GENESIS XENON 210 ',8590);

insert into Products values (5,1,'Цифровая фотоаппарат CANON POWERSHOT G7',59990);
insert into Products values (5,2,'Цифровая фотоаппарат SONY DSCRX',49990);
insert into Products values (5,3,'Цифровая фотоаппарат SONY DSC-W830',79990);
insert into Products values (5,4,'Цифровая фотоаппарат NIKON D850 BODY',89990);
insert into Products values (5,5,'Цифровая фотоаппарат CANON POWERSHOT G8',89990);

insert into Products values (6,1,'Микроволновая печь СВЧ Centek',19990);
insert into Products values (6,2,'Микроволновая печь LG MS2042DB',29990);
insert into Products values (6,3,'Микроволновая печь Samsung GE83MRTS/BW',35990);
insert into Products values (6,4,'Пылесос моющий Xiaomi TJ200',49990);
insert into Products values (6,5,'Пылесос Deerma DX700',59990);
insert into Products values (6,6,'Утюг Philips GC4563/30',9990);

insert into Products values (7,1,'Велосипед Torrent Totem',39990);
insert into Products values (7,2,'Велосипед City Cruiser',49990);
insert into Products values (7,3,'Велосипед Adrenalin ',59990);
insert into Products values (7,4,'Беговая дорожка SPORT ELITE',89990);
insert into Products values (7,5,'Беговая дорожка ARTFIT Х5',119990);

-----------------

insert into Product_Description values(1,1,'Samsung Galaxy A02 смартфон 2021 года выпуска.Его размеры 164 x 75.9 x 9.1 и вес 206 г.Он оснащен PLS IPS-дисплеем с размером 6.5" дюйма.Емкость аккумулятора 5000 mAh.');
insert into Product_Description values(1,2,'Galaxy A12 оснащен быстрым процессором и вместительным хранилищем. Улучшенный 8-ядерный процессор и оперативная память 3/4ГБ обеспечат плавную и эффективную работу любых приложений. ');
insert into Product_Description values(1,3,'Компания Samsung Electronics представляет Galaxy S21 Ultra, флагман, который получил инновационную систему камер профессионального уровня и самый яркий и интеллектуальный дисплей в серии Galaxy.');
insert into Product_Description values(1,4,'Оцени невероятный эффект полного погружения в контент на 6.1-дюймовом безграничном U-экране смартфона Galaxy A41. Играть, смотреть любимые видео и вести трансляции гораздо приятнее благодаря потрясающему Super AMOLED экрану с разрешением FullHD+.');
insert into Product_Description values(1,5,'Samsung Galaxy A51 смартфон 2019 года выпуска. Его размеры 158.5 x 73.6 x 7.9 и вес 172 г. Он оснащен Super AMOLED-дисплеем с размером 6.5" дюйма. Разрешение составляет 1080 x 2400 пикселей');
insert into Product_Description values(1,6,'Корейская компания Samsung в начале года представила миру обновленную линейку своих топовых флагманских смартфонов — Galaxy S20. Главное место в ней занимает самая дорогая и наиболее технически укомплектованная модель Samsung Galaxy S20 Ultra 5G');
insert into Product_Description values(1,7,'iPhone Xr — новый 6,1-дюймовый смартфон Apple, который был представлен на презентации 12 сентября. iPhone Xr получил 6,1-дюймовый жидкокристаллический дисплей Liquid Retina в стиле iPhone X, систему на флагманском процессоре A12');
insert into Product_Description values(1,8,'Процессор: 6-ядерный Apple A14 Bionic. Камеры: 12 Мп (f/1,6) + 12 Мп (f/2,4) + 12 Мп (f/2,42) основная, 12 Мп (f/2,2) фронтальная Память: 6 ГБ оперативной, 128/256/512 ГБ постоянной Батарея: 3687 мАч (по данным TENAA)');
insert into Product_Description values(1,9,'Используется микропроцессорный чип Apple A13, содержащий шесть вычислительных ядер ARMv8, четыре ядра видеоускорителя и восемь ядер нейроускорителя. Телефон будет выпускаться в вариантах с 64, 128 или 256 гигабайтами встроенной флеш-памяти. Дисплей аппарата выполнен в технологии LCD IPS и имеет диагональ 6,06 дюйма');
insert into Product_Description values(1,10,'Платформа: iOS 13. Дисплей: 4,7", 1334 х 750 точек, 326 ppi, 1400:1, 625 нит, IPS, TrueTone. Камера: 12 Мп, Focus Pixels, f/1,8, 6 линз, OIS, запись видео 4K@60fps / 1080p@240fps. Фронтальная камера: 7 Мп, f/2,2, запись видео 1080р@30fps.');
insert into Product_Description values(1,11,'Дисплей В смартфоне установлен экран 6.53 дюйма, IPS LCD, 1080 x 2340 точек, соотношение сторон 19.5:9 , плотность точек 395 ppi, Corning Gorilla Glass 5, заявленная яркость 450 нит');
insert into Product_Description values(1,12,'Дисплей В смартфоне установлен экран 6.53 дюйма, IPS LCD, 1080 x 2340 точек, соотношение сторон 19.5:9 , плотность точек 395 ppi, Corning Gorilla Glass 5, заявленная яркость 450 нит');
insert into Product_Description values(1,13,'Главная модель обновленной 9-й серии, с помощью которой Xiaomi пытается изменить восприятие бренда Redmi.Xiaomi представила марку Redmi как линейку смартфонов, более доступных по сравнению с оригинальной Mi-серией.');

insert into Product_Description values(2,1,'Процессор Crystal - это мощный двигатель, который обеспечивает опыт просмотра на совершенно новом уровне.Насладитесь четким изображением на экране 4K UHD ТВ который содержит в 4 раза больше пикселей');
insert into Product_Description values(2,2,'Телевизор LG UHD был создан, чтобы поднять все, что вы смотрите, на новый уровень. Фильмы, спортивные программы, игры – все отображается в качестве 4K, живом цвете и максимально детализировано. Насладитесь реалистичной картинкой с разрешением вчетверо больше, чем у Full HD.');
insert into Product_Description values(2,3,'Телевизор LG UHD был создан, чтобы поднять все, что вы смотрите, на новый уровень. Фильмы, спортивные программы, игры – все отображается в качестве 4K, живом цвете и максимально детализировано. Насладитесь реалистичной картинкой с разрешением вчетверо больше, чем у Full HD.');
insert into Product_Description values(2,4,'Насладитесь четким изображением на экране 4K UHD ТВ который содержит в 4 раза больше пикселей чем прошлые версии этого серии телевизоров');
insert into Product_Description values(2,5,'Тонкий профиль и тонкая рамка делают телевизор красивым, независимо от того, включен он или нет.Он сочетает в себе функциональность и моду в высшем проявлении элегантности.Изображения на экране оживают на телевизоре TCL с очень узкой рамкой, все ваше внимание будет приковано к экрану, который обеспечит вам лучший визуальный опыт, чем когда-либо.');
insert into Product_Description values(2,6,'Ощутите поистине захватывающие эмоции от просмотра или работы с необычайно изогнутым монитором Samsung. Линия изгиба изогнутого монитора такая же как у экрана в кинотеатре iMax и составляет 1 800 R или 1 800 мм, что создает более широкое поле зрения, повышает глубину восприятия картинки');
insert into Product_Description values(2,7,'Время отклика равное 1 мс означает скорость без размытия изображения для полноценного наслаждения игрой. Скоростные движения и драматичные переходы будут плавными и без раздражающих задержек изображения.Независимо от рабочей среды, достигайте самой высокой частоты смены кадров ');
insert into Product_Description values(2,8,'Частота обновления 144 Гц и технология AMD FreeSync™ дадут тебе дополнительное преимущество в противостоянии, когда необходима мгновенная скорость реакции. Радуйся каждой победе, не упуская ни единой детали.');
insert into Product_Description values(2,9,'Насладитесь четким изображением на экране Samsung LS24. Тип матрицы: PLS разрешение: 1920x1080 (16:9) время отклика: 4 мс разъемы: HDMI, VGA (D-Sub) контрастность: 1000:1 яркость: 250 кд/м²');

insert into Product_Description values(3,1,'Ноутбук Acer A315-57G оснащен технологиями, которые идеально подойдут для динамичных и активных пользователей. Невероятно тонкий корпус и приятное на ощупь покрытие подчеркивают достоинства устройства.');
insert into Product_Description values(3,2,'Acer A515-55G Aspire 5 объединяет в себе большую мощность с возможностью выбора процессоров Intel ® или AMD, а также графики NVIDIA ® или AMD 1 . Благодаря памяти объемом до 24 ГБ у пользователей есть все возможности для решения ваших задач в многозадачном режиме.');
insert into Product_Description values(3,3,'Огромный список стандартных и опциональных функций IdeaPad 5 (15, AMD) позволит вам подобрать доступную по цене модель, которая будет лучше всего соответствовать вашим потребностям. С производительной видеокартой AMD® Radeon™ вы без проблем сможете использовать все любимые приложения. ');
insert into Product_Description values(3,4,'ASUS ZenBook 14 UX425JA в комплектации 90NB0QX1-S00020. В ее оснащение входит топовый для данного ноутбука 4-ядерный 8-поточный процессор Intel Core i7-1065G7, 16 ГБ оперативной памяти стандарта LPDDR4X-3200 МГц в двухканальном режиме и быстрый накопитель Micron 2200 объемом 1 ТБ. ');
insert into Product_Description values(3,5,'Ноутбук TUF Gaming A15, работающий на базе операционной системы Windows 10 Pro, представляет собой особо надежную геймерскую платформу, которая поможет вам добиться победы в любой игре. В его аппаратную конфигурацию входят новейший процессор AMD Ryzen 9 и видеокарта GeForce RTX 2060, которые гарантируют высокую скорость и плавное изображение');
insert into Product_Description values(3,6,'Nitro 5 AN515-43-R1Y4 это мощный игровой ноутбук. Крепкий корпус, экран с быстрой частотой обновления и высокопроизводительные компоненты, оснащенные эффективной системой охлаждения обеспечат новые впечатления от игр.');
insert into Product_Description values(3,7,'Бюджетная игровая серия Pavilion Gaming 15 включает 15-дюймовые модели с начинкой среднего уровня производительности. К нам на тест поступила конфигурация с процессором AMD Ryzen 5 4600H и видеокартой Nvidia GeForce GTX 1650.');
insert into Product_Description values(3,8,'Компания Lenovo является одним из лидеров рынка ноутбуков, предлагая широкий спектр моделей. IdeaPad Gaming 3i, который сочетает хорошие технические характеристики с доступной ценой. Это игровой ноутбук начального уровня на базе процессора Intel Comet Lake-H и дискретной графики NVIDIA GeForce GTX 1650 Ti.');
insert into Product_Description values(3,9,'Игровой ноутбук Legion Y540 этот элегантный портативный 15,6-дюймовый ноутбук позволяет играть на совершенно другом уровне. Он оснащен новейшими высокопроизводительными компонентами, которые дадут вам значительные преимущества в игре. ');

insert into Product_Description values(4,1,'Sven KB-C2200W - беспроводная клавиатура с классической раскладкой.');
insert into Product_Description values(4,2,'Клавиатура OKLICK 700G Dynasty обладает полноформатной 104-клавишной QWERTY-раскладкой. Для быстрого цифрового набора присутствует блок NumPad, а для доступа к медиа-функциям есть 12 мультимедийных клавиш.');
insert into Product_Description values(4,3,'SVEN RX-510SW - это беспроводная мышка, отличающаяся лаконичным дизайном и высоким качеством исполнения. Послужит прекрасным приобретением для тех, кто устал от проводов, но в то же время не нуждается в изобилии всевозможных функций.');
insert into Product_Description values(4,4,'Мышь A4 Bloody W60 Max оснащена сенсором, который наделен чувствительностью в 10000 dpi. Сенсор обладает ускорением 35G. Такие характеристики мыши в сочетании с прорезиненным колесом прокрутки гарантируют точность и управляемость, особенно в играх. Колесо прокрутки отличается долговечностью.');
insert into Product_Description values(4,5,'Genesis Xenon 220 Устройство оснащено бесшумными кнопочными переключателями, снижающими уровень шума до минимума, гарантируя спокойный сон для остальных жильцов. Кроме того, эргономичная форма мыши обеспечит комфорт в течение долгих часов использования.');
insert into Product_Description values(5,1,'Камера PowerShot G7 — это компактное устройство, оснащенное датчиком типа 1.0, которое позволит вам создавать видео 4K и фотографии 20,1 МП даже во время поездок. Идеально для блогеров, видеоблогеров и тех, кто публикует свой контент.');
insert into Product_Description values(5,2,'Цифровая камера SONY DSCR с большой матрицей и светосильным высококачественным объективом.Матрица Exmor CMOS 20,2 МП типа 1.0, объектив F1.8, 3,6-кратный оптический зум, Full HD 50p, ЖК-экран 7,5 см (3,0").');
insert into Product_Description values(5,3,'С камерой Sony W830 вы с легкостью можете запечатлеть красоту каждого мгновения. Матрица 20,1 МП с высоким разрешением и встроенный автофокус обеспечивают четкие, детализированные кадры даже при быстром движении. ');
insert into Product_Description values(5,4,'Nikon D850 Body – зеркальная камера премиум-класса, с помощью которой можно делать превосходные снимки. Она оборудована быстродействующей матрицей формата FX со сверхвысоким разрешением, использующей 45.7 эффективных мегапикселей, что позволяет получать реалистичные изображения с высокой детализацией. ');
insert into Product_Description values(5,5,'Камера PowerShot G8 — это компактное устройство, оснащенное датчиком типа 1.0, которое позволит вам создавать видео 4K и фотографии 24 МП даже во время поездок. Идеально для блогеров, видеоблогеров и тех, кто публикует свой контент.');

insert into Product_Description values(6,1,'Микроволновая печь Centek СВЧ CT-1575 (черный) 20л, 700Вт, мех. управление, подсветка, таймер, 6 режимов, тарелка 245мм');
insert into Product_Description values(6,2,'Микроволновая печь LG MS2042DB.Легкоочищаемое внутреннее покрытие EasyClean* Быстрое и равномерное приготовление с технологией i-Wave** Автопрограммы «Кухни мира» с рецептами итальянских, французских, восточных и русских блюд Экономия электроэнергии с функцией ECO ON***');
insert into Product_Description values(6,3,'Микроволновая печь Samsung GE83MRTS/BW. 99,9 % защита от бактерий .Увеличенный внутренний объем при компактных размерах. Интуитивно-понятная панель управления');
insert into Product_Description values(6,4,'Пылесос моющий Xiaomi TJ200. Сухая и влажная уборка без лишних хлопот.Многофункциональное применение| Высокая мощность всасывания| Уборка любых помещений| Удобное хранение');
insert into Product_Description values(6,5,'Deerma DX700 2 в 1 вертикальный ручной пылесос предназначен для более эффективной уборки вашего дома. Вы можете не только выбрать правильный способ его использования в соответствии с вашими личными потребностями, но и можете очистить все области с удобством. ');
insert into Product_Description values(6,6,'Гарантированно оптимальная подача пара. С улучшенной системой очистки от накипи Quick Calc Release Мощность: 2600 Паровой удар: 230 Постоянная подача пара: 50 Объем емкости для воды: 300');

insert into Product_Description values(7,1,'Велосипед Torrent Totem - надежный и безопасный велосипед для вашего удобство. В основе конструкции - стальная рама, жесткая вилка. Для комфортного катания модель оборудована 7 скоростями, тормозами V-BRAKE. Велосипед оснащен светоотражателями, пластиковыми крыльями, боковой подножкой.');
insert into Product_Description values(7,2,'Велосипед TORRENT CITY CRUISER предназначен для подростков и взрослых с ростом до 163-179 сантиметров. Подходит для езды по выделенным городским велодорожкам, пересеченной местности, а также сельских и загородных прогулок.');
insert into Product_Description values(7,3,'Представляем Велосипед Adrenalin  2020го модельного года. На байк установлена рама Алюминиевая, а так же надежная вилка амортизационная вилка XCM SR Suntour. Качественная трансмиссия с количеством скоростей равным 21 позволит легко преодолевать любые рельефы местности.');
insert into Product_Description values(7,4,'Надежный двигатель мощностью 1 л.с, беговое полотно 100 х 360 см и скорость до 10 км./ч. Большой, удобный ЖК-дисплей выводит на экран основные параметры тренировки: время тренировки, скорость, дистанция, потраченные калории.');
insert into Product_Description values(7,5,'Беговая дорожка Artfit X5 – это настоящий развлекательный мультимедийный центр. Огромный 15-дюймовый экран позволяет погружаться в увлекательный мир развлечений и перемещает пользователей в другую реальность. ');

insert into Comments values(1,1,'Товар отличный');
insert into Comments values(1,2,'Неплохо');
insert into Comments values(1,3,'Все отлично');
insert into Comments values(1,4,'Не понравился');
insert into Comments values(1,5,'Подойдет');
insert into Comments values(1,6,'Товар лучший');
insert into Comments values(1,7,'Неплохо');
insert into Comments values(1,8,'Не понравился');
insert into Comments values(1,9,'Понравился рекомендую');
insert into Comments values(1,10,'Товар лучший');
insert into Comments values(1,11,'Все отлично');
insert into Comments values(1,12,'Товар лучший');
insert into Comments values(1,13,'Товар лучший');

insert into Comments values(2,1,'Товар отличный');
insert into Comments values(2,2,'Неплохо');
insert into Comments values(2,3,'Все отлично');
insert into Comments values(2,4,'Не понравился');
insert into Comments values(2,5,'Подойдет');
insert into Comments values(2,6,'Товар лучший');
insert into Comments values(2,7,'Неплохо');
insert into Comments values(2,8,'Не понравился');
insert into Comments values(2,6,'Понравился рекомендую');
insert into Comments values(2,5,'Товар лучший');
insert into Comments values(2,3,'Все отлично');
insert into Comments values(2,2,'Товар лучший');
insert into Comments values(2,1,'Товар лучший');

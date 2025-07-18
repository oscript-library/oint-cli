﻿
Перем ТаблицаСостава;

Функция ПолучитьСостав() Экспорт

    Если ТаблицаСостава <> Неопределено Тогда
        Возврат ТаблицаСостава;
    КонецЕсли;

    ТаблицаСостава = Новый ТаблицаЗначений();
    ТаблицаСостава.Колонки.Добавить("Библиотека");
    ТаблицаСостава.Колонки.Добавить("Модуль");
    ТаблицаСостава.Колонки.Добавить("Метод");
    ТаблицаСостава.Колонки.Добавить("МетодПоиска");
    ТаблицаСостава.Колонки.Добавить("Параметр");
    ТаблицаСостава.Колонки.Добавить("Описание");
    ТаблицаСостава.Колонки.Добавить("ОписаниеМетода");
    ТаблицаСостава.Колонки.Добавить("Область");

    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьИнформациюОДиске";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬИНФОРМАЦИЮОДИСКЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Получает информацию о текущем диске";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СоздатьПапку";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬПАПКУ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Создает каталог на диске";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СоздатьПапку";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬПАПКУ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь к созаваемой папке";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьОбъект";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Получает информацию об объекте диска по заданному пути";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьОбъект";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь к папке или файлу";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "УдалитьОбъект";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Удаляет объект по заданному пути";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "УдалитьОбъект";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь к удаляемой папке или файлу";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "УдалитьОбъект";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--can";
    НоваяСтрока.Описание    = "В корзину (необяз. по ум. - True)";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СоздатьКопиюОбъекта";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬКОПИЮОБЪЕКТА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Создает копию объекта по заданному пути и пути к оригиналу";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СоздатьКопиюОбъекта";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬКОПИЮОБЪЕКТА";
    НоваяСтрока.Параметр    = "--from";
    НоваяСтрока.Описание    = "Путь к оригинальному файлу или каталогу";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СоздатьКопиюОбъекта";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬКОПИЮОБЪЕКТА";
    НоваяСтрока.Параметр    = "--to";
    НоваяСтрока.Описание    = "Путь назначения для копии";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СоздатьКопиюОбъекта";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬКОПИЮОБЪЕКТА";
    НоваяСтрока.Параметр    = "--rewrite";
    НоваяСтрока.Описание    = "Перезаписывать если файл с таким именем уже существует (необяз. по ум. - False)";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСсылкуДляСкачивания";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬССЫЛКУДЛЯСКАЧИВАНИЯ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Получает ссылку для скачивания файла";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСсылкуДляСкачивания";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬССЫЛКУДЛЯСКАЧИВАНИЯ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь к файлу для скачивания";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СкачатьФайл";
    НоваяСтрока.МетодПоиска = "СКАЧАТЬФАЙЛ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Скачивает файл по указанному пути";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СкачатьФайл";
    НоваяСтрока.МетодПоиска = "СКАЧАТЬФАЙЛ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь к файлу для скачивания";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СкачатьФайл";
    НоваяСтрока.МетодПоиска = "СКАЧАТЬФАЙЛ";
    НоваяСтрока.Параметр    = "--out";
    НоваяСтрока.Описание    = "Путь сохранения файла (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСписокФайлов";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКФАЙЛОВ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Получает список файлов с или без отбора по типу
    |    Список доступных типов: audio, backup, book, compressed, data, development,
    |                            diskimage, document, encoded, executable, flash, font,
    |                            mage, settings, spreadsheet, text, unknown, video, web";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСписокФайлов";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКФАЙЛОВ";
    НоваяСтрока.Параметр    = "--amount";
    НоваяСтрока.Описание    = "Количество возвращаемых объектов (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСписокФайлов";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКФАЙЛОВ";
    НоваяСтрока.Параметр    = "--offset";
    НоваяСтрока.Описание    = "Смещение для получение объектов не из начала списка (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСписокФайлов";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКФАЙЛОВ";
    НоваяСтрока.Параметр    = "--type";
    НоваяСтрока.Описание    = "Отбор по типу файла (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСписокФайлов";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКФАЙЛОВ";
    НоваяСтрока.Параметр    = "--datesort";
    НоваяСтрока.Описание    = "Истина > сортировать по дате, Ложь > по алфавиту (необяз. по ум. - False)";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПереместитьОбъект";
    НоваяСтрока.МетодПоиска = "ПЕРЕМЕСТИТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Перемещает объект по заданному пути и пути к оригиналу";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПереместитьОбъект";
    НоваяСтрока.МетодПоиска = "ПЕРЕМЕСТИТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--from";
    НоваяСтрока.Описание    = "Путь к оригинальному файлу или папке";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПереместитьОбъект";
    НоваяСтрока.МетодПоиска = "ПЕРЕМЕСТИТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--to";
    НоваяСтрока.Описание    = "Путь назначение для перемещения";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПереместитьОбъект";
    НоваяСтрока.МетодПоиска = "ПЕРЕМЕСТИТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--rewrite";
    НоваяСтрока.Описание    = "Перезаписывать если файл с таким именем уже существует (необяз. по ум. - False)";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ЗагрузитьФайл";
    НоваяСтрока.МетодПоиска = "ЗАГРУЗИТЬФАЙЛ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Загружает файл на диск по заданному пути";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ЗагрузитьФайл";
    НоваяСтрока.МетодПоиска = "ЗАГРУЗИТЬФАЙЛ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь для сохранение файла на Диске";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ЗагрузитьФайл";
    НоваяСтрока.МетодПоиска = "ЗАГРУЗИТЬФАЙЛ";
    НоваяСтрока.Параметр    = "--file";
    НоваяСтрока.Описание    = "Файл для загрузки";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ЗагрузитьФайл";
    НоваяСтрока.МетодПоиска = "ЗАГРУЗИТЬФАЙЛ";
    НоваяСтрока.Параметр    = "--rewrite";
    НоваяСтрока.Описание    = "Перезаписывать, если файл с таким именем уже существует (необяз. по ум. - False)";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ЗагрузитьФайлПоURL";
    НоваяСтрока.МетодПоиска = "ЗАГРУЗИТЬФАЙЛПОURL";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Работа с файлами и папками";
    НоваяСтрока.ОписаниеМетода   = "Загружает файл на диск, забирая его по заданному URL";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ЗагрузитьФайлПоURL";
    НоваяСтрока.МетодПоиска = "ЗАГРУЗИТЬФАЙЛПОURL";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь помещения загруженного файла";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ЗагрузитьФайлПоURL";
    НоваяСтрока.МетодПоиска = "ЗАГРУЗИТЬФАЙЛПОURL";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "URL файла";
    НоваяСтрока.Область     = "Работа с файлами и папками";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ОпубликоватьОбъект";
    НоваяСтрока.МетодПоиска = "ОПУБЛИКОВАТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Управление публичным доступом";
    НоваяСтрока.ОписаниеМетода   = "Публикует объект диска в публичный доступ";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ОпубликоватьОбъект";
    НоваяСтрока.МетодПоиска = "ОПУБЛИКОВАТЬОБЪЕКТ";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь к публикуемому объекту";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ОтменитьПубликациюОбъекта";
    НоваяСтрока.МетодПоиска = "ОТМЕНИТЬПУБЛИКАЦИЮОБЪЕКТА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Управление публичным доступом";
    НоваяСтрока.ОписаниеМетода   = "Отменяет публикацию ранее опубликованного объекта";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ОтменитьПубликациюОбъекта";
    НоваяСтрока.МетодПоиска = "ОТМЕНИТЬПУБЛИКАЦИЮОБЪЕКТА";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь к опубликованному ранее объекту";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСписокОпубликованныхОбъектов";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКОПУБЛИКОВАННЫХОБЪЕКТОВ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Управление публичным доступом";
    НоваяСтрока.ОписаниеМетода   = "Получает список опубликованных объектов";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСписокОпубликованныхОбъектов";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКОПУБЛИКОВАННЫХОБЪЕКТОВ";
    НоваяСтрока.Параметр    = "--amount";
    НоваяСтрока.Описание    = "Количество возвращаемых объектов (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСписокОпубликованныхОбъектов";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКОПУБЛИКОВАННЫХОБЪЕКТОВ";
    НоваяСтрока.Параметр    = "--offset";
    НоваяСтрока.Описание    = "Смещение для получение объектов не из начала списка (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьПубличныйОбъект";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПУБЛИЧНЫЙОБЪЕКТ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Управление публичным доступом";
    НоваяСтрока.ОписаниеМетода   = "Получает информацию об опубликованном объекте по его URL";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьПубличныйОбъект";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПУБЛИЧНЫЙОБЪЕКТ";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "Адрес объекта";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьПубличныйОбъект";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПУБЛИЧНЫЙОБЪЕКТ";
    НоваяСтрока.Параметр    = "--amount";
    НоваяСтрока.Описание    = "Количество возвращаемых вложенных объектов (для каталога) (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьПубличныйОбъект";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПУБЛИЧНЫЙОБЪЕКТ";
    НоваяСтрока.Параметр    = "--offset";
    НоваяСтрока.Описание    = "Смещение для получение вложенных объектов не из начала списка (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСсылкуСкачиванияПубличногоОбъекта";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬССЫЛКУСКАЧИВАНИЯПУБЛИЧНОГООБЪЕКТА";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Управление публичным доступом";
    НоваяСтрока.ОписаниеМетода   = "Получает прямую ссылку для скачивания публичного объекта";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСсылкуСкачиванияПубличногоОбъекта";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬССЫЛКУСКАЧИВАНИЯПУБЛИЧНОГООБЪЕКТА";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "Адрес объекта";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "ПолучитьСсылкуСкачиванияПубличногоОбъекта";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬССЫЛКУСКАЧИВАНИЯПУБЛИЧНОГООБЪЕКТА";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Путь внутри объекта (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СохранитьПубличныйОбъектНаДиск";
    НоваяСтрока.МетодПоиска = "СОХРАНИТЬПУБЛИЧНЫЙОБЪЕКТНАДИСК";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.Область     = "Управление публичным доступом";
    НоваяСтрока.ОписаниеМетода   = "Сохраняет публичный объект на ваш диск";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СохранитьПубличныйОбъектНаДиск";
    НоваяСтрока.МетодПоиска = "СОХРАНИТЬПУБЛИЧНЫЙОБЪЕКТНАДИСК";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "Адрес объекта";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СохранитьПубличныйОбъектНаДиск";
    НоваяСтрока.МетодПоиска = "СОХРАНИТЬПУБЛИЧНЫЙОБЪЕКТНАДИСК";
    НоваяСтрока.Параметр    = "--from";
    НоваяСтрока.Описание    = "Путь внутри публичного каталога (только для папок) (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Управление публичным доступом";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "СохранитьПубличныйОбъектНаДиск";
    НоваяСтрока.МетодПоиска = "СОХРАНИТЬПУБЛИЧНЫЙОБЪЕКТНАДИСК";
    НоваяСтрока.Параметр    = "--to";
    НоваяСтрока.Описание    = "Путь сохранения файла (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Управление публичным доступом";

    Возврат ТаблицаСостава;
КонецФункции


Функция ПолучитьСтрокуПодключения() Экспорт


    Возврат "
        |Контекст = Новый Структура;
        |Контекст.Вставить(""OPI_YandexID"", Неопределено);
        |
        |OPI_YandexID = ЗагрузитьСценарий(""%1/oint/core/Modules/OPI_YandexID.os"", Контекст);
        |Контекст.Вставить(""OPI_YandexID"", OPI_YandexID);
        |
        |OPI_YandexDisk = ЗагрузитьСценарий(""%1/oint/core/Modules/OPI_YandexDisk.os"", Контекст);
        |" + Символы.ПС;


КонецФункции 

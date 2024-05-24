﻿Функция ПолучитьСостав() Экспорт

    ТаблицаСостава = Новый ТаблицаЗначений();
    ТаблицаСостава.Колонки.Добавить("Библиотека");
    ТаблицаСостава.Колонки.Добавить("Модуль");
    ТаблицаСостава.Колонки.Добавить("Метод");
    ТаблицаСостава.Колонки.Добавить("МетодПоиска");
    ТаблицаСостава.Колонки.Добавить("Параметр");
    ТаблицаСостава.Колонки.Добавить("Описание");
    ТаблицаСостава.Колонки.Добавить("ОписаниеМетода");

    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьСписокБаз";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКБАЗ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Получает список доступных баз";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьСписокБаз";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКБАЗ";
    НоваяСтрока.Параметр    = "--offset";
    НоваяСтрока.Описание    = "Идентификатор следующей страницы списка баз из перыдудщего запроса (необяз. по ум. - Пустое значение)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьТаблицыБазы";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬТАБЛИЦЫБАЗЫ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Получает схему таблиц базы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьТаблицыБазы";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬТАБЛИЦЫБАЗЫ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьБазу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬБАЗУ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Создает новую базу данных
    |
    |    Структура JSON данных описания таблиц (параметр --tablesdata):
    |  {
    |    ""Имя таблицы 1"": [
    |                         {
    |                          <Данные описание поля 1>
    |                         },
    |                         {
    |                          <Данные описание поля 2>
    |                        },
    |                       ],
    |   ...
    |  }
    |
    |Функции формирования описаний полей: ПолучитьПолеСтроковое, ПолучитьПолеНомера, ПолучитьПолеВложения, ПолучитьПолеФлажка, ПолучитьПолеДаты, ПолучитьПолеПочты, ПолучитьПолеТелефона, ПолучитьПолеСсылки
    |";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьБазу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬБАЗУ";
    НоваяСтрока.Параметр    = "--ws";
    НоваяСтрока.Описание    = "Идентификатор рабочего пространства";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьБазу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬБАЗУ";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование новой базы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьБазу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬБАЗУ";
    НоваяСтрока.Параметр    = "--tablesdata";
    НоваяСтрока.Описание    = "Описание таблиц: Ключ > имя, Значение > массив полей";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьТаблицу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Создает новую таблицу в базе
    |
    |    Пример указания параметра типа массив:
    |    --param ""['Val1','Val2','Val3']""
    |
    |
    |    Структура JSON данных массива полей (параметр --fieldsdata):
    |    [
    |        {
    |          <Данные описание поля 1>
    |        },
    |        {
    |          <Данные описание поля 2>
    |        },
    |    ]
    |
    |Функции формирования описаний полей: ПолучитьПолеСтроковое, ПолучитьПолеНомера, ПолучитьПолеВложения, ПолучитьПолеФлажка, ПолучитьПолеДаты, ПолучитьПолеПочты, ПолучитьПолеТелефона, ПолучитьПолеСсылки
    |";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьТаблицу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьТаблицу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование новой таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьТаблицу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--fieldsdata";
    НоваяСтрока.Описание    = "Массив описаний полей";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьТаблицу";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--description";
    НоваяСтрока.Описание    = "Описание таблицы (необяз. по ум. - Пустое значение)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьТаблицу";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Изменяет наименование и|или описание базы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьТаблицу";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьТаблицу";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьТаблицу";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Новое наименование (необяз. по ум. - Пустое значение)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьТаблицу";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬТАБЛИЦУ";
    НоваяСтрока.Параметр    = "--description";
    НоваяСтрока.Описание    = "Новое описание (необяз. по ум. - Пустое значение)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьПоле";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Создет новое поле в таблице
    |Функции формирования описаний полей: ПолучитьПолеСтроковое, ПолучитьПолеНомера, ПолучитьПолеВложения, ПолучитьПолеФлажка, ПолучитьПолеДаты, ПолучитьПолеПочты, ПолучитьПолеТелефона, ПолучитьПолеСсылки
    |";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьПоле";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьПоле";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьПоле";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--fielddata";
    НоваяСтрока.Описание    = "Описание нового поля";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьПоле";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Изменяет имя и|или описание существующего поля таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьПоле";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы База";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьПоле";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьПоле";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--field";
    НоваяСтрока.Описание    = "Идентификатор поля";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьПоле";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Новое наименование (необяз. по ум. - Пустое значение)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьПоле";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬПОЛЕ";
    НоваяСтрока.Параметр    = "--description";
    НоваяСтрока.Описание    = "Новое описание (необяз. по ум. - Пустое значение)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьПолеСтроковое";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПОЛЕСТРОКОВОЕ";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование нового поля";
    НоваяСтрока.ОписаниеМетода   = "Получает описание поля строкового типа";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьПолеНомера";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПОЛЕНОМЕРА";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование нового поля";
    НоваяСтрока.ОписаниеМетода   = "Получает описание поля числового типа";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьПолеНомера";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПОЛЕНОМЕРА";
    НоваяСтрока.Параметр    = "--precision";
    НоваяСтрока.Описание    = "Число знаков после запятой (необяз. по ум. - Пустое значение)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьПолеВложения";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПОЛЕВЛОЖЕНИЯ";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование поля";
    НоваяСтрока.ОписаниеМетода   = "Получает описание поля файлового типа";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьПолеФлажка";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПОЛЕФЛАЖКА";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование поля";
    НоваяСтрока.ОписаниеМетода   = "Получает описание поля типа булево";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьПолеДаты";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПОЛЕДАТЫ";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование поля";
    НоваяСтрока.ОписаниеМетода   = "Получает описание поля типа дата";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьПолеПочты";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПОЛЕПОЧТЫ";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование поля";
    НоваяСтрока.ОписаниеМетода   = "Получает описание поля с электронной почтой";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьПолеТелефона";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПОЛЕТЕЛЕФОНА";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование поля";
    НоваяСтрока.ОписаниеМетода   = "Получает описание поля с номером телефона";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьПолеСсылки";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬПОЛЕССЫЛКИ";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Наименование поля";
    НоваяСтрока.ОписаниеМетода   = "Получает описание поля с URL";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьСписокЗаписей";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКЗАПИСЕЙ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Получает список записей выбранной таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьСписокЗаписей";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКЗАПИСЕЙ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы данных";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьСписокЗаписей";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКЗАПИСЕЙ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьСписокЗаписей";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬСПИСОКЗАПИСЕЙ";
    НоваяСтрока.Параметр    = "--offset";
    НоваяСтрока.Описание    = "Иднтификатор следующей страницы данных из предыдущего запроса (необяз. по ум. - Пустое значение)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьЗапись";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАПИСЬ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Получает данные строки таблицы по идентификатору";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьЗапись";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАПИСЬ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы данных";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьЗапись";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАПИСЬ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьЗапись";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬЗАПИСЬ";
    НоваяСтрока.Параметр    = "--record";
    НоваяСтрока.Описание    = "Идентификатор записи в таблице";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьЗаписи";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАПИСИ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Создает одну или массив записей по описанию или массиву описаний значений полей
    |
    |    Пример указания параметра типа массив:
    |    --param ""['Val1','Val2','Val3']""
    |";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьЗаписи";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАПИСИ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы данных";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьЗаписи";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАПИСИ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьЗаписи";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬЗАПИСИ";
    НоваяСтрока.Параметр    = "--data";
    НоваяСтрока.Описание    = "Набор или массив наборов пар Ключ : Значение > Поле : Показатель";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "УдалитьЗаписи";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАПИСИ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Удаляет одну или массив записей по идентификаторам
    |
    |    Пример указания параметра типа массив:
    |    --param ""['Val1','Val2','Val3']""
    |";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "УдалитьЗаписи";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАПИСИ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы данных";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "УдалитьЗаписи";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАПИСИ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "УдалитьЗаписи";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬЗАПИСИ";
    НоваяСтрока.Параметр    = "--records";
    НоваяСтрока.Описание    = "Идентификатор или массив индентификаторов записей";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьКомментарии";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКОММЕНТАРИИ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Получает список комментариев к записи в таблице";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьКомментарии";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКОММЕНТАРИИ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы данных";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьКомментарии";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКОММЕНТАРИИ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьКомментарии";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКОММЕНТАРИИ";
    НоваяСтрока.Параметр    = "--record";
    НоваяСтрока.Описание    = "Идентификатор записи в таблице";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ПолучитьКомментарии";
    НоваяСтрока.МетодПоиска = "ПОЛУЧИТЬКОММЕНТАРИИ";
    НоваяСтрока.Параметр    = "--offset";
    НоваяСтрока.Описание    = "Иднтификатор следующей страницы данных из предыдущего запроса (необяз. по ум. - Пустое значение)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьКомментарий";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Создает комментарий к записи в таблице";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьКомментарий";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы данных";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьКомментарий";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьКомментарий";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--record";
    НоваяСтрока.Описание    = "Идентификатор записи в таблице";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "СоздатьКомментарий";
    НоваяСтрока.МетодПоиска = "СОЗДАТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Текст комментария";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьКомментарий";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Изменяет текст существующего комментария";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьКомментарий";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы данных";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьКомментарий";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьКомментарий";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--record";
    НоваяСтрока.Описание    = "Идентификатор записи в таблице";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьКомментарий";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--comment";
    НоваяСтрока.Описание    = "Идентификатор комментария";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "ИзменитьКомментарий";
    НоваяСтрока.МетодПоиска = "ИЗМЕНИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Новый текст комментария";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "УдалитьКомментарий";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Токен";
    НоваяСтрока.ОписаниеМетода   = "Удаляет комментарий к записи таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "УдалитьКомментарий";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--base";
    НоваяСтрока.Описание    = "Идентификатор базы данных";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "УдалитьКомментарий";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--table";
    НоваяСтрока.Описание    = "Идентификатор таблицы";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "УдалитьКомментарий";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--record";
    НоваяСтрока.Описание    = "Идентификатор записи в таблице";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "airtable";
    НоваяСтрока.Модуль      = "OPI_Airtable";
    НоваяСтрока.Метод       = "УдалитьКомментарий";
    НоваяСтрока.МетодПоиска = "УДАЛИТЬКОММЕНТАРИЙ";
    НоваяСтрока.Параметр    = "--comment";
    НоваяСтрока.Описание    = "Идентификатор комментария";

    Возврат ТаблицаСостава;
КонецФункции

// OneScript: ./OInt/core/Modules/OPI_PostgreSQL.os
// Lib: PostgreSQL
// CLI: postgres
// Keywords: postgresql, postgre sql, postgres
// Depends: OPI_PostgreSQL

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

#Область ПрограммныйИнтерфейс

#Область ОсновныеМетоды

// Открыть соединение !NOCLI
// Создает подключение к указанной базе
//
// Параметры:
//  СтрокаПодключения - Строка                     - Строка подключения. См. СформироватьСтрокуПодключения    - sting
//  Tls               - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Произвольный - Объект коннектора или структура с информацией об ошибке
Функция ОткрытьСоединение(Знач СтрокаПодключения = "", Знач Tls = "") Экспорт

    Если ЭтоКоннектор(СтрокаПодключения) Тогда
        Возврат СтрокаПодключения;
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьСтроку(СтрокаПодключения);
    OPI_Инструменты.ВернутьУправляющиеПоследовательности(СтрокаПодключения);

    Коннектор = OPI_Компоненты.ПолучитьКомпоненту("PostgreSQL");

    Tls = OPI_Компоненты.УстановитьTls(Коннектор, Tls);

    Если Не OPI_Инструменты.ПолучитьИли(Tls, "result", Ложь) Тогда
        Возврат Tls;
    КонецЕсли;

    Коннектор.ConnectionString = СтрокаПодключения;

    Результат = Коннектор.Connect();
    Результат = OPI_Инструменты.JsonВСтруктуру(Результат, Ложь);

    Возврат ?(Результат["result"], Коннектор, Результат);

КонецФункции

// Закрыть соединение !NOCLI
// Явно закрывает переданное соединение
//
// Параметры:
//  Соединение - Произвольный - Объект компоненты с открытым соединением - dbc
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Результат закрытия соединения
Функция ЗакрытьСоединение(Знач Соединение) Экспорт

    Если ЭтоКоннектор(Соединение) Тогда

        Результат = Соединение.Close();
        Результат = OPI_Инструменты.JsonВСтруктуру(Результат, Ложь);

    Иначе

        Результат = Новый Структура("result,error", Ложь, "It's not a connection");

    КонецЕсли;

    Возврат Результат;

КонецФункции

// Это коннектор !NOCLI
// Проверяет, что значение является объектом внешней компоненты PostgreSQL
//
// Параметры:
//  Значение - Произвольный - Значение для проверки - value
//
// Возвращаемое значение:
//  Булево -  Это коннектор
Функция ЭтоКоннектор(Знач Значение) Экспорт

    Возврат Строка(ТипЗнч(Значение)) = "AddIn.OPI_PostgreSQL.Main";

КонецФункции

// Выполнить запрос SQL
// Выполняет произвольный SQL запрос
//
// Примечание:
// Параметры запроса указываются как массив структур вида `{'Тип данных': 'Значение'}`.^^
// Список доступных типов описан на начальной странице документации библиотеки PostgreSQL
// Без указания флага `ФорсироватьРезультат`, чтение результата осуществляется только для запросов, начинающихся с `SELECT`^^
// Для остальных запросов возвращается `result:true` или `false` с текстом ошибки
//
// Параметры:
//  ТекстЗапроса         - Строка                     - Текст запроса к базе                                               - sql
//  Параметры            - Массив Из Произвольный     - Массив позиционных параметров запроса                              - params
//  ФорсироватьРезультат - Булево                     - Включает попытку получения результата, даже для не SELECT запросов - force
//  Соединение           - Строка, Произвольный       - Соединение или строка подключения                                  - dbc
//  Tls                  - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls           - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция ВыполнитьЗапросSQL(Знач ТекстЗапроса
    , Знач Параметры = ""
    , Знач ФорсироватьРезультат = Ложь
    , Знач Соединение = ""
    , Знач Tls = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекстЗапроса, Истина);
    OPI_ПреобразованиеТипов.ПолучитьБулево(ФорсироватьРезультат);

    Параметры_ = ОбработатьПараметры(Параметры);

    Если ЭтоКоннектор(Соединение) Тогда
        ЗакрыватьСоединение = Ложь;
        Коннектор           = Соединение;
    Иначе
        ЗакрыватьСоединение = Истина;
        Коннектор           = ОткрытьСоединение(Соединение, Tls);
    КонецЕсли;

    Если Не ЭтоКоннектор(Коннектор) Тогда
        Возврат Коннектор;
    КонецЕсли;

    Результат = Коннектор.Execute(ТекстЗапроса, Параметры_, ФорсироватьРезультат);

    Если ЗакрыватьСоединение Тогда
        ЗакрытьСоединение(Коннектор);
    КонецЕсли;

    Результат = OPI_Инструменты.JsonВСтруктуру(Результат);

    Возврат Результат;

КонецФункции

// Сформировать строку подключения
// Формирует строку подключения из переданных данных
//
// Параметры:
//  Адрес  - Строка - IP адрес или доменное имя сервера - addr
//  База   - Строка - Имя базы данных для подключения   - db
//  Логин  - Строка - Логин пользователя postgres       - login
//  Пароль - Строка - Пароль пользователя postgres      - pass
//  Порт   - Строка - Порт подключения                  - port
//
// Возвращаемое значение:
//  Строка -  Строка подключения к базе PostgreSQL
Функция СформироватьСтрокуПодключения(Знач Адрес, Знач База, Знач Логин, Знач Пароль = "", Знач Порт = "5432") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Адрес);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Логин);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Порт);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Пароль);

    Порт   = ?(ЗначениеЗаполнено(Порт), ":" + Порт, Порт);
    Пароль = ?(ЗначениеЗаполнено(Пароль), ":" + Пароль, Пароль);

    ШаблонСтроки      = "postgresql://%1%2@%3%4/%5";
    СтрокаПодключения = СтрШаблон(ШаблонСтроки, Логин, Пароль, Адрес, Порт, База);

    Возврат СтрокаПодключения;

КонецФункции

// Получить настройки TLS
// Формирует настройки для использования TLS при выполнении запросов
//
// Примечание:
// Настройки Tls могут быть установлены только в момент создания соединения: явного, при использовании функции `ОткрытьСоединение`^^
// или неявного, при передаче строки подключения в методы ORM.
// Передача настроек Tls совместно с передачей уже созданного соединения в параметр `Соединение` будет проигнорирована
//
// Параметры:
//  ОтключитьПроверкуСертификатов - Булево - Позволяет работать с некорретными сертификатами, в т.ч. самоподписанными   - trust
//  ПутьКСертификату              - Строка - Путь к корневому PEM файлу сертификата, если его нет в системном хранилище - cert
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура настроек TLS соединения
Функция ПолучитьНастройкиTls(Знач ОтключитьПроверкуСертификатов, Знач ПутьКСертификату = "") Экспорт

    Возврат OPI_Компоненты.ПолучитьНастройкиTls(ОтключитьПроверкуСертификатов, ПутьКСертификату);

КонецФункции

#КонецОбласти

#Область ORM

// Создать базу данных
// Создает базу данных с указанным именем
//
// Параметры:
//  База       - Строка                     - Имя базы                                                 - base
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция СоздатьБазуДанных(Знач База, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.СоздатьБазуДанных(OPI_PostgreSQL, База, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Удалить базу данных
// Удаляет базу данных
//
// Параметры:
//  База       - Строка                     - Имя базы                                                 - base
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция УдалитьБазуДанных(Знач База, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.УдалитьБазуДанных(OPI_PostgreSQL, База, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Отключить все соединения базы данных
// Завершает все соединения к базе данных кроме текущего
//
// Параметры:
//  База       - Строка                     - Имя базы                                                 - base
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция ОтключитьВсеСоединенияБазыДанных(Знач База, Знач Соединение = "", Знач Tls = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьСтроку(База);

    ТекстSQL       = "SELECT pg_terminate_backend(pid)
    |FROM pg_stat_activity
    |WHERE datname = '%1' AND pid <> pg_backend_pid();";

    ТекстSQL = СтрШаблон(ТекстSQL, База);

    Результат = ВыполнитьЗапросSQL(ТекстSQL, , , Соединение, Tls);

    Возврат Результат;

КонецФункции

// Получить информацию о таблице
// Получает информацию о таблице
//
// Параметры:
//  Таблица    - Строка                     - Имя таблицы                                              - table
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция ПолучитьИнформациюОТаблице(Знач Таблица, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.ПолучитьСтруктуруТаблицы(OPI_PostgreSQL, Таблица, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Создать таблицу
// Создает пустую таблицу в базе
//
// Примечание:
// Список доступных типов описан на начальной странице документации библиотеки PostgreSQL
//
// Параметры:
//  Таблица          - Строка                     - Имя таблицы                                              - table
//  СтруктураКолонок - Структура Из КлючИЗначение - Структура колонок: Ключ > имя, Значение > Тип данных     - cols
//  Соединение       - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls              - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция СоздатьТаблицу(Знач Таблица, Знач СтруктураКолонок, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.СоздатьТаблицу(OPI_PostgreSQL, Таблица, СтруктураКолонок, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Добавить колонку таблицы
// Добавляет новую колонку в существующую таблицу
//
// Параметры:
//  Таблица    - Строка                     - Имя таблицы                                              - table
//  Имя        - Строка                     - Имя колонки                                              - name
//  ТипДанных  - Строка                     - Тип данных колонки                                       - type
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция ДобавитьКолонкуТаблицы(Знач Таблица, Знач Имя, Знач ТипДанных, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.ДобавитьКолонкуТаблицы(OPI_PostgreSQL, Таблица, Имя, ТипДанных, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Удалить колонку таблицы
// Удаляет колонку из таблицы
//
// Параметры:
//  Таблица    - Строка                     - Имя таблицы                                              - table
//  Имя        - Строка                     - Имя колонки                                              - name
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция УдалитьКолонкуТаблицы(Знач Таблица, Знач Имя, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.УдалитьКолонкуТаблицы(OPI_PostgreSQL, Таблица, Имя, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Гарантировать таблицу
// Создает новую таблицу в случае отсутствия или обновляет состав колонок существующей таблицы
//
// Примечание:
// В результате изменения структуры таблицы данные могут быть утеряны!^^
// Рекомендуется предварительно опробовать данный метод на тестовых данных
// Данная функция не обновляет тип данных существующих колонок
//
// Параметры:
//  Таблица          - Строка                     - Имя таблицы                                              - table
//  СтруктураКолонок - Структура Из КлючИЗначение - Структура колонок: Ключ > имя, Значение > Тип данных     - cols
//  Соединение       - Строка, Произвольный       - Существующее соединение или путь к базе                  - dbc
//  Tls              - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция ГарантироватьТаблицу(Знач Таблица, Знач СтруктураКолонок, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.ГарантироватьТаблицу(OPI_PostgreSQL, Таблица, СтруктураКолонок, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Очистить таблицу
// Очищает таблицу базы
//
// Параметры:
//  Таблица    - Строка                     - Имя таблицы                                              - table
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция ОчиститьТаблицу(Знач Таблица, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.УдалитьЗаписи(OPI_PostgreSQL, Таблица, , Соединение, Tls);
    Возврат Результат;

КонецФункции

// Удалить таблицу
// Удаляет таблицу из базы
//
// Параметры:
//  Таблица    - Строка                     - Имя таблицы                                              - table
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция УдалитьТаблицу(Знач Таблица, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.УдалитьТаблицу(OPI_PostgreSQL, Таблица, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Добавить записи
// Добавляет записи в таблицу
//
// Примечание:
// Данные записей указываются как массив структур вида:^
// `{'Имя поля 1': {'Тип данных': 'Значение'}, 'Имя поля 2': {'Тип данных': 'Значение'},...}`
// Список доступных типов описан на начальной странице документации библиотеки PostgreSQL
//
// Параметры:
//  Таблица      - Строка                     - Имя таблицы                                                         - table
//  МассивДанных - Массив Из Структура        - Массив структур данных строк: Ключ > поле, Значение > значение поля - rows
//  Транзакция   - Булево                     - Истина > добавление записей в транзакции с откатом при ошибке       - trn
//  Соединение   - Строка, Произвольный       - Соединение или строка подключения                                   - dbc
//  Tls          - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls            - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция ДобавитьЗаписи(Знач Таблица, Знач МассивДанных, Знач Транзакция = Истина, Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.ДобавитьЗаписи(OPI_PostgreSQL, Таблица, МассивДанных, Транзакция, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Получить записи
// Получает записи из выбранной таблицы
//
// Параметры:
//  Таблица    - Строка                     - Имя таблицы                                                  - table
//  Поля       - Массив Из Строка           - Поля для выборки                                             - fields
//  Фильтры    - Массив Из Структура        - Массив фильтров. См. ПолучитьСтруктуруФильтраЗаписей         - filter
//  Сортировка - Структура Из КлючИЗначение - Сортировка: Ключ > поле, Значение > направление (ASC, DESC)  - order
//  Количество - Число                      - Ограничение количества получаемых строк                      - limit
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                            - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls     - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция ПолучитьЗаписи(Знач Таблица
    , Знач Поля = "*"
    , Знач Фильтры = ""
    , Знач Сортировка = ""
    , Знач Количество = ""
    , Знач Соединение = ""
    , Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.ПолучитьЗаписи(OPI_PostgreSQL
        , Таблица
        , Поля
        , Фильтры
        , Сортировка
        , Количество
        , Соединение
        , Tls);

    Возврат Результат;

КонецФункции

// Обновить записи
// Обновляет значение записей по выбранным критериям
//
// Примечание:
// Данные записей указываются как массив структур вида:^
// `{'Имя поля 1': {'Тип данных': 'Значение'}, 'Имя поля 2': {'Тип данных': 'Значение'},...}`
// Список доступных типов описан на начальной странице документации библиотеки PostgreSQL
//
// Параметры:
//  Таблица           - Строка                     - Имя таблицы                                               - table
//  СтруктураЗначений - Структура Из КлючИЗначение - Структура значений: Ключ > поле, Значение > значение поля - values
//  Фильтры           - Массив Из Структура        - Массив фильтров. См. ПолучитьСтруктуруФильтраЗаписей      - filter
//  Соединение        - Строка, Произвольный       - Соединение или строка подключения                         - dbc
//  Tls               - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls  - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция ОбновитьЗаписи(Знач Таблица
    , Знач СтруктураЗначений
    , Знач Фильтры = ""
    , Знач Соединение = ""
    , Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.ОбновитьЗаписи(OPI_PostgreSQL, Таблица, СтруктураЗначений, Фильтры, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Удалить записи
// Удаляет записи из таблицы
//
// Параметры:
//  Таблица    - Строка                     - Имя таблицы                                              - table
//  Фильтры    - Массив Из Структура        - Массив фильтров. См. ПолучитьСтруктуруФильтраЗаписей     - filter
//  Соединение - Строка, Произвольный       - Соединение или строка подключения                        - dbc
//  Tls        - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls - tls
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Результат выполнения запроса
Функция УдалитьЗаписи(Знач Таблица, Знач Фильтры = "", Знач Соединение = "", Знач Tls = "") Экспорт

    Результат = OPI_ЗапросыSQL.УдалитьЗаписи(OPI_PostgreSQL, Таблица, Фильтры, Соединение, Tls);
    Возврат Результат;

КонецФункции

// Получить структуру фильтра записей
// Получает структуру шаблон для фильтрации записей в запросах ORM
//
// Примечание:
// Использование признака `raw` необходимо для составных конструкций, вроде `BEETWEEN`.^^
// Например: при `raw:false` фильтр `type:BETWEEN` `value:10 AND 20` будет интерпритирован как `BETWEEN ?1 `^^
// где `?1 = "10 AND 20"`, что приведет к ошибке.^^
// В таком случае необходимо использовать `raw:true` для установки условия напрямую в текст запроса
//
// Параметры:
//  Пустая - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Элемент фильтра записей
Функция ПолучитьСтруктуруФильтраЗаписей(Знач Пустая = Ложь) Экспорт

    Возврат OPI_ЗапросыSQL.ПолучитьСтруктуруФильтраЗаписей(Пустая);

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Функция ПолучитьОсобенности() Экспорт

    Особенности = Новый Соответствие;
    Особенности.Вставить("НумерацияПараметров", Истина);
    Особенности.Вставить("МаркерПараметров"   , "$");
    Особенности.Вставить("СУБД"               , "postgres");
    Особенности.Вставить("ПолеКолонки"        , "column_name");
    Особенности.Вставить("НачалоТранзакции"   , "BEGIN");

    Возврат Особенности;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ОбработатьПараметры(Знач Параметры)

    Если Не ЗначениеЗаполнено(Параметры) Тогда
        Возврат "[]";
    КонецЕсли;

    OPI_ПреобразованиеТипов.ПолучитьМассив(Параметры);

    Для Н = 0 По Параметры.ВГраница() Цикл

        ТекущийПараметр = Параметры[Н];

        ТекущийПараметр = ОбработатьПараметр(ТекущийПараметр);

        Параметры[Н] = ТекущийПараметр;

    КонецЦикла;

    Параметры_ = OPI_Инструменты.JSONСтрокой(Параметры, , Ложь);

    Если СтрНачинаетсяС(Параметры_, "НЕ JSON") Тогда
        ВызватьИсключение "Ошибка валидации JSON массива параметров!";
    КонецЕсли;

    Возврат Параметры_;

КонецФункции

Функция ОбработатьПараметр(ТекущийПараметр)

    ТекущийТип = ТипЗнч(ТекущийПараметр);

    Если ТекущийТип = Тип("ДвоичныеДанные") Тогда

        ТекущийПараметр = Новый Структура("BYTEA", Base64Строка(ТекущийПараметр));

    ИначеЕсли ТекущийТип = Тип("УникальныйИдентификатор") Тогда

        ТекущийПараметр = Строка(ТекущийПараметр);

    ИначеЕсли ТекущийТип = Тип("Дата") Тогда

        ТекущийПараметр = OPI_Инструменты.ДатаRFC3339(ТекущийПараметр);

    ИначеЕсли OPI_Инструменты.ПолеКоллекцииСуществует(ТекущийПараметр, "BYTEA") Тогда

        ТекущийПараметр = ОбработатьСтруктуруBlob(ТекущийПараметр);

    ИначеЕсли ТекущийТип = Тип("Структура")
        Или ТекущийТип = Тип("Соответствие") Тогда

        ТекущийПараметр_ = OPI_Инструменты.КопироватьКоллекцию(ТекущийПараметр);

        Для Каждого ЭлементПараметра Из ТекущийПараметр_ Цикл

            ТекущийКлюч     = вРег(ЭлементПараметра.Ключ);
            ТекущееЗначение = ЭлементПараметра.Значение;

            Если ЭтоТипКоллекция(ТекущийКлюч) Тогда
                Продолжить;
            КонецЕсли;

            ТекущийПараметр[ЭлементПараметра.Ключ] = ОбработатьПараметр(ТекущееЗначение);

        КонецЦикла;

    Иначе

        Если Не OPI_Инструменты.ЭтоПримитивныйТип(ТекущийПараметр) Тогда
            OPI_ПреобразованиеТипов.ПолучитьСтроку(ТекущийПараметр);
        КонецЕсли;

    КонецЕсли;

    Возврат ТекущийПараметр;

КонецФункции

Функция ОбработатьСтруктуруBlob(Знач Значение)

    Bytea_ = "BYTEA";

    ЗначениеДанных = Значение[Bytea_];

    Если ТипЗнч(ЗначениеДанных) = Тип("ДвоичныеДанные") Тогда
        Значение = Новый Структура(Bytea_, Base64Строка(ЗначениеДанных));
    Иначе

        ФайлДанных = Новый Файл(Строка(ЗначениеДанных));

        Если ФайлДанных.Существует() Тогда

            ТекущиеДанные = Новый ДвоичныеДанные(Строка(ЗначениеДанных));
            Значение      = Новый Структура(Bytea_, Base64Строка(ТекущиеДанные));

        КонецЕсли;

    КонецЕсли;

    Возврат Значение;

КонецФункции

Функция ЭтоТипКоллекция(Знач ПроверяемыйТип)

    Возврат ПроверяемыйТип = "JSONB" Или ПроверяемыйТип = "JSON" Или ПроверяемыйТип = "HSTORE";

КонецФункции

#КонецОбласти

#Region Alternate

Function CreateConnection(Val ConnectionString = "", Val Tls = "") Export
	Return ОткрытьСоединение(ConnectionString, Tls);
EndFunction

Function CloseConnection(Val Connection) Export
	Return ЗакрытьСоединение(Connection);
EndFunction

Function IsConnector(Val Value) Export
	Return ЭтоКоннектор(Value);
EndFunction

Function ExecuteSQLQuery(Val QueryText, Val Parameters = "", Val ForceResult = False, Val Connection = "", Val Tls = "") Export
	Return ВыполнитьЗапросSQL(QueryText, Parameters, ForceResult, Connection, Tls);
EndFunction

Function GenerateConnectionString(Val Address, Val Base, Val Login, Val Password = "", Val Port = "5432") Export
	Return СформироватьСтрокуПодключения(Address, Base, Login, Password, Port);
EndFunction

Function GetTlsSettings(Val DisableCertVerification, Val CertFilepath = "") Export
	Return ПолучитьНастройкиTls(DisableCertVerification, CertFilepath);
EndFunction

Function CreateDatabase(Val Base, Val Connection = "", Val Tls = "") Export
	Return СоздатьБазуДанных(Base, Connection, Tls);
EndFunction

Function DeleteDatabase(Val Base, Val Connection = "", Val Tls = "") Export
	Return УдалитьБазуДанных(Base, Connection, Tls);
EndFunction

Function DisableAllDatabaseConnections(Val Base, Val Connection = "", Val Tls = "") Export
	Return ОтключитьВсеСоединенияБазыДанных(Base, Connection, Tls);
EndFunction

Function GetTableInformation(Val Table, Val Connection = "", Val Tls = "") Export
	Return ПолучитьИнформациюОТаблице(Table, Connection, Tls);
EndFunction

Function CreateTable(Val Table, Val ColoumnsStruct, Val Connection = "", Val Tls = "") Export
	Return СоздатьТаблицу(Table, ColoumnsStruct, Connection, Tls);
EndFunction

Function AddTableColumn(Val Table, Val Name, Val DataType, Val Connection = "", Val Tls = "") Export
	Return ДобавитьКолонкуТаблицы(Table, Name, DataType, Connection, Tls);
EndFunction

Function DeleteTableColumn(Val Table, Val Name, Val Connection = "", Val Tls = "") Export
	Return УдалитьКолонкуТаблицы(Table, Name, Connection, Tls);
EndFunction

Function EnsureTable(Val Table, Val ColoumnsStruct, Val Connection = "", Val Tls = "") Export
	Return ГарантироватьТаблицу(Table, ColoumnsStruct, Connection, Tls);
EndFunction

Function ClearTable(Val Table, Val Connection = "", Val Tls = "") Export
	Return ОчиститьТаблицу(Table, Connection, Tls);
EndFunction

Function DeleteTable(Val Table, Val Connection = "", Val Tls = "") Export
	Return УдалитьТаблицу(Table, Connection, Tls);
EndFunction

Function AddRecords(Val Table, Val DataArray, Val Transaction = True, Val Connection = "", Val Tls = "") Export
	Return ДобавитьЗаписи(Table, DataArray, Transaction, Connection, Tls);
EndFunction

Function GetRecords(Val Table, Val Fields = "*", Val Filters = "", Val Sort = "", Val Count = "", Val Connection = "", Val Tls = "") Export
	Return ПолучитьЗаписи(Table, Fields, Filters, Sort, Count, Connection, Tls);
EndFunction

Function UpdateRecords(Val Table, Val ValueStructure, Val Filters = "", Val Connection = "", Val Tls = "") Export
	Return ОбновитьЗаписи(Table, ValueStructure, Filters, Connection, Tls);
EndFunction

Function DeleteRecords(Val Table, Val Filters = "", Val Connection = "", Val Tls = "") Export
	Return УдалитьЗаписи(Table, Filters, Connection, Tls);
EndFunction

Function GetRecordsFilterStrucutre(Val Clear = False) Export
	Return ПолучитьСтруктуруФильтраЗаписей(Clear);
EndFunction

Function GetFeatures() Export
	Return ПолучитьОсобенности();
EndFunction

#EndRegion
﻿// OneScript: ./OInt/core/Modules/OPI_Slack.os
// Lib: Slack
// CLI: slack
// Keywords: slack

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

// BSLLS:IncorrectLineBreak-off
// BSLLS:Typo-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Область ПрограммныйИнтерфейс

#Область УправлениеИНастройки

// Получить информацию о боте
// Получает основную информацию о боте
//
// Параметры:
//  Токен - Строка - Токен бота - token
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьИнформациюОБоте(Знач Токен) Экспорт

    URL       = "https://slack.com/api/auth.test";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Ответ = OPI_ЗапросыHTTP.Get(URL, , Заголовки);

    Возврат Ответ;

КонецФункции

// Получить список рабочих областей
// Получает список рабочих областей, в которых подключен бот
//
// Параметры:
//  Токен  - Строка - Токен бота                                                    - token
//  Курсор - Строка - Указатель из предыдущего запроса, если строк результата > 100 - cursor
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокРабочихОбластей(Знач Токен, Знач Курсор = "") Экспорт

    URL   = "https://slack.com/api/auth.teams.list";
    Ответ = ПолучениеОбщихДанных(Токен, URL, Курсор);

    Возврат Ответ;

КонецФункции

// Получить список пользователей
// Получает список пользователей рабочей области
//
// Параметры:
//  Токен  - Строка - Токен бота                                                    - token
//  Курсор - Строка - Указатель из предыдущего запроса, если строк результата > 100 - cursor
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокПользователей(Знач Токен, Знач Курсор = "") Экспорт

    URL   = "https://slack.com/api/users.list";
    Ответ = ПолучениеОбщихДанных(Токен, URL, Курсор);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаССообщениями

// Отправить сообщение
// Отправляет сообщение в выбранный час
//
// Параметры:
//  Токен        - Строка - Токен бота                              - token
//  Канал        - Строка - Идентификатор канала                    - channel
//  Текст        - Строка - Текст сообщения                         - text
//  ДатаОтправки - Дата   - Дата отправки для отложенного сообщения - date
//  Блоки        - Массив Из Структура - Массив описаний блоков     - blocks - JSON массива описаний блоков
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ОтправитьСообщение(Знач Токен, Знач Канал, Знач Текст = "", Знач ДатаОтправки = "", Знач Блоки = "") Экспорт

    Строка_   = "Строка";
    ЕстьДата  = ЗначениеЗаполнено(ДатаОтправки);
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал, Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("text"   , Текст, Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("blocks" , Блоки, "Массив"   , Параметры);

    Если ЕстьДата Тогда

        URL = "https://slack.com/api/chat.scheduleMessage";
        OPI_Инструменты.ДобавитьПоле("post_at", ДатаОтправки, "Дата", Параметры);

    Иначе

        URL = "https://slack.com/api/chat.postMessage";

    КонецЕсли;

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Отправить эфемерное сообщение
// Отправляет сообщение, которое приходит в канал, но видно
// только конкретному пользователю
//
// Параметры:
//  Токен        - Строка - Токен бота                              - token
//  Канал        - Строка - Идентификатор канала                    - channel
//  Текст        - Строка - Текст сообщения                         - text
//  Пользователь - Строка - ID пользователя                         - user
//  Блоки        - Массив Из Структура - Массив описаний блоков     - blocks - JSON массива описаний блоков
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ОтправитьЭфемерноеСообщение(Знач Токен
    , Знач Канал
    , Знач Текст = ""
    , Знач Пользователь = ""
    , Знач Блоки = "") Экспорт

    Строка_ = "Строка";

    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал       , Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("text"   , Текст       , Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("user"   , Пользователь, Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("blocks" , Блоки       , "Массив"   , Параметры);

    URL = "https://slack.com/api/chat.postEphemeral";

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Изменить сообщение
// Изменяет состав существующего сообщения
//
// Параметры:
//  Токен        - Строка - Токен бота                          - token
//  Канал        - Строка - Идентификатор канала                - channel
//  Отметка      - Строка - Временная отметка сообщения         - stamp
//  Текст        - Строка - Новый текст сообщения               - text
//  МассивБлоков - Массив Из Структура - Массив описаний блоков - blocks - JSON массива описаний блоков
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ИзменитьСообщение(Знач Токен, Знач Канал, Знач Отметка, Знач Текст = "", Знач МассивБлоков = "") Экспорт

    Строка_   = "Строка";
    URL       = "https://slack.com/api/chat.update";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал       , Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("text"   , Текст       , Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("ts"     , Отметка     , Строка_    , Параметры);
    OPI_Инструменты.ДобавитьПоле("blocks" , МассивБлоков, "Коллекция", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Удалить сообщение
// Удаляет сообщение канала по timestamp
//
// Параметры:
//  Токен         - Строка - Токен бота                             - token
//  Канал         - Строка - Идентификатор канала                   - channel
//  Отметка       - Строка - Временная отметка или ID сообщения     - stamp
//  ЭтоОтложенное - Булево - Признак удаления отложенного сообщения - issheduled
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция УдалитьСообщение(Знач Токен, Знач Канал, Знач Отметка, Знач ЭтоОтложенное = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(ЭтоОтложенное);

    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Если ЭтоОтложенное Тогда
        URL         = "https://slack.com/api/chat.deleteScheduledMessage";
        ПолеОтметки = "scheduled_message_id";
    Иначе
        URL         = "https://slack.com/api/chat.delete";
        ПолеОтметки = "ts";
    КонецЕсли;

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel"  , Канал  , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле(ПолеОтметки, Отметка, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить список отложенных сообщений
// Получает список отложенных сообщений канала
//
// Параметры:
//  Токен  - Строка - Токен бота                                                    - token
//  Канал  - Строка - Идентификатор канала                                          - channel
//  Курсор - Строка - Указатель из предыдущего запроса, если строк результата > 100 - cursor
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокОтложенныхСообщений(Знач Токен, Знач Канал, Знач Курсор = "") Экспорт

    URL       = "https://slack.com/api/chat.scheduledMessages.list";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("cursor" , Курсор, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить ссылку на сообщение
// Получает постоянный UTL к сообщению канала
//
// Параметры:
//  Токен         - Строка - Токен бота                             - token
//  Канал         - Строка - Идентификатор канала                   - channel
//  Отметка       - Строка - Временная отметка или ID сообщения     - stamp
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСсылкуНаСообщение(Знач Токен, Знач Канал, Знач Отметка) Экспорт

    URL       = "https://slack.com/api/chat.getPermalink";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel"   , Канал  , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("message_ts", Отметка, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить список ответов на сообщение
// Получает массив сообщений, которые являются ответом на указанное
//
// Параметры:
//  Токен         - Строка - Токен бота                                                    - token
//  Канал         - Строка - Идентификатор канала                                          - channel
//  Отметка       - Строка - Временная отметка или ID сообщения                            - stamp
//  Курсор        - Строка - Указатель из предыдущего запроса, если строк результата > 100 - cursor
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокОтветовНаСообщение(Знач Токен, Знач Канал, Знач Отметка, Знач Курсор = "") Экспорт

    Строка_   = "Строка";
    URL       = "https://slack.com/api/conversations.replies";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал  , Строка_, Параметры);
    OPI_Инструменты.ДобавитьПоле("cursor" , Курсор , Строка_, Параметры);
    OPI_Инструменты.ДобавитьПоле("ts"     , Отметка, Строка_, Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСКаналами

// Получить список каналов
// Получает список доступных каналов
//
// Параметры:
//  Токен                   - Строка - Токен бота                                                    - token
//  ИсключатьАрхивированные - Булево - Признак исключения архивированных каналов                     - notarchived
//  Курсор                  - Строка - Указатель из предыдущего запроса, если строк результата > 100 - cursor
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокКаналов(Знач Токен, Знач ИсключатьАрхивированные = Ложь, Знач Курсор = "") Экспорт

    URL       = "https://slack.com/api/conversations.list";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("exclude_archived", ИсключатьАрхивированные, "Булево", Параметры);
    OPI_Инструменты.ДобавитьПоле("cursor"          , Курсор                 , "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить список пользователей канала
// Получает список пользователей указанного канала
//
// Параметры:
//  Токен         - Строка - Токен бота                                                    - token
//  Канал         - Строка - Идентификатор канала                                          - channel
//  Курсор        - Строка - Указатель из предыдущего запроса, если строк результата > 100 - cursor
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокПользователейКанала(Знач Токен, Знач Канал, Знач Курсор = "") Экспорт

    URL       = "https://slack.com/api/conversations.members";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("cursor" , Курсор, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Создать канал
// Создает новый канал
//
// Параметры:
//  Токен     - Строка - Токен бота              - token
//  Название  - Строка - Наименование канала     - title
//  Приватный - Булево - Создать канал приватным - private
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция СоздатьКанал(Знач Токен, Знач Название, Знач Приватный = Ложь) Экспорт

    URL       = "https://slack.com/api/conversations.create";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("name"      , Название , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("is_private", Приватный, "Булево", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Архивировать канал
// Архивирует активный канал
//
// Параметры:
//  Токен - Строка - Токен бота - token
//  Канал - Строка - ID канала  - channel
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция АрхивироватьКанал(Знач Токен, Знач Канал) Экспорт

    URL   = "https://slack.com/api/conversations.archive";
    Ответ = УправлениеДиалогом(Токен, Канал, URL);
    Возврат Ответ;

КонецФункции

// Получить канал
// Получает информацию о канале
//
// Параметры:
//  Токен - Строка - Токен бота - token
//  Канал - Строка - ID канала  - channel
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьКанал(Знач Токен, Знач Канал) Экспорт

    URL   = "https://slack.com/api/conversations.info";
    Ответ = УправлениеДиалогом(Токен, Канал, URL, "GET");
    Возврат Ответ;

КонецФункции

// Получить историю канала
// Получает информацию событиях канала
//
// Параметры:
//  Токен - Строка - Токен бота - token
//  Канал - Строка - ID канала  - channel
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьИсториюКанала(Знач Токен, Знач Канал) Экспорт

    URL   = "https://slack.com/api/conversations.history";
    Ответ = УправлениеДиалогом(Токен, Канал, URL, "GET");
    Возврат Ответ;

КонецФункции

// Пригласить пользователей в канал
// Добавляет указанных пользователей в канал
//
// Параметры:
//  Токен               - Строка           - Токен бота              - token
//  Канал               - Строка           - ID канала               - channel
//  МассивПользователей - Массив Из Строка - Массив ID пользователей - users
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПригласитьПользователейВКанал(Знач Токен, Знач Канал, Знач МассивПользователей) Экспорт

    URL       = "https://slack.com/api/conversations.invite";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивПользователей);
    МассивПользователей = СтрСоединить(МассивПользователей, ",");

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал              , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("users"  , МассивПользователей, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Выгнать пользователя из канала
// Удаляет указанного пользователя из канала
//
// Параметры:
//  Токен        - Строка - Токен бота      - token
//  Канал        - Строка - ID канала       - channel
//  Пользователь - Строка - ID пользователя - user
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ВыгнатьПользователяИзКанала(Знач Токен, Знач Канал, Знач Пользователь) Экспорт

    URL       = "https://slack.com/api/conversations.kick";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал       , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("user"   , Пользователь, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Вступить в канал
// Добавляет текущего бота в канал
//
// Параметры:
//  Токен - Строка - Токен бота - token
//  Канал - Строка - ID канала  - channel
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ВступитьВКанал(Знач Токен, Знач Канал) Экспорт

    URL   = "https://slack.com/api/conversations.join";
    Ответ = УправлениеДиалогом(Токен, Канал, URL);
    Возврат Ответ;

КонецФункции

// Покинуть канал
// Удаляет текущего бота из канала
//
// Параметры:
//  Токен - Строка - Токен бота - token
//  Канал - Строка - ID канала  - channel
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПокинутьКанал(Знач Токен, Знач Канал) Экспорт

    URL   = "https://slack.com/api/conversations.leave";
    Ответ = УправлениеДиалогом(Токен, Канал, URL);
    Возврат Ответ;

КонецФункции

// Установить тему канала
// Устанавливает тему канала
//
// Параметры:
//  Токен - Строка - Токен бота  - token
//  Канал - Строка - ID канала   - channel
//  Тема  - Строка - Тема канала - theme
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция УстановитьТемуКанала(Знач Токен, Знач Канал, Знач Тема) Экспорт

    URL       = "https://slack.com/api/conversations.setTopic";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("topic"  , Тема  , "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Установить цель канала
// Устанавливает цель (описание) канала
//
// Параметры:
//  Токен - Строка - Токен бота  - token
//  Канал - Строка - ID канала   - channel
//  Цель  - Строка - Цель канала - purpose
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция УстановитьЦельКанала(Знач Токен, Знач Канал, Знач Цель) Экспорт

    URL       = "https://slack.com/api/conversations.setPurpose";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("purpose", Цель  , "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Переименовать канал
// Изменяет название канала
//
// Параметры:
//  Токен     - Строка - Токен бота            - token
//  Канал     - Строка - ID канала             - channel
//  Название  - Строка - Новое название канала - title
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПереименоватьКанал(Знач Токен, Знач Канал, Знач Название) Экспорт

    URL       = "https://slack.com/api/conversations.rename";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал   , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("name"   , Название, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСДиалогами

// Открыть диалог
// Открывает новый диалог с одним или несколькими пользователями
//
// Параметры:
//  Токен               - Строка           - Токен бота              - token
//  МассивПользователей - Массив из Строка - Массив ID пользователей - users
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ОткрытьДиалог(Знач Токен, Знач МассивПользователей) Экспорт

    URL       = "https://slack.com/api/conversations.open";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивПользователей);
    МассивПользователей = СтрСоединить(МассивПользователей, ",");

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("users", МассивПользователей, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Закрыть диалог
// Закрывает существующий диалог
//
// Параметры:
//  Токен  - Строка - Токен бота - token
//  Диалог - Строка - ID диалога - conv
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ЗакрытьДиалог(Знач Токен, Знач Диалог) Экспорт

    URL   = "https://slack.com/api/conversations.close";
    Ответ = УправлениеДиалогом(Токен, Диалог, URL);
    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСФайлами

// Получить список файлов
// Получает список файлов бота или канала
//
// Параметры:
//  Токен          - Строка        - Токен бота       - token
//  Канал          - Строка        - Канал для отбора - channel
//  НомерСтраницы  - Число, Строка - Номер страницы   - page
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокФайлов(Знач Токен, Знач Канал = "", Знач НомерСтраницы = 1) Экспорт

    URL       = "https://slack.com/api/files.list";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал        , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("page"   , НомерСтраницы, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Загрузить файл
// Загружает файл на сервера Slack
//
// Параметры:
//  Токен     - Строка                - Токен бота              - token
//  Файл      - Строка,ДвоичныеДанные - Файл для загрузки       - file
//  ИмяФайла  - Строка                - Имя файла с расширением - filename
//  Заголовок - Строка                - Имя файла в Slack       - title
//  Канал     - Строка                - ID канала               - channel
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач ИмяФайла, Знач Заголовок, Знач Канал = "") Экспорт

    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Файл);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(ИмяФайла);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Заголовок);

    Строка_    = "Строка";
    Upload_url = "upload_url";
    File_id    = "file_id";
    URL        = "https://slack.com/api/files.getUploadURLExternal";
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);
    Размер     = Файл.Размер();

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("filename", ИмяФайла, Строка_, Параметры);
    OPI_Инструменты.ДобавитьПоле("length"  , Размер  , Строка_, Параметры);

    Ответ         = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);
    URL           = Ответ[Upload_url];
    Идентификатор = Ответ[File_id];

    Если Не ЗначениеЗаполнено(URL) Или Не ЗначениеЗаполнено(Идентификатор) Тогда
        Возврат Ответ;
    КонецЕсли;

    Файлы = Новый Соответствие;
    Файлы.Вставить(ИмяФайла, Файл);

    Ответ    = OPI_ЗапросыHTTP.PostMultipart(URL, , Файлы, , Заголовки);
    URL      = "https://slack.com/api/files.completeUploadExternal";
    ФайлСлак = Новый Структура("id, title", Идентификатор, Заголовок);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("filename"  , ИмяФайла, Строка_ , Параметры);
    OPI_Инструменты.ДобавитьПоле("channel_id", Канал   , Строка_ , Параметры);
    OPI_Инструменты.ДобавитьПоле("files"     , ФайлСлак, "Массив", Параметры);

    Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить данные файла
// Получает информацию о файле
//
// Параметры:
//  Токен              - Строка - Токен бота          - token
//  ИдентификаторФайла - Строка - Идентификатор файла - fileid
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьДанныеФайла(Знач Токен, Знач ИдентификаторФайла) Экспорт

    URL   = "https://slack.com/api/files.info";
    Ответ = УправлениеФайлом(Токен, ИдентификаторФайла, URL, "GET");

    Возврат Ответ;

КонецФункции

// Удалить файл
// Удаляет файл на Slack
//
// Параметры:
//  Токен              - Строка - Токен бота          - token
//  ИдентификаторФайла - Строка - Идентификатор файла - fileid
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция УдалитьФайл(Знач Токен, Знач ИдентификаторФайла) Экспорт

    URL   = "https://slack.com/api/files.delete";
    Ответ = УправлениеФайлом(Токен, ИдентификаторФайла, URL);

    Возврат Ответ;

КонецФункции

// Сделать файл публичным
// Создает публичный URL для файла. Требует токен пользователя
//
// Параметры:
//  Токен              - Строка - Токен пользователя  - token
//  ИдентификаторФайла - Строка - Идентификатор файла - fileid
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция СделатьФайлПубличным(Знач Токен, Знач ИдентификаторФайла) Экспорт

    URL   = "https://slack.com/api/files.sharedPublicURL";
    Ответ = УправлениеФайлом(Токен, ИдентификаторФайла, URL);

    Возврат Ответ;

КонецФункции

// Сделать файл приватным
// Удаляет публичный URL у файла. Требует токен пользователя
//
// Параметры:
//  Токен              - Строка - Токен пользователя  - token
//  ИдентификаторФайла - Строка - Идентификатор файла - fileid
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция СделатьФайлПриватным(Знач Токен, Знач ИдентификаторФайла) Экспорт

    URL   = "https://slack.com/api/files.revokePublicURL";
    Ответ = УправлениеФайлом(Токен, ИдентификаторФайла, URL);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область РаботаСУдаленнымиФайлами

// Получить список внешних файлов
// Получает список внешних файлов пользователя или канала
//
// Параметры:
//  Токен  - Строка - Токен бота                                                    - token
//  Канал  - Строка - Канал для отбора                                              - channel
//  Курсор - Строка - Указатель из предыдущего запроса, если строк результата > 100 - cursor
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьСписокВнешнихФайлов(Знач Токен, Знач Канал = "", Знач Курсор = "") Экспорт

    URL       = "https://slack.com/api/files.remote.list";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("cursor" , Курсор, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Получить внешний файл
// Получает информацию о внешнем файле
//
// Параметры:
//  Токен              - Строка - Токен бота          - token
//  ИдентификаторФайла - Строка - Идентификатор файла - fileid
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ПолучитьВнешнийФайл(Знач Токен, Знач ИдентификаторФайла) Экспорт

    URL   = "https://slack.com/api/files.remote.info";
    Ответ = УправлениеВнешнимФайлом(Токен, ИдентификаторФайла, URL);

    Возврат Ответ;

КонецФункции

// Добавить внешний файл
// Добавляет новый внешний файл
//
// Параметры:
//  Токен     - Строка - Токен бота                - token
//  URL       - Строка - URL к внешнему файлу      - url
//  Заголовок - Строка - Заголовок файла для Slack - title
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ДобавитьВнешнийФайл(Знач Токен, Знач URL, Знач Заголовок) Экспорт

    Строка_    = "Строка";
    URLЗапроса = "https://slack.com/api/files.remote.add";
    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);
    UID        = Строка(Новый УникальныйИдентификатор());

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("external_url", URL          , Строка_, Параметры);
    OPI_Инструменты.ДобавитьПоле("external_id" , UID          , Строка_, Параметры);
    OPI_Инструменты.ДобавитьПоле("title"       , Заголовок    , Строка_, Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URLЗапроса, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Отправить внешний файл
// Отправляет внейшний файл по списку каналов
//
// Параметры:
//  Токен              - Строка           - Токен бота                  - token
//  ИдентификаторФайла - Строка           - Идентификатор файла         - fileid
//  МассивКаналов      - Массив Из Строка - Массив каналов для отправки - channels
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция ОтправитьВнешнийФайл(Знач Токен, Знач ИдентификаторФайла, Знач МассивКаналов) Экспорт

    URL       = "https://slack.com/api/files.remote.share";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивКаналов);
    МассивКаналов = СтрСоединить(МассивКаналов, ",");

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("file"    , ИдентификаторФайла , "Строка", Параметры);
    OPI_Инструменты.ДобавитьПоле("channels", МассивКаналов      , "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

// Удалить внешний файл
// Удаляет внешний файл из Slack
//
// Параметры:
//  Токен              - Строка - Токен бота          - token
//  ИдентификаторФайла - Строка - Идентификатор файла - fileid
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - сериализованный JSON ответа от Slack
Функция УдалитьВнешнийФайл(Знач Токен, Знач ИдентификаторФайла) Экспорт

    URL   = "https://slack.com/api/files.remote.remove";
    Ответ = УправлениеВнешнимФайлом(Токен, ИдентификаторФайла, URL);

    Возврат Ответ;

КонецФункции

#КонецОбласти

#Область ФормированиеБлоков

// Сформировать блок картинку
// Формирует блок с картинкой для добавления в массив блоков сообщения
//
// Параметры:
//  URL                 - Строка - URL картинки                   - picture
//  АльтернативныйТекст - Строка - Альтернативный текст картинки  - alt
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение -  Блок картинки
Функция СформироватьБлокКартинку(Знач URL, Знач АльтернативныйТекст = "") Экспорт

    Строка_ = "Строка";

    Блок = Новый Соответствие;
    OPI_Инструменты.ДобавитьПоле("type"     , "image"              , Строка_, Блок);
    OPI_Инструменты.ДобавитьПоле("image_url", URL                  , Строка_, Блок);
    OPI_Инструменты.ДобавитьПоле("alt_text" , АльтернативныйТекст  , Строка_, Блок);

    Возврат Блок;

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьЗаголовокАвторизации(Знач Токен)

    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);

    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization", "Bearer " + Токен);
    Возврат Заголовки;

КонецФункции

Функция УправлениеДиалогом(Знач Токен, Знач Канал, Знач URL, Знач ВидЗапроса = "POST")

    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);
    ВидЗапроса = вРег(ВидЗапроса);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("channel", Канал, "Строка", Параметры);

    Если ВидЗапроса = "POST" Тогда
        Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);
    Иначе
        Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);
    КонецЕсли;

    Возврат Ответ;

КонецФункции

Функция УправлениеФайлом(Знач Токен, Знач ИдентификаторФайла, Знач URL, Знач ВидЗапроса = "POST")

    Заголовки  = ПолучитьЗаголовокАвторизации(Токен);
    ВидЗапроса = вРег(ВидЗапроса);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("file", ИдентификаторФайла , "Строка", Параметры);

    Если ВидЗапроса = "POST" Тогда
        Ответ = OPI_ЗапросыHTTP.PostСТелом(URL, Параметры, Заголовки);
    Иначе
        Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);
    КонецЕсли;

    Возврат Ответ;

КонецФункции

Функция ПолучениеОбщихДанных(Знач Токен, Знач URL, Знач Курсор)

    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("cursor", Курсор, "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

Функция УправлениеВнешнимФайлом(Знач Токен, Знач ИдентификаторФайла, Знач URL)

    Заголовки = ПолучитьЗаголовокАвторизации(Токен);

    Параметры = Новый Структура;
    OPI_Инструменты.ДобавитьПоле("file", ИдентификаторФайла , "Строка", Параметры);

    Ответ = OPI_ЗапросыHTTP.Get(URL, Параметры, Заголовки);

    Возврат Ответ;

КонецФункции

#КонецОбласти

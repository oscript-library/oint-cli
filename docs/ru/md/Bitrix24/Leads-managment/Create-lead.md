﻿---
sidebar_position: 1
---

# Создать лид
 Создает новый лид по структуре полей (см. ПолучитьСтруктуруЛида)



`Функция СоздатьЛид(Знач URL, Знач СтруктураПолей, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | СтруктураПолей | --fields | Структура Из КлючИЗначение | Структура полей лида (см. ПолучитьСтруктуруЛида) |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrix24

<br/>

:::tip
Метод в документации API: [crm.lead.add](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_add.php)
:::
<br/>


```bsl title="Пример кода"
    МассивПочт = Новый Массив;
    МассивПочт.Добавить(Новый Структура("VALUE,VALUE_TYPE", "yo@example.com", "HOME"));
    МассивПочт.Добавить(Новый Структура("VALUE,VALUE_TYPE", "hi@example.com", "WORK"));

    МассивНомеров = Новый Массив;
    МассивНомеров.Добавить(Новый Структура("VALUE,VALUE_TYPE", "88005553535", "WORK"));

    СтруктураПолей = Новый Структура;
    СтруктураПолей.Вставить("ADDRESS"        , "ул. Пушкина, д. 10");
    СтруктураПолей.Вставить("ADDRESS_COUNTRY", "Россия");
    СтруктураПолей.Вставить("EMAIL"          , МассивПочт);
    СтруктураПолей.Вставить("NAME"           , "Петр");
    СтруктураПолей.Вставить("LAST_NAME"      , "Петров");
    СтруктураПолей.Вставить("PHONE"          , МассивНомеров);
    СтруктураПолей.Вставить("TITLE"          , "Мегаклиент");

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.СоздатьЛид(URL, СтруктураПолей);

    СтруктураПолей.Вставить("NAME"           , "Иван");
    СтруктураПолей.Вставить("LAST_NAME"      , "Иванов");

    URL            = "b24-ar17wx.bitrix24.by";
    Токен          = "6476c766006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.СоздатьЛид(URL, СтруктураПолей, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 СоздатьЛид --url "b24-ar17wx.bitrix24.by" --fields %fields% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": 30,
 "time": {
  "start": 1724348723.47912,
  "finish": 1724348723.98354,
  "duration": 0.504424095153809,
  "processing": 0.477245092391968,
  "date_start": "2024-08-22T17:45:23+00:00",
  "date_finish": "2024-08-22T17:45:23+00:00",
  "operating_reset_at": 1724349323,
  "operating": 0.477225065231323
 }
}
```
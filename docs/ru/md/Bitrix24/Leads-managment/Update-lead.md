﻿---
sidebar_position: 5
---

# Изменить лид
 Изменяет существующий лид



`Функция ИзменитьЛид(Знач URL, Знач IDЛида, Знач СтруктураПолей, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЛида | --lead | Число, Строка | ID лида |
  | СтруктураПолей | --fields | Структура Из КлючИЗначение | Структура полей лида |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrix24

<br/>

:::tip
Метод в документации API: [crm.lead.update](https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_update.php)
:::
<br/>


```bsl title="Пример кода"
    СтруктураПолей = Новый Структура;
    СтруктураПолей.Вставить("ADDRESS"        , "ул. Лермонтова, д. 20");
    СтруктураПолей.Вставить("ADDRESS_COUNTRY", "Беларусь");
    СтруктураПолей.Вставить("TITLE"          , "Суперклиент");

    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЛида = "24";

    Результат = OPI_Bitrix24.ИзменитьЛид(URL, IDЛида, СтруктураПолей);

    СтруктураПолей.Вставить("NAME"           , "Евгений");
    СтруктураПолей.Вставить("LAST_NAME"      , "Евгеньев");

    URL    = "b24-ar17wx.bitrix24.by";
    Токен  = "6476c766006e9f06006b12e400000001000...";
    IDЛида = "26";

    Результат = OPI_Bitrix24.ИзменитьЛид(URL, IDЛида, СтруктураПолей, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ИзменитьЛид --url "b24-ar17wx.bitrix24.by" --lead %lead% --fields %fields% --token "ec4dc366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1724348726.37858,
  "finish": 1724348726.5149,
  "duration": 0.136314153671265,
  "processing": 0.11129903793335,
  "date_start": "2024-08-22T17:45:26+00:00",
  "date_finish": "2024-08-22T17:45:26+00:00",
  "operating_reset_at": 1724349326,
  "operating": 0.111276865005493
 }
}
```
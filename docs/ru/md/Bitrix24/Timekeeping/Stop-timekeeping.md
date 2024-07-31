﻿---
sidebar_position: 7
---

# Завершить учет времени
 Завершает учет времени пользователя



`Функция ЗавершитьУчетВремени(Знач URL, Знач IDПользователя = "", Знач Время = "", Знач Отчет = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDПользователя | --userid | Строка, Число | ID пользователя для учета. Текущий по умолчанию |
  | Время | --time | Дата | Время заверш. учета. Дата должна совпадать с текущей. Текущее время по ум. |
  | Отчет | --report | Строка | Причина изменения. Обязателен при указании Время и отключенном свободном графике |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [timeman.close](https://dev.1c-bitrix.ru/rest_help/timeman/base/timeman_close.php)
:::
<br/>


```bsl title="Пример кода"
  URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  
  Результат = OPI_Bitrix24.ЗавершитьУчетВремени(URL);
  
  URL            = "b24-ar17wx.bitrix24.by";
  Токен          = "adf89366006e9f06006b12e400000001000...";
  IDПользователя = 1;
  Время          = OPI_Инструменты.ПолучитьТекущуюДату();
  Отчет          = "Отгул";
  
  Результат = OPI_Bitrix24.ЗавершитьУчетВремени(URL, IDПользователя, Время, Отчет, );
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ЗавершитьУчетВремени --url %url% --userid %userid% --time %time% --report %report% --token %token%

```

```json title="Результат"
{
 "error": "WRONG_DATETIME_FORMAT",
 "error_description": "Wrong datetime format"
}
```
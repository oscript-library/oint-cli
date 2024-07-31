﻿---
sidebar_position: 4
---

# Получить пользовательское поле задачи
 Получает информацию о пользовательском поле задачи



`Функция ПолучитьПользовательскоеПолеЗадачи(Знач URL, Знач IDПоля, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDПоля | --fieldid | Строка, Число | ID поля для получения |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.item.userfield.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/userfield/get.php)
:::
<br/>


```bsl title="Пример кода"
  URL      = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDПоля   = "";
  
  Результат = OPI_Bitrix24.ПолучитьПользовательскоеПолеЗадачи(URL, IDПоля);
  
  URL      = "b24-ar17wx.bitrix24.by";
  Токен    = "adf89366006e9f06006b12e400000001000...";
  IDПоля   = "";
  
  Результат = OPI_Bitrix24.ПолучитьПользовательскоеПолеЗадачи(URL, IDПоля, );
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьПользовательскоеПолеЗадачи --url %url% --fieldid %fieldid% --token %token%

```

```json title="Результат"
{
 "result": {
  "ID": "261",
  "ENTITY_ID": "TASKS_TASK",
  "FIELD_NAME": "UF_TEXT_FIELD",
  "USER_TYPE_ID": "string",
  "XML_ID": "NEW_TEXT_FIELD",
  "SORT": "100",
  "MULTIPLE": "N",
  "MANDATORY": "N",
  "SHOW_FILTER": "N",
  "SHOW_IN_LIST": "Y",
  "EDIT_IN_LIST": "Y",
  "IS_SEARCHABLE": "N",
  "SETTINGS": {
   "SIZE": 20,
   "ROWS": 1,
   "REGEXP": "",
   "MIN_LENGTH": 0,
   "MAX_LENGTH": 0,
   "DEFAULT_VALUE": ""
  },
  "EDIT_FORM_LABEL": {
   "ar": "",
   "br": "",
   "de": "",
   "en": "Updated field",
   "fr": "",
   "id": "",
   "it": "",
   "ja": "",
   "la": "",
   "ms": "",
   "pl": "",
   "ru": "Измененное поле",
   "sc": "",
   "tc": "",
   "th": "",
   "tr": "",
   "ua": "",
   "vn": ""
  },
  "LIST_COLUMN_LABEL": {
   "ar": "Поле для текста",
   "br": "Поле для текста",
   "de": "Поле для текста",
   "en": "Поле для текста",
   "fr": "Поле для текста",
   "id": "Поле для текста",
   "it": "Поле для текста",
   "ja": "Поле для текста",
   "la": "Поле для текста",
   "ms": "Поле для текста",
   "pl": "Поле для текста",
   "ru": "Поле для текста",
   "sc": "Поле для текста",
   "tc": "Поле для текста",
   "th": "Поле для текста",
   "tr": "Поле для текста",
   "ua": "Поле для текста",
   "vn": "Поле для текста"
  },
  "LIST_FILTER_LABEL": {
   "ar": "Поле для текста",
   "br": "Поле для текста",
   "de": "Поле для текста",
   "en": "Поле для текста",
   "fr": "Поле для текста",
   "id": "Поле для текста",
   "it": "Поле для текста",
   "ja": "Поле для текста",
   "la": "Поле для текста",
   "ms": "Поле для текста",
   "pl": "Поле для текста",
   "ru": "Поле для текста",
   "sc": "Поле для текста",
   "tc": "Поле для текста",
   "th": "Поле для текста",
   "tr": "Поле для текста",
   "ua": "Поле для текста",
   "vn": "Поле для текста"
  },
  "ERROR_MESSAGE": {
   "ar": "Поле для текста",
   "br": "Поле для текста",
   "de": "Поле для текста",
   "en": "Поле для текста",
   "fr": "Поле для текста",
   "id": "Поле для текста",
   "it": "Поле для текста",
   "ja": "Поле для текста",
   "la": "Поле для текста",
   "ms": "Поле для текста",
   "pl": "Поле для текста",
   "ru": "Поле для текста",
   "sc": "Поле для текста",
   "tc": "Поле для текста",
   "th": "Поле для текста",
   "tr": "Поле для текста",
   "ua": "Поле для текста",
   "vn": "Поле для текста"
  },
  "HELP_MESSAGE": {
   "ar": "Поле для текста",
   "br": "Поле для текста",
   "de": "Поле для текста",
   "en": "Поле для текста",
   "fr": "Поле для текста",
   "id": "Поле для текста",
   "it": "Поле для текста",
   "ja": "Поле для текста",
   "la": "Поле для текста",
   "ms": "Поле для текста",
   "pl": "Поле для текста",
   "ru": "Поле для текста",
   "sc": "Поле для текста",
   "tc": "Поле для текста",
   "th": "Поле для текста",
   "tr": "Поле для текста",
   "ua": "Поле для текста",
   "vn": "Поле для текста"
  }
 },
 "total": 0,
 "time": {
  "start": 1722114797.9059,
  "finish": 1722114797.92375,
  "duration": 0.0178542137145996,
  "processing": 0.000695943832397461,
  "date_start": "2024-07-27T21:13:17+00:00",
  "date_finish": "2024-07-27T21:13:17+00:00",
  "operating_reset_at": 1722115397,
  "operating": 0
 }
}
```
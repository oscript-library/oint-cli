﻿---
sidebar_position: 1
---

# Добавить элемент чеклиста задачи
 Добавляет новый элемент чеклиста задачи



`Функция ДобавитьЭлементЧеклистаЗадачи(Знач URL, Знач IDЗадачи, Знач Текст, Знач Выполнен = Ложь, Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число, Строка | ID задачи |
  | Текст | --text | Строка | Текст (заголовок) пункта чек листа |
  | Выполнен | --complete | Булево | Отметить пункт как выполненный |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [task.checklistitem.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/add.php)
:::
<br/>


```bsl title="Пример кода"
  URL      = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
  IDЗадачи = "720";
  
  Текст    = "Пункт чек-листа";
  
  Результат = OPI_Bitrix24.ДобавитьЭлементЧеклистаЗадачи(URL, IDЗадачи, Текст, Истина);
  
  
  
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "adf89366006e9f06006b12e400000001000...";
  IDЗадачи  = "722";
  
  Результат = OPI_Bitrix24.ДобавитьЭлементЧеклистаЗадачи(URL, IDЗадачи, Текст, , Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ДобавитьЭлементЧеклистаЗадачи --url %url% --task %task% --text %text% --complete %complete% --token %token%

```

```json title="Результат"
{
 "result": 96,
 "time": {
  "start": 1720816505.3041,
  "finish": 1720816505.37014,
  "duration": 0.0660440921783447,
  "processing": 0.0380921363830566,
  "date_start": "2024-07-12T20:35:05+00:00",
  "date_finish": "2024-07-12T20:35:05+00:00",
  "operating_reset_at": 1720817105,
  "operating": 0
 }
}
```
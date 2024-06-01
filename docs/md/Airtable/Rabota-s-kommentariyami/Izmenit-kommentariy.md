﻿---
sidebar_position: 3
---

# Изменить комментарий
 Изменяет текст существующего комментария


*Функция ИзменитьКомментарий(Знач Токен, Знач База, Знач Таблица, Знач Запись, Знач Комментарий, Знач Текст) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы данных |
  | Таблица | --table | Строка | Идентификатор таблицы |
  | Запись | --record | Строка | Идентификатор записи в таблице |
  | Комментарий | --comment | Строка | Идентификатор комментария |
  | Текст | --text | Строка | Новый текст комментария |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

```bsl title="Пример кода"
	

	
```

```sh title="Пример команд CLI"
    
  oint airtable ИзменитьКомментарий --token %token% --base %base% --table %table% --record %record% --comment %comment% --text %text%

```


```json title="Результат"



```
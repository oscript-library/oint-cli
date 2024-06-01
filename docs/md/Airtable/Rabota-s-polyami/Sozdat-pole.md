﻿---
sidebar_position: 1
---

# Создать поле
 Создет новое поле в таблице


*Функция СоздатьПоле(Знач Токен, Знач База, Знач Таблица, Знач СтруктураПоля) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | База | --base | Строка | Идентификатор базы |
  | Таблица | --table | Строка | Идентификатор таблицы |
  | СтруктураПоля | --fielddata | Структура Из КлючИЗначение | Описание нового поля |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

```bsl title="Пример кода"
	

	
```

```sh title="Пример команд CLI"
    
  oint airtable СоздатьПоле --token %token% --base %base% --table %table% --fielddata %fielddata%

```


```json title="Результат"



```
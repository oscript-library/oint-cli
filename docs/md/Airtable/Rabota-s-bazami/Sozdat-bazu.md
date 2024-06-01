﻿---
sidebar_position: 3
---

# Создать базу
 Создает новую базу данных


*Функция СоздатьБазу(Знач Токен, Знач РабочееПространство, Знач Наименование, Знач КоллекцияТаблиц) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | РабочееПространство | --ws | Строка | Идентификатор рабочего пространства |
  | Наименование | --title | Строка | Наименование новой базы |
  | КоллекцияТаблиц | --tablesdata | Соответствие Из КлючИЗначение | Описание таблиц: Ключ > имя, Значение > массив полей |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Airtable

```bsl title="Пример кода"
	

	
```

```sh title="Пример команд CLI"
    
  oint airtable СоздатьБазу --token %token% --ws %ws% --title %title% --tablesdata %tablesdata%

```


```json title="Результат"



```
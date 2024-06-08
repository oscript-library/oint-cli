﻿---
sidebar_position: 4
---

# Удалить комментарий
 Удаляет комментарий по ID


*Функция УдалитьКомментарий(Знач Токен, Знач ИДОбъекта, Знач ИДКомментария) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИДОбъекта | --object | Строка | Идентификатор файла или каталога размещения комментария |
  | ИДКомментария | --comment | Строка | Идентификатор комментария |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	
      
      Идентификатор = "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa";
      
      Ответ = OPI_GoogleDrive.УдалитьКомментарий(Токен, Идентификатор, Комментарий);  //Соответствие
      
    
	
```

```sh title="Пример команды CLI"
    
      oint gdrive УдалитьКомментарий --token %token% --object %object% --comment %comment%


```


```json title="Результат"

''

```
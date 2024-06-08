﻿---
sidebar_position: 3
---

# Создать твит гифки
 Создает твит с вложением-гифкой


*Функция СоздатьТвитГифки(Знач Текст, Знач МассивГифок, Знач Параметры = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Текст | --text | Строка | Текст твита |
  | МассивГифок | --gifs | Массив из Строка,ДвоичныеДанные | Массив файлов гифок |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter

```bsl title="Пример кода"
	
      
      МассивКартинок = Новый Массив;
      МассивКартинок.Добавить("C:\1.gif");
      МассивКартинок.Добавить("C:\2.gif");
      
      Ответ = OPI_Twitter.СоздатьТвитГифки("Гифки", МассивКартинок, Параметры);
      Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
      
    
	
```

```sh title="Пример команды CLI"
    
      oint twitter СоздатьТвитГифки --text %text% --gifs %gifs% --auth %auth%


```


```json title="Результат"

{
  "data": {
  "text": "Природа https://t.co/VWkWU11111",
  "id": "1746086669499924991",
  "edit_history_tweet_ids": [
  "1746086669499924991"
  ]
  }
  }

```
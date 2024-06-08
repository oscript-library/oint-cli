﻿---
sidebar_position: 8
---

# Показать главную тему форума
 Показывает ранее скрытую главную тему форума


*Функция ПоказатьГлавнуюТемуФорума(Знач Токен, Знач IDЧата) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDЧата | --forum | Строка,Число | ID чата темы |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Telegram

```bsl title="Пример кода"
	
        Токен       = "6129457865:AAFyzNYOAFbu...";
        Чат         = "-1001971186208";
        
        Результат = OPI_Telegram.ПоказатьГлавнуюТемуФорума(Токен, Чат);
    
	
```

```sh title="Пример команды CLI"
    
      oint telegram ПоказатьГлавнуюТемуФорума --token "6129457865:AAFyzNYOAFbu..." --forum %forum%


```


```json title="Результат"

{
 "ok": true,
 "result": true
}

```
﻿---
sidebar_position: 1
---

# Исключить пользователей чата
 Исключает пользователей из чата



`Функция ИсключитьПользователейЧата(Знач Токен, Знач IDЧата, Знач Пользователи) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDЧата | --chatid | Строка, Число | ID чата |
  | Пользователи | --members | Строка, Число, Массив Из Строка, Число | Пользователь или пользователи чата для удаления |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /chats/members/delete](https://teams.vk.com/botapi/#/chats/get_chats_members_delete)
:::
<br/>


```bsl title="Пример кода"
    Токен        = "001.3501506236.091...";
    IDЧата       = "689203963@chat.agent";
    Пользователь = 1011987091;

    Результат = OPI_VKTeams.ИсключитьПользователейЧата(Токен, IDЧата, Пользователь);
```



```sh title="Пример команды CLI"
    
  oint vkteams ИсключитьПользователейЧата --token %token% --chatid %chatid% --members %members%

```

```json title="Результат"

```
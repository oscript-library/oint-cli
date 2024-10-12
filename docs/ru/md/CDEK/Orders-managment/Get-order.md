﻿---
sidebar_position: 4
---

# Получить заказ
 Получает заказ по UUID



`Функция ПолучитьЗаказ(Знач Токен, Знач UUID, Знач ТестовыйAPI = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен авторизации |
  | UUID | --uuid | Строка | UUID заказа |
  | ТестовыйAPI | --testapi | Булево | Флаг использования API для тестовых запросов |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK

<br/>

:::tip
Метод в документации API: [Информация о заказе](https://api-docs.cdek.ru/29923975.html)
:::
<br/>


```bsl title="Пример кода"
    Токен = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg3MzkwMDYsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJjb250cmFjdDrQmNCcLdCg0KQt0JPQm9CTLTIyIiwiYWNjb3VudC1sYW5nOnJ1cyIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJhcGktdmVyc2lvbjoxLjEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJjb250cmFnZW50L...";
    UUID  = "48763bae-2d8e-4521-9052-01377017fbe7";

    Результат = OPI_CDEK.ПолучитьЗаказ(Токен, UUID, Истина);
```



```sh title="Пример команды CLI"
    
  oint cdek ПолучитьЗаказ --token "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg2ODEyNjEsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJhY2NvdW50LWxhbmc6cnVzIiwiY29udHJhY3Q60JjQnC3QoNCkLdCT0JvQky0yMiIsImFwaS12ZXJzaW9uOjEuMSIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJzb2xpZC1hZGRyZ..." --uuid "f1799065-01de-448c-91cf-8afe7d4c0cfc" --testapi %testapi%

```

```json title="Результат"
{
 "entity": {
  "uuid": "0c6b403d-000a-4d64-a282-798607b5e01f",
  "type": 1,
  "number": "ddOererre7450813980068",
  "tariff_code": 139,
  "comment": "Новый заказ",
  "delivery_recipient_cost": {
   "value": 50
  },
  "delivery_recipient_cost_adv": [
   {
    "threshold": 200,
    "sum": 3000
   }
  ],
  "sender": {
   "name": "Петров Петр"
  },
  "recipient": {
   "name": "Иванов Иван",
   "phones": [
    {
     "number": "+79134637228"
    }
   ]
  },
  "from_location": {
   "code": 44,
   "city": "Москва",
   "address": "пр. Ленинградский, д.4"
  },
  "to_location": {
   "code": 270,
   "city": "Новосибирск",
   "address": "ул. Блюхера, 32"
  },
  "services": [
   {
    "code": "SECURE_PACKAGE_A2",
    "parameter": "10"
   }
  ],
  "packages": [
   {
    "number": "bar-001",
    "weight": 4000,
    "length": 10,
    "width": 10,
    "height": 10,
    "comment": "Упаковка",
    "items": [
     {
      "name": "Товар",
      "ware_key": "00055",
      "payment": {
       "value": 3000
      },
      "weight": 700,
      "amount": 2,
      "url": "www.item.ru",
      "cost": 300
     }
    ]
   }
  ],
  "statuses": [
   {
    "code": "ACCEPTED",
    "name": "Принят",
    "date_time": "2024-10-12T17:43:53+03:00",
    "city": "Офис СДЭК"
   }
  ]
 },
 "requests": [
  {
   "request_uuid": "8f4e5a29-7954-4f53-9b87-f8fe7573345e",
   "type": "CREATE",
   "date_time": "2024-10-12T17:43:53+03:00",
   "state": "ACCEPTED"
  }
 ],
 "related_entities": []
}
```
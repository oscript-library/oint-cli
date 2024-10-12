﻿---
sidebar_position: 5
---

# Получить заказ по номеру
 Получает заказ по номеру СДЭК или внутреннему номеру клиента



`Функция ПолучитьЗаказПоНомеру(Знач Токен, Знач НомерЗаказа, Знач Внутренний = Ложь, Знач ТестовыйAPI = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен авторизации |
  | НомерЗаказа | --number | Строка | Номер заказа |
  | Внутренний | --internal | Булево | Вид номера заказа. Истина > номер в базе клиента, Ложь > номер СДЭК |
  | ТестовыйAPI | --testapi | Булево | Флаг использования API для тестовых запросов |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK

<br/>

:::tip
Метод в документации API: [Информация о заказе](https://api-docs.cdek.ru/29923975.html)
:::
<br/>


```bsl title="Пример кода"
    Токен = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg3MzkwMDYsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJjb250cmFjdDrQmNCcLdCg0KQt0JPQm9CTLTIyIiwiYWNjb3VudC1sYW5nOnJ1cyIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJhcGktdmVyc2lvbjoxLjEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJjb250cmFnZW50L...";

    НомерЗаказа = "ddOererre7450813980068";
    Результат   = OPI_CDEK.ПолучитьЗаказПоНомеру(Токен, НомерЗаказа, Истина, Истина);
```



```sh title="Пример команды CLI"
    
  oint cdek ПолучитьЗаказПоНомеру --token "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJsb2NhdGlvbjphbGwiLCJvcmRlcjphbGwiLCJwYXltZW50OmFsbCJdLCJleHAiOjE3Mjg2ODEyNjEsImF1dGhvcml0aWVzIjpbInNoYXJkLWlkOnJ1LTAxIiwiY2xpZW50LWNpdHk60J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwiLCJhY2NvdW50LWxhbmc6cnVzIiwiY29udHJhY3Q60JjQnC3QoNCkLdCT0JvQky0yMiIsImFwaS12ZXJzaW9uOjEuMSIsImFjY291bnQtdXVpZDplOTI1YmQwZi0wNWE2LTRjNTYtYjczNy00Yjk5YzE0ZjY2OWEiLCJjbGllbnQtaWQtZWM1OmVkNzVlY2Y0LTMwZWQtNDE1My1hZmU5LWViODBiYjUxMmYyMiIsImNvbnRyYWN0LWlkOmRlNDJjYjcxLTZjOGMtNGNmNS04MjIyLWNmYjY2MDQ0ZThkZiIsImNsaWVudC1pZC1lYzQ6MTQzNDgyMzEiLCJzb2xpZC1hZGRyZ..." --number "ddOererre7450813980068" --internal %internal% --testapi %testapi%

```

```json title="Результат"
{
 "entity": {
  "uuid": "0c6b403d-000a-4d64-a282-798607b5e01f",
  "type": 1,
  "is_return": false,
  "is_reverse": false,
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
   "name": "Петров Петр",
   "passport_requirements_satisfied": false
  },
  "seller": {
   "name": "Тестирование Интеграции ИМ"
  },
  "recipient": {
   "name": "Иванов Иван",
   "phones": [
    {
     "number": "+79134637228"
    }
   ],
   "passport_requirements_satisfied": false
  },
  "from_location": {
   "code": 44,
   "city_uuid": "7e8f36ba-d937-4ce4-8d53-e44177db6469",
   "city": "Москва",
   "fias_guid": "0c5b2444-70a0-4932-980c-b4dc0d3f02b5",
   "kladr_code": "7700000000000",
   "country_code": "RU",
   "country": "Россия",
   "region": "Москва",
   "region_code": 81,
   "sub_region": "Москва",
   "longitude": 37.61556,
   "latitude": 55.75222,
   "address": "пр. Ленинградский, д.4"
  },
  "to_location": {
   "code": 270,
   "city_uuid": "4e938d63-e189-454d-bb5c-54bfb2f1e4e2",
   "city": "Новосибирск",
   "kladr_code": "5400000100000",
   "country_code": "RU",
   "country": "Россия",
   "region": "Новосибирская область",
   "region_code": 23,
   "sub_region": "городской округ Новосибирск",
   "longitude": 82.906928,
   "latitude": 55.028739,
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
      "return_item_detail": {},
      "excise": false,
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
  ],
  "is_client_return": false,
  "delivery_detail": {
   "total_sum": 0,
   "payment_info": []
  },
  "calls": {}
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
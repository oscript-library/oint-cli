---
id: MSSQL
sidebar_class_name: MSSQL
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, MSSQL, Microsoft SQL Server]
---

<img src={require('../../static/img/APIs/MSSQL.png').default} width='64px' />

# MS SQL Server

Этот раздел посвящен библиотеке для работы с базами данных MSSQL в 1С:Предприятие, OneScript и CLI. На данной странице описаны все действия, необходимые для полноценного начала работы

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">Для реализации некоторых функции в этой библиотеке используется внешняя компонента <br/>
Пожалуйста, ознакомьтесь с разделом ["О внешних компонентах"](/docs/Start/Component-requirements) перед началом работы</div>
</div>


<div class="theme-admonition theme-admonition-caution admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--warning">

<img src={require('../../static/img/lock.png').default} class="tipimage" />
<div class="addin">Для работы этой библиотеки на Linux необходим **OpenSSL 3.x** <br/>
Узнать больше: <a href="/docs/Start/Component-requirements#openssl" class="orangelink">"Об использовании OpenSSL во внешних компонентах"</a></div>
</div>

## О реализованных методах

Данная библиотека состоит из двух частей: основных методов, вроде подключения и выполнения SQL-запросов, и небольшой ORM для часто встречающихся операций, вроде CREATE, SELECT, INSERT, DELETE и пр. Работа через ORM и через тексты запросов, выполняемые функцией `ВыполнитьЗапросSQL()`, технически не отличается: ORM просто формирует текст SQL-запроса на основе макетов, но далее также выполняет их этой функцией

По умолчанию, все запросы SELECT возвращают массив выбранных данных, а остальные запросы - только `true` в поле `result` при успехе, либо `false` и текст ошибки в полях `result` и `error` соответственно. Для выполнения запросов, требующих возврата данных, но не являющихся запросами SELECT, в функции `ВыполнитьЗапросSQL()` есть параметр `ФорсироватьРезультат`

## Параметры запросов

Коннектор MSSQL поддерживает использование позиционных параметров. Все значения, передаваемые как при прямом выполнении запросов через функцию `ВыполнитьЗапросSQL()`, так и в ORM методах с установкой значений, вроде `ДобавитьЗаписи` и `ОбновитьЗаписи`, должный представлять из себя структуру вида `{'Тип данных': 'Значение'}`. Поддерживаются следующие типы данных\*:

> \* В перечне типов MSSQL  перечислены только некоторые подходящие типы

  | Имя типа (ключ структуры) | Тип значения 1С | Подходит для типов MSSQL |
  |-|-|-|
  | TINYINT | Число  | tinyint |
  | SMALLINT | Число  | smallint |
  | INT | Число  | int |
  | BIGINT | Число  | bigint |
  | FLOAT24 | Число  | float(24), real |
  | FLOAT53 | Число  | float(53) |
  | NUMERIC | Число  | decimal, numeric |
  | DECIMAL | Число  | decimal, numeric |
  | BIT | Булево | bit |
  | NVARCHAR | Строка | nvarchar, varchar, nchar, char, ntext, text |
  | UUID | Строка, УникальныйИдентификатор | uniqueidentifier |
  | XML | Строка | xml |
  | DATE | Дата, Строка | date |
  | TIME | Дата, Строка | time |
  | DATETIME | Дата, Строка | datetime, datetime2 |
  | DATETIMEOFFSET | Дата, Строка | datetimeoffset |
  | BYTES | ДвоичныеДанные | varbinary |

## Получение двоичных данных

Двоичные данные при получении из БД будут представленны как объект (структура) вида `{"BYTES": "Base64 строка"}` и должны быть преобразованы из Base64 вручную

## TLS

Библиотека поддерживает работу в режиме TLS. Для его включения необходимо сформировать настройки TLS при помощи функции `ПолучитьНастройкиTls`, и передать их как соответствующий параметр в функцию `ОткрытьСоединение` или одну из функций ORM, поддерживающих данный параметр. Если параметр TLS при вызове этих функций не передан, соединение инициализируется в незащищенном режиме

:::tip
Настройки Tls могут быть установлены только в момент создания соединения: явного, при использовании функции `ОткрытьСоединение` или неявного, при передаче строки подключения в методы ORM.

Передача настроек Tls совместно с передачей уже созданного соединения в параметр Соединение будет проигнорирована
:::

## Совместимость

Технически, реализация коннектора представляет из себя Native компоненту на Rust. Она поставляется в формате zip-архива со сборками для всех основных платформ: x86 и x64 Windows и Linux. Фактическое тестирование проводилось на Windows x64 и, косвенно (через OneScript), на Linux x64
﻿Процедура ОтформатироватьМодуль(Знач ПутьКМодулю) Экспорт

	ТекстовыйДокумент = Новый ТекстовыйДокумент();
	ТекстовыйДокумент.Прочитать(ПутьКМодулю, "UTF-8");

	БлокиКода  = РазобратьМодульНаБлоки(ТекстовыйДокумент);

	Для Н = 0 По БлокиКода.ВГраница() Цикл

		МассивСтрокБлока = СтрРазделить(БлокиКода[Н], Символы.ПС);

		Если МассивСтрокБлока.Количество() < 2 Тогда
			Продолжить;
		ИначеЕсли СтрНачинаетсяС(СокрЛП(МассивСтрокБлока[1]), "//") Тогда
			Продолжить;
		Иначе
			ВыровнятьЗнакиРавно(МассивСтрокБлока);
			ВыровнятьЗапятые(МассивСтрокБлока);
		КонецЕсли;

		БлокиКода[Н] = СтрСоединить(МассивСтрокБлока, Символы.ПС);

	КонецЦикла;

	ТекстФайла = СтрСоединить(БлокиКода, "");
	ТекстФайла = СтрЗаменить(ТекстФайла, Символы.Таб, "    ");

	ТекстовыйДокумент.УстановитьТекст(ТекстФайла);
	ТекстовыйДокумент.Записать(ПутьКМодулю);

КонецПроцедуры

Функция РазобратьМодульНаБлоки(Знач ТекстовыйДокумент)

	Для Н = 1 По ТекстовыйДокумент.КоличествоСтрок() Цикл

		ТекущаяСтрока = ТекстовыйДокумент.ПолучитьСтроку(Н);

		Если Не ЗначениеЗаполнено(СокрЛП(ТекущаяСтрока)) Тогда
			ТекстовыйДокумент.ЗаменитьСтроку(Н, "⣿");
		Иначе
			ТекстовыйДокумент.ЗаменитьСтроку(Н, СокрП(ТекущаяСтрока));
		КонецЕсли;

	КонецЦикла;

	ТекстФайла = ТекстовыйДокумент.ПолучитьТекст();
	БлокиФайла = СтрРазделить(ТекстФайла, "⣿");

	Возврат БлокиФайла;

КонецФункции

Процедура ВыровнятьЗнакиРавно(МассивСтрокБлока)

	СоответствиеРасположений = Новый Соответствие();
	МаксимальноеРасположение = 0;
	ЧислоЗнаковРавно         = 0;

	Для Н = 0 По МассивСтрокБлока.ВГраница() Цикл

		РасположениеРавно = СтрНайти(МассивСтрокБлока[Н], "=");

		Если Не РасположениеРавно = 0 Тогда
			
			МассивЧастей = СтрРазделить(МассивСтрокБлока[Н], "=");
			НеПроверять  = Ложь;
			
			Для А = 0 По МассивЧастей.ВГраница() - 1 Цикл
				
				ЧислоКавычек = СтрЧислоВхождений(МассивЧастей[А], """");
				
				Если ЧислоКавычек <> 0 И ЧислоКавычек % 2 <> 0 Тогда
					СоответствиеРасположений.Вставить(Н, 0);
					НеПроверять = Истина;
					Прервать;
				КонецЕсли;

			КонецЦикла;

			Если НеПроверять Тогда
				Продолжить;
			КонецЕсли;

		КонецЕсли;

		СоответствиеРасположений.Вставить(Н, РасположениеРавно);
		МаксимальноеРасположение = ?(РасположениеРавно > МаксимальноеРасположение, РасположениеРавно, МаксимальноеРасположение);

		Если Не РасположениеРавно = 0 Тогда
			ЧислоЗнаковРавно = ЧислоЗнаковРавно + 1;
		КонецЕсли;

	КонецЦикла;

	Если МаксимальноеРасположение = 0 Или ЧислоЗнаковРавно < 2 Тогда
		Возврат;
	КонецЕсли;

	Для Каждого СтрокаБлока Из СоответствиеРасположений Цикл

		РасположениеРавно = СтрокаБлока.Значение;
		Индекс            = СтрокаБлока.Ключ;

		Если РасположениеРавно = 0 Или МаксимальноеРасположение - РасположениеРавно > 12 Тогда
			Продолжить;
		КонецЕсли;

		Для Н = РасположениеРавно По МаксимальноеРасположение - 1 Цикл
			МассивСтрокБлока[Индекс] = СтрЗаменить(МассивСтрокБлока[Индекс], "=", " =");
		КонецЦикла;

	КонецЦикла;

КонецПроцедуры

Процедура ВыровнятьЗапятые(МассивСтрокБлока, СоответствиеМаксимумов = "")

	ПолноеСоответствиеРасположений = Новый Соответствие();
	СтрокаСЗапятыми = 0;
	НачалоСтроки    = "";

	Для Н = 0 По МассивСтрокБлока.ВГраница() Цикл

		МассивУчастков   = СтрРазделить(МассивСтрокБлока[Н], ",");
		МассивУчастков_  = Новый Массив;
		Соединение       = Ложь;
		СтрокаСоединения = "";

		Для Каждого Участок Из МассивУчастков Цикл

			ЧислоКавычек = СтрЧислоВхождений(Участок, """");

			Если (ЧислоКавычек = 0 Или ЧислоКавычек % 2 = 0 ) И Не Соединение Тогда

				МассивУчастков_.Добавить(Участок);

			ИначеЕсли Соединение И ЧислоКавычек % 2 <> 0 Тогда
				МассивУчастков_.Добавить(СтрокаСоединения + "," + Участок);
				СтрокаСоединения = "";
				Соединение       = Ложь;

			Иначе
				СтрокаСоединения = ?(ЗначениеЗаполнено(СтрокаСоединения), СтрокаСоединения + "," + Участок, Участок);
				Соединение       = Истина;
			КонецЕсли;

		КонецЦикла;

		МассивУчастков = МассивУчастков_;

		Если МассивУчастков.Количество() < 2 Тогда
			Продолжить;
		Иначе
			СтрокаСЗапятыми = СтрокаСЗапятыми + 1;
		КонецЕсли;

		МассивНачалаСтроки = СтрРазделить(МассивУчастков[0], "(");

		Если МассивНачалаСтроки.Количество() < 2 Тогда
			Продолжить;
		КонецЕсли;

		НачалоСтроки             = МассивНачалаСтроки[0];
		СоответствиеРасположений = ПолноеСоответствиеРасположений[НачалоСтроки];

		Если Не ЗначениеЗаполнено(СоответствиеРасположений) Тогда
			СоответствиеРасположений = Новый Соответствие;
		КонецЕсли;

		Для Р = 0 По МассивУчастков.ВГраница() - 1 Цикл

			Если Не ЗначениеЗаполнено(СоответствиеМаксимумов) Тогда

				ДлинаУчастка = СтрДлина(МассивУчастков[Р]);

				ТекущийМаксимум = СоответствиеРасположений.Получить(Р);
				ТекущийМаксимум = ?(ЗначениеЗаполнено(ТекущийМаксимум), ТекущийМаксимум, 0);
				ТекущийМаксимум = ?(ДлинаУчастка > ТекущийМаксимум    , ДлинаУчастка   , ТекущийМаксимум);

				СоответствиеРасположений.Вставить(Р, ТекущийМаксимум);

			Иначе

				ТекущееСоответствиеМаксимумов = СоответствиеМаксимумов[НачалоСтроки];

				Если Не ЗначениеЗаполнено(ТекущееСоответствиеМаксимумов) Тогда
					Прервать;
				КонецЕсли;

				НеобходимаяДлина = ТекущееСоответствиеМаксимумов[Р];

				Если НеобходимаяДлина = Неопределено Тогда
					Продолжить;
				КонецЕсли;

				Пока СтрДлина(МассивУчастков[Р]) < НеобходимаяДлина Цикл
					МассивУчастков[Р] = МассивУчастков[Р] + " ";
				КонецЦикла;

			КонецЕсли;

		КонецЦикла;

		ПолноеСоответствиеРасположений.Вставить(НачалоСтроки, СоответствиеРасположений);

		МассивСтрокБлока[Н] = СтрСоединить(МассивУчастков, ",");

	КонецЦикла;

	Если Не ЗначениеЗаполнено(СоответствиеМаксимумов)
		И ЗначениеЗаполнено(ПолноеСоответствиеРасположений)
		И СтрокаСЗапятыми > 1 Тогда
		ВыровнятьЗапятые(МассивСтрокБлока, ПолноеСоответствиеРасположений);
	КонецЕсли;

КонецПроцедуры

Для Каждого Файл Из НайтиФайлы("./src", "*.os", Истина) Цикл
	Если СтрНайти(Файл.ПолноеИмя, "\cli\") = 0 
		И СтрНайти(Файл.ПолноеИмя, "/cli/") = 0 Тогда
		ОтформатироватьМодуль(Файл.ПолноеИмя);
	КонецЕсли;
КонецЦикла;

Для Каждого Файл Из НайтиФайлы("./src", "*.bsl", Истина) Цикл
	Если СтрНайти(Файл.ПолноеИмя, "\cli\") = 0 
		И СтрНайти(Файл.ПолноеИмя, "/cli/") = 0 Тогда
		ОтформатироватьМодуль(Файл.ПолноеИмя);
	КонецЕсли;
КонецЦикла;
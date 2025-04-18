﻿#Использовать "../../tools"
#Использовать coloratos

#Область СлужебныйПрограммныйИнтерфейс

Процедура ВывестиНачальнуюСтраницу(Знач СоответствиеКомандМодулей, Знач Версия) Экспорт
	
	СписокКоманд = "";

	Для Каждого Команда Из СоответствиеКомандМодулей Цикл
		СписокКоманд = СписокКоманд + Команда.Ключ + ", ";
	КонецЦикла;

	ЛишниеСимволы = 2;
	СписокКоманд  = Лев(СписокКоманд, СтрДлина(СписокКоманд) - ЛишниеСимволы);

	Консоль.ЦветТекста = ЦветКонсоли.Зеленый;
	Консоль.ВывестиСтроку("");

	Консоль.ЦветТекста = ЦветКонсоли.Желтый;
	ЦветнойВывод.Вывести("
		|    _______ _____________  ___  _______
		|    __  __ ___/__  _/_ /  |  / /___  __/
		|    _  / / / __  /  __      / __  /   
		|    / /_/ / __/ /   _  /|  /  _  /    
		|    \____/  /___/   /_/ |_/   /_/     
		|                          
		|
		| Welcome to  (OInt|#color=Белый) v (" + Версия + "|#color=Зеленый)!
		|
		| The structure of calls:
	    | 
		| "
		+ "(oint|#color=Белый) "
		+ "(<library>|#color=Бирюза) "
		+ "(<method>|#color=Бирюза) " 
		+ "(--option1|#color=Серый) "
		+ "(""|#color=Зеленый)"
		+ "(Value|#color=Белый)"
		+ "(""|#color=Зеленый) "
		+ "(...|#color=Белый) "
		+ "(--optionN|#color=Серый) "
		+ "(""|#color=Зеленый)"
		+ "(Value|#color=Белый)"
		+ "(""|#color=Зеленый) ");

	Консоль.Вывести("
		|
		| Calling a library without a method or a method without parameters returns help
		| List of available libraries: "); 
		
	Консоль.ЦветТекста = ЦветКонсоли.Белый;
	Консоль.Вывести(СписокКоманд); 

	Консоль.ЦветТекста = ЦветКонсоли.Белый;
	ЦветнойВывод.ВывестиСтроку("
		|
		| (Common options:|#color=Желтый)
		|
		|  (--help|#color=Зеленый)  - displays help for the current command or method. Similar to calling the command without options.
		|  (--debug|#color=Зеленый) - the flag responsible for providing more detailed information during program execution
		|  (--out|#color=Зеленый)   - the path for saving the result (especially, for binary data)
		|");
	
	Консоль.ЦветТекста = ЦветКонсоли.Желтый;
	ЦветнойВывод.ВывестиСтроку(" You can find the full documentation at the following address (https://openintegrations.dev|#color=Бирюза)" + Символы.ПС);

	Консоль.ВывестиСтроку("");
	Консоль.ЦветТекста = ЦветКонсоли.Белый;

	ЗавершитьРаботу(0);
	
КонецПроцедуры

Процедура ВывестиСправкуПоМетодам(Знач Команда, Знач ТаблицаПараметров) Экспорт

	Консоль.ЦветТекста = ЦветКонсоли.Белый;
	ЦветнойВывод.ВывестиСтроку(Символы.ПС + " (##|#color=Зеленый) Library - (" + Команда + "|#color=Бирюза)");

	ТаблицаПараметров.Свернуть("Метод,Область");
	
	ЦветнойВывод.ВывестиСтроку(" (##|#color=Зеленый) Available methods" + Символы.ПС);
	Консоль.ЦветТекста = ЦветКонсоли.Белый;

	ТекущаяОбласть       = "";
	Счетчик              = 0;
	КоличествоПараметров = ТаблицаПараметров.Количество();

	Для каждого СтрокаМетода Из ТаблицаПараметров Цикл

		Первый    = Ложь;
		Последний = Ложь;

		Если ТекущаяОбласть <> СтрокаМетода.Область Тогда
			ТекущаяОбласть = СтрокаМетода.Область;
			ЦветнойВывод.ВывестиСтроку("    (o|#color=Желтый) (" + ТекущаяОбласть + "|#color=Бирюза)");
			Первый = Истина;
		КонецЕсли;

		Если Счетчик >= КоличествоПараметров - 1 Тогда
			Последний = Истина;
		Иначе
			Последний = ТаблицаПараметров[Счетчик + 1].Область <> ТекущаяОбласть;
		КонецЕсли;

		Если Первый И Последний Тогда
			Метка = "└───";
		ИначеЕсли Первый Тогда
			Метка = "└─┬─";
		ИначеЕсли Последний Тогда
			Метка = "  └─";
		Иначе
			Метка = "  ├─";
		КонецЕсли;
		
		ЦветнойВывод.ВывестиСтроку("    (" + Метка + "|#color=Желтый) " + СтрокаМетода.Метод);

		Счетчик = Счетчик + 1;
	КонецЦикла;

	Сообщить(Символы.ПС);
	Консоль.ЦветТекста = ЦветКонсоли.Белый;

	ЗавершитьРаботу(0);

КонецПроцедуры

Процедура ВывестиСправкуПоПараметрам(Знач ТаблицаПараметров) Экспорт 

	Если ТаблицаПараметров.Количество() = 0 Тогда
		ВывестиСообщениеИсключения("Метод");
	КонецЕсли;

	ИмяМетода    = ТаблицаПараметров[0].Метод;
	ТекстСправки = "
	| (##|#color=Зеленый) Method (" + ИмяМетода + "|#color=Бирюза)
	| (##|#color=Зеленый) "       + ТаблицаПараметров[0].ОписаниеМетода; 
	
	ЦветнойВывод.ВывестиСтроку(ТекстСправки);
	ТекстСправки = "";

	ОбработатьТабуляциюСправки(ТаблицаПараметров);

	Для Каждого ПараметрМетода Из ТаблицаПараметров Цикл

		ТекстСправки = ТекстСправки 
			+ Символы.ПС
			+ "    ("
			+ ПараметрМетода["Параметр"]
			+ "|#color=Желтый) - "
			+ ПараметрМетода["Описание"];

	КонецЦикла;

	ЦветнойВывод.ВывестиСтроку(ТекстСправки + Символы.ПС);

	ЗавершитьРаботу(0);
	
КонецПроцедуры

Процедура ВывестиСообщениеИсключения(Знач Причина, Знач ФайлВывода = "") Экспорт

	ФайлВывода = Строка(ФайлВывода);

	Если Причина = "Команда" Тогда
		Текст = "Invalid command! Please, check the input.";
		Код   = 1;

	ИначеЕсли Причина = "Метод" Тогда
		Текст = "Invalid method! Please, check the input.";
		Код   = 2;
		
	Иначе
		Текст = "An unexpected error occurred! " + Причина;
		Код   = 99;
	КонецЕсли;

	Текст = Символы.ПС + Текст + Символы.ПС;
	
	Сообщить(Текст, СтатусСообщения.ОченьВажное);

	Если ЗначениеЗаполнено(ФайлВывода) Тогда

		ТекстДД = ПолучитьДвоичныеДанныеИзСтроки(Текст);

		Попытка
			ТекстДД.Записать(ФайлВывода);
			Сообщить("The error message has been saved to a file: " + ФайлВывода, СтатусСообщения.Внимание);
		Исключение
			Сообщить("Failed to save the error to the output file: " + ErrorDescription(), СтатусСообщения.Внимание);
		КонецПопытки;

	КонецЕсли;

	ЗавершитьРаботу(Код);

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ОбработатьТабуляциюСправки(ТаблицаПараметров)

	Параметр_			= "Параметр";
	МаксимальнаяДлина 	= 15;

	Для Каждого ПараметрМетода Из ТаблицаПараметров Цикл
			
		Пока Не СтрДлина(ПараметрМетода[Параметр_]) = МаксимальнаяДлина Цикл
			ПараметрМетода[Параметр_] = ПараметрМетода[Параметр_] + " ";
		КонецЦикла;

		ТекущееОписание    = ПараметрМетода["Описание"];
		МассивОписания     = СтрРазделить(ТекущееОписание, Символы.ПС);
		НачальнаяТабуляция = 4;

		Если МассивОписания.Количество() = 1 Тогда
			Продолжить;
		Иначе

			Для Н = 1 По МассивОписания.ВГраница() Цикл

				ТекущийЭлемент = МассивОписания[Н];
				НеобходимаяДлина = СтрДлина(ТекущийЭлемент) + СтрДлина(ПараметрМетода[Параметр_] + " - ") + НачальнаяТабуляция;

				Пока СтрДлина(МассивОписания[Н]) < НеобходимаяДлина Цикл
					МассивОписания[Н] = " " + МассивОписания[Н];
				КонецЦикла;

			КонецЦикла;

			ПараметрМетода["Описание"] = СтрСоединить(МассивОписания, Символы.ПС);	
			
		КонецЕсли;

	КонецЦикла;

КонецПроцедуры

#КонецОбласти

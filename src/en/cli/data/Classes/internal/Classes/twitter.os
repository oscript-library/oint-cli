﻿Function ПолучитьСостав() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Библиотека");
    CompositionTable.Columns.Add("Модуль");
    CompositionTable.Columns.Add("Метод");
    CompositionTable.Columns.Add("МетодПоиска");
    CompositionTable.Columns.Add("Параметр");
    CompositionTable.Columns.Add("Описание");
    CompositionTable.Columns.Add("ОписаниеМетода");
    CompositionTable.Columns.Add("Область");

    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "GetAuthorizationLink";
    NewLine.МетодПоиска = "GETAUTHORIZATIONLINK";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Data and settings";
    NewLine.ОписаниеМетода   = "Forms a link for authorization via the browser
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--code";
    NewLine.Описание    = "Code obtained from authorization See GetAuthorizationLink";
    NewLine.Область     = "Data and settings";
    NewLine.ОписаниеМетода   = "Gets the token by the code received when authorizing using the link from GetAuthorizationLink
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Data and settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Data and settings";
    NewLine.ОписаниеМетода   = "Updates the v2 token using the refresh_token
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateCustomTweet";
    NewLine.МетодПоиска = "CREATECUSTOMTWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet with custom content
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateCustomTweet";
    NewLine.МетодПоиска = "CREATECUSTOMTWEET";
    NewLine.Параметр    = "--media";
    NewLine.Описание    = "Array of binary data or file paths (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateCustomTweet";
    NewLine.МетодПоиска = "CREATECUSTOMTWEET";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Array of poll options, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateCustomTweet";
    NewLine.МетодПоиска = "CREATECUSTOMTWEET";
    NewLine.Параметр    = "--dur";
    NewLine.Описание    = "Poll duration if necessary (poll without duration is not created) (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateCustomTweet";
    NewLine.МетодПоиска = "CREATECUSTOMTWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateTextTweet";
    NewLine.МетодПоиска = "CREATETEXTTWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet without attachments
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateTextTweet";
    NewLine.МетодПоиска = "CREATETEXTTWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateImageTweet";
    NewLine.МетодПоиска = "CREATEIMAGETWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet with an image attachment
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateImageTweet";
    NewLine.МетодПоиска = "CREATEIMAGETWEET";
    NewLine.Параметр    = "--pictures";
    NewLine.Описание    = "Image files array";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateImageTweet";
    NewLine.МетодПоиска = "CREATEIMAGETWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateGifTweet";
    NewLine.МетодПоиска = "CREATEGIFTWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet with a gif attachment
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateGifTweet";
    NewLine.МетодПоиска = "CREATEGIFTWEET";
    NewLine.Параметр    = "--gifs";
    NewLine.Описание    = "Gif files array";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateGifTweet";
    NewLine.МетодПоиска = "CREATEGIFTWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateVideoTweet";
    NewLine.МетодПоиска = "CREATEVIDEOTWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet with a video attachment
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateVideoTweet";
    NewLine.МетодПоиска = "CREATEVIDEOTWEET";
    NewLine.Параметр    = "--videos";
    NewLine.Описание    = "Video files array";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateVideoTweet";
    NewLine.МетодПоиска = "CREATEVIDEOTWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreatePollTweet";
    NewLine.МетодПоиска = "CREATEPOLLTWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet with a poll
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreatePollTweet";
    NewLine.МетодПоиска = "CREATEPOLLTWEET";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Poll options array";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreatePollTweet";
    NewLine.МетодПоиска = "CREATEPOLLTWEET";
    NewLine.Параметр    = "--duration";
    NewLine.Описание    = "Poll duration";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreatePollTweet";
    NewLine.МетодПоиска = "CREATEPOLLTWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "UploadAttachmentsArray";
    NewLine.МетодПоиска = "UPLOADATTACHMENTSARRAY";
    NewLine.Параметр    = "--files";
    NewLine.Описание    = "Array of files to be uploaded";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Uploads files to the server and returns their IDs
    |    Data structure for option --auth:
    |    {
    |     ""redirect_uri"": """",  
    |     ""client_id"": """",  
    |     ""client_secret"": """",  
    |     ""access_token"": """",  
    |     ""refresh_token"": """",  
    |     ""oauth_token"": """",  
    |     ""oauth_token_secret"": """",  
    |     ""oauth_consumer_key"": """", 
    |     ""oauth_consumer_secret"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "UploadAttachmentsArray";
    NewLine.МетодПоиска = "UPLOADATTACHMENTSARRAY";
    NewLine.Параметр    = "--type";
    NewLine.Описание    = "Attachment type: tweet_video, tweet_image, tweet_gif";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "UploadAttachmentsArray";
    NewLine.МетодПоиска = "UPLOADATTACHMENTSARRAY";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization data. See GetStandardParameters (optional, def. val. - Empty value)";
    NewLine.Область     = "Tweets";

    Return CompositionTable;
EndFunction


﻿---
sidebar_position: 7
---

# Add new recipients to a post
 Adds new groups or users to the recipients


*Function AddPostRecipients(Val URL, Val PostID, Val Visibility, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | PostID | --postid | String, Number | Post ID |
 | Visibility | --vision | String | Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

```bsl title="Code example"
	
 Visibility = "UA";
 PostID = "124";
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility, Token);
	
```

```sh title="CLI command example"
 
 oint bitrix24 AddPostRecipients --url "b24-ar17wx.bitrix24.by" --postid "124" --vision %vision% --token "b9df7366006e9f06006b12e400000001000..."

```


```json title="Result"

{
 "result": true,
 "time": {
 "start": 1718473318.17435,
 "finish": 1718473318.21352,
 "duration": 0.0391781330108643,
 "processing": 0.00464105606079102,
 "date_start": "2024-06-15T17:41:58+00:00",
 "date_finish": "2024-06-15T17:41:58+00:00",
 "operating_reset_at": 1718473918,
 "operating": 0
 }
}

```
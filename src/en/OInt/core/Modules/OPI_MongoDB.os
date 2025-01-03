﻿// OneScript: ./OInt/core/Modules/OPI_MongoDB.os
// Lib: MongoDB
// CLI: mongodb

// MIT License

// Copyright (c) 2023 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

// Uncomment if OneScript is executed
#Use "../../tools"

#Region Public

#Region DatabaseManagement

// Get list of bases
// Gets a list of bases
//
// Note
// Method in MongoDB documentation: [listDatabases](@mongodb.com/docs/manual/reference/command/listDatabases/)
//
// Parameters:
// ConnectionString - String - Connection string to MongoDB server - connect
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from MongoDB server
Function GetListOfBases(Val ConnectionString) Export

    Client = MongoDBClient(ConnectionString);

    Response = Client.ListDatabases();
    Response = OPI_Tools.JsonToStructure(Response, False);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function MongoDBClient(Val ConnectionString)

    OPI_TypeConversion.GetLine(ConnectionString);

    Client                  = OPI_Tools.GetAddIn("MongoDB");
    Client.ConnectionString = ConnectionString;

    Return Client;

EndFunction

#EndRegion

REM .NET Core 2.1 VS 2017
REM dotnet new globaljson --sdk-version 2.1.500
REM .NET Core 2.1 VS 2019 16.0
REM dotnet new globaljson --sdk-version 2.1.600
REM .NET Core 2.1 VS 2019 16.1
dotnet new globaljson --sdk-version 2.1.700

rem create the solution
dotnet new sln -n SpyStore.Hol
rem create the ASP.NET Core Web App project and add it to the solution
dotnet new mvc -n SpyStore.Hol.Mvc -au none --no-https  -o .\SpyStore.Hol.Mvc
dotnet sln SpyStore.Hol.sln add SpyStore.Hol.Mvc
rem create the Data Access Layer class library, and add to the solution
dotnet new classlib -n SpyStore.Hol.Dal -o .\SpyStore.Hol.Dal -f netcoreapp2.1
dotnet sln SpyStore.Hol.sln add SpyStore.Hol.Dal
rem create the class library for the Models and add it to the solution
dotnet new classlib -n SpyStore.Hol.Models -o .\SpyStore.Hol.Models -f netcoreapp2.1
dotnet sln SpyStore.Hol.sln add SpyStore.Hol.Models
rem create the Data Access Layer XUnit project and add it to the solution
dotnet new xunit -n SpyStore.Hol.Dal.Tests -o .\SpyStore.Hol.Dal.Tests
dotnet sln SpyStore.Hol.sln add SpyStore.Hol.Dal.Tests
rem create the XUnit project for the Service and add it to the solution
dotnet new xunit -n SpyStore.Hol.Service.Tests -o .\SpyStore.Hol.Service.Tests 
dotnet sln SpyStore.Hol.sln add SpyStore.Hol.Service.Tests
rem create the ASP.NET Core RESTful Service project, add it to the solution
rem NOTE THE NEXT TWO LINES MUST BE ON ONE LINE IN THE COMMAND FILE
dotnet new webapi -n SpyStore.Hol.Service -au none --no-https  -o .\SpyStore.Hol.Service 
dotnet sln SpyStore.Hol.sln add SpyStore.Hol.Service

dotnet add SpyStore.Hol.Mvc reference SpyStore.Hol.Models

dotnet add SpyStore.Hol.Dal reference SpyStore.Hol.Models

dotnet add SpyStore.Hol.Dal.tests reference SpyStore.Hol.Models
dotnet add SpyStore.Hol.Dal.tests reference SpyStore.Hol.Dal

dotnet add SpyStore.Hol.Service reference SpyStore.Hol.Dal
dotnet add SpyStore.Hol.Service reference SpyStore.Hol.Models

dotnet add SpyStore.Hol.Service.Tests reference SpyStore.Hol.Models
dotnet add SpyStore.Hol.Service.Tests reference SpyStore.Hol.Dal

dotnet add SpyStore.Hol.Service package AutoMapper
dotnet add SpyStore.Hol.Service package Newtonsoft.Json 
dotnet add SpyStore.Hol.Service package Swashbuckle.AspNetCore.Annotations
dotnet add SpyStore.Hol.Service package Swashbuckle.AspNetCore.Swagger
dotnet add SpyStore.Hol.Service package Swashbuckle.AspNetCore.SwaggerGen
dotnet add SpyStore.Hol.Service package Swashbuckle.AspNetCore.SwaggerUI
dotnet add SpyStore.Hol.Service package Microsoft.VisualStudio.Azure.Containers.Tools.Targets -v 1.7.9
dotnet add SpyStore.Hol.Service package Microsoft.VisualStudio.Web.CodeGeneration.Design -v 2.1.9

dotnet add SpyStore.Hol.Mvc package AutoMapper
dotnet add SpyStore.Hol.Mvc package Newtonsoft.Json
dotnet add SpyStore.Hol.Mvc package LigerShark.WebOptimizer.Core
dotnet add SpyStore.Hol.Mvc package LigerShark.WebOptimizer.sass -v 1.0.34-beta

dotnet add SpyStore.Hol.Dal package Microsoft.EntityFrameworkCore.SqlServer -v 2.1.1
dotnet add SpyStore.Hol.Dal package Microsoft.EntityFrameworkCore.Design -v 2.1.1
dotnet add SpyStore.Hol.Dal package Newtonsoft.Json
dotnet add SpyStore.Hol.Dal package Microsoft.EntityFrameworkCore.Tools -v 2.1.1

dotnet add SpyStore.Hol.Models package Microsoft.EntityFrameworkCore.Abstractions -v 2.1.1
dotnet add SpyStore.Hol.Models package AutoMapper
dotnet add SpyStore.Hol.Models package Newtonsoft.Json

dotnet add SpyStore.Hol.Dal.Tests package Microsoft.EntityFrameworkCore.SqlServer -v 2.1.1




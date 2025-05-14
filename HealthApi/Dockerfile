FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["HealthApi.csproj", "./"]
RUN dotnet restore "./HealthApi.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "HealthApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "HealthApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "HealthApi.dll"]

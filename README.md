# dbt_scooters
## Описание проекта
Проект на базе dbt, предназначенный для управления и трансформации данных,
связанных с использованием скутеров кикшеринга.
Позволяет выстроить аналитику данных о передвижениях и использовании скутеров.

## Структура проекта
```bash
dbt_scooters/
├── models/ # SQL модели трансформаций
├── macros/ # Jinja макросы
├── tests/ # Тесты данных
├── snapshots/ # Снапшоты для SCD
├── analysis/ # Аналитические запросы
├── dbt_project.yml # Конфигурация проекта
└── uv.lock # Lock-файл зависимостей
```

## Быстрый старт

1. Убедитесь, что у вас установлен пакетный менеджер uv:

```bash
uv --version
```

2. Установите зависимости проекта (dbt и адаптер postgres):
   
```bash
uv sync
```

3. Клонируйте репозиторий, а затем перейдите в директорию проекта:

```bash
cd dbt_scooters
```

## Конфигурация

Обновите конфигурационный файл `~/.dbt/profiles.yml` с вашими данными доступа к базе данных.
```bash
uv sync
```

## Инициализация проекта
```bash
dbt deps              # Установка dbt-пакетов
dbt debug             # Проверка подключения
```
## Основные команды
### Запуск моделей
```bash
dbt run               # Запуск всех моделей
dbt run -m model_name # Запуск конкретной модели
dbt run -s tag:daily  # Запуск по тегу
```
## Тестирование
```bash
dbt test              # Все тесты
dbt test -m model_name # Тесты для модели
dbt test --store-failures # Сохранить результаты падений
```
## Документация
```bash
dbt docs generate     # Генерация документации
dbt docs serve        # Запуск веб-документации
```
## Анализ
```bash
dbt compile          # Компиляция без выполнения
dbt parse            # Проверка синтаксиса
```
## Полезные флаги
```bash
--full-refresh       # Полное обновление инкрементальных моделей
--target dev         # Выбор окружения
--vars '{key: value}' # Передача переменных
```

## Конфигурация

Проект использует uv для управления Python-окружением. Основные зависимости:

    dbt-core

    Адаптер БД (например dbt-postgres, dbt-snowflake)

Разработка

    Добавьте модели в models/

    Определите тесты в schema.yml

    Запустите dbt run && dbt test

    Сгенерируйте документацию: dbt docs generate

Проект использует современный пайплайн данных с dbt и uv

Примечание: если виртуальное окружение не активно, используйте `uv run dbt `.



### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


4. Активируйте PostGIS в базе PostgreSQL для работы с геоданными:

```sql
create extension postgis schema public;
```
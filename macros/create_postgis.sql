{% macro create_postgis(name) %}
    {% set query %}
        create extension postgis schema public;
    {% endset %}
    {% do log("Activating PostGIS in PostgreSQL", info=True) %}
    {% do run_query(query) %}
{% endmacro %}

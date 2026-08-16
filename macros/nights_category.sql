{% macro nights_category(column_name) %}

    CASE WHEN {{ column_name }} <3 THEN 'Short stay'
         WHEN {{ column_name }} >= 3 AND {{ column_name }} < 7 THEN 'Weekly'
         WHEN {{ column_name }} >= 7 THEN 'Long stay'
    END
{% endmacro %}
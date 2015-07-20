#!/bin/bash

DB='hbbs'
TDB=$DB'_test'

# create fresh test database
echo "DROP DATABASE IF EXISTS $TDB" | mysql
mysql --batch --raw --skip-column-names -e "SHOW CREATE DATABASE $DB" | sed -e "s/^$DB\t//" -e "s/$DB/$TDB/g" | mysql

# create all tables
mysqldump --no-data $DB | mysql -D $TDB

# create all procedures
cat routine/*.sql | mysql -D $TDB

# create all triggers
cat trigger/*.sql | mysql -D $TDB

# do the tests
for d in routine trigger; do
    echo TESTING $d
    for f in $d/*.my.sql; do
        test=$(basename -s '.my.sql' $f)
        if bash $d/$test.test; then
            echo 'PASS: '$test 
        else
            echo 'FAIL: '$test
        fi
    done
done


#!/usr/bin/env bash

set -e

host="$1"

if [ -z "$host" ]; then
	echo "missing host argument"
	exit 1
fi

./build.sh

outputFile="target/killbill-bluepay-plugin-0.0.1-SNAPSHOT-jar-with-dependencies.jar"
scp $outputFile stack@"$host":coconut-stack/killbill/killbill-bluepay-plugin.jar
cp $outputFile /home/chris13524/programming/coconut-stack/killbill/killbill-bluepay-plugin.jar

outputSql="src/main/java/com/fathomstudio/killbillbluepayplugin/db.sql"
scp $outputSql stack@"$host":coconut-stack/database/bluePay.sql
cp $outputSql /home/chris13524/programming/coconut-stack/database/bluePay.sql
#!/bin/bash
cd sql/schema

goose postgres postgres://postgres:zRocky@db/example up

cd ..

sqlc generate 

cd ..

./rssagg



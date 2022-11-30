#!/bin/bash

data=$(wget https://opendata.bnportugal.gov.pt/downloads.htm -O - |grep bndlivre -A1|tail -1|cut -d\> -f2|cut -d\< -f1)
rm -f bndlivre.csv.zip
wget https://opendata.bnportugal.gov.pt/docs/bndlivre.csv.zip
unzip bndlivre.csv.zip
git add bndlivre.csv
git commit -m "sync: $data"
git push

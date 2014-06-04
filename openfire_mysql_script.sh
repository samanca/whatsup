#!/bin/bash
for i in `seq 1 1600`;
do
    echo $i
    mysql -uroot openfire -e "insert into ofUser (username,plainPassword,creationDate,modificationDate) VALUES ('$i','root',0,0)"
done

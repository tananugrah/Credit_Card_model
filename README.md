# Credit_Card_model
pycaret, sql, python, mssql, tsql, docker

1. Instal Docker untuk menjalankan container MSSQL.
2. Instal image MSSQL dan buat container MSSQL.
3. Import File csv ke dalam database yang telah dibuat.
4. Create table as select dan join data sesuai kebutuhan.
5. Membuat model menggunakan pycaret

# Instal Docker

untuk instalasi docker engine ataupun docker dekstop dapat dilihat pada:

```bash
https://docs.docker.com
```

# Instal Image dan Container MSSQL

Pre-requisite : docker sudah diinstalasi di dalam server/localhost.

1. Pull image MSSQL Server.

```bash
sudo docker pull mcr.microsoft.com/mssql/server:2017-latest
```

2. Membuat Container MSSQL server.

```bash
sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Test@1234abcd' -e ‘MSSQL_PID=Express’ -p '1401:1433' --name sqltest -d mcr.microsoft.com/mssql/server:2017-latest
```
3. Melakukan operasi di dalam SQL Server dengan menggunakan mssql melalui terminal.

```bash
$ mssql -U SA -P "Test@1234abcd"
```
4. Connect database ke Dalam DBEAVER.
isi port, database dan password sesuai dengan container yang telah dibuat.

![Screen Shot 2023-01-26 at 15 32 18](https://user-images.githubusercontent.com/22236787/214790729-02284074-a831-4a35-9b12-c5941e266077.png)


# Import File csv ke dalam database yang telah dibuat

setelah database terhubung di DBeaver import file csv. file dapat diakses pada : https://github.com/tananugrah/Credit_Card_model/tree/main/dataset

# Create table as select dan join data sesuai kebutuhan.
menggabungkan data customer_history dari table lainnya 
file dapat diakses pada : https://github.com/tananugrah/Credit_Card_model/blob/main/CTAS_Customer_History.sql

# Membuat model menggunakan pycaret
membuat model machine learning menggunakan library python pycaret untuk analisa data.
file dapat diakses pada : https://github.com/tananugrah/Credit_Card_model/blob/main/model_customer_CC.ipynb


source : https://pycaret.gitbook.io/docs/get-started/quickstart

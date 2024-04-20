import psycopg2
from psycopg2 import OperationalError,errorcodes,errors


def otworz_plik(nazwa_pliku):
    try:
        plik = open(nazwa_pliku, "r", encoding="utf-8")
        return plik
    except FileNotFoundError:
        print("Nie znaleziono pliku do wczytania1")
        return None

def wgraj_do_bazy(dane):
    try:
        connection = psycopg2.connect(user="mariusz",
                                      password="Nana@1974",
                                      host="testowy123.postgres.database.azure.com",
                                      dbname="testowa1",
                                      sslmode="require")
        
        kwerenda=dane.read()
        cursor = connection.cursor()
        cursor.execute(kwerenda)
        connection.commit()
        print("Dane wgrane do bazy")
    except OperationalError as e:
        print(f"OperationalError: {e}")

    finally:
        if connection:
            cursor.close()
            connection.close()
            print("Połączenie z bazą zamknięte")

def main():
    plik = otworz_plik("wgraj_do_bazy.sql")
    if plik:
        wgraj_do_bazy(plik)
        plik.close()

if __name__ == "__main__":
    main()
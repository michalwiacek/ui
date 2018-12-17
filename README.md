## SETUP

`> docker-compose build`

`> docker-compose run --rm web bin/rails db:create`

`> docker-compose run --rm web bin/rails db:migrate`

`> docker-compose run --rm web bin/rails db:seed`

`> docker-compose up -d`

or

`> docker-compose run --service-ports web` for debugging with pry

and then just go to `localhost:3000`

## TODO

1. ~~brak instrukcji uruchomienia aplikacji (README.md)~~

2. ~~całkowicie niezrozumiały interface, brak formatowania, etc~~

3. ~~plik `database.yml` zakomitowany (brak w gitignore)~~

4. ~~dodalem kategorie na koncu drzewa gdzie byly produkty -> wchodze w nia -> crash~~

5. ~~ brak walidacji miejsca w drzewie w produkcie~~

6. ~~brak enuma w bazie typu~~

7. zaprojektowane od gory (dziedziczenie parametrow) zamiast od dolu (filtrowanie wg. parametrow idac z gory na dol) - zobacz jak jest na grafice. w roocie mozna filtrowac po cenie (bo wszystkie liscie ja maja), w motoryzacji po rocznik/przebieg/cena (ale benzyna/diesel juz nie) i tak dalej

8. ~~brak enuma (nie mozna wybrac bnezyna/diesel)~~

9. zduplikowany kod

10. gdy dodamy kategorie w kategorii gdzie juz cos jest, to nie jest to obslugiwane (tworze kategorie test w tesli i w tym test jeszcze jeden test) i jest wyjątek

11. zle porofmatowany kod (brak np lamania linii po 80 znakach)

12. filtrowanie po wszystkim a nie po jednym polu

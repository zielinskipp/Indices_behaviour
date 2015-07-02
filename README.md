## INDEKSY ANALIZA

To repozytorium zawiera dane dotyczące analizy różnych metod liczeń indeksów akustycznych wykorzystywanych w analizach dzwiękosfery. Indeksy służą głównie do szacowania różnorodności biologicznej -  głównie zespołów ptaków. Probem w tym, że nie wiadomo jak proces pozyskiwania danych do analizy i późniejsza ich obróbka wpływa na wartości wskaźników.


To co trzeba zrobić to:

Wczytać surowe dane, następnie przeprowadzić kilka różnych metod filtracji danych:

* ruchoma średnia,
* liniowy filtr górnych częstotliwości liczony przy pomocy odwrotnej
transformanty Fouriera,
* konwersja do MP3
* odfiltrowanie przy pomocy programu akustycznego
* odfitrowanie górnych częstotliwości i resampling,
* filtr ze względu na amplitudę
* różne okna czasowe i dft? Może coś jeszcze?

Na razie skrypt będzie robiony na podstawie jednego godzinnego nagrania. Jak będzie skrypt gotowy, to można będzie pomyśleć o jakiś pełniejszych danych. Na przykład nagranie całej doby - i oczywiście skorelowanie tego z ilościami ptaków i innych dzwięków.
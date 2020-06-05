# tda
<h1><b>Topologiczna analiza danych</b> – projekt praktyczny</h1>

Topologiczna analiza danych (TDA) jest to nowe i innowacyjne podejście do analizy danych, które uwzględnia, że dane mają kształt. Topologiczny kształt danych daje możliwość, aby uprościć dany kształt, wyróżniając punkty o podobnych charakterystykach. Zatem trafnym stwierdzeniem jest, że metoda ta szuka zależności pomiędzy danymi, jednak nie daje klarownej odpowiedzi: dlaczego ta zależność występuje.    
<br>
<h2>Poniżej jest zrealizowany i opisany krok po kroku projekt, wykorzystujący metodę TDA.</h2>
<ol>
  
  <!-- 1 -->
  
  <li><b>Cel projektu</b></li>
<p>Celem projektu jest analiza drużyn piłkarskich w lidze angielskiej, a dokładniej eksploracja zależności pomiędzy cechami piłkarzy w drużynie, a osiągniętymi wynikami przez zespół.</p>

  <!-- 2 -->
  

<li><b>Wykorzystane narzędzia</b></li>
  <p>Podczas tworzenia projektu do przetwarzania danych, będzie wykorzystywana biblioteka Pandas w języku Python. Natomiast analiza danych zostanie wykonana za pomocą języka R, wykorzystującego bibliotekę TDA. Kod będzie implementowany w środowisku programistycznym Jupyter oraz RStudio.</p>
  
   <!-- 3 -->
  

<li><b>Sposób realizacji projektu</b></li>
  <p>Realizacja projektu ma na celu badanie siły ofensywnej zespołów względem miejsca, które zajmują w ligowej tabeli. Do zmierzenia siły ofensywnej klubu, branych pod uwagę będzie dziesięciu najbardziej bramkostrzelnych graczy. Potencjał ofensywny każdego z graczy będzie badany w sześciu wymiarach – takich jak: ilość bramek, oddane strzały, podania, strzały w światło bramki, dokładność strzałów, stworzone okazje na bramkę. 
 </p>

   <!-- 4 -->
<li><b>Omówienie technicznych aspektów projektu</b></li>
<p>Kod wraz z komentarzami przedstawiony jest w plikach: </p>
<ul>
  <li>"Projekt_tda/program do przetwarzania i normalizacji danych/processing_data.ipynb"</li>
  <li>"Projekt_tda/tda/plot_barcode.r"</li>
</ul>

<p>Aby uruchomić kod należy pobrać: </p>
<ul>
  <li>Jupyter uruchomić plik "processing_data.ipynb"</li>
  <li>RStudio i uruchomić projekt z plikiem "plot_barcode.r</li>
</ul>

<p>Pliki ze statystykami zawodników poszczególnych klubów zamieszczone są w folderze "Projekt_tda/program do przetwarzania i normalizacji danych/clubs".</p>

<p>Natomiast tabela ligi angielskie jest w pliku "Projekt_tda/tda/TeamStats.csv".</p>

<p align="center">
  <img src="https://github.com/LukaszMikol/tda/blob/master/Projekt_tda/screens/TeamStats.png" alt="Statystyki ligi" title="Statystyki ligi">
</p>



   <!-- 5 -->
<li><b>Wnioski</b></li>
<p>Wygenerowane przez program wykresy są przedstawione w pliku "Projekt_tda/tda/clubs_barcode.pdf"</p>
<p>Poniżej jest przedstawiony przykładowy wykres barcode dla: </p>
<ol>
  <li> pierwszej drużyny ligi angielskiej: Liverpool</li>
<p align="center">
  <img src="https://github.com/LukaszMikol/tda/blob/master/Projekt_tda/screens/Liverpool.png" alt="Liverpool" title="Barcode">
</p>
  
  <li>ostatniej drużyny: Norwich City</li>

<p align="center">
  <img src="https://github.com/LukaszMikol/tda/blob/master/Projekt_tda/screens/Norwich_city.png" alt="Norwich_city" title="Barcode">
</p>
</ol>

<hr>
<p>Wnioski, które można wyciągnąć z powyższych barcode: zaobserwowano mocne zależności, dotyczące większego zróżnicowania umiejętności u części graczy dla składowych niezależnych w wymiarze zero.  Dostrzeżono, że drużyny, które zajmują pierwsze pozycje w lidzie ich wykresy posiadają długie supki, a drużyny które zajmują dalsze miejsca w lidze, jak i ostatnie – wykresy są wyraźnie krótsze. Może to świadczyć o zróżnicowaniu graczy, których kluby zajmują wysokie miejsce w lidze, ponieważ długość życia poszczególnych punktów (jeden gracz, to jest jeden punkt), świadczy o tym, że ich umiejętności są bardziej zróżnicowane od zawodników w słabszych klubach. Udowadnia, to że punkty, podczas poddawania ich procesowi zaszumienia, łączą się później a więc ich rozmieszczenie na wykresie jest bardziej zróżnicowane, co przekłada się na dłuższą ilość życia dla punktu – symbolizującego zawodnika – co pokazuje, że ich umiejętności są również bardziej zróżnicowane. 
</p>

<h2>Transfer króla strzelców do ostatniej drużyny ligi</h2>
<p>Powyższa refleksja jest pomocna, przy pozyskiwaniu nowych graczy, w celu poprawy jakości drużyny, ponieważ podstawiając cechy potencjalnego nowo wybieranego gracza do zespołu (można podstawić również kilku graczy i obserwować zmianę barcodów), można obserwować czy kształt barcodów się zmienia i czy przypomina bardziej wygląd drużyn z pierwszych pozycji, walczących o mistrzostwo ligi angielskiej. </p>


<p align="center">
  <img src="https://github.com/LukaszMikol/tda/blob/master/Projekt_tda/screens/Norwich_city_transf.png" alt="Transfer gracza" title="Barcode">
</p>
Górne zdjęcie pokazuje wykres przed transferem, dolny po transferze. Można zaobserwować, iż wykres słupkowy nieznacznie się poprawił po transferze króla strzelców ligi, zwiększając siłę ofensywną klubu. W tym wypadku należało by przeanalizować, czy nie bardziej jest opłacalne dokonać transferu kilku tańszych (słabszych) graczy i wtedy ocenić, w jaki sposób ci gracze będą mieć wpływ na potencjał ofensywny graczy.


<h6>Dodatkowe wnioski</h6>
<p>Patrząc z perspektywy historycznej w lidze angielskiej od zawsze jest walka, aby wejść do top 4, czyli czterech najlepszych drużyn. Przeważnie o rotacje miejsc w top 4, walczy ze sobą 4 - 5 drużyn. Wystarczy popatrzeć na współczesne wyniki i zobaczy, iż w tabeli przewodzą dwie drużyny Liverpool i Manchester City. Ich wykresy jeszcze bardziej podkreślają zróżnicowanie poszczególnych graczy. Może to świadczyć o jednym lub dwóch wyróżniających się graczach, którzy przewodzą w tabeli z branymi pod uwagę do analizy cechami. Porównują Manchesteru City do Liverpool można dostrzec, że ostatni pasek jest krótszy. Dlaczego? Można spekulować, że gracze w Liverpool są bardziej zróżnicowanymi graczami i bardziej angażują się w grę całego zespołu, nie skupiając się wyłącznie na ilości strzelonych goli, ale również na prowadzeniu gry</p>
</ol>

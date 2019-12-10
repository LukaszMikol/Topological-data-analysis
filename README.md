# tda
<h1><b>Topologiczna analiza danych</b> – projekt praktyczny</h1>

Topologiczna analiza danych (TDA) jest to nowe i innowacyjne podejście do analizy danch, które uwzglęnia, że dane mają kształt. Topologiczny kształt danych daje możliwość, aby uprościć dany kształt, wyróżniając punkty o podobnych charakterystykach. Zatem trafnym stwierdzeniem jest, że metoda ta szuka zależności pomiędzy danymi, jednak nie daje klarownej odpowiedzi: dlaczego ta zależność występuje.    
<br>
<h2>Poniżej jest zrealizowany i opisany krok po kroku projekt, wykorzystujący metodę TDA.</h2>
<ol>
  
  <!-- 1 -->
  
  <li><b>Cel projektu</b></li>
<p>Celem projektu jest analiza drużyn piłkarskich w lidze angielskiej, a dokładniej eksploracja zależności pomiędzy cechami piłkarzy w drużynie, a osiągniętymi wynikami przez zespół.</p>

  <!-- 2 -->
  

<li><b>Wykotrzystane narzędzia</b></li>
  <p>Analiza danych zostanie wykonana za pomocą języka R, wykorzystującego bibliotekę TDA. Kod będzie implementowany w środowiku programistycznym RStudio.</p>
  
   <!-- 3 -->
  

<li><b>Sposób realizacji projektu</b></li>
  <p>Realizując projekt, badana jest siła ofensywna zespołów względem miejsca, które zajmują w aktualnej (na okres tworzenia projektu) ligowej tabeli. Do zmierzenia siły ofensywnej klubu, branych pod uwagę będzie dziesięciu najbardziej bramkostrzelnych graczy. Potecjał ofensywny każdego z graczy będzie badany w sześciu wymiarach – takich jak: ilość bramek, oddane strzały, strzały w światło bramki, dokładność długich podań, podania, stworzone okazje na bramkę. 
 </p>


   <!-- 4 -->
<li><b>Omówienie technicznych aspektów projektu</b></li>

<p>Kod wraz z komentarzami przedstawiony jest w folderze: Projekt_tda. Aby uruchomić kod należy pobrać RStudio i uruchomić projekt z plikiem "Main.r".</p>

<p>Pliki ze statystykami zawodników poszczególnych klubów zamieszczone są w folderze "Projekt_tda/kluby/".</p>

<p>Natomiast aktualna tabela ligii angielskie jest w pliku "Projekt_tda/TeamStats.csv".</p>

<p align="center">
  <img src="https://github.com/LukaszMikol/tda/blob/master/Projekt_tda/photos_to_describe/stats_league.jpg" alt="Statystyki ligi" title="Statystyki ligi">
</p>



   <!-- 5 -->
<li><b>Wnioski</b></li>
<p>Wygenerowane przez program wykresy są przedstawione w pliku "all_clubs_diag.pdf" oraz w pojedynczych plikach jpg w folderze "Projekt_tda/zdj/"</p>
<p>Poniżej jest przedstawiony przykładowy wykres barcode dla: </p>
<ol>
  <li> pierwszej drużyny ligi angielskiej: Liverpool</li>
<p align="center">
  <img src="https://github.com/LukaszMikol/tda/blob/master/Projekt_tda/photos/1.jpeg" alt="barcode_photo" title="Barcode">
</p>
  
  <li>ostatniej drużyny: Huddersfield Town</li>

<p align="center">
  <img src="https://github.com/LukaszMikol/tda/blob/master/Projekt_tda/photos/20.jpeg" alt="barcode_photo" title="Barcode">
</p>
</ol>

<hr>
<p>Wnioski, które można wyciągnąć z powyższych barcode: zaobserwowano mocne zależności, dotyczące większego zróżnicowania umiejętności u części graczy ("kolumny wypukłe i wklęsłe").  Dostrzeżono, że drużyny, które zajmują pierwsze pozycje w lidzie ich wykresy są bardziej wypukłe, od drużyn które zajmują dalsze miejsca w lidze, jak i ostatnie – wykresy są wklęsłe. Może to świadczyć o zróżnicowaniu graczy, których kluby zajmują wysokie miejsce w lidze, ponieważ długość życia poszczególnych punktów (jeden gracz, to jest jeden punkt), świadczy o tym, że ich umiejętności są bardziej zróżnicowane od zawodników w słabszych klubach. Udowadnia, to że punkty, podczas poddawania ich procesowi zaszumienia, łączą się później a więc ich rozmieszczenie na wykresie jest bardziej zróżnicowane, co przekłada się na dłuższą ilość życia dla punktu – symbolizującego zawodnika – co pokazuje, że ich umiejętności są również bardziej zróżnicowane. 
Refleksja ta jest pomocna, przy pozyskiwaniu nowych graczy, w celu poprawy jakości drużyny, ponieważ podstawiając cechy potencjalnego nowo wybieranego członka do zespołu (można podstawić również kilku graczy i obserwować zmianę barcodów), można obserwować czy kształt barcodów się zmienia i czy przypomina bardziej wygląd drużyn z pierwszych pozycji, walczących o mistrzostwo ligi angielskiej. 
</p>

<h6>Dodatkowe wnioski</h6>
<p>Patrząc z perspektwy historycznej w lidze angielskiej od zawsze jest walka, aby wejść do top 4, czyli czterech najlepszych drużyn. Przeważnie o miejsce, które będą mieć ostatecznie drużyny w top 4 walczy 5 drużyn. Wystarczy popatrzeć na współczesne wyniki, aby zdać sobie sprawę, że o mistrzostwo walczą tylko dwie drużyny Liverpool i Manchester City. Ich wykresy jeszcze bardziej podkreślają zróżniocowanie poszczególnych graczy. Może to świadczyć o jednym lub dwóch wyróżniających się graczach, którzy przewodzą w tabeli ilości strzelonych bramek. Ta sama analiza tyczy się Manchesteru City, ale tam jest inna zasada. Przed ostatni pasek jest krótszy. Dlaczego? Można spekulować, że gracze w Liverpool są bardziej zróżnicowanymi graczami i bardziej angażują się w grę całego zespołu, nie skupiając się wyłącznie na ilości strzelonych goli, ale również na prowadzeniu gry.</p>
</ol>

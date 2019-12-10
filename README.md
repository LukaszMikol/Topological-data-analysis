# Hadoop MapReduce 
<h1><b>Hadoop MapReduce</b> – projekt praktyczny</h1>

MapReduce to algorytm do przetwarzania ogromnych zbiorów danych, który wykonuje obliczenia w sposób równoległy, rozproszony, co wpływa pozytywnie na jego wydajność.

Operacje MapReduce wykonywane są w trzech krokach:
<ul>
  <li><b>Mapper </b>pobiera dane z pliku linia po lini, a następnie dzieli zadania na mniejsze problemy, zwracając wartości, które zostaną wybrane.</li>
  <li><b>Combiner </b>jest to krok optymalizacyjny - zmiejszający czas wykonywania zadania - w którym sortujemy po kluczu wartości i je grupujemy (Wartości i kluczy zostały przekazane z mappera). Ważną infromacją jest, iż combiner działa na pojedynczej linii, czyli pojedynczych przekazanych wartościach.</li>
  <li><b>Reducer </b>redukuje wartości względem funkcji, która zostanie użyta, może być to: warość minmalna, maaksymalna, suma, sortowanie.</li>
</ul>

<br>
<h2>Poniżej jest zrealizowany i opisany krok po kroku projekt, wykorzystujący algorytm MapReduce.</h2>
<ol>
  
  <!-- 1 -->
  
  <li><b>Cel projektu</b></li>
<p>Celem projektu jest analiza danych dotycząych wina oraz dostareczenie odpowiedzi na pytania: </p>

<ol>
  <li>Ile jest francuskich win droższych niż $100?</li>
  <li>Który szczep wingoron jest najbardziej popularny?</li>
  <li>Który kraj ma najwięcej win typu: "pinot grigio"?</li>
  <li>Ile kosztuje najlepiej ocenione "prosecco"?</li>
  <li>Mając budżet $10, po wino jakiego szczepu najlepiej sięgnąć?</li>
</ol>

<br>
  <!-- 2 -->
  

<li><b>Wykotrzystane narzędzia</b></li>
  <p>Analiza danych zostanie wykonana za pomocą języka Python, wykorzystującego biblioteki: MRJob oraz MRStep. W sprawdzaniu wyników (odpowiedzi na pytania) pomocne będzie narzędzie jupyther notebook, w którym będzie importowana biblioteka Pandas używana do analizowania danych.</p>
  
   <!-- 3 -->
  

<li><b>Realizacja projektu:</b></li>


  <ol>
    <!-- 1 -->
    <li>Należy pobrać pliki z recenzjami win:</li>
    <p>Dostęp do danych, znajduje się w linku: <a href="https://www.kaggle.com/zynicide/wine-reviews">plik [pliku winemag-data_first150k.csv]. </a>Jeżeli ktoś nie może pobierać danych, można skorzystać z zmniejszonego pliku, który zawiera 1000 wierszy – plik ten znajduje się: <i>wine_reviews/test.csv</i></p>
<!--  2  -->
    <li>Odczytanie zawartości pobranego pliku winemag-data_first150k.csv: [z użyciem biblioteki Pandas]</li>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/tree/master/wine_reviews/screens/Review_data_jupyter_notebook.png" alt="Review_data_jupyter_notebook" title="Review data jupyter notebook">
    </p>
<!-- 3 -->
    <li>Modyfikacja pliku</li>
    <p>Na zdjęciu powyżej, dane w pierwszym wierszu posiadają nazwy nagłówków. W późniejszym etapie komplikuje to przetważanie danych algorytmem MapReduce, dlatego teraz z pliku zostaną usunięte nagłówkówki z użyciem biblioteki Pandas. Plik wykonawczy znajduje się w folderze <i>wine_reviews/screen/01_preprocessing_data.py</i></p>
<code># odczytuje plik csv</code><br>
<code>df = pd.read_csv("winemag-data_first150k.csv")</code><br>
<code># separator to znak:  ~ . Zapisuje do pliku .tsv bez nagłówka i indeksów </code><br>
<code>df.to_csv("winemag-data_without_header.tsv", sep="~", header=False, index=False)</code><br><br>
<!-- 4 -->
    <li>Z przygotowanym odpowiednio plikiem, można przystąpić do obliczenie pierwszego zadania: Ile jest francuskich win droższych niż $100?</li>
    <p>Kod znajduje się w: <i>wine_reviews/02_wines_more_expensive_than_100$.py</i></p>
    <p>Rezultatem jest wynik w terminalu: </p>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/result_02_py.png" alt="Review_data_jupyter_notebook" title="Review data jupyter notebook">
    </p>
    <p>Aby sprawdzić wynik, możemy również utworzyć zapytanie w bibliotece Pandas, którego wynik jest poniżej</p>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/amount_french_wine_over_100_$.png" alt="amount_french_wine_over_100_$" title="amount french wine over 100$">
    </p>
    <p>Wyniki są identyczny i wskazują, iż: ilość francuskich win droższych niż $100 wynosi: 1126.</p>
   <!-- 5 -->
	<li>Zadanie: Który szczep wingoron jest najbardziej popularny?</li>
    <p>Kod znajduje się w: <i>wine_reviews/03_the_most_popular_variety.py</i></p>
    <h3>Rezultat: </h3>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/result_03_py.png" alt="the_most_popular_variety" title="the most popular variety">
    </p>
    <p>Sprawdzenie: </p>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/the_most_popular_variety.png" alt="the_most_popular_variety" title="the most popular variety">
    </p>
    <p>Według – potwierdzonych dwoma metodami – danych najbardziej popularny szczep to: Chardonnay. Interesujące jest, że można zobaczyć rozpierzność pomiędzy policzoną ilością występowania szczepu "Chardonnay", MapReduce – 14482, a biblioteką Pandas – 14481. </p>
        <!-- 7 -->
    <li>Zadanie: Który kraj ma najwięcej win typu “Pinot Grigio”?</li>
    <p>Kod znajduje się w: <i>wine_reviews/04_the_most_amout_wine.py</i></p>
    <h3>Wynik: </h3>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/result_04_py.png" alt="the_most_amout_wine" title="the most amount wine">
    </p>
    <p>Wynik:</p>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/the_most_amount_wine_in_country.png" alt="the_most_amount_wine_in_country" title="the most amount wine in country">
    </p>
    <p>Odpowiedź: Włochy posiadają najwięcej win typu “Pinot Grigio”.</p>
        <!-- 8 -->
    <li>Zadanie: Ile kosztuje najlepiej ocenione Prosecco?</li>
    <p>Kod znajduje się w: <i>wine_reviews/05_cost_the_best_rate_wine.py</i></p>
    <h3>Rezultat: </h3>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/result_05_py.png" alt="cost_the_best_rating_prosecco" title="cost the best rating proseccos">
    </p>
    <h3>Wynik: </h3>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/cost_the_best_rating_prosecco.png" alt="cost_the_best_rating_prosecco" title="cost the best rating prosecco">
    </p>
    <p>Najlepiej ocenione Prosecco kosztuje $38.</p>
        <!-- 9 -->
    <li>Zadanie:  Mając budżet $10 po wino jakiego szczepu najlepiej sięgnąć?</li>
    <p>Kod znajduje się w: <i>wine_reviews/06_wine_for_10$.py</i></p>
    <h3>Rezultat: </h3>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/result_06_py.png" alt="cost_the_best_rating_prosecco" title="cost the best rating proseccos">
    </p>
    <p>Wynik:</p>
    <p align="center">
      <img src="https://github.com/LukaszMikol/big-data-hadoop-map-reudce-course/blob/master/wine_reviews/screens/the_best_choice_for_10$.png" alt="the_best_choice_for_10$" title="the_best_choice_for_10$">
    </p>
    <p>W tym pytaniu nie ma jednoznacznej odpowiedzi na to pytanie, ponieważ jest kilka win w cenie do $10, które dostały 81 punktów. W przypadku pliku wykonawczego algorytmu MapReduce, zostały wybrane najlepsze wina wg. każej półki cenowej.</p>

  </ol>
<li><b>Wnioski</b></li>

<hr>
<p>MapReduce jest idealnym algorytmem do przetważania ogromnym ilości danych. Jeżeli operujemy na mniejszych zbiorach szybciej można wyciągnąć informacje z pliku za pomocą biblioteki pandas, która jest prostsza w użyciu, jednak przy większej ilości plików, ponad 5GB, mapreduce jest idealnym wyborem.</p>

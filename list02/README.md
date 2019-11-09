<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang="">
<head>
  <meta charset="utf-8" />
  <meta name="generator" content="pandoc" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
  <title>ON_raport_L02</title>
  <style type="text/css">
      code{white-space: pre-wrap;}
      span.smallcaps{font-variant: small-caps;}
      span.underline{text-decoration: underline;}
      div.column{display: inline-block; vertical-align: top; width: 50%;}
  </style>
</head>
<body>




<p>03.11.2019</p>





<p>Obliczenia Naukowe</p>




<p>Lista Nr 2( Laboratorium)</p>





<p>Piotr Popis</p>









<ul>
<li>Zadanie 1</li>
</ul>

<ol type="1">
<li>Opis problemu.</li>
</ol>
<p>Celem jest ponowne eksperymentalne zbadanie problemu różności rozwiązań iloczynu skalarnego dwóch wektorów. Tym razem usuwamy osatnie znaczące cyfry współrzędnych x<sub>4 </sub>oraz x<sub>5 </sub>odpowiednio 9 i 7. Problem należy sprawdzić dla pojedynczej i podwójnej precyzji.</p>



<p>@Zadanie 5 Lista 1</p>
<p>x=[2.718281828, (-3.141592654), 1.414213562,<strong>0.5772156649</strong>,<strong>0.3010299957</strong>]</p>
<p>y=[1486.2497,878366.9879, (-22.37492),4773714.647,0.000185049]</p>

<p>@Zadanie 1 Lista 2</p>
<p>a=[2.718281828, (-3.141592654), 1.414213562,<strong>0.577215664</strong>,<strong>0.301029995</strong>]</p>
<p>b=[1486.2497,878366.9879, (-22.37492),4773714.647,0.000185049]</p>





<ol type="1">
<li>Rozwiązanie problemu.</li>
</ol>
<p>Ponowne przepuszczenie zmienionych danych przez algorytmy :</p>

<ul>
<li>(a) &quot;w przód&quot;</li>
</ul>

<ul>
<li>(b) &quot;w tył&quot;</li>
<li>(c) od największego do najmniejszego (dodaj dodatnie liczby w porządku od największegodo najmniejszego, dodaj ujemne liczby w porządku od najmniejszego do największego,a następnie daj do siebie obliczone sumy częściowe)</li>
<li>(d) od najmniejszego do największego (przeciwnie do metody (c))</li>
</ul>
<p>zaimplementowane w zadaniu nr 5 listy nr 1 oraz porównanie i analiza otrzymanych wyników.</p>


<ol type="1">
<li>Wyniki</li>
</ol>
<p>@Zadanie 5 Lista 1</p>
<table>
<tbody>
<tr class="odd">
<td>Algorytm</td>
<td>a</td>
<td>b</td>
<td>c</td>
<td>d</td>
</tr>
<tr class="even">
<td>Float32</td>
<td>-0.4999443</td>
<td>-0.4543457</td>
<td>-0.5</td>
<td>-0.5</td>
</tr>
<tr class="odd">
<td>Float64</td>
<td>1.0251881368296672e-10 </td>
<td>-1.5643308870494366e-10</td>
<td>0.0</td>
<td>0.0</td>
</tr>
</tbody>
</table>
<p>@Zadanie 1 Lista 2</p>
<table>
<tbody>
<tr class="odd">
<td>Algorytm</td>
<td>a</td>
<td>b</td>
<td>c</td>
<td>d</td>
</tr>
<tr class="even">
<td>Float32</td>
<td>-0.4999443</td>
<td>-0.4543457</td>
<td>-0.5</td>
<td>-0.5</td>
</tr>
<tr class="odd">
<td>Float64</td>
<td>-0.004296342739891585 </td>
<td>-0.004296342998713953</td>
<td>-0.004296342842280865</td>
<td>-0.004296342842280865</td>
</tr>
</tbody>
</table>

<ol type="1">
<li>Wnioski.</li>
</ol>
<p>- Jaki wpływ na wyniki mają niewielkie zmiany danych?<sup> </sup></p>
<p>W przypadku precyzji <strong>Float32</strong> wyniki nie zmieniły się. Dzieję się tak z przyczny zbyt słabej precyzji( rząd 10<sup>-7</sup>) arytmetyki względem precyzji zapisu liczby( rząd 10<sup>-9</sup>).</p>
<p>W przypadku precyzji <strong>Float64 </strong>zauważalna jest ogromna różnica między wynikami poprzednimi, (przed ucięciem), a nowymi, (po ucięciu). Możemy śmiało stwierdzić, że jest to przykład zadania <strong>źle uwarunkowanego. </strong>Minimalna zmiana danych wejściowych powoduje ogromne zmiany wyjściowego wyniku.</p>

<ul>
<li>Zadanie 2</li>
</ul>

<ol type="1">
<li>Opis problemu.</li>
</ol>
<p>Celem jest narysowanie wykresu funkcji f(x) w co najmniej dwóch dowolnych programach do wizualizacji. Oraz policzenie limes f(x) dla x→ ∞, gdzie</p>

<p>f(x) = e<sup>x</sup> ln(1 + e<sup>-x</sup>)</p>
<p>Porównać otrzymany wynik limes z wykresami oraz wyjaśnić zjawisko.</p>

<ol type="1">
<li>Rozwiązanie problemu.</li>
</ol>
<p>W celu obliczenia wyznaczenia granicy wykorzystuję SymPy oraz jego podrzędna funkcję limit(func,arg,aim). Do narysowania wykresu wykorzstuję Plots- biblioteka do tworzenia wykresów , Desmos – dostępny w każdej nowoczesnej przeglądarce, Geogebra oraz Footplot.</p>
<ol type="1">
<li>Wyniki.</li>
</ol>
<p>Szukana granica funkcji f(x) = e<sup>x</sup> ln(1 + e<sup>-x</sup>) wynosi 1.</p>
<p>Plots – Julia Library</p>
<p>Osie są przesunięte ze względu na komendę RANGE()</p>
<p><img src="Pictures/1000000000000258000001908C2170ED4AE33B93.png" style="width:14.66cm;height:9.774cm" />Desmos</p>
<p><img src="Pictures/1000020100000257000000DC48D3C26651CE684D.png" style="width:12.952cm;height:4.757cm" /></p>










<p>Geogebra </p>
<p><img src="Pictures/100002010000023C000000B3AA2732CF5BF80C84.png" style="width:15.134cm;height:4.736cm" /></p>

<p>Footplot</p>
<p><img src="Pictures/100002010000027700000079D7812082A618F16F.png" style="width:16.695cm;height:3.201cm" /></p>
<ol type="1">
<li>Wnioski.</li>
</ol>
<p>Jak widzimy po przejśćiu przez x=32 otrzymujemy bardzo dużą wartość <strong>e</strong><sup><strong>32</strong> </sup>, która jest przemnażana przez liczbę bardzo małą<strong> ln(1+e</strong><sup><strong>-x</strong></sup><strong>)</strong>. Przez co otrzymujemy wyniki oscylujące na przemian powyżej i poniżej wyliczonej granicy. Otrzymane wyniki są oczywiście błędne. Następnie dla x=37 funkcja osiąga wartość 0 ze względu na fakt, iż wartość <strong>ln(1+e</strong><sup><strong>-x</strong></sup><strong>) </strong>jest już tak mała, że zostaje przybliżona do 0. Więc przemnożona </p>
<p>z pozostałym członem zawsze daje zero. W niektórych programach dla dostatecznie dużych x program jest na tyle inteligentny, że wylicza granicę podanej funkcji i od tego miejsca podaje jej wartość zamiast błędnych wyników.</p>

<ul>
<li>Zadanie 3</li>
</ul>

<ol type="1">
<li>Opis problemu.</li>
</ol>
<p>Głównym problemem jest rozwiązanie układu równań liniowych</p>
<p>Ax=b</p>
<p>zadana jest macierz współczynników A i wektor prawych stron b. Macierz generujemy na dwa sposoby. Pierwszy to wykorzystanie macierzy Hilbera stopnia n. Druga natomiast jest macierzą losową stopnia n z zadanym wskaźnikiem uwarunkowania <strong>c</strong>.</p>
<p>Wektor <strong>b</strong> jest zadany jako <strong>Ax</strong>, gdzie a to wygenerowana przez nas macierz, a </p>
<p><strong>x=(1,…,1)</strong><sup><strong>T</strong></sup></p>
<p>Rozwiązać zadane równanie na dwa sposoby, przy użyciu eliminacji Gausa i inversji. Eksperymenty wykonać dla rosnącego n&gt;1 w przypadku macierzy Hilberta, dla n=5,10,20 z rosnącym c=1,10,10<sup>3</sup>,10<sup>7</sup>,10<sup>12</sup>,10<sup>16</sup>. Policzyć błędy względne.</p>

<ol type="1">
<li>Rozwiązanie problemu.</li>
</ol>
<p>Do rozwiązania wykorzystamy pakiet LinearAlgebra w celu pobrania cond() oraz rank() odpowiednio wskaźnik uwarunkowania wygenerowanej macierzy oraz rząd macierzy. Zostały zaimplementowane metody do generowania macirzy hilberta oraz losowej z zadanym wskaźnikiem c oraz metoda obliczająca błąd względny wykorzystujący funkcję norm(). Następnie zostały przeprowadzone eksperymenty a ich wyniki możemy sprawdzić w sekcji wyniki.</p>


<ol type="1">
<li>Wyniki.</li>
</ol>






<table>
<tbody>
<tr class="odd">
<td>Macierz Hilberta M<sub>n</sub></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>cond() </td>
<td>Rozmiar</td>
<td> rank() </td>
<td> Błąd względny eliminacji Gausaa   </td>
<td>     Błąd względny inwersji</td>
</tr>
<tr class="odd">
<td>19.28147006790397 </td>
<td> 2 </td>
<td> 2 </td>
<td> 5.661048867003676e-16 </td>
<td> 1.4043333874306803e-15 </td>
</tr>
<tr class="even">
<td>524.0567775860644 </td>
<td> 3 </td>
<td> 3 </td>
<td> 8.022593772267726e-15 </td>
<td> 0.0 </td>
</tr>
<tr class="odd">
<td>15513.73873892924 </td>
<td> 4 </td>
<td> 4 </td>
<td> 4.137409622430382e-14 </td>
<td> 0.0 </td>
</tr>
<tr class="even">
<td>476607.25024259434 </td>
<td> 5 </td>
<td> 5 </td>
<td> 1.6828426299227195e-12 </td>
<td> 3.3544360584359632e-12 </td>
</tr>
<tr class="odd">
<td>1.4951058642254665e7 </td>
<td> 6 </td>
<td> 6 </td>
<td> 2.618913302311624e-10 </td>
<td> 2.0163759404347654e-10 </td>
</tr>
<tr class="even">
<td>4.75367356583129e8 </td>
<td> 7 </td>
<td> 7 </td>
<td> 1.2606867224171548e-8 </td>
<td> 4.713280397232037e-9 </td>
</tr>
<tr class="odd">
<td>1.5257575538060041e10 </td>
<td> 8 </td>
<td> 8 </td>
<td> 6.124089555723088e-8 </td>
<td> 3.07748390309622e-7 </td>
</tr>
<tr class="even">
<td>4.931537564468762e11 </td>
<td> 9 </td>
<td> 9 </td>
<td> 3.8751634185032475e-6 </td>
<td> 4.541268303176643e-6 </td>
</tr>
<tr class="odd">
<td>1.6024416992541715e13 </td>
<td> 10 </td>
<td> 10 </td>
<td> 8.67039023709691e-5 </td>
<td> 0.0002501493411824886 </td>
</tr>
<tr class="even">
<td>5.222677939280335e14 </td>
<td> 11 </td>
<td> 10 </td>
<td> 0.00015827808158590435 </td>
<td> 0.007618304284315809 </td>
</tr>
<tr class="odd">
<td>1.7514731907091464e16 </td>
<td> 12 </td>
<td> 11 </td>
<td> 0.13396208372085344 </td>
<td> 0.258994120804705 </td>
</tr>
<tr class="even">
<td>3.344143497338461e18 </td>
<td> 13 </td>
<td> 11 </td>
<td> 0.11039701117868264 </td>
<td> 5.331275639426837 </td>
</tr>
<tr class="odd">
<td>6.200786263161444e17 </td>
<td> 14 </td>
<td> 11 </td>
<td> 1.4554087127659643 </td>
<td> 8.71499275104814 </td>
</tr>
<tr class="even">
<td>3.674392953467974e17 </td>
<td> 15 </td>
<td> 12 </td>
<td> 4.696668350857427 </td>
<td> 7.344641453111494 </td>
</tr>
<tr class="odd">
<td>7.865467778431645e17 </td>
<td> 16 </td>
<td> 12 </td>
<td> 54.15518954564602 </td>
<td> 29.84884207073541 </td>
</tr>
<tr class="even">
<td>1.263684342666052e18 </td>
<td> 17 </td>
<td> 12 </td>
<td> 13.707236683836307 </td>
<td> 10.516942378369349 </td>
</tr>
<tr class="odd">
<td>2.2446309929189128e18 </td>
<td> 18 </td>
<td> 12 </td>
<td> 9.134134521198485 </td>
<td> 7.575475905055309 </td>
</tr>
<tr class="even">
<td>6.471953976541591e18 </td>
<td> 19 </td>
<td> 13 </td>
<td> 9.720589712655698 </td>
<td> 12.233761393757726 </td>
</tr>
<tr class="odd">
<td>1.3553657908688225e18 </td>
<td> 20 </td>
<td> 13 </td>
<td> 7.549915039472976 </td>
<td> 22.062697257870493 </td>
</tr>
</tbody>
</table>






<table>
<tbody>
<tr class="odd">
<td>Macierz Losowa R<sub>n</sub></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>cond()</td>
<td>Rozmiar </td>
<td>rank() </td>
<td>  Błąd względny eliminacji Gausaa       </td>
<td>     Błąd względny inwersji   </td>
</tr>
<tr class="odd">
<td>1.0 </td>
<td> 5 </td>
<td> 5 </td>
<td> 1.5700924586837752e-16 </td>
<td> 1.4043333874306804e-16 </td>
</tr>
<tr class="even">
<td>10.0 </td>
<td> 5 </td>
<td> 5 </td>
<td> 1.719950113979703e-16 </td>
<td> 1.719950113979703e-16 </td>
</tr>
<tr class="odd">
<td>1000.0 </td>
<td> 5 </td>
<td> 5 </td>
<td> 1.4148266844381742e-15 </td>
<td> 9.79415571016078e-15 </td>
</tr>
<tr class="even">
<td>1.0e7 </td>
<td> 5 </td>
<td> 5 </td>
<td> 3.6204531690624907e-10 </td>
<td> 3.1588048560580086e-10 </td>
</tr>
<tr class="odd">
<td>1.0e12 </td>
<td> 5 </td>
<td> 5 </td>
<td> 1.6541515455114935e-5 </td>
<td> 1.619562508800795e-5 </td>
</tr>
<tr class="even">
<td>1.0e16 </td>
<td> 5 </td>
<td> 4 </td>
<td> 0.11443581117792277 </td>
<td> 0.0739509972887452 </td>
</tr>
<tr class="odd">
<td>1.0 </td>
<td> 10 </td>
<td> 10 </td>
<td> 2.1642230995786354e-16 </td>
<td> 1.9229626863835638e-16 </td>
</tr>
<tr class="even">
<td>10.0 </td>
<td> 10 </td>
<td> 10 </td>
<td> 1.2658490090568384e-16 </td>
<td> 2.016820280180126e-16 </td>
</tr>
<tr class="odd">
<td>1000.0 </td>
<td> 10 </td>
<td> 10 </td>
<td> 2.920810890748086e-14 </td>
<td> 3.0974784661609553e-14 </td>
</tr>
<tr class="even">
<td>1.0e7 </td>
<td> 10 </td>
<td> 10 </td>
<td> 1.711913162282261e-10 </td>
<td> 1.7144107812809687e-10 </td>
</tr>
<tr class="odd">
<td>1.0e12 </td>
<td> 10 </td>
<td> 10 </td>
<td> 1.423255114178321e-6 </td>
<td> 3.428588488053808e-6 </td>
</tr>
<tr class="even">
<td>1.0e16 </td>
<td> 10 </td>
<td> 9 </td>
<td> 0.032216726513605014 </td>
<td> 0.04332240822816178 </td>
</tr>
<tr class="odd">
<td>1.0 </td>
<td> 20 </td>
<td> 20 </td>
<td> 5.23691153334427e-16 </td>
<td> 5.09978018830275e-16 </td>
</tr>
<tr class="even">
<td>10.0 </td>
<td> 20 </td>
<td> 20 </td>
<td> 3.7485443673843946e-16 </td>
<td> 4.37799666588975e-16 </td>
</tr>
<tr class="odd">
<td>1000.0 </td>
<td> 20 </td>
<td> 20 </td>
<td> 8.177680028281057e-15 </td>
<td> 5.9090571005317786e-15 </td>
</tr>
<tr class="even">
<td>1.0e7 </td>
<td> 20 </td>
<td> 20 </td>
<td> 3.2123824321972287e-10 </td>
<td> 3.55640107589538e-10 </td>
</tr>
<tr class="odd">
<td>1.0e12 </td>
<td> 20 </td>
<td> 20 </td>
<td> 3.1645714988939825e-5 </td>
<td> 3.2600983724545365e-5 </td>
</tr>
<tr class="even">
<td>1.0e16 </td>
<td> 20 </td>
<td> 19 </td>
<td> 0.14898201945476774 </td>
<td> 0.1196613874909112 </td>
</tr>
</tbody>
</table>


<ol type="1">
<li>Wnioski.</li>
</ol>

<p>Dla macierzy Hilberta wraz ze wzrostem rozmiaru macierzy błąd względny obu metod oraz wskaźnik uwaronkowania cond() również rośnie.</p>
<p>Dla macierzy Losowej przy zwiększeniu stopnia macierzy zauważalny jest wzrost błędów względnych obu metod. Jednak w tym przypadku rosnący błąd powiązany jest również z wskaźnikiem uwarunkowania cond() danej macierzy. Metoda inwersji jest w tym przypadku widocznie bardziej precyzyjna niż metoda Eliminacji Gauss’a.</p>
<p>Zwłaszcza dla macierzy losowej zauważalne jest, że większy wpływ ma cond() niż sam rozmiar, co dla macierzy Hilberta nie jest tak widoczne. Jednak nie zmienia to faktu, iż tym większa macierz tym większy błąd. Błędy dla macierzy losowej rosną jednakże dużo wolniej niż dla macierzy Hilbera.</p>
<p>Na podstawie wyników eksperymentu macierz Hilberta jest zadaniem <strong>źle uwarunkowaną, </strong>bo kolejna inkrementacja stpnia powoduje gwałtowny wzrost jej wskaźnika uwarunkowania cond(), a za tym wzrost błędu.</p>
<ul>
<li>Zadanie 4</li>
</ul>


<ol type="1">
<li>Opis problemu.</li>
</ol>


<ol type="1">
</ol>
<p>  53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,         </p>
<p>      11310276995381.0, -135585182899530.0,</p>
<p>      1307535010540395.0,    -10142299865511450.0,</p>
<p>      63030812099294896.0,    -311333643161390640.0,</p>
<p>      1206647803780373360.0,    -3599979517947607200.0,</p>
<p>      8037811822645051776.0,     -12870931245150988800.0,</p>
<p>      13803759753640704000.0,     -8752948036761600000.0,</p>
<p>      2432902008176640000.0]</p>
<p>Wielomian skonstruowany z powyższych współczynników jest postacią naturalna wielomianu Wilkinsona p</p>

<p><em>p(x) </em>= (x−20)(x−19)(x−18)(x−17)(x−16)(x−15)(x−14)(x−13)(x−12)(x−11)(x−10)(x−9)(x−8)(x−7)(x−6)(x−5)(x−4)(x−3)(x−2)(x−1)</p>

<p>W następnym etapie zadania należy koniecznie sprawdzić wszystkie pierwiastki obliczająć |P(z<sub>k</sub>)|, |p(z<sub>k</sub>)| oraz |z<sub>k</sub>-k| i wyjaśnić rozbieżności. Sprawdzić eksperyment Wilkinsona.</p>

<ol type="1">
<li>Rozwiązanie problemu.</li>
</ol>

<p>W pierwszej części zadania skorzystamy z funkcji roots z pakietu Polynomails do obliczenia szukanych miejsc. <strong>Poly</strong> do utworzenia wielomianu z tablicy zaiwerającej współczynniki. Natomiast <strong>poly</strong> do tworzenia wielomianu z tablicy zawierającej miejsca zerowe. Kolejno <strong>polyval(P,x) </strong>do obliczenia wartości wielomianu P w x z wykorzystaniem metody Hornera.</p>
<p>W drugiej części przeprowadzamy eksepryment Wilkinsona tzn, zamieniamy współczynnik przy -210 na -210 -2<sup>-23</sup>.</p>

<ol type="1">
<li>Wyniki.</li>
</ol>

<p>3.1.a</p>

<table>
<tbody>
<tr class="odd">
<td>k</td>
<td>z<sub>k</sub></td>
<td>|z<sub>k </sub>- k|</td>
<td>|P(z<sub>k</sub>)|</td>
<td>|p(z<sub>k</sub>)|</td>
</tr>
<tr class="even">
<td>1</td>
<td>0.9999999999996989</td>
<td>3.0109248427834245e-13</td>
<td>36352.0</td>
<td>38400.0</td>
</tr>
<tr class="odd">
<td>2</td>
<td>2.0000000000283182</td>
<td>2.8318236644508943e-11</td>
<td>181760.0</td>
<td>198144.0</td>
</tr>
<tr class="even">
<td>3</td>
<td>2.9999999995920965</td>
<td>4.0790348876384996e-10</td>
<td>209408.0</td>
<td>301568.0</td>
</tr>
<tr class="odd">
<td>4</td>
<td>3.9999999837375317</td>
<td>1.626246826091915e-8</td>
<td>3.106816e6</td>
<td>2.844672e6</td>
</tr>
<tr class="even">
<td>5</td>
<td>5.000000665769791</td>
<td>6.657697912970661e-7</td>
<td>2.4114688e7</td>
<td>2.3346688e7</td>
</tr>
<tr class="odd">
<td>6</td>
<td>5.999989245824773</td>
<td>1.0754175226779239e-5</td>
<td>1.20152064e8</td>
<td>1.1882496e8</td>
</tr>
<tr class="even">
<td>7</td>
<td>7.000102002793008</td>
<td>0.00010200279300764947</td>
<td>4.80398336e8</td>
<td>4.78290944e8</td>
</tr>
<tr class="odd">
<td>8</td>
<td>7.999355829607762</td>
<td>0.0006441703922384079</td>
<td>1.682691072e9</td>
<td>1.67849728e9</td>
</tr>
<tr class="even">
<td>9</td>
<td>9.002915294362053</td>
<td>0.002915294362052734</td>
<td>4.465326592e9</td>
<td>4.457859584e9</td>
</tr>
<tr class="odd">
<td>10</td>
<td>9.990413042481725</td>
<td>0.009586957518274986</td>
<td>1.2707126784e10</td>
<td>1.2696907264e10</td>
</tr>
<tr class="even">
<td>11</td>
<td>11.025022932909318</td>
<td>0.025022932909317674</td>
<td>3.5759895552e10</td>
<td>3.5743469056e10</td>
</tr>
<tr class="odd">
<td>12</td>
<td>11.953283253846857</td>
<td>0.04671674615314281</td>
<td>7.216771584e10</td>
<td>7.2146650624e10</td>
</tr>
<tr class="even">
<td>13</td>
<td>13.07431403244734</td>
<td>0.07431403244734014</td>
<td>2.15723629056e11</td>
<td>2.15696330752e11</td>
</tr>
<tr class="odd">
<td>14</td>
<td>13.914755591802127</td>
<td>0.08524440819787316</td>
<td>3.65383250944e11</td>
<td>3.653447936e11</td>
</tr>
<tr class="even">
<td>15</td>
<td>15.075493799699476</td>
<td>0.07549379969947623</td>
<td>6.13987753472e11</td>
<td>6.13938415616e11</td>
</tr>
<tr class="odd">
<td>16</td>
<td>15.946286716607972</td>
<td>0.05371328339202819</td>
<td>1.555027751936e12</td>
<td>1.554961097216e12</td>
</tr>
<tr class="even">
<td>17</td>
<td>17.025427146237412</td>
<td>0.025427146237412046</td>
<td>3.777623778304e12</td>
<td>3.777532946944e12</td>
</tr>
<tr class="odd">
<td>18</td>
<td>17.99092135271648</td>
<td>0.009078647283519814</td>
<td>7.199554861056e12</td>
<td>7.1994474752e12</td>
</tr>
<tr class="even">
<td>19</td>
<td>19.00190981829944</td>
<td>0.0019098182994383706</td>
<td>1.0278376162816e13</td>
<td>1.0278235656704e13</td>
</tr>
<tr class="odd">
<td>20</td>
<td>19.999809291236637</td>
<td>0.00019070876336257925</td>
<td>2.7462952745472e13</td>
<td>2.7462788907008e13</td>
</tr>
</tbody>
</table>










<p>3.1.b</p>



<table>
<tbody>
<tr class="odd">
<td>k</td>
<td>z<sub>k</sub></td>
<td>|z<sub>k </sub>- k|</td>
<td>|P(z<sub>k</sub>)|</td>
<td>|p(z<sub>k</sub>)|</td>
</tr>
<tr class="even">
<td>1</td>
<td>0.9999999999998357 + 0.0im</td>
<td>1.6431300764452317e-13</td>
<td>20992.0</td>
<td>22016.0</td>
</tr>
<tr class="odd">
<td>2</td>
<td>2.0000000000550373 + 0.0im</td>
<td>5.503730804434781e-11</td>
<td>349184.0</td>
<td>365568.0</td>
</tr>
<tr class="even">
<td>3</td>
<td>2.99999999660342 + 0.0im</td>
<td>3.3965799062229962e-9</td>
<td>2.221568e6</td>
<td>2.295296e6</td>
</tr>
<tr class="odd">
<td>4</td>
<td>4.000000089724362 + 0.0im</td>
<td>8.972436216225788e-8</td>
<td>1.046784e7</td>
<td>1.0729984e7</td>
</tr>
<tr class="even">
<td>5</td>
<td>4.99999857388791 + 0.0im</td>
<td>1.4261120897529622e-6</td>
<td>3.9463936e7</td>
<td>4.3303936e7</td>
</tr>
<tr class="odd">
<td>6</td>
<td>6.000020476673031 + 0.0im</td>
<td>2.0476673030955794e-5</td>
<td>1.29148416e8</td>
<td>2.06120448e8</td>
</tr>
<tr class="even">
<td>7</td>
<td>6.99960207042242 + 0.0im</td>
<td>0.00039792957757978087</td>
<td>3.88123136e8</td>
<td>1.757670912e9</td>
</tr>
<tr class="odd">
<td>8</td>
<td>8.007772029099446 + 0.0im</td>
<td>0.007772029099445632</td>
<td>1.072547328e9</td>
<td>1.8525486592e10</td>
</tr>
<tr class="even">
<td>9</td>
<td>8.915816367932559 + 0.0im</td>
<td>0.0841836320674414</td>
<td>3.065575424e9</td>
<td>1.37174317056e11</td>
</tr>
<tr class="odd">
<td>10</td>
<td>10.095455630535774 - 0.6449328236240688im</td>
<td>0.6519586830380406</td>
<td>7.143113638035824e9</td>
<td>1.4912633816754019e12</td>
</tr>
<tr class="even">
<td>11</td>
<td>10.095455630535774 + 0.6449328236240688im</td>
<td>1.1109180272716561</td>
<td>7.143113638035824e9</td>
<td>1.4912633816754019e12</td>
</tr>
<tr class="odd">
<td>12</td>
<td>11.793890586174369 - 1.6524771364075785im</td>
<td>1.665281290598479</td>
<td>3.357756113171857e10</td>
<td>3.2960214141301664e13</td>
</tr>
<tr class="even">
<td>13</td>
<td>11.793890586174369 + 1.6524771364075785im</td>
<td>2.045820276678428</td>
<td>3.357756113171857e10</td>
<td>3.2960214141301664e13</td>
</tr>
<tr class="odd">
<td>14</td>
<td>13.992406684487216 - 2.5188244257108443im</td>
<td>2.5188358711909045</td>
<td>1.0612064533081976e11</td>
<td>9.545941595183662e14</td>
</tr>
<tr class="even">
<td>15</td>
<td>13.992406684487216 + 2.5188244257108443im</td>
<td>2.7128805312847097</td>
<td>1.0612064533081976e11</td>
<td>9.545941595183662e14</td>
</tr>
<tr class="odd">
<td>16</td>
<td>16.73074487979267 - 2.812624896721978im</td>
<td>2.9060018735375106</td>
<td>3.315103475981763e11</td>
<td>2.7420894016764064e16</td>
</tr>
<tr class="even">
<td>17</td>
<td>16.73074487979267 + 2.812624896721978im</td>
<td>2.825483521349608</td>
<td>3.315103475981763e11</td>
<td>2.7420894016764064e16</td>
</tr>
<tr class="odd">
<td>18</td>
<td>19.5024423688181 - 1.940331978642903im</td>
<td>2.454021446312976</td>
<td>9.539424609817828e12</td>
<td>4.2525024879934694e17</td>
</tr>
<tr class="even">
<td>19</td>
<td>19.5024423688181 + 1.940331978642903im</td>
<td>2.004329444309949</td>
<td>9.539424609817828e12</td>
<td>4.2525024879934694e17</td>
</tr>
<tr class="odd">
<td>20</td>
<td>20.84691021519479 + 0.0im</td>
<td>0.8469102151947894</td>
<td>1.114453504512e13</td>
<td>1.3743733197249713e18</td>
</tr>
</tbody>
</table>







<ol type="1">
<li>Wnioski.</li>
</ol>

<p>4.1.a</p>

<p>Wilkinson swoje odkrycie uznał za najbardziej traumatyczne w całej jego karierze naukowej. Zauważmy, że stosunkowe małe błędy przybliżenia powstałe podczas obliczania pierwiastków przyczyniają się do otrzymania wyników odlegle błędnych. Zadanie obliczenia pierwiastków z<sub>k</sub> wielomianu Wilkinsona jest zadaniem skrajnie źle uwarunkowanym. Powodem tych sprzecznych wyników są prawdopodbnie duże wartości współczynników, błąd zatem jest powielany. Drugą sprawą jest rozwikłanie zadanej wskazówki. Język Julia (float64) ma od 15 do 17 cyfr znaczących, więc nie wszystkie współczynniki wielomianu są dokładnie rezprezentowane.</p>


<p>4.1.b Eksperyment Wilkinsona (- 2<sup>-23</sup>)</p>

<p>Dla zoobrazowania różnicy:</p>
<p>-210</p>
<p>11000000011010100100000000000000000000000<em><strong>0</strong></em>0000000000000000000000</p>
<p>-210-2<sup>-23</sup></p>
<p>11000000011010100100000000000000000000000<em><strong>1</strong></em>0000000000000000000000</p>

<p>Po odjęciu względnie małej liczby 2<sup>-23</sup> pierwiastki przyjmują zwyczajowo wartości większe niż prawidłowe dla x= 20 otrzymujemy 20,8. Pojawiają się pierwiastki zespolone. Niewielka zmiana współczynnika doprowadza do znacznie innego rozmieszczenia miejsc zerowych. Trzeba zauważyć, że w wejściowym stanie pierwiastki rozłożone są równomiernie. Wilkinson wykazał, iż zachowanie to wynika ze względu na to, że niektóre pierwiastki <strong>a</strong> będą miały wiele bliskich pierwiastków<strong> b </strong>takich, że <strong>|a-b| </strong>jest mniejszy od <strong>a</strong><sup><strong>2 </strong></sup>(np. 15). Powyższy eksperyment arguemtnuje, iż zadanie jest zadaniem skrajnie źle uwarunkowanym.</p>










<ul>
<li>Zadanie 5</li>
</ul>


<ol type="1">
<li>Opis problemu.</li>
</ol>


<p>Rozważanym problem jest model logistyczny, model wzrostu populacji Ver-huste</p>


<p>p<sub>n+1</sub>=p<sub>n</sub>+r p<sub>n</sub>(1- <sub> </sub>p<sub>n</sub>)</p>


<p>gdzie r jest zadaną stałą, r(1- p<sub>n</sub>) jest czynnikiem wzrostu populacji natomiast p<sub>0</sub> jest </p>
<p>wielkością poppulacji stanowiącą procent maksymalenj wielkości populacji dla danego stanu środowiska.</p>


<p> W zadaniu mamy zmierzyć się z dwoma eksperymentami. Dla narzuconego p=0.01 oraz 3=3 przeprowadzić 40 iteracji wyrażenia w arytmetyce Float32 z zaburzeniem tzn ucięciem do 3 cyfr po przecinku dla wartości w 10 iteracji . Następnie to samo doświadczenie wykonać bez zbaurzenia dla arytmetki Floaat64.</p>



<ol type="1">
<li>Rozwiązanie problemu.</li>
</ol>

<p>Zaimplementowanie algorytmu iterującego 40 razy dla aż trzech wartości p<sub>1</sub>,p<sub>2</sub> oraz p<sub>3</sub> jest słusznym podejściem. Wykonanie zadanego działania 40 razy dla p<sub>1 </sub> oraz p<sub>3 </sub>natomiast z zatrzymaniem w 10 iteracji dla p<sub>2</sub>. Zapisanie otrzymanych wyników kolejnych kolumnach w celu ułatwienia interpretacji otrzymanych wartości dla kolejnych problemów.</p>

<ol type="1">
<li>Wyniki.</li>
</ol>
<table>
<tbody>
<tr class="odd">
<td>i</td>
<td> Float32 </td>
<td> Float32 z ucięciem </td>
<td> Float64</td>
</tr>
<tr class="even">
<td>1 </td>
<td> 0.0397 </td>
<td> 0.0397 </td>
<td> 0.0397</td>
</tr>
<tr class="odd">
<td>2 </td>
<td> 0.15407173 </td>
<td> 0.15407173 </td>
<td> 0.15407173000000002</td>
</tr>
<tr class="even">
<td>3 </td>
<td> 0.5450726 </td>
<td> 0.5450726 </td>
<td> 0.5450726260444213</td>
</tr>
<tr class="odd">
<td>4 </td>
<td> 1.2889781 </td>
<td> 1.2889781 </td>
<td> 1.2889780011888006</td>
</tr>
<tr class="even">
<td>5 </td>
<td> 0.1715188 </td>
<td> 0.1715188 </td>
<td> 0.17151914210917552</td>
</tr>
<tr class="odd">
<td>6 </td>
<td> 0.5978191 </td>
<td> 0.5978191 </td>
<td> 0.5978201201070994</td>
</tr>
<tr class="even">
<td>7 </td>
<td> 1.3191134 </td>
<td> 1.3191134 </td>
<td> 1.3191137924137974</td>
</tr>
<tr class="odd">
<td>8 </td>
<td> 0.056273222 </td>
<td> 0.056273222 </td>
<td> 0.056271577646256565</td>
</tr>
<tr class="even">
<td>9 </td>
<td> 0.21559286 </td>
<td> 0.21559286 </td>
<td> 0.21558683923263022</td>
</tr>
<tr class="odd">
<td>10 </td>
<td> 0.7229306 </td>
<td> 0.722 </td>
<td> 0.722914301179573</td>
</tr>
<tr class="even">
<td>11 </td>
<td> 1.3238364 </td>
<td> 1.3241479 </td>
<td> 1.3238419441684408</td>
</tr>
<tr class="odd">
<td>12 </td>
<td> 0.037716985 </td>
<td> 0.036488414 </td>
<td> 0.03769529725473175</td>
</tr>
<tr class="even">
<td>13 </td>
<td> 0.14660022 </td>
<td> 0.14195944 </td>
<td> 0.14651838271355924</td>
</tr>
<tr class="odd">
<td>14 </td>
<td> 0.521926 </td>
<td> 0.50738037 </td>
<td> 0.521670621435246</td>
</tr>
<tr class="even">
<td>15 </td>
<td> 1.2704837 </td>
<td> 1.2572169 </td>
<td> 1.2702617739350768</td>
</tr>
<tr class="odd">
<td>16 </td>
<td> 0.2395482 </td>
<td> 0.28708452 </td>
<td> 0.24035217277824272</td>
</tr>
<tr class="even">
<td>17 </td>
<td> 0.7860428 </td>
<td> 0.9010855 </td>
<td> 0.7881011902353041</td>
</tr>
<tr class="odd">
<td>18 </td>
<td> 1.2905813 </td>
<td> 1.1684768 </td>
<td> 1.2890943027903075</td>
</tr>
<tr class="even">
<td>19 </td>
<td> 0.16552472 </td>
<td> 0.577893 </td>
<td> 0.17108484670194324</td>
</tr>
<tr class="odd">
<td>20 </td>
<td> 0.5799036 </td>
<td> 1.3096911 </td>
<td> 0.5965293124946907</td>
</tr>
<tr class="even">
<td>21 </td>
<td> 1.3107498 </td>
<td> 0.09289217 </td>
<td> 1.3185755879825978</td>
</tr>
<tr class="odd">
<td>22 </td>
<td> 0.088804245 </td>
<td> 0.34568182 </td>
<td> 0.058377608259430724</td>
</tr>
<tr class="even">
<td>23 </td>
<td> 0.3315584 </td>
<td> 1.0242395 </td>
<td> 0.22328659759944824</td>
</tr>
<tr class="odd">
<td>24 </td>
<td> 0.9964407 </td>
<td> 0.94975823 </td>
<td> 0.7435756763951792</td>
</tr>
<tr class="even">
<td>25 </td>
<td> 1.0070806 </td>
<td> 1.0929108 </td>
<td> 1.315588346001072</td>
</tr>
<tr class="odd">
<td>26 </td>
<td> 0.9856885 </td>
<td> 0.7882812 </td>
<td> 0.07003529560277899</td>
</tr>
<tr class="even">
<td>27 </td>
<td> 1.0280086 </td>
<td> 1.2889631 </td>
<td> 0.26542635452061003</td>
</tr>
<tr class="odd">
<td>28 </td>
<td> 0.9416294 </td>
<td> 0.17157483 </td>
<td> 0.8503519690601384</td>
</tr>
<tr class="even">
<td>29 </td>
<td> 1.1065198 </td>
<td> 0.59798557 </td>
<td> 1.2321124623871897</td>
</tr>
<tr class="odd">
<td>30 </td>
<td> 0.7529209 </td>
<td> 1.3191822 </td>
<td> 0.37414648963928676</td>
</tr>
<tr class="even">
<td>31 </td>
<td> 1.3110139 </td>
<td> 0.05600393 </td>
<td> 1.0766291714289444</td>
</tr>
<tr class="odd">
<td>32 </td>
<td> 0.0877831 </td>
<td> 0.21460639 </td>
<td> 0.8291255674004515</td>
</tr>
<tr class="even">
<td>33 </td>
<td> 0.3280148 </td>
<td> 0.7202578 </td>
<td> 1.2541546500504441</td>
</tr>
<tr class="odd">
<td>34 </td>
<td> 0.9892781 </td>
<td> 1.3247173 </td>
<td> 0.29790694147232066</td>
</tr>
<tr class="even">
<td>35 </td>
<td> 1.021099 </td>
<td> 0.034241438 </td>
<td> 0.9253821285571046</td>
</tr>
<tr class="odd">
<td>36 </td>
<td> 0.95646656 </td>
<td> 0.13344833 </td>
<td> 1.1325322626697856</td>
</tr>
<tr class="even">
<td>37 </td>
<td> 1.0813814 </td>
<td> 0.48036796 </td>
<td> 0.6822410727153098</td>
</tr>
<tr class="odd">
<td>38 </td>
<td> 0.81736827 </td>
<td> 1.2292118 </td>
<td> 1.3326056469620293</td>
</tr>
<tr class="even">
<td>39 </td>
<td> 1.2652004 </td>
<td> 0.3839622 </td>
<td> 0.0029091569028512065</td>
</tr>
<tr class="odd">
<td>40 </td>
<td> 0.25860548 </td>
<td> 1.093568 </td>
<td> 0.011611238029748606</td>
</tr>
</tbody>
</table>
<ol type="1">
<li>Wnioski.</li>
</ol>

<p>Pozornie drobne, niewielkie zmiany w danych takie jak obcięcie kilku miejsc po przecinku doprowadza wyniki końcowe do dużych błędów. Takie ucięcie może być np. spowodowane ograniczeniami ze strony bazy danych.</p>
<p>Zauważalne jest, że różnice są coraz większe w kolejnych iteracjach. </p>
<p>Zadanie jest zadaniem źle uwarunkowanym. Zwiększenie precyzji dla małych n może przynić się do zbliżenia do bardziej poprawnych wyników.</p>



<ul>
<li>Zadanie 6</li>
</ul>

<ol type="1">
<li>Opis problemu.</li>
</ol>

<p>Rozważanym problemem jest równanie rekurencyjne postaci:</p>

<p>x<sub>n+1</sub> = x<sub>n</sub><sup>2</sup> + c dla n = 0,1…</p>


<p>Celem jest przeprowadzenie eksperymentów dla danych :</p>

<p>1. c = -2 i x<sub>0</sub> = 1</p>
<p>2. c = -2 i x<sub>0</sub> = 2</p>
<p>3. c = -2 i x<sub>0</sub> = 1.99999999999999</p>
<p>4. c = -1 i x<sub>0</sub> = 1</p>
<p>5. c = -1 i x<sub>0</sub> = -1</p>
<p>6. c = -1 i x<sub>0</sub> = 0.75</p>
<p>7. c = -1 i x<sub>0</sub> = 0.25</p>




<ol type="1">
<li>Rozwiązanie problemu.</li>
</ol>


<p>W celu rozwiązania problemu wykonujemy 40 iretacji wyżej podanego wyrażenia. </p>
<p>Konluzję i wnioski wyciągniemy z iteracji graficznej zadanego równania.</p>




<ol type="1">
<li>Wyniki.</li>
</ol>
<table>
<tbody>
<tr class="odd">
<td>i</td>
<td><p>C= -2</p>
<p>x<sub>0</sub>=1</p></td>
<td><p>C= -2</p>
<p>x<sub>0</sub>=2</p></td>
<td><p>C= -2</p>
<p>x<sub>0</sub>=1.99999999999999</p></td>
<td><p>C= -1</p>
<p>x<sub>0</sub>=1</p></td>
<td><p>C= -1</p>
<p>x<sub>0</sub>=2</p></td>
<td><p>C= -1</p>
<p>x<sub>0</sub>=0.75</p></td>
<td><p>C= -1</p>
<p>x<sub>0</sub>=0.25</p></td>
</tr>
<tr class="even">
<td>1 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.99999999999996 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -0.4375 </td>
<td> -0.9375</td>
</tr>
<tr class="odd">
<td>2 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999999999998401 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -0.80859375 </td>
<td> -0.12109375</td>
</tr>
<tr class="even">
<td>3 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999999999993605 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -0.3461761474609375 </td>
<td> -0.9853363037109375</td>
</tr>
<tr class="odd">
<td>4 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.999999999997442 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -0.8801620749291033 </td>
<td> -0.029112368589267135</td>
</tr>
<tr class="even">
<td>5 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999999999897682 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -0.2253147218564956 </td>
<td> -0.9991524699951226</td>
</tr>
<tr class="odd">
<td>6 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999999999590727 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -0.9492332761147301 </td>
<td> -0.0016943417026455965</td>
</tr>
<tr class="even">
<td>7 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.999999999836291 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -0.0989561875164966 </td>
<td> -0.9999971292061947</td>
</tr>
<tr class="odd">
<td>8 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999999993451638 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -0.9902076729521999 </td>
<td> -5.741579369278327e-6</td>
</tr>
<tr class="even">
<td>9 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999999973806553 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -0.01948876442658909 </td>
<td> -0.9999999999670343</td>
</tr>
<tr class="odd">
<td>10 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.999999989522621 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -0.999620188061125 </td>
<td> -6.593148249578462e-11</td>
</tr>
<tr class="even">
<td>11 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999999580904841 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -0.0007594796206411569 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>12 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999998323619383 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -0.9999994231907058 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>13 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999993294477814 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.1536182557003727e-6 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>14 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999973177915749 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -0.9999999999986692 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>15 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999892711734937 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -2.6616486792363503e-12 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>16 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9999570848090826 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>17 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.999828341078044 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>18 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9993133937789613 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>19 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9972540465439481 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>20 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9890237264361752 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>21 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.9562153843260486 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>22 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.82677862987391 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>23 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.3371201625639997 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>24 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -0.21210967086482313 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>25 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -1.9550094875256163 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>26 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.822062096315173 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>27 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.319910282828443 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>28 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -0.2578368452837396 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>29 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -1.9335201612141288 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>30 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.7385002138215109 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>31 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.0223829934574389 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>32 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -0.9547330146890065 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>33 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -1.0884848706628412 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>34 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -0.8152006863380978 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>35 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -1.3354478409938944 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>36 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -0.21657906398474625 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>37 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -1.953093509043491 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>38 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.8145742550678174 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
<tr class="even">
<td>39 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> 1.2926797271549244 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> 0.0 </td>
<td> -1.0</td>
</tr>
<tr class="odd">
<td>40 </td>
<td> -1.0 </td>
<td> 2.0 </td>
<td> -0.3289791230026702 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> -1.0 </td>
<td> 0.0</td>
</tr>
</tbody>
</table>


<ol type="1">
<li>Wnioski.</li>
</ol>
<p><img src="Pictures/10000000000002580000019082984E823F2BF532.png" style="width:8.885cm;height:5.923cm" /><img src="Pictures/1000000000000258000001900523A64D4941761C.png" style="width:9.29cm;height:6.195cm" />X<sub>0 </sub>= 1 c = -2 x<sub>0</sub> = 2 c = -2</p>



<p>c = -1 x<sub>0</sub>= -1x<sub>0</sub> = 1 c = -1 </p>
<p><img src="Pictures/1000000000000258000001902B8FD1C5762231A6.png" style="width:8.797cm;height:5.865cm" /><img src="Pictures/1000000000000258000001902B8FD1C5762231A6.png" style="width:9.241cm;height:6.161cm" /></p>




<p>x<sub>0</sub>= 1.99999999999999 c = -2</p>
<p><img src="Pictures/10000000000002580000019018345BBD64029BEE.png" style="width:9.125cm;height:6.084cm" /></p>





<p><img src="Pictures/1000000000000258000001901DE54442601AD6F1.png" style="width:9.283cm;height:6.189cm" /><img src="Pictures/100000000000025800000190C4E6127AF4D5684B.png" style="width:10.46cm;height:6.973cm" /></p>


<p>c = -1 x<sub>0</sub>= 0.75</p>










<p>c = -1 x<sub>0</sub>= 0.25</p>








<p>Dla pierwszych 4 wykresów wyniki są dość przewidywalne, zgodne.</p>
<p>W kolejnym przykładzie tj. dla x<sub>o</sub>=1. 99999999999999 zauważalny jest fakt, iż z kolejną iteracją wyniki są coraz bardziej rozrzucone, niezgodne. Intuicja podpowiada, że x<sub>0</sub> zostanie zaokrąglony do 2 i otrzymamy rezultaty zbliżone to [2.0, 2.0, …, 2.0]. </p>
<p>Dla x<sub>o</sub>=0.75 v x<sub>o</sub>=0.25 wartości po pewnej iteracji stabilizują się i oscylują po wartościach 0 oraz – 1.0 .</p>
<p>Sprawcą chaosu potencjalnie jest podnoszenie do kwadratu, ponieważ w wyniku np. błędu przybliżenia w pewnej iteracji w kolejnych błąd będzie wielokrotnie powtarzany. Jednak nasza analiza dowodzi, że wyniki są bezpośrednio i w dużym stopniu zależne od danych wejściowych <strong>x</strong><sub><strong>0</strong></sub><strong> </strong>i <strong>c</strong>. Jest to również zadanie źle uwarunkowane, ponieważ dorbna zmiana może doprowadzić do otrzymania skrajnie błędnych wyników.</p>
</body>
</html>

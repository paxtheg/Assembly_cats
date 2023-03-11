

4 exerciții independente: Fiecare task constă în implementarea unei sau mai multor funcții în limbaj de asamblare. Implementarea se realizează în fișierele puse la dispoziție pentru fiecare exercițiu.

1. Sursee dorește să ajungă pe catedra din PR001 așa că trebuie să trimită mesaje criptate studenților că să afle cine o poate ajuta. Ea vrea să folosească simple cipher pentru a transmite mesajele.

Acest algoritm de criptare presupune shiftarea la dreapta în cadrul alfabetului a fiecărui caracter de un anumit număr de ori. De exemplu, textul ANABANANA se transformă în BOBCBOBOB când pasul este 1. Astfel, o criptare cu pasul 26 nu modifică litera, întrucât alfabetul englez are 26 de caractere.

Pentru acest task va trebui să implementați în fișierul simple.asm funcția simple(), care criptează un string folosind metoda descrisă mai sus.

Antetul funcției este:

 void simple(int n, char* plain, char* enc_string, int step) 
Semnificația argumentelor este:

n dimensiunea textului
plain string-ul care trebuie criptat
enc_string adresa la care se va scrie textul criptat
step cu cât se shiftează fiecare caracter

2. Diablo, mâncăciosul, vrea să ajungă la cantina din EC pentru a-și pune lăbuțele pe un meniu de mâncare proaspătă. Ajutați-l să găsească cel mai scurt drum de la intrarea în facultate până la cantină.

Prin intermediul acestui task se dorește aprofundarea lucrului cu structuri.

Se dă structura unui punct în coordonate carteziene:

struct point{
    short x;
    short y; 
};


a)Pentru această parte a task-ului aveți de implementat funcția points_distance() din fișierul points-distance.asm, care va calcula distanța dintre două puncte aflate pe o dreapta paralelă cu axele OX sau OY.

Antetul funcției este:

void points_distance(struct point *p, int *rez);
Semnificația argumentelor este:

p adresa de început a vectorului de puncte
rez adresa unde trebuie scrisă distanța dintre cele două puncte


b) În continuarea exercițiului 1, acum trebuie să implementati funcția road() din fișierul road.asm, care va calcula distanța dintre punctele dintr-un vector. Astfel, pentru un vector de 4 puncte (A,B,C,D), se vor calcula 3 distanțe: *A-B* , *B-C*, *C-D*. Perechile de puncte se află pe drepte paralele cu axele.

Antetul funcției este:

void road(struct point* points, int len, int* distances);
Semnificația argumentelor este:

points adresa de început a vectorului de puncte
len numărul de puncte
distances adresa de început a vectorului de distanțe


c) Ultima parte a task-ului presupune analizarea fiecărei distanțe calculate anterior pentru a determina dacă este pătrat perfect. Trebuie să implementati funcția is_square() din fișierul is_square.asm.

Antetul funcției este:

void is_square(int *dist, int n, int *rez);
Semnificația argumentelor este:

dist adresa de început a vectorului de distanțe calculate la exercițiul 2
n lungimea vectorului
rez adresa de început a vectorului rezultat în urmă verificărilor

3. Swaro a aflat că cifrul folosit de Sursee a fost spart, așa că vă roagă să îi trimiteți mesaje cifrate folosind criptarea Beaufort, pentru a nu îi fi descoperit planul de a se infiltra în corpul ED.

Algoritmul de criptare Beaufort pleacă de la un string în clar (numit și plain text) și un string secundar (numit cheie) și obține un text criptat, de lungime identică cu string-ul în clar, prin înlocuirea caracter cu caracter a literelor din textul inițial.

De exemplu, să zicem că vrem să criptăm textul DEFENDTHEEASTWALLOFTHECASTLE, utilizând cheia FORTIFICATION.

Regula după care se face înlocuirea folosește o matrice de caractere, numită tabula recta, în care fiecare linie și fiecare coloană au asociate câte o literă a alfabetului limbii engleze.

Criptarea fiecărui caracter se realizează aplicând următorii pași:

asociem fiecărui caracter din textul în clar un caracter din cheie, repetând cheia pentru a acoperi tot string-ul inițial
    DEFENDTHEEASTWALLOFTHECASTLE
    FORTIFICATIONFORTIFICATIONFO
mergem în `tabula recta` pe coloana asociată literei pe care vrem să o criptăm
coborâm pe această coloană până când găsim litera asociată din cheie
litera asociată liniei pe care am ajuns reprezintă caracterul criptat

Criptând fiecare caracter folosind pașii de mai sus, obținem string-ul criptat. Pe exemplul nostru:

 CKMPVCPVWPIWUJOGIUAPVWRIWUUK 
Pentru acest task, va trebui să implementați în fișierul beaufort.asm funcția beaufort() care criptează un string în clar, folosind metoda descrisă mai sus.

Antetul funcției este:

void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc)
Semnificația argumentelor este:

len_plain și plain: dimensiunea textului în clar și string-ul în clar (adresa primului element)
len_key și key: dimensiunea cheii și string-ul care reprezintă cheia (adresa primului element)
tabula_recta: o matrice (alocată static) de 26 X 26 de caractere ale limbii engleze, cu conținutul din figurile de mai sus
enc: adresa la care va trebui să scrieți textul criptat

4. Îngeraș, care este capul răutăților, vrea să cucerească toate laboratoarele din EG. Știe că are nevoie de o modalitate sigură de a transmite mesaje celorlalte pisici. Ajutați-o să trimită mesaje folosind spiral encryption.

O criptare prin substituție (în care înlocuim caracter cu caracter literele din textul în clar) e cu atât mai eficientă cu cât unui atacator îi e mai greu să decodifice mesajul inițial, chiar dacă are acces la cheie și la mesajul criptat. Pentru asta, putem alege moduri cât mai “ezoterice” de utilizare a cheii, iar spiral encryption e un algoritm care face tocmai acest lucru.

Vom pleca de la un text în clar de dimensiune N ^ 2. Cheia în acest caz va fi o matrice de întregi de dimensiune N * N. Un caracter din textul în clar va fi criptat adunând la codul său ASCII valoarea întreagă din cheie care îi corespunde. Spre exemplu, dacă pentru caracterul `A` avem asociată în cheie valoarea 2, caracterul criptat va fi `C`. De asemenea, dacă avem caracterul `Z` cu cheia asociată 1, caracterul criptat va fi `[`.

Partea specială la acest algoritm este modul în care asociem caracterelor din textul plain valori din cheie. Pentru asta, vom parcurge textul în clar secvențial (de la primul la ultimul caracter), iar în același timp vom parcurge cheia în spirală.

Astfel, ținând cont de dimensiunea matricii care reprezintă cheia și de dimensiunea textului (mereu vor fi corelate astfel încât numărul de elemente din matrice să fie egal cu numărul de litere din text) obținem întregul text criptat.

Sarcina voastră este să completați funcția spiral() din fișierul spiral.asm, astfel încât aceasta să cripteze un text în clar cu ajutorul unei chei date, folosind algoritmul prezentat mai sus. Antetul funcției este:

void spiral(int N, char *plain, int key[N][N], char *enc_string)
Semnificația argumentelor este:

N: dimensiunea textului în clar va fi N ^ 2, iar dimensiunea cheii va fi N * N
plain: textul în clar, conținând N ^ 2 caractere
key: matricea (alocată static) care stochează cheia
enc_string: adresa de start a șirului de caractere în care va trebui să întoarceți rezultatul (textul criptat)


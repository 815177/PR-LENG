//----------------------------------------------------------------------
//  cambio_base.cl
//----------------------------------------------------------------------
int num, base;
int enB;
//----------------------------------------------------
int b_dec(int n, int b) {
	int uc;
	int valRec;

	if (n == 0) {
		return 0;
	}
	else {
		uc = n % 10;
	
		valRec = b_dec (n / 10, b);
		return valRec*b + uc;
	}
}
//----------------------------------------------------
int dec_b(int n, int b) {
	int resto,valRec;

	if (n < b) {
		return n;
	}
	else {
		resto = n % b;
		valRec = dec_b (n / b, b);
		return valRec*10 + resto;
	}
}

//----------------------------------------------------
void main () {
	num = 4;
	base = 2;

	print_ln ("Este programa convierte n=",num," a base b=", base, ", y luego efectúa la conversión inversa.");
	print_ln();
	print_ln("n: ",num);
	print("b: ");
	print_ln(base);
	enB = dec_b(num,base);
	print_ln ("dec_b(",num,",",base,"): ",enB);
    print_ln ("b_dec(",enB,",",base,"): ",b_dec(enB,base));
	print_ln();
}
//----------------------------------------------------------------------
//  criba_eratostenes.cl
//----------------------------------------------------------------------

int n;
bool criba[101];

//----------------------------------------------------------------------
int pedir_entero () {
    int n;

    n = 0;
    while (n < 1 || n > 100) {
        print("Dame un numero entre 1 y 100: ");
        read (n);
    }
    return n;
}
//----------------------------------------------------------------------
void escrib_vect (bool v[101]) {
	int i, m;
	bool salir;

    i = 2;
    m = 0;
    salir = false;
    print_ln ("");
    print_ln ("Numeros primos hasta ", n, ": ");
    print_ln ("");
    while (! salir) {
        if (i > n) {
            salir = true;
        }
        else {
            if (v[i]) {
                print_ln (i, " es primo.");
                m = m + 1;
            }
            i = i + 1;
        }
    }
    print_ln ("");
    print_ln ("Hasta ", n, " hay ", m, " números primos.");
}
//--------------------------------------------------------------
void inicializar (bool& v[101]) {
	int i;

    i = 1;
    while (i <= n) {
        v[i] = true;
        i = i + 1;
    }
}
//--------------------------------------------------------------
void eliminar_no_primos (bool& v[101]) {
	int i, j;

    i = 2;
    while (i <= n / 2) {
        if (v[i]) {
            j = 2 * i;
            while (j <= n) {
                v[j] = false;
                j = j + i;
            }
        }
        i = i + 1;
    }
}
//--------------------------------------------------------------
void procesar (bool& v[101]) {
    inicializar (v);
    eliminar_no_primos (v);
    escrib_vect (v);
}
//--------------------------------------------------------------
void main() {
    print_ln ("Criba de Eratóstenes: determinación de qué números son primos hasta un n dado.");
    print_ln ("https://es.wikipedia.org/wiki/Criba_de_Erat%C3%B3stenes");
    print_ln();

    n = pedir_entero ();
    procesar (criba);
}
//----------------------------------------------------------------------
//  factorial.cl
//----------------------------------------------------------------------

//----------------------------------------------------------------------
int fact (int m) {
    if (m == 1) {
        return 1;
    }
    else {
        return m * fact(m-1);
    }
}
//----------------------------------------------------------------------
int n;
//----------------------------------------------------------------------
void main() {
    print_ln ("");
    print_ln ("Calcula k! para k=1..20.");
    print_ln ("");
    print_ln ("Habrá MATH overflow en 13! porque los enteros en la máquina p son de 4 bytes.");
    print_ln ("");

    n = 1;
    while (n <= 20) {
        print_ln (n, "! = ", fact (n));
        n = n + 1;
    }
}
  
//----------------------------------------------------------------------
//  fibonacci.cl
//----------------------------------------------------------------------

int i, n, r;
//---------------------------------------------------------
void dato (int& dato) {
  bool correcto;
  dato = 0;
  correcto = false;
  while (!correcto) {
     print ("Escribe un numero positivo: ");
     read (dato);
     correcto = dato > 0;
     if (!correcto) {
        print_ln ("El numero debe ser positivo.");
     }
  }
}

//---------------------------------------------------------
void cambiar_de_linea () {
  print (int2char (13), int2char (10));
}
//---------------------------------------------------------
void fib (int n, int& r) {
  int r1, r2;

  if (n > 1) {
     fib (n - 1, r1);
     fib (n - 2, r2);
     r = r1 + r2;
  }
  else {
     r = n;
  }
}
//---------------------------------------------------------
void main() {
  print_ln ("Este programa pide un número positivo n y calcula fib(n) con la fórmula recursiva fib(n) = fib(n-1) + fib(n-2)");
  print_ln ("A partir de 30 será muy lento por la recursividad.");
  print_ln ("");
  dato (n);
  i = 1;
  while (i <= n) {
    fib (i, r);
    print_ln ("fib(", i,") = ", r);
    i = i + 1;
  }
  cambiar_de_linea ();
}//----------------------------------------------------------------------
//  fibonacci_iterativo.cl
//----------------------------------------------------------------------

//-----------------------------------------------------------
void cambiar_de_linea () {

	print (int2char (13), int2char (10));
}

//-----------------------------------------------------------
void pedir_dato (int& dato) {
    dato = 0;
    
    while (dato <= 0){
        print ("Escribe un numero positivo: ");
        read_ln (dato);
	}
}
//-----------------------------------------------------------
void dato (int& dato) {
	bool correcto;
   

	dato = 0;
	correcto = false;
	while (!correcto) {
		pedir_dato (dato);
		correcto = dato > 0;
 		if (!correcto) {
			print_ln ("El numero debe ser postivo.");
		}
	}
}
//-----------------------------------------------------------

int i, n, fn, fnm1, fnm2;

void main () {
	print_ln ("");
	print_ln ("Este programa pide un número positivo n y calcula fib(n) con la fórmula recursiva fib(n) = fib(n-1) + fib(n-2)");
	print_ln ("Es muy rápido porque la implementación es iterativa.");
	print_ln ("Habrá MATH overflow en fib(47) porque los enteros en la máquina p son de 4 bytes).");
	print_ln ("");
	dato (n);
	print_ln ("");

	print_ln ("fib(1) = 1");
	print_ln ("fib(2) = 1");

	i = 3;
	fnm1 = 1;
	fnm2 = 1;
	while (i <= n) {
		fn = fnm1 + fnm2;
		print_ln ("fib(", i,") = ", fn);
		fnm2 = fnm1;
		fnm1 = fn;
		i = i + 1;
	}
	cambiar_de_linea ();
}//----------------------------------------------------------------------
//  hello_wordl.cl
//----------------------------------------------------------------------

void main () {

    print_ln ("Hello World!");
}//----------------------------------------------------------------------
//  juego_de_la_vida.cl
//----------------------------------------------------------------------

//------------------------------------------------------------------------
bool colonia[80];
int i, iteraciones, elementos;

//--------------------------------------------------------------------------
void inicializar (bool& colonia[80]) {
    int i;

    i = 0;
    while (i < elementos) {
        colonia[i] = (i % 20) == 0;
        i = i + 1;
    }
}

//--------------------------------------------------------------------------
void inicializar2 (bool& colonia[80]) {
    int i;

    i = 0;
    while (i < 80) {
        colonia[i] = (i >= 37) && (i <= 43);
        i = i + 1;
    }
}
//--------------------------------------------------------------------------
void asignar (bool& colonia[80], bool siguiente[80]) {
    int i;

    i = 0;

    while (i < elementos) {
        colonia[i] = siguiente[i];
        i = i + 1;
    }
}
//--------------------------------------------------------------------------
bool vivira (bool& colonia[80], int i) {
    if (i == 0) {
        return (false);
    }
    else {
        if (i == elementos - 1) {
            return (false);
        }
        else {
            return (!colonia[i] && 
                ((colonia[i - 1] && !colonia[i + 1]) 
                 || (!colonia[i - 1] && colonia[i + 1])
                )
            );
        }
    }
}
//--------------------------------------------------------------------------
bool vivira2 (bool& colonia[80], int i) {
    int vivos;

    vivos = 0;
    if (i > 0) { if (colonia[i-1]) { vivos = vivos + 1; } }
    if (i > 1) { if (colonia[i-2]) { vivos = vivos + 1; } }
    if (i < 79) { if (colonia[i+1]) { vivos = vivos + 1; } }
    if (i < 78) { if (colonia[i+2]) { vivos = vivos + 1; } }

    if (! colonia[i]) {
        return (vivos == 2) || (vivos == 3);
    }
    else {
        return (vivos == 2) || (vivos == 4);
    }
}

//--------------------------------------------------------------------------
void siguientegeneracion (bool& colonia[80]) {
    int i;
    bool siguiente[80];

    i = 0;
    while (i < elementos) {
        siguiente[i] = vivira (colonia, i);
        i = i + 1;
    }
    asignar (colonia, siguiente);
}

//--------------------------------------------------------------------------
void mostrarcolonia (bool colonia[80]) {
    int i;

    i = 0;
    while (i < elementos) {
        if (colonia[i]) {
            print ('*');
        }
        else {
            print (' ');
        }
        i = i + 1;
    }
    print_ln("");
}
//--------------------------------------------------------------------------
void main() {
    print_ln ("Implementación de la versión 1D del Juego de la Vida de Conway.");
    print_ln ("https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life");
    print_ln ("");
    elementos = 80;
    inicializar (colonia);
    mostrarcolonia (colonia);
    i = 1;
    iteraciones = 50;
    while (i <= iteraciones) {
        siguientegeneracion (colonia);
        mostrarcolonia (colonia);
        i = i + 1;
    }
}//----------------------------------------------------------------------
//  mcd.cl
//----------------------------------------------------------------------

void dato (int& d) {
	d = 0;
	while (d <= 0) {
		print ("Escribe un numero (>0): ");
		read_ln (d);
		if (d <= 0) {
			print_ln("El numero debe ser > 0.");
		}
	}
}
//------------------------------------------------------
int mcd(int a, int b) {
	int i, j, k;

	j = a;
	k = b;
	i = a % b;
	while (i != 0) {
		j = k;
		k = i;
		i = j % k;
	}
	return k;
}
//------------------------------------------------------
int i, j;

void main() {
	print_ln ("Este programa pide dos números positivos y calcula su máximo común divisor.");
	dato (i);
	dato (j);
	print_ln ("");
	print_ln ("mcd(", i, ",", j, ") = ", mcd (i,j));
}
//----------------------------------------------------------------------
//  mcd_simple.cl
//----------------------------------------------------------------------

int i, j;
//------------------------------------------------------
int mcd(int a, int b) {
	int i, j, k;

	j = a;
	k = b;
	i = a % b;
	while (i != 0) {
		j = k;
		k = i;
		i = j % k;
	}
	return k;
}
//------------------------------------------------------
void main() {
	read (i);
	read (j);
	print_ln (mcd (i,j));
}
//----------------------------------------------------------------------
//  numero_euler.cl
//----------------------------------------------------------------------
// e aproximado con una serie infinita
// https://en.wikipedia.org/wiki/List_of_representations_of_e#As_an_infinite_series

//--------------------------------------------------------------------
int n, e[101], sumando[101], resultado[101], ndigitos;

//--------------------------------------------------------------------
void iniciar (int& s[101]) {
	int i;

	i = 0;
	while (i <= ndigitos) {
		s[i] = 0;
		i = i + 1;
 	}
}
//--------------------------------------------------------------------
void mostrar_numero (int& s[101]) {
	int i;

	print (s[0],'.');
	i = 1;
	while (i <= ndigitos) {
		if (((i-1) % 5) == 0) {
			print (" ");
		}
		print (s[i]);
		i = i + 1;
	}
	print_ln("");
}

//--------------------------------------------------------------------
void sumar (int& s[101], int& r[101]) {
	int i, n;

	i = ndigitos;
	while (i > 0) {
		n = s[i] + r[i];
		if (n > 9) {
			s[i] = n % 10;
			s[i-1] = s[i-1] + (n / 10);
		}
		else {
			s[i] = n;
		}
		i = i - 1;
   }
}
//--------------------------------------------------------------------
void dividir (int& s[101], int& r[101], int n) {
	int i;
	i = 0;
	while (i < ndigitos) {
		if (s[i] / n > 0) {
			r[i] = s[i] / n;
			s[i+1] = (((s[i] % n) * 10)) + s[i+1];
		}
		else {
			r[i] = 0;
			s[i+1] = (s[i] * 10) + s[i+1];
		}
 		i = i + 1;
	}
}
//--------------------------------------------------------------------
void asignar (int& s[101], int& r[101]) {
	int i;

	i = 0;
	while (i <= ndigitos) {
		s[i] = r[i];
		i = i + 1;
	}
}
//--------------------------------------------------------------------
void main () {
	ndigitos = 20;
   
	print ("Aproximación del número de Euler e utilizan");
	print_ln (" la serie infinita e = 1/0! + 1/1! + 1/2! + 1/3! ...");
	print_ln ("");
   
	iniciar (sumando);
	iniciar (e);
	sumando[0] = 1;
	e[0] = 2;
	n = 1;
	while (n < ndigitos) {
		dividir (sumando, resultado, n);
		sumar (e, resultado);
		print ("e con ", n+1, " componentes de la serie: ");
		mostrar_numero (e);
		asignar (sumando, resultado);
		n = n + 1;
	}
	print_ln ("");
	print_ln ("La convergencia es rápida porque los términos de la suma son 1/k!");
}
//----------------------------------------------------------------------
//  numero_pi_leibnitz.cl
//----------------------------------------------------------------------

int n, pi[101], sumando[101], resultado[101], limite_n, digitos;
bool sumo;

//--------------------------------------------------------------------
void iniciar (int& s[101]) {
   int i;

   i = 0;
   while (i <= digitos) {
      s[i] = 0;
      i = i + 1;
   }
}
//--------------------------------------------------------------------
void mostrar_numero (int& s[101]) {
	int i;

	print (s[0],'.');
	i = 1;
	while (i <= digitos) {
		if (((i-1) % 5) == 0) {
			print (" ");
		}
		print (s[i]);
		i = i + 1;
	}
	print_ln("");
}
//--------------------------------------------------------------------
void sumar (int& s[101], int r[101]) {
	int i, n;

	i = digitos;
	while (i >= 0) {
		n = s[i] + r[i];
		if (n > 9) {
			s[i] = n % 10;
	        if (i > 0) {
               s[i-1] = s[i-1] + (n / 10);
			}
		}
		else {
			s[i] = n;
		}
		i = i - 1;
	}
}
//--------------------------------------------------------------------
//-- s = s - r
void restar (int& s[101], int r[101]) {

	int i, n;
	bool llevo_uno;

	i = digitos;
	llevo_uno = false;

	while (i >= 0) {
		if (llevo_uno) { 
			n = (s[i] - 1) - r[i];
		}
		else {
			n = s[i] - r[i];
     	}
		if (n < 0) {
			s[i] = n + 10;
			llevo_uno = true;
		}
		else {
			s[i] = n;
			llevo_uno = false;
		}
		i = i - 1;
   }
}

//--------------------------------------------------------------------
void dividir (int s[101], int& r[101], int n) {
	int i;

	i = 0;
	while (i < digitos) {
		if (s[i] / n > 0) {
			r[i] = s[i] / n;
			s[i+1] = (((s[i] % n) * 10)) + s[i+1];
		}
		else {
			r[i] = 0;
			s[i+1] = (s[i] * 10) + s[i+1];
		}
		i = i + 1;
	}
}
//--------------------------------------------------------------------
void main() {
   print_ln ("Aproximación del número Pi utilizando la serie infinita e = 4 - 4/3 + 4/5 - 4/7 + 4/9 ...");
   print_ln ("");
   iniciar (sumando);
   iniciar (pi);
   sumando[0] = 4;
   pi[0] = 4;
   n = 3;
   digitos = 50;
   limite_n = 100;
   sumo = false;
   while (n < limite_n) {
         dividir (sumando, resultado, n);
         if (sumo) {
            sumar (pi, resultado);
         }
         else {
            restar (pi, resultado);
         }
         sumo = !sumo;
         print ("Pi con ", (n - 1) / 2, " componentes de la serie: ");
         mostrar_numero (pi);
         n = n + 2;
   }
   print_ln ("");
   print_ln ("La convergencia es lenta porque los términos de la suma son prooprcionales a 1/k");
}
//----------------------------------------------------------------------
//  quicksort.cl
//----------------------------------------------------------------------

int n, t[20], iteraciones;

//--------------------------------------------------------------------
void inicializar (int& t[20]) {
	int i;

	i = 0;
	while (i < n) {
		t[i] = n - i;
		i = i + 1;
	}
}
//--------------------------------------------------------------------
void mostrar (int t[20]) {
	int i;

	i = 0;
	while (i < n) {
		print(t[i], " ");
		i = i + 1;
	}
	print_ln("");
}
//--------------------------------------------------------------------
void intercambiar (int& i, int& j) {
	int k;

	k = i;
	i = j;
	j = k;
}
//--------------------------------------------------------------------
void ordenar (int& i, int& j) {
	if (i > j) {
		intercambiar(i, j);
	}
}
//--------------------------------------------------------------------
void divide (int& t[20], int izq, int der, int& me) {
	int p,k;

	p = t[izq];
	k = izq;
	me = der + 1;
	k = k + 1;
	while ((t[k] <= p) && (k < der)) {
		k = k + 1;
	}
	me = me - 1;
	while (t[me] > p) {
		me = me - 1;
	}
	while (k < me) {
		intercambiar(t[k], t[me]);
		k = k + 1;
		while (t[k] <= p) {
			k = k + 1;
		}
		me = me - 1;
		while (t[me] > p) {
 			me = me - 1;
		}
	}
	intercambiar(t[izq], t[me]);
}
//--------------------------------------------------------------------
void quicksort (int& t[20], int izq, int der) {
	int me;

	if (der > izq) {
		mostrar(t);
		if (der - izq == 1) {
			ordenar(t[izq], t[der]);
		}
		else {
			divide(t, izq, der, me);
			quicksort(t, izq, me - 1);
			quicksort(t, me + 1, der);
			iteraciones = iteraciones + 1;
		}
	}
}
//--------------------------------------------------------------------
void main() {
	print ("Ilustración del funcionamiento del algoritmo ");
	print_ln ("quicksort para ordenar 20 enteros.");

	n = 20;
	iteraciones = 0;
	inicializar (t);
	quicksort(t, 0, n-1);

	print_ln ("");
	print_ln ("Iteraciones: ", iteraciones);
}
//----------------------------------------------------------------------
//  reinas_ajedrez.cl
//----------------------------------------------------------------------


int tamano_tablero, tablero[1000], reinas[1000];
int nreinas, fila, columna, f, c;

//------------------------------------------------------------------------
int min (int x, int y) {
	if (x > y) { return (y); } else { return (x); }
}

//------------------------------------------------------------------------
int max (int x, int y) {
	if (x > y) { return (x);} else { return (y); }
}

//------------------------------------------------------------------------
void linea () {
	print_ln ("");
}
//------------------------------------------------------------------------
int sitio (int fila, int columna) {
	return (((fila - 1) * tamano_tablero) + columna - 1);
}

//------------------------------------------------------------------------
int componente (int& tablero[1000], int fila, int columna) {
	return (tablero[sitio (fila, columna)]);
}

//------------------------------------------------------------------------
bool ocupada (int& tablero[1000], int fila, int columna) {
	return (tablero[sitio (fila, columna)] > 0);
}
//------------------------------------------------------------------------
void asignar_componente (int& tablero[1000], int fila, int columna, int valor) {
	tablero[sitio (fila, columna)] = valor;
}
//------------------------------------------------------------------------
void marcar_componente (int& tablero[1000], int fila, int columna) {
	tablero[sitio (fila, columna)] = tablero[sitio (fila, columna)] + 1;
}
//------------------------------------------------------------------------
void desmarcar_componente (int& tablero[1000], int fila, int columna) {
	tablero[sitio (fila, columna)] = tablero[sitio (fila, columna)] - 1;
}
//------------------------------------------------------------------------
void colocar_reina (int fila, int columna) {
	int f, c;

	marcar_componente (reinas, fila, columna);

	f = 1;
	while (f <= tamano_tablero) {
		marcar_componente (tablero, f, columna);
		f = f + 1;
	}

	c = 1;
	while (c <= tamano_tablero) {
		marcar_componente (tablero, fila, c);
		c = c + 1;
	}

	f = fila;
	c = columna;
	while ((f > 1) && (c > 1)) {
		f = f - 1;
		c = c - 1;
	}

	while ((f <= tamano_tablero) && (c <= tamano_tablero))  {
		marcar_componente (tablero, f, c);
		f = f + 1;
		c = c + 1;
	}

	f = fila;
	c = columna;
	while ((f > 1) && (c < tamano_tablero)) {
		f = f - 1;
		c = c + 1;
	}

	while ((f <= tamano_tablero) && (c >= 1)) {
		marcar_componente (tablero, f, c);
		f = f + 1;
		c = c - 1;
	}
}
//------------------------------------------------------------------------
void iniciar_tablero () {
	int f,c;

	f = 1;
	while (f <= tamano_tablero) {
		c = 1;
		while (c <= tamano_tablero) {
			asignar_componente (tablero, f, c, 0);
			asignar_componente (reinas, f, c, 0);
			c = c + 1;
		}
		f = f + 1;
	}
}
//------------------------------------------------------------------------
void mostrar_tablero (int& tablero[1000]) {
	int f,c;

	linea ();
	print_ln ("Esta es una solución:");
	linea ();
	f = 1;
	while (f <= tamano_tablero) {
		c = 1;
		while (c <= tamano_tablero) {
			if (componente (tablero, f,c) > 0) {
				print (" o");
			}
			else { 
				print (" .");
			}
      		c = c + 1;
		}
		linea ();
    	f = f + 1;
	}
}
//------------------------------------------------------------------------
bool libre (int& fila, int& columna) {
	bool endal;

    fila = 1;
    columna = 1;
    endal = false;
    while (!endal) {
        if (fila > tamano_tablero) {
        	endal = true;
        }
        else {
        	if (columna > tamano_tablero) {
        		columna = 1;
        		fila = fila + 1;
	        }
	        else {
	        	if (ocupada (tablero, fila, columna)) {
	        		columna = columna + 1;
		        }
		        else {
		        	endal = true;
		        }
	        }
        }
    }
    return (fila <= tamano_tablero);
}
//------------------------------------------------------------------------
void main() {
	tamano_tablero = 8;
    
    print_ln ("Este programa intenta colocar ", tamano_tablero, " reinas en un tablero de ajedrez de ", tamano_tablero, '*', tamano_tablero, " sin que se ataquen.");

    fila = 1;
    nreinas = 0;
    while ((fila <= tamano_tablero) && (nreinas < tamano_tablero)) {
        columna = 1;
        while ((columna <= tamano_tablero) && (nreinas < tamano_tablero)) {
            nreinas = 1;
            iniciar_tablero ();
            colocar_reina (fila, columna);
            while ((nreinas < tamano_tablero) && libre (f, c)) {
                colocar_reina (f, c);
                nreinas = nreinas + 1;
            }
            if (nreinas == tamano_tablero) {
                mostrar_tablero (reinas);
            }
            columna = columna + 1;
        }
        fila = fila + 1;
    }
    print_ln ("");
}//----------------------------------------------------------------------
//  reinas_ajedrez.cl
//----------------------------------------------------------------------
//-- algoritmo recurso para resolver las torres de hanoi
//-- https://en.wikipedia.org/wiki/Tower_of_Hanoi#Recursive_solution
//--------------------------------------------------------------------------
int steps, n;

//--------------------------------------------------------------------------
void hanoi (int n, char source, char target, char spare) {
	if (n == 1) {
		print_ln ("Move disk from tower ", source, " to tower ", target, ". ");
		steps = steps + 1;
	}
	else {
		hanoi (n - 1, source, spare, target);
		hanoi (1, source, target, spare);
		hanoi (n - 1, spare, target, source);
	}
}
//--------------------------------------------------------------------------
void main() {
	print_ln ();
	print_ln ("Recursive algorithm to solve the Hanoi Towers problem.");
	print_ln ("https://en.wikipedia.org/wiki/Tower_of_Hanoi#Recursive_solution");
	print_ln ();

	steps = 0;
	n = 3;

	print_ln ("Solving for ", n, " disks.");
	print_ln();

	hanoi (n, 'A', 'C', 'B');

	print_ln ();
	print_ln ("Finished in ", steps, " steps.");
}
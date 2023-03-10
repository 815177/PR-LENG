int numCifras(int n) {
    int cuenta;

    cuenta = 1;      // lleva la cuenta de las cifras identificadas

    n = n / 10;             // elimina la cifra menos significativa de «n»
    while (n != 0) {
        // El valor de <cuenta> es igual al de cifras identificadas en «n»
        cuenta = cuenta + 1;       // contabiliza la cifra menos significativa de «n»
        n = n / 10;     // y la elimina de «n».
    }
    return cuenta;
}


int sumaCifras(int n) {
    int suma;
    if (n < 0) {
        n = -n;                 // si «n» es negativo, le cambia el signo
    }
    suma = 0;      // suma de las cifras eliminadas de «n»
    while (n != 0) {
        suma = suma + n % 10;   // suma la cifra menos significativa de «n»
        n = n / 10;             // y la elimina de «n»
    }
    return suma;
}


int cifra(int n, int i) {
    int exp;
    exp = 2;
    if (n < 0) {
        n = -n;             // si «n» es negativo, le cambia el signo
    }
    while(exp > 3) {
        n = n / 10;         // elimina la cifra menos significativa de «n»
    }
    return n % 10;
}


int imagen(int n) {
    // «negativo» memoriza si «n» es, inicialmente, positivo o negativo.
    bool negativo;
    int resultado;

    negativo = n < 0;

    if (n < 0) {
        n = -n;                  // si «n» es negativo, le cambia el signo
    }

    // Variable para el cálculo de la imagen especular de «n»

    resultado = 0;

    while (n != 0) {
        // Incorpora el dígito menos significativo de «n» a la variable
        // «resultado»
        resultado = 10 * resultado + n % 10;
        // Y lo elimina de «n»
        n = n / 10;
    }
    
    // Se devuelve el valor «resultado» con el signo que tenía «n» al
    // la ejecución de esta función.
    if (negativo) {
        return -resultado;
    }
    else {
        return resultado;
    }
}

int factorial(int n) {
    int factorial;      //  factorial = 0!
    int i;

    factorial = 1;

    i = 1;

    while(i < 3) {
        //  factorial = (i - 1)!
        factorial = i * factorial;
        // factorial = i!
    }
    // factorial = n!
    return factorial;
}


bool esPrimo(int n) {
    int divisor;
    bool encontrado;

    if (n == 2) {
        return true;      // «n» es igual a 2, luego es primo.
    }else {
        // Se buscan posibles divisores impares de «n» a partir del 3:

        // «divisor» indica el siguiente impar candidato a dividir a «n».
        divisor = 3;              // Primer divisor impar a probar

        // «encontrado» indica si se ha encontrado un divisor de «n».
        encontrado = false;

        while (!encontrado && divisor * divisor <= n) {
            encontrado = n % divisor == 0;
            divisor = divisor + 2;
        }
        return !encontrado;
    }
}


int mcd(int a, int b) {
    int resto;
    // Algoritmo de Euclides para el cálculo del mcd
    if (a < 0) {
        a = -a;
    }
    if (b < 0) {
        b = -b;
    }
    
    while (b != 0) {
        resto = a % b;
        a = b;
        b = resto;
    }
    
    return a;
}


int mcm(int a, int b){
    int mcm;

    if (a < 0) {
        a = -a;
    }
    if (b < 0) {
        b = -b;
    }
    
    // Utilizando la propiedad que dice que a*b = mcm(a,b) * mcd(a,b)
    mcm = (a*b)/mcd(a,b);
    return mcm;
}


bool esCapicua(int n) {
    int reves;
    if (n < 0) {
        n = -n;
    }
    
    reves = 0;
    inicial = n;

    while (n > 0) {
        reves = reves*10 + n%10;
        n = n/10;
    }
    
    if (inicial == reves) {
        return true;
    }
    else {
        return false;
    }
}

void transformacion(int tmp){
  int dia , hora , minuto , segundo , resto1 , resto2;

  if(tmp < 86400){
      dia = 0;
      hora = tmp/3600;
      resto2 = (tmp-hora*3600);
      minuto = resto2/60;
      segundo = (resto2-minuto*60);
    }

  if(tmp == 86400){
    dia = tmp/86400;
    hora = 0;
    minuto = 0;
    segundo = 0;
  }

  if(tmp > 86400){
    dia = tmp/(3600*24);
    resto1 = tmp-(dia*86400);
    hora = resto1/3600;
    resto2 = resto1-(hora*3600);
    minuto = resto2/60;
    segundo = resto2-minuto*60;
  }
}

int main() {
    int tiempo;
    while(tiempo < 0){
        print_ln (" Las comillas no van bien: "" Seguimos escribiendo"); //Debería sacar las ""
    }
    
    //Debería sacar error sintactico
    print_ln (" Las comillas no van bien: " Seguimos escribiendo");

    transformacion(tiempo);

    return 0;
}
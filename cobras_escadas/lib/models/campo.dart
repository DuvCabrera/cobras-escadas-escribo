class Campo {
  int _numeroPosicao = 0;


  int get numeroPosicao => _numeroPosicao;
  bool _ocupadoP1 = false;
  bool _ocupadoP2 = false;

  bool get ocupadoP2 => _ocupadoP2;
  bool _cobra = false;
  bool _escada = false;

  bool get cobra => _cobra;
  bool get ocupadoP1 => _ocupadoP1;
  bool get escada => _escada;

  void novaPosicao(numero){
    _numeroPosicao = numero;
  }
  void ocuparP1(){
      _ocupadoP1 = true;
  } void ocuparP2(){
      _ocupadoP2 = true;
  } void desocuparP1(){
      _ocupadoP1 = false;
  } void desocuparP2(){
      _ocupadoP2 = false;
  }

  void reiniciar(){
    _cobra = false;
    _escada = false;
    _ocupadoP1 = false;
    _ocupadoP2 = false;
  }

  void temCobra(){
    _cobra = true;
  }

  void temEscada(){
    _escada = true;
  }


}
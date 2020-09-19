import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:google_fonts/google_fonts.dart';

class Aquadoro extends StatefulWidget {
  Aquadoro({
    this.actividad,
    this.tConcentracion,
    this.tDescanso,
  });

  final String actividad;
  final int tConcentracion;
  final int tDescanso;

  @override
  _AquadoroState createState() => _AquadoroState();
}

class _AquadoroState extends State<Aquadoro> {
  String tipoActividad = "Focus";
  String tiempoPantalla;
  int contador = 0;
  bool kindActivity = false;
  //variablespara la funcionalidad de Aquadoro
  int startState = 1;
  int tConcetracionSeg = 0;
  int tDescansoSeg = 0;
  bool revisarTiempoCon = false;
  bool revisarTiempoDes = false;
  bool botonDeshabilitado = false;
  bool resetDeshabilitado = false;
  String animacionActual = 'Reset';

  @override
  void initState() {
    super.initState();
    tiempoPantalla = '${widget.tConcentracion.toString()}:00';
    resetDeshabilitado = true;
  }

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      /*appBar: AppBar(
        centerTitle: true,
        title: Text('Aquadoro'),
        backgroundColor: Colors.cyan[400],
      ),*/
      body: Stack(
        children: [
          fondoPomodoro(),
          SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  _nuestroAppBar(context),
                  SizedBox(
                    height: 40,
                  ),
                  _contadorAcuadoro(),
                  SizedBox(
                    height: 20,
                  ),
                  _aquadoroStack(ancho, context),
                  Expanded(child: Container()),
                  _botones(),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fondoPomodoro() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Colors.lightBlue[300],
            Colors.lightBlue[700],
          ],
        ),
      ),
    );
  }

  Widget _nuestroAppBar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 50,
          child: FlatButton(
            padding: EdgeInsets.only(
              right: 10,
              top: 10,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Colors.cyan[100],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              widget.actividad,
              style: GoogleFonts.muktaVaani(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.cyan[50],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _contadorAcuadoro() {
    switch (contador) {
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;

      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;

      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;

      case 4:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;

      case 5:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;
      default:
        return Container(
          height: 45,
        );
    }
  }

  Widget _aquadoroStack(double ancho, BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 400,
          height: 400,
          child: FlareActor(
            'assets/Aquadoro.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: animacionActual,
          ),
        ),
        /*Container(
          width: 350,
          height: 350,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage('assets/Acuadoro.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),*/
        Positioned(
          top: 160,
          left: 115,
          child: Container(
            height: 100,
            width: 170,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    tipoActividad,
                    style: GoogleFonts.muktaVaani(
                      fontSize: 30,
                      color: Colors.blueGrey[50],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    tiempoPantalla,
                    style: GoogleFonts.muktaVaani(
                      fontSize: 30,
                      color: Colors.blueGrey[50],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _botones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AbsorbPointer(
          absorbing: resetDeshabilitado,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.cyan[200],
            child: Row(children: <Widget>[
              Text(
                'Reset ',
                style: GoogleFonts.muktaVaani(
                  fontSize: 25,
                  color: Colors.teal[900],
                ),
              ),
              Icon(
                Icons.rotate_left,
                size: 25,
                color: Colors.teal[900],
              ),
            ]),
            onPressed: () {
              animacionActual = 'Reset';
              if (tConcetracionSeg > 1) {
                revisarTiempoCon = true;
                startState = 1;
                print('Le diste en resetear focus');
              } else if (tDescansoSeg > 1) {
                revisarTiempoDes = true;
                startState = 1;
                kindActivity = false;
                tipoActividad = 'focus';
                tiempoPantalla = '${widget.tConcentracion.toString()}:00';
                print('Le diste en reset de relax y te regresa a focus');
              }
            },
          ),
        ),
        AbsorbPointer(
          absorbing: botonDeshabilitado,
          child: OutlineButton(
            borderSide: BorderSide(
              width: 3,
              color: Colors.blue[900],
              style: BorderStyle.solid,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  tipoActividad,
                  style: GoogleFonts.muktaVaani(
                    fontSize: 25,
                    color: Colors.indigo[800],
                  ),
                ),
                Icon(
                  (kindActivity) ? Icons.adjust : Icons.album,
                  size: 25,
                  color: Colors.blue[900],
                ),
              ],
            ),
            onPressed: () {
              switch (startState) {
                case 1:
                  //Tiempo de Focus
                  {
                    setState(
                      () {
                        botonDeshabilitado = true;
                        resetDeshabilitado = false;
                        animacionActual = 'LoopFocus';
                      },
                    );
                    tConcetracionSeg = (widget.tConcentracion * 60);
                    Timer.periodic(
                      Duration(seconds: 1),
                      (t) {
                        setState(
                          () {
                            if (tConcetracionSeg < 1 ||
                                revisarTiempoCon == true) {
                              t.cancel();
                              revisarTiempoCon = false;
                              tiempoPantalla =
                                  '${widget.tConcentracion.toString()}:00';
                              botonDeshabilitado = false;
                              resetDeshabilitado = true;
                              if (tConcetracionSeg < 1) {
                                startState = 2;
                                tipoActividad = "Relax";
                                kindActivity = true;
                                tiempoPantalla =
                                    '${widget.tDescanso.toString()}:00';
                                if (contador == 4) {
                                  _mostrarAlerta(context);
                                  contador = 5;
                                  tiempoPantalla = '${30}:00';
                                } else {
                                  tiempoPantalla = '${widget.tDescanso}:00';
                                }
                              }
                            } else if (tConcetracionSeg < 60) {
                              tiempoPantalla = '$tConcetracionSeg';
                              tConcetracionSeg--;
                            } else {
                              int m = tConcetracionSeg ~/ 60;
                              int s = tConcetracionSeg - (60 * m);
                              if (s < 10) {
                                tiempoPantalla = '$m:0$s';
                              } else {
                                tiempoPantalla = '$m:$s';
                              }
                              tConcetracionSeg--;
                            }
                            if (tConcetracionSeg < 11) {
                              animacionActual = 'FinFocus';
                            }
                          },
                        );
                      },
                    );
                  }
                  break;
                case 2:
                  //Tiempo de Relax
                  {
                    setState(
                      () {
                        botonDeshabilitado = true;
                        resetDeshabilitado = false;
                        animacionActual = 'LoopRelax';
                      },
                    );
                    tDescansoSeg = (widget.tDescanso * 60);
                    Timer.periodic(
                      Duration(seconds: 1),
                      (t) {
                        setState(
                          () {
                            if (tDescansoSeg < 1 || revisarTiempoDes == true) {
                              t.cancel();
                              revisarTiempoDes = false;
                              tiempoPantalla =
                                  '${widget.tDescanso.toString()}:00';
                              botonDeshabilitado = false;
                              resetDeshabilitado = true;
                              if (tDescansoSeg < 1) {
                                startState = 1;
                                tipoActividad = "Focus";
                                kindActivity = false;
                                tiempoPantalla =
                                    '${widget.tConcentracion.toString()}:00';
                                if (contador < 4) {
                                  contador++;
                                }
                              }
                            } else if (tDescansoSeg < 60) {
                              tiempoPantalla = '$tDescansoSeg';
                              tDescansoSeg--;
                            } else {
                              int m = tDescansoSeg ~/ 60;
                              int s = tDescansoSeg - (60 * m);
                              if (s < 10) {
                                tiempoPantalla = '$m:0$s';
                              } else {
                                tiempoPantalla = '$m:$s';
                              }
                              tDescansoSeg--;
                            }
                            if (tDescansoSeg < 11) {
                              animacionActual = 'FinRelax';
                            }
                          },
                        );
                      },
                    );
                  }
                  break;
                case 3:
                  {
                    setState(() {
                      botonDeshabilitado = true;
                      resetDeshabilitado = false;
                      animacionActual = "LoopRelax";
                    });
                    tDescansoSeg = (30 * 60);
                    Timer.periodic(
                      Duration(seconds: 1),
                      (t) {
                        setState(
                          () {
                            if (tDescansoSeg < 1 || revisarTiempoDes == true) {
                              t.cancel();
                              revisarTiempoDes = false;
                              tiempoPantalla =
                                  '${widget.tDescanso.toString()}:00';
                              botonDeshabilitado = false;
                              resetDeshabilitado = true;
                              if (tConcetracionSeg < 1) {
                                startState = 1;
                                tipoActividad = "Focus";
                                kindActivity = false;
                                tiempoPantalla =
                                    '${widget.tConcentracion.toString()}:00';
                                contador = 0;
                              }
                            } else if (tDescansoSeg < 60) {
                              tiempoPantalla = '$tDescansoSeg';
                              tDescansoSeg--;
                            } else {
                              int m = tDescansoSeg ~/ 60;
                              int s = tDescansoSeg - (60 * m);
                              if (s < 10) {
                                tiempoPantalla = '$m:0$s';
                              } else {
                                tiempoPantalla = '$m:$s';
                              }
                              tDescansoSeg--;
                            }
                            if (tDescansoSeg < 11) {
                              animacionActual = "FinRelax";
                            }
                          },
                        );
                      },
                    );
                  }
                  break;
                default:
              }
            },
          ),
        ),
      ],
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.teal[200],
          elevation: 25,
          title: Text(
            '\t\tFelicidades:',
            style: GoogleFonts.muktaVaani(
              fontSize: 30,
              color: Colors.blue[900],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Haz realizado 5 pomodoros segidos',
                style: GoogleFonts.muktaVaani(
                  fontSize: 20,
                  color: Colors.indigo[900],
                ),
              ),
              Text(
                'Te recomendamos dividir esta meta en una mas pequeña para disminuir la carga',
                style: GoogleFonts.muktaVaani(
                  fontSize: 20,
                  color: Colors.indigo[900],
                ),
              ),
              Text(
                'Nos tomamos un descanso de 30 minuto',
                style: GoogleFonts.muktaVaani(
                  fontSize: 20,
                  color: Colors.indigo[900],
                ),
              ),
              Image.asset(
                'assets/AlertImage.png',
                fit: BoxFit.cover,
                height: 170,
              ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                'Subdividir',
                style: GoogleFonts.muktaVaani(
                  fontSize: 24,
                  color: Colors.lightBlue[800],
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                setState(
                  () {
                    startState = 3;
                    print('Se mando al startState 3');
                  },
                );
              },
              child: Text(
                'Descansar',
                style: GoogleFonts.muktaVaani(
                  fontSize: 24,
                  color: Colors.lightBlue[800],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

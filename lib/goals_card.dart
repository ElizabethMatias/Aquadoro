import 'package:aquadoro/aquadoro.dart';
import 'package:flutter/material.dart';

class GoalsCard extends StatefulWidget {
  GoalsCard({
    this.animationController,
  });
  @override
  _GoalsCardState createState() => _GoalsCardState();
  String actividad;
  int tConcentracion;
  int tDescanso;

  final AnimationController animationController;
}

class _GoalsCardState extends State<GoalsCard> {
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.linear,
      ),
      axisAlignment: 0.0,
      child: Center(
        child: Container(
          height: 75,
          margin: EdgeInsets.all(10),
          //width: anchoPantalla * 0.9,
          decoration: BoxDecoration(
            color: Color.fromRGBO(223, 255, 255, 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 13),
                child: _actividadInput(),
                width: anchoPantalla * 0.45,
              ),
              Spacer(),
              Container(
                child: _consentracionInput(),
                width: anchoPantalla * 0.15,
              ),
              Spacer(),
              Container(
                child: _descansoInput(),
                width: anchoPantalla * 0.15,
              ),
              Spacer(),
              Container(
                width: anchoPantalla * 0.13,
                //margin: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10, right: 10),
                child: FlatButton(
                  onPressed: () {
                    print('Navegando');
                    if ((widget.actividad != null) &&
                        (widget.tConcentracion != null) &&
                        (widget.tDescanso != null)) {
                      //Elementos no nulos
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Aquadoro(
                            actividad: widget.actividad,
                            tConcentracion: widget.tConcentracion,
                            tDescanso: widget.tDescanso,
                          ),
                        ),
                      );
                    } else {} //sin accion
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: (MediaQuery.of(context).size.width < 600)
                        ? anchoPantalla * 0.1
                        : 40,
                    color: Colors.cyan[900],
                  ),
                ), //
              ),
            ],
          ),
        ),
      ),
    );
  } //build

  String initialActivity() {
    if (widget.actividad == null) {
      return " ";
    } else {
      return "${widget.actividad.toString()}";
    }
  }

  String initialConcentracion() {
    if (widget.tConcentracion == null) {
      return " ";
    } else {
      return "${widget.tConcentracion.toString()}";
    }
  }

  String initialDescanso() {
    if (widget.tDescanso == null) {
      return " ";
    } else {
      return "${widget.tDescanso.toString()}";
    }
  }

  Widget _actividadInput() {
    return TextFormField(
      initialValue: initialActivity(),
      decoration: InputDecoration(
        labelText: 'Actividad',
        labelStyle: TextStyle(fontSize: 13),
      ),
      onChanged: (activity) {
        widget.actividad = activity;
        print("La actividad es ${widget.actividad}");
      },
    );
  }

  Widget _consentracionInput() {
    return TextFormField(
      initialValue: initialConcentracion(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Focus',
        labelStyle: TextStyle(fontSize: 13),
      ),
      onChanged: (tiempoConcentracion) {
        widget.tConcentracion = (double.parse(tiempoConcentracion)).toInt();
        print("Tiempo de Consentracion ${widget.tConcentracion}");
      },
    );
  }

  Widget _descansoInput() {
    return TextFormField(
      initialValue: initialDescanso(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Relax',
        labelStyle: TextStyle(fontSize: 13),
      ),
      onChanged: (tiempoDescanso) {
        widget.tDescanso = (double.parse(tiempoDescanso)).toInt();
        print("Tiempo de Descanso ${widget.tDescanso}");
      },
    );
  }
}

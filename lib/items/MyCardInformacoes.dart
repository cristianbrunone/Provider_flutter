import 'package:flutter/material.dart';

class MyCardInfomacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Aquí puedes personalizar la apariencia de tu tarjeta
    return Container(
      color: Colors.red,
      height: 20,
      width: 20,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Imagen del jugador con borde
            Container(
              height: 100,
              width: 100,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey, // Color del borde
                  width: 0.0, // Ancho del borde
                ),
                image: DecorationImage(
                  image: AssetImage('assets/imgs/futebol.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8), // Espacio entre imagen y texto
            // Columna para la información del jugador
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Nombre del jugador
                Text(
                  'Cristian Brunone',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4), // Espacio entre nombre y posición
                // Posición del jugador
                Text(
                  'Posición: Delantero',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4), // Espacio entre posición y equipo
                // Equipo del jugador
                Text(
                  'Equipo: FC Ejemplo',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

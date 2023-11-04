import 'package:flutter/material.dart';

class AcercaDePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              '“Ningún hombre es tan tonto como para desear la guerra y no la paz; pues en la paz los hijos llevan a sus padres a la tumba y en la guerra son los padres quienes llevan a sus hijos a la tumba”. Heródoto de Halicarnaso, historiador griego',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Desarrollado por Angel Ortiz',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

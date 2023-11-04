import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:audioplayers/audioplayers.dart';

class DiaryEntryPage extends StatefulWidget {
  @override
  _DiaryEntryPageState createState() => _DiaryEntryPageState();
}

class _DiaryEntryPageState extends State<DiaryEntryPage> {
  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> capturePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // La foto se capturó con éxito, puedes guardarla o mostrarla en tu interfaz de usuario.
      // El archivo de la foto estará en pickedFile.path.
    } else {
      // El usuario canceló la captura de la foto.
    }
  }

  Future<void> recordAudio() async {
    int result = await audioPlayer.startRecord();
    if (result == 1) {
      // La grabación se inició con éxito.
    } else {
      // Hubo un error al iniciar la grabación.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Vivencia'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Título'),
            TextFormField(
              // Input para el título
            ),
            Text('Fecha'),
            // Widget para seleccionar la fecha
            Text('Descripción'),
            TextFormField(
              // Input para la descripción
            ),
            ElevatedButton(
              onPressed: () {
                capturePhoto();
              },
              child: Text('Tomar Foto'),
            ),
            ElevatedButton(
              onPressed: () {
                recordAudio();
              },
              child: Text('Grabar Audio'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar la lógica para guardar la vivencia
              },
              child: Text('Guardar Vivencia'),
            ),
          ],
        ),
      ),
    );
  }
}

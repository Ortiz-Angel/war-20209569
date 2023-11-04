import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';

class DiaryEntryPage extends StatefulWidget {
  @override
  _DiaryEntryPageState createState() => _DiaryEntryPageState();
}

class _DiaryEntryPageState extends State<DiaryEntryPage> {
  late FlutterSoundPlayer _player;
  late FlutterSoundRecorder _recorder;

  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _player = FlutterSoundPlayer();
    _recorder = FlutterSoundRecorder();
  }

  @override
  void dispose() {
    _player.closePlayer();
    _recorder.closeRecorder();
    super.dispose();
  }

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

  Future<void> startRecording() async {
    try {
      await _recorder.openRecorder();
      await _recorder.startRecorder(
        toFile: 'ruta_para_guardar_el_audio.mp4',
        codec: Codec.aacMP4,
      );
    } catch (e) {
      print('Error al iniciar la grabación: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      await _recorder.stopRecorder();
      await _recorder.closeRecorder();
    } catch (e) {
      print('Error al detener la grabación: $e');
    }
  }

  Future<void> playAudio() async {
    try {
      await _player.openPlayer();
      await _player.startPlayer(
        fromURI: 'ruta_para_guardar_el_audio.mp4',
        whenFinished: () {
          _player.closePlayer();
        },
      );
    } catch (e) {
      print('Error al reproducir audio: $e');
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
            TextFormField(
              controller: _dateController,
              readOnly: true,
              onTap: () {
                _selectDate(context);
              },
            ),
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
                startRecording();
              },
              child: Text('Iniciar Grabación'),
            ),
            ElevatedButton(
              onPressed: () {
                stopRecording();
              },
              child: Text('Detener Grabación'),
            ),
            ElevatedButton(
              onPressed: () {
                playAudio();
              },
              child: Text('Reproducir Audio'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/acerca_de'); // Navega a la pantalla "Acerca de"
              },
              child: Text('Acerca de'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = selectedDate.toLocal().toString();
      });
    }
  }
}

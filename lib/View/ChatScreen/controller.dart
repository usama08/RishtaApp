import 'package:audioplayers/audioplayers.dart';
import 'package:easyrishta/View/AdminSide/adminchat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final _isRecordPlaying = false.obs,
      isRecording = false.obs,
      isSending = false.obs,
      isUploading = false.obs;
  final _currentId = 999999.obs;
  final start = DateTime.now().obs;
  final end = DateTime.now().obs;
  String _total = "";
  String get total => _total;
  var completedPercentage = 0.0.obs;
  var currentDuration = 0.obs;
  var totalDuration = 0.obs;

  bool get isRecordPlaying => _isRecordPlaying.value;
  bool get isRecordingValue => isRecording.value;
  late final AudioPlayerService _audioPlayerService;
  int get currentId => _currentId.value;
  @override
  void onInit() {
    _audioPlayerService = AudioPlayerAdapter();

    _audioPlayerService.getAudioPlayer.onDurationChanged.listen((duration) {
      totalDuration.value = duration.inMicroseconds;
    });

    _audioPlayerService.getAudioPlayer.onPositionChanged.listen((duration) {
      currentDuration.value = duration.inMicroseconds;
      completedPercentage.value =
          currentDuration.value.toDouble() / totalDuration.value.toDouble();
    });

    _audioPlayerService.getAudioPlayer.onPlayerComplete.listen((event) async {
      await _audioPlayerService.getAudioPlayer.seek(Duration.zero);
      _isRecordPlaying.value = false;
    });

    super.onInit();
  }

  @override
  void onClose() {
    _audioPlayerService.dispose();
    // Add an error listener here

    super.onClose();
  }

  Future<void> changeProg() async {
    if (isRecordPlaying) {
      _audioPlayerService.getAudioPlayer.onDurationChanged.listen((duration) {
        totalDuration.value = duration.inMicroseconds;
      });

      _audioPlayerService.getAudioPlayer.onPositionChanged.listen((duration) {
        currentDuration.value = duration.inMicroseconds;
        completedPercentage.value =
            currentDuration.value.toDouble() / totalDuration.value.toDouble();
      });
    }
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> onPressedPlayButton(int id, var message) async {
    _currentId.value = id;
    if (isRecordPlaying) {
      await _pauseRecord();
    } else {
      _isRecordPlaying.value = true;
      // Print the URL before playing
      print('Audio URL: ${message}');
      try {
        await _audioPlayerService.play(message);
      } catch (e) {
        print('Audio Player Error: $e');
        // Handle the error as needed (e.g., show an error message to the user)
      }
    }
  }

  calcDuration() {
    var a = end.value.difference(start.value).inSeconds;
    format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
    _total = format(Duration(seconds: a));
  }

  Future<void> _pauseRecord() async {
    _isRecordPlaying.value = false;
    await _audioPlayerService.pause();
  }
}

abstract class AudioPlayerService {
  void dispose();
  Future<void> play(String url);
  Future<void> resume();
  Future<void> pause();
  Future<void> release();

  AudioPlayer get getAudioPlayer;
}

class AudioPlayerAdapter implements AudioPlayerService {
  late AudioPlayer _audioPlayer;

  @override
  AudioPlayer get getAudioPlayer => _audioPlayer;

  AudioPlayerAdapter() {
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() async {
    await _audioPlayer.dispose();
  }

  @override
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  @override
  Future<void> play(String url) async {
    await _audioPlayer.play(UrlSource(url));
  }

  @override
  Future<void> release() async {
    await _audioPlayer.release();
  }

  @override
  Future<void> resume() async {
    await _audioPlayer.resume();
  }
}

class AudioDuration {
  static double calculate(Duration soundDuration) {
    if (soundDuration.inSeconds > 60) {
      return 70;
    } else if (soundDuration.inSeconds > 50) {
      return 65;
    } else if (soundDuration.inSeconds > 40) {
      return 60;
    } else if (soundDuration.inSeconds > 30) {
      return 55;
    } else if (soundDuration.inSeconds > 20) {
      return 50;
    } else if (soundDuration.inSeconds > 10) {
      return 45;
    } else {
      return 40;
    }
  }
}

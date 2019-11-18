import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class OminousShakeDetector extends ChangeNotifier {
  bool _isShakedHard = false;

  bool isShaked() => this._isShakedHard;
  AudioCache _audioCache = AudioCache();

  OminousShakeDetector(this._isShakedHard) {
    _detect();
  }

  _detect() {
    ShakeDetector.autoStart(
        // TODO: set to beeping sound duration
        shakeCountResetTime: 1000,
        onPhoneShake: () {
          // Do stuff on phone shake
          _isShakedHard = true;
          notifyListeners();
          if (_isShakedHard) {
            print('Shaked');
            // _isShakedHard = false;
            playLocal();
            waitBeepsToFinish();
          }
        });
  }

  playLocal() async {
    await _audioCache.play('sound/the_ominous_beep.wav', isNotification: true);
  }

  waitBeepsToFinish() async {
    await Future.delayed(Duration(seconds: 5)).whenComplete(() {
      _isShakedHard = false;
      notifyListeners();
    });
  }
}

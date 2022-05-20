import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  AudioPlayerHandler() {
    // Broadcast that we're loading, and what controls are available.
    // playbackState.add(playbackState.value.copyWith(
    //   controls: [MediaControl.play],
    //   processingState: AudioProcessingState.loading,
    // ));
    // Connect to the URL
    // _player.setUrl("http://melody4arab.com/music/lebnan/maher_zain/forgive_me/Assalamu_Alayka_melody4arab.com.mp3").then((_) {
    //   // Broadcast that we've finished loading
    //   playbackState.add(playbackState.value.copyWith(
    //     processingState: AudioProcessingState.ready,
    //   ));
    // });
  }

  @override
  Future<void> prepareFromUri(Uri uri, [Map<String, dynamic>? extras]) async {
    print("Preparing: ${uri.toString()}");
    playbackState.add(playbackState.value.copyWith(
      processingState: AudioProcessingState.loading,
    ));
    _player.setUrl(uri.toString()).then((_) {
      // Broadcast that we've finished loading
      playbackState.add(playbackState.value.copyWith(
        processingState: AudioProcessingState.ready,
      ));
    });
    await play();
  }

  @override
  Future<void> play() async {
    print("Playing...");
    playbackState.add(playbackState.value.copyWith(
      playing: true,
      controls: [MediaControl.pause],
    ));
    await _player.play();
  }

  @override
  Future<void> pause() async {
    print("pausing...");
    playbackState.add(playbackState.value.copyWith(
      playing: false,
      controls: [MediaControl.play],
    ));
    return _player.pause();
  }

  @override
  Future<void> stop() async {
    // Release any audio decoders back to the system
    await _player.stop();

    // Set the audio_service state to `idle` to deactivate the notification.
    playbackState.add(playbackState.value.copyWith(
      processingState: AudioProcessingState.idle,
    ));
  }
}
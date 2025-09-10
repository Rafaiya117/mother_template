// import 'package:flutter/material.dart';
// import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
// import 'package:just_audio/just_audio.dart';

// enum RecordingState { idle, recording, recorded, playing }

// class AudioRecorderPlayer extends StatefulWidget {
//   const AudioRecorderPlayer({super.key});

//   @override
//   State<AudioRecorderPlayer> createState() => _AudioRecorderPlayerState();
// }

// class _AudioRecorderPlayerState extends State<AudioRecorderPlayer> {
//   RecordingState recordingState = RecordingState.idle;
//   final AudioPlayer audioPlayer = AudioPlayer();

//   final recorderController = RecorderController();
//   final playerController = PlayerController();

//   Duration audioDuration = Duration.zero;
//   Duration currentPosition = Duration.zero;

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     recorderController.dispose();
//     playerController.dispose();
//     super.dispose();
//   }

//   void startRecording() {
//     setState(() => recordingState = RecordingState.recording);
//     recorderController.start();
//   }

//   void stopRecording() {
//     setState(() => recordingState = RecordingState.recorded);
//     recorderController.stop();
//     // Simulate recorded audio length
//     audioDuration = Duration(minutes: 15, seconds: 20);
//   }

//   void playAudio() {
//     setState(() => recordingState = RecordingState.playing);
//     playerController.start();
//     // Simulate playback for demo
//     Future.delayed(audioDuration, () {
//       setState(() {
//         recordingState = RecordingState.recorded;
//         currentPosition = Duration.zero;
//       });
//     });
//   }

//   void pauseAudio() {
//     setState(() => recordingState = RecordingState.recorded);
//     playerController.pause();
//   }

//   void resetAudio() {
//     setState(() {
//       recordingState = RecordingState.idle;
//       currentPosition = Duration.zero;
//     });
//     recorderController.reset();
//     playerController.stop();
//   }

//   void deleteAudio() {
//     setState(() {
//       recordingState = RecordingState.idle;
//       currentPosition = Duration.zero;
//     });
//     recorderController.reset();
//     playerController.stop();
//   }

//   Widget buildControlButtons() {
//     final isRecording = recordingState == RecordingState.recording;
//     final isRecorded = recordingState == RecordingState.recorded;
//     final isPlaying = recordingState == RecordingState.playing;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         IconButton(
//           icon: const Icon(Icons.refresh, color: Colors.white),
//           onPressed: resetAudio,
//         ),
//         IconButton(
//           icon: Icon(
//             isRecording
//                 ? Icons.stop_circle
//                 : (isRecorded || isPlaying)
//                     ? (isPlaying ? Icons.pause_circle : Icons.play_circle)
//                     : Icons.fiber_manual_record,
//             color: Colors.orange,
//             size: 36,
//           ),
//           onPressed: () {
//             if (isRecording) {
//               stopRecording();
//             } else if (isRecorded) {
//               playAudio();
//             } else if (isPlaying) {
//               pauseAudio();
//             } else {
//               startRecording();
//             }
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.delete, color: Colors.white),
//           onPressed: deleteAudio,
//         ),
//       ],
//     );
//   }

//   Widget buildWaveform() {
//     switch (recordingState) {
//       case RecordingState.recording:
//         return AudioWaveforms(
//           size: Size(double.infinity, 200),
//           recorderController: recorderController,
//           waveStyle: const WaveStyle(
//             waveColor: Colors.blue,
//             showMiddleLine: false,
//             spacing: 6.0,
//             extendWaveform: true,
//           ),
//           enableGesture: false,
//         );

//       case RecordingState.playing:
//       case RecordingState.recorded:
//         return AudioFileWaveforms(
//           size: Size(double.infinity, 200),
//           playerController: playerController,
//           playerWaveStyle: const PlayerWaveStyle(
//             fixedWaveColor: Colors.grey,
//             liveWaveColor: Colors.blue,
//             spacing: 6.0,
//             showSeekLine: true,
//           ),
//         );

//       case RecordingState.idle:
//       default:
//         return Container(
//           height: 200,
//           color: const Color(0xFF2E2E4D),
//         );
//     }
//   }

//   String formatDuration(Duration d) {
//     final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return "$minutes:$seconds";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF2E2E4D),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: ElevatedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.mic, size: 16),
//               label: const Text("Audio"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.black,
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 textStyle: const TextStyle(fontSize: 12),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Expanded(child: buildWaveform()),
//           const SizedBox(height: 8),
//           Text(
//             recordingState == RecordingState.idle
//                 ? "00:00"
//                 : formatDuration(
//                     recordingState == RecordingState.recording
//                         ? currentPosition
//                         : audioDuration,
//                   ),
//             style: const TextStyle(color: Colors.white),
//           ),
//           const SizedBox(height: 12),
//           buildControlButtons(),
//         ],
//       ),
//     );
//   }
// }
// // just_audio: ^0.9.35
// //   flutter_audio_waveforms: ^1.2.0

// // AudioRecorderPlayer(),
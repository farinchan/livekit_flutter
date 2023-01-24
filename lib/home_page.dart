import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final roomOptions = RoomOptions(
    adaptiveStream: true,
    dynacast: true,

    // ... your room options
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  final room = await LiveKitClient.connect(
                      "https://gariskode.livekit.cloud",
                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzQ2NjMwMDQsImlzcyI6IkFQSW1rZ3R5YmZUMlNweSIsIm5iZiI6MTY3NDU3NjYwNCwic3ViIjoidXNlci1jZTc5ZGRlYiIsInZpZGVvIjp7InJvb20iOiJyb29tLTY5ZDNhM2NmIiwicm9vbUpvaW4iOnRydWV9fQ.nhnDhNvKPOwU6AHinadrzoFkGx0tDFXO8drtqL1rSdI",
                      roomOptions: roomOptions);
                  try {
                    // video will fail when running in ios simulator
                    await room.localParticipant?.setCameraEnabled(true);
                  } catch (error) {
                    print('Could not publish video, error: $error');
                  }

                  await room.localParticipant?.setMicrophoneEnabled(true);
                },
                child: Text("Connect")),
          )
        ],
      ),
    );
  }
}

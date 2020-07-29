import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/jitsi_meeting_listener.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:webeoapp/ui/views/home/home_viewmodel.dart';
import 'package:webeoapp/ui/widgets/buttons/action_button_custom.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  void _onConferenceWillJoin({message}) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined({message}) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated({message}) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Webeo Home'),
          backgroundColor: Colors.black,
        ),
        body: Container(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: RoomForm()),
      ),
    );
  }
}

class RoomForm extends HookViewModelWidget<HomeViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel model) {
    var roomNameController = useTextEditingController(text: model.roomName);
    var subjectController = useTextEditingController(text: model.subject);
    var userDisplayNameController = useTextEditingController(text: model.userDisplayName);
    var userEmailController = useTextEditingController(text: model.userEmail);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 24.0),
          TextField(
            controller: roomNameController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Room"),
            onChanged: model.updateRoomName,
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: subjectController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Subject"),
            onChanged: model.updateSubject,
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: userDisplayNameController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Display Name"),
            onChanged: model.updateUserDisplayName,
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: userEmailController,
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Email"),
            onChanged: model.updateUserEmail,
          ),
          const SizedBox(height: 16.0),
          CheckboxListTile(
            title: Text("Audio Only"),
            value: model.isAudioOnly,
            activeColor: Colors.blue,
            onChanged: model.onAudioOnlyChanged,
          ),
          const SizedBox(height: 16.0),
          CheckboxListTile(
            title: Text("Audio Muted"),
            value: model.isAudioMuted,
            activeColor: Colors.blue,
            onChanged: model.onAudioMutedChanged,
          ),
          const SizedBox(height: 16.0),
          CheckboxListTile(
            title: Text("Video Muted"),
            value: model.isVideoMuted,
            activeColor: Colors.blue,
            onChanged: model.onVideoMutedChanged,
          ),
          Divider(
            height: 48.0,
            thickness: 2.0,
          ),
          ActionButtonCustom(
            action: () => model.joinMeeting(),
            label: 'Join Meeting',
          ),
          const SizedBox(height: 48.0),
        ],
      ),
    );
  }
}

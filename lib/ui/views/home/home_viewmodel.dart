import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/jitsi_meeting_listener.dart';
import 'package:jitsi_meet/room_name_constraint.dart';
import 'package:jitsi_meet/room_name_constraint_type.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _server = 'https://webeo.site';
  String _roomName = 'Demo';
  String _subject = 'Demo Meeting';
  String _userDisplayName = 'Test User';
  String _userEmail = 'test@gmail.com';
  bool _isAudioOnly = true;
  bool _isAudioMuted = true;
  bool _isVideoMuted = true;
  final iosAppBarRGBAColor = "#0080FF80";

  // * Getters
  String get roomName => _roomName;
  String get subject => _subject;
  String get userDisplayName => _userDisplayName;
  String get userEmail => _userEmail;
  bool get isAudioOnly => _isAudioOnly;
  bool get isAudioMuted => _isAudioMuted;
  bool get isVideoMuted => _isVideoMuted;

  // * Functions

  onAudioOnlyChanged(bool value) {
    _isAudioOnly = value;
    notifyListeners();
  }

  onAudioMutedChanged(bool value) {
    _isAudioMuted = value;
    notifyListeners();
  }

  onVideoMutedChanged(bool value) {
    _isVideoMuted = value;
    notifyListeners();
  }

  void updateUserDisplayName(String text) {
    _userDisplayName = text;
  }

  void updateUserEmail(String text) {
    _userEmail = text;
  }

  void updateRoomName(String text) {
    _roomName = text;
  }

  void updateSubject(String text) {
    _subject = text;
  }

  joinMeeting() async {
    String serverUrl = _server?.trim()?.isEmpty ?? "" ? null : _server;

    try {
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };

      if (Platform.isAndroid) {
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }

      var options = JitsiMeetingOptions()
        ..room = _roomName
        ..serverURL = serverUrl
        ..subject = _subject
        ..userDisplayName = _userDisplayName
        ..userEmail = _userEmail
        ..iosAppBarRGBAColor = iosAppBarRGBAColor
        ..audioOnly = _isAudioOnly
        ..audioMuted = _isAudioMuted
        ..videoMuted = _isVideoMuted
        ..featureFlags.addAll(featureFlags);

      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeet.joinMeeting(
        options,
        listener: JitsiMeetingListener(onConferenceWillJoin: ({message}) {
          debugPrint("${options.room} will join with message: $message");
        }, onConferenceJoined: ({message}) {
          debugPrint("${options.room} joined with message: $message");
        }, onConferenceTerminated: ({message}) {
          debugPrint("${options.room} terminated with message: $message");
        }),
        // by default, plugin default constraints are used
        //roomNameConstraints: new Map(), // to disable all constraints
        //roomNameConstraints: customContraints, // to use your own constraint(s)
      );
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  static final Map<RoomNameConstraintType, RoomNameConstraint> customContraints = {
    RoomNameConstraintType.MAX_LENGTH: new RoomNameConstraint((value) {
      return value.trim().length <= 50;
    }, "Maximum room name length should be 30."),
    RoomNameConstraintType.FORBIDDEN_CHARS: new RoomNameConstraint((value) {
      return RegExp(r"[$€£]+", caseSensitive: false, multiLine: false).hasMatch(value) == false;
    }, "Currencies characters aren't allowed in room names."),
  };
}

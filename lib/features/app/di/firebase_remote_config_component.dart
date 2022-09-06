// ignore_for_file: member-ordering-extended

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:surf_injector/surf_injector.dart';

/// [Component] с зависимостями, которые будут жить на протяжении всего цикла приложения
class FirebaseRemoteConfigComponent extends Component {
  final FirebaseRemoteConfig config;

  FirebaseRemoteConfigComponent(this.config): super();
}

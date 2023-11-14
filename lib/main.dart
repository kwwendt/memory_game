
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:memory_match_game/memory_match_game.dart';
import 'package:memory_match_game/models/ModelProvider.dart';
import 'amplifyconfiguration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();

  runApp(
    const ProviderScope(
      child: MemoryMatchGame(),
    ),
  );
}

Future<void> _configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    AmplifyAPI(modelProvider: ModelProvider.instance),
  ]);
  await Amplify.configure(amplifyconfig);
}



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videorender/features/videoloader/presentation/pages/home_page.dart';
import 'package:videorender/injection.dart' as di;

import 'features/videoloader/presentation/bloc/videoloader_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VideoloaderBloc>(
          create: (_) => VideoloaderBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        home: const HomePage(),
      ),
    );
  }
}

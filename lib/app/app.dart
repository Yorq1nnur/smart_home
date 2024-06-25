import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/bloc/country/country_bloc.dart';
import 'package:smart_home/bloc/devices/devices_bloc.dart';
import 'package:smart_home/bloc/map/map_bloc.dart';
import 'package:smart_home/bloc/map/map_event.dart';
import 'package:smart_home/bloc/my_home/my_home_bloc.dart';
import 'package:smart_home/bloc/rooms/rooms_bloc.dart';
import 'package:smart_home/bloc/tab_box/tab_box_bloc.dart';
import 'package:smart_home/data/local/local_db.dart';
import 'package:smart_home/data/repositories/country_repository.dart';
import '../screens/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => CountryRepository(),
        ),
        RepositoryProvider(
          create: (_) => LocalDb(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CountryBloc(
              context.read<CountryRepository>(),
            ),
          ),
          BlocProvider(
            create: (_) => MyHomeBloc(),
          ),
          BlocProvider(
            create: (_) => DevicesBloc(
              context.read<LocalDb>(),
            ),
          ),
          BlocProvider(
            create: (_) => RoomsBloc(),
          ),
          BlocProvider(
            create: (_) => TabBoxBloc(),
          ),
          BlocProvider(
            create: (_) => MapsBloc()
              ..add(
                RequestPermission(),
              )
              ..add(
                GetUserLocationEvent(),
              ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.transparent,
              ),
            ),
          ),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
          // home: const CountriesScreen(),
        ),
      ),
    );
  }
}

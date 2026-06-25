import 'package:dawaya/data/repositories/auth_repo.dart';
import 'package:dawaya/data/service/api_service/pharmacy/pharmacy_repo.dart';
import 'package:dawaya/firebase_options.dart';
import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:dawaya/presentation/cubits/cart/cart_cubit.dart';
import 'package:dawaya/presentation/cubits/home/home_cubit.dart';
import 'package:dawaya/presentation/cubits/pharmacy/pharmacy_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_gate.dart';
import 'package:dawaya/presentation/screens/cart/cart_screen.dart';
import 'package:dawaya/presentation/screens/cart/checkout_screen.dart';
import 'package:dawaya/presentation/screens/pharmacy_screen/pharmacy_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthCubit(AuthRepository()),

        ),
      BlocProvider(
          create: (_) => PharmacyCubit(PharmacyRepo())..getPharmacies()),

        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => HomeCubit()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // AuthGate()
      home: const AuthGate(),
    );
  }
}

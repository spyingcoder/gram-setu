import 'package:flutter/material.dart';
import 'package:gram_setu/shared/routes/app_router.dart';

class GramSetuApp extends StatelessWidget {
  const GramSetuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Gram Setu',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

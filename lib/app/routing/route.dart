import 'package:calculator_camera/app/page/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
);

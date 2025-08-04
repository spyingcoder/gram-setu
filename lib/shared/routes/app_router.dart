import 'package:flutter/material.dart';
import 'package:gram_setu/features/complaints/view/add_complaint_screen.dart';
import 'package:gram_setu/features/complaints/view/complaint_detail_screen.dart';
import 'package:gram_setu/features/complaints/view/complaints_listing_screen.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String complaintList = '/complaints';
  static const String complaintAdd = '/complaints/add';
  static const String complaintDetail = '/complaints/detail';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:

      case complaintList:
        return MaterialPageRoute(
            builder: (_) => const ComplaintsListingScreen());

      case complaintAdd:
        return MaterialPageRoute(builder: (_) => const AddComplaintsScreen());

      case complaintDetail:
        final args = settings.arguments;
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => ComplaintDetailsScreen(complaintId: args),
          );
        }
        return _errorRoute('Missing complaint ID');

      default:
        return _errorRoute('Route not found');
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text(message)),
      ),
    );
  }
}

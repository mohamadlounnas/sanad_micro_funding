import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/projects/presentation/pages/projects_page.dart';
import '../../features/projects/presentation/pages/project_details_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/setup/presentation/pages/setup_page.dart';
import '../../features/investor/presentation/pages/investor_dashboard.dart';
import '../../features/project_owner/presentation/pages/owner_dashboard.dart';
import '../../shared/models/project_model.dart';

/// App router configuration using go_router
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/setup',
    routes: [
      // Setup route (New - First page)
      GoRoute(
        path: '/setup',
        name: 'setup',
        builder: (context, state) => const SetupPage(),
      ),
      
      // Home route
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      
      // Authentication routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      
      // Dashboard routes
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      
      // Investor routes
      GoRoute(
        path: '/investor',
        name: 'investor',
        builder: (context, state) => const InvestorDashboard(),
      ),
      
      // Project Owner routes
      GoRoute(
        path: '/owner',
        name: 'owner',
        builder: (context, state) => const OwnerDashboard(),
      ),
      
      // Projects routes
      GoRoute(
        path: '/projects',
        name: 'projects',
        builder: (context, state) => const ProjectsPage(),
      ),
      GoRoute(
        path: '/project-details',
        name: 'project-details',
        builder: (context, state) {
          final project = state.extra as Project;
          return ProjectDetailsPage(project: project);
        },
      ),
      
      // Investments routes (placeholders)
      GoRoute(
        path: '/investments',
        name: 'investments',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('الاستثمارات - قريباً'),
          ),
        ),
      ),
      
      // Profile routes (placeholders)
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('الملف الشخصي - قريباً'),
          ),
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('خطأ')),
      body: Center(
        child: Text('الصفحة غير موجودة: ${state.uri.path}'),
      ),
    ),
  );
} 
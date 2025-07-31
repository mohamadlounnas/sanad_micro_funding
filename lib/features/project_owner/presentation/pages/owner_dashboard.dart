import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../widgets/project_progress_card.dart';
import '../widgets/funding_summary.dart';

/// Project owner dashboard with crypto/IBM style
class OwnerDashboard extends StatefulWidget {
  const OwnerDashboard({super.key});

  @override
  State<OwnerDashboard> createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('مشاريعي'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              context.go('/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: AppSpacing.xl),
            _buildFundingSummary(),
            const SizedBox(height: AppSpacing.xl),
            _buildMyProjects(),
            const SizedBox(height: AppSpacing.xl),
            _buildQuickActions(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to create project
        },
        icon: const Icon(Icons.add),
        label: const Text('مشروع جديد'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحباً، فاطمة علي',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'صاحبة مشاريع',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Row(
            children: [
              Icon(
                Icons.trending_up,
                color: AppColors.success,
                size: 16,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                '3 مشاريع نشطة',
                style: TextStyle(
                  color: AppColors.success,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFundingSummary() {
    return const FundingSummary();
  }

  Widget _buildMyProjects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'مشاريعي',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: Navigate to all projects
              },
              child: const Text('عرض الكل'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),

        Column(
          children: [
            ProjectProgressCard(
              projectName: 'مطعم الشرق التقليدي',
              targetAmount: 500000,
              currentAmount: 350000,
              progress: 70.0,
              status: 'في التمويل',
              investors: 45,
              daysLeft: 15,
              onTap: () {
                // TODO: Navigate to project details
              },
            ),
            const SizedBox(height: AppSpacing.md),
            ProjectProgressCard(
              projectName: 'تطبيق توصيل الطعام',
              targetAmount: 800000,
              currentAmount: 680000,
              progress: 85.0,
              status: 'في التمويل',
              investors: 78,
              daysLeft: 8,
              onTap: () {
                // TODO: Navigate to project details
              },
            ),
            const SizedBox(height: AppSpacing.md),
            ProjectProgressCard(
              projectName: 'متجر إلكتروني للأزياء',
              targetAmount: 300000,
              currentAmount: 180000,
              progress: 60.0,
              status: 'في التمويل',
              investors: 32,
              daysLeft: 22,
              onTap: () {
                // TODO: Navigate to project details
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إجراءات سريعة',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                'إنشاء مشروع',
                Icons.add_business_outlined,
                AppColors.primary,
                () {
                  // TODO: Navigate to create project
                },
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _buildQuickActionCard(
                'التقارير',
                Icons.analytics_outlined,
                AppColors.info,
                () {
                  // TODO: Navigate to reports
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                'المستثمرين',
                Icons.people_outline,
                AppColors.success,
                () {
                  // TODO: Navigate to investors
                },
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _buildQuickActionCard(
                'الإعدادات',
                Icons.settings_outlined,
                AppColors.warning,
                () {
                  // TODO: Navigate to settings
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        
        switch (index) {
          case 1: // Projects
            context.go('/projects');
            break;
          case 2: // Analytics
            // TODO: Navigate to analytics
            break;
          case 3: // Profile
            context.go('/profile');
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'المشاريع',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'التحليلات',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'الملف الشخصي',
        ),
      ],
    );
  }
} 
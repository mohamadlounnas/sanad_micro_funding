import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../widgets/investment_type_card.dart';
import '../widgets/ad_banner.dart';
import '../widgets/featured_project_card.dart';

/// Home page for Sanad app with simplified YouTube Studio style
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedInvestmentType = 0;

  final List<Map<String, dynamic>> _investmentTypes = [
    {
      'title': 'مشاريع تقليدية',
      'description': 'مطاعم، محلات، خدمات',
      'icon': Icons.store,
      'color': AppColors.primary,
    },
    {
      'title': 'مشاريع تقنية',
      'description': 'تطبيقات، مواقع، برمجيات',
      'icon': Icons.phone_android,
      'color': AppColors.primary,
    },
    {
      'title': 'مشاريع تجارية',
      'description': 'متاجر إلكترونية، استيراد',
      'icon': Icons.shopping_bag,
      'color': AppColors.primary,
    },
    {
      'title': 'مشاريع صناعية',
      'description': 'تصنيع، إنتاج، تصدير',
      'icon': Icons.factory,
      'color': AppColors.info,
    },
  ];

  final List<Map<String, dynamic>> _featuredProjects = [
    {
      'title': 'مطعم الشرق التقليدي',
      'description': 'مطعم يقدم المأكولات الشرقية التقليدية',
      'progress': 70.0,
    },
    {
      'title': 'تطبيق توصيل الطعام',
      'description': 'تطبيق هاتف ذكي لتوصيل الطعام',
      'progress': 85.0,
    },
    {
      'title': 'متجر إلكتروني للأزياء',
      'description': 'متجر إلكتروني متخصص في الأزياء',
      'progress': 60.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('ساند'),
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
              context.go('/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeSection(),
            const SizedBox(height: AppSpacing.xl),
            _buildInvestmentTypesSection(),
            const SizedBox(height: AppSpacing.xl),
            _buildFeaturedProjectsSection(),
            const SizedBox(height: AppSpacing.xl),
            _buildAdSection(),
            const SizedBox(height: AppSpacing.xl),
            _buildQuickActionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withValues(alpha: 0.1),
              AppColors.primary.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance,
                color: AppColors.primary,
                size: 32,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرحباً بك في ساند',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'منصة الاستثمار الصغير الرائدة في الجزائر',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentTypesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أنواع الاستثمار',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'اختر نوع الاستثمار الذي يناسبك',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.2,
          ),
          itemCount: _investmentTypes.length,
          itemBuilder: (context, index) {
            final type = _investmentTypes[index];
            return InvestmentTypeCard(
              title: type['title'] as String,
              description: type['description'] as String,
              icon: type['icon'] as IconData,
              color: type['color'] as Color,
              isSelected: _selectedInvestmentType == index,
              onTap: () {
                setState(() {
                  _selectedInvestmentType = index;
                });
                // TODO: Navigate to filtered projects
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeaturedProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'المشاريع المميزة',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            Flexible(
              child: TextButton(
                onPressed: () {
                  context.go('/projects');
                },
                child: const Text('عرض الكل'),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),

        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _featuredProjects.length,
            itemBuilder: (context, index) {
              final project = _featuredProjects[index];
              return Padding(
                padding: const EdgeInsets.only(right: AppSpacing.md),
                child: SizedBox(
                  width: 280,
                  child: FeaturedProjectCard(
                    title: project['title'] as String,
                    description: project['description'] as String,
                    progress: project['progress'] as double,
                    onTap: () {
                      // TODO: Navigate to project details
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAdSection() {
    return const AdBanner(
      title: 'ابدأ استثمارك اليوم',
      subtitle: 'انضم إلى آلاف المستثمرين الناجحين',
      icon: Icons.trending_up,
    );
  }

  Widget _buildQuickActionsSection() {
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
                'تسجيل الدخول',
                Icons.login,
                AppColors.primary,
                () => context.go('/login'),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _buildQuickActionCard(
                'إنشاء حساب',
                Icons.person_add,
                AppColors.primary,
                () => context.go('/register'),
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
} 
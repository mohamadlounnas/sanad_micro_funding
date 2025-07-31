import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../shared/models/project_model.dart';
import '../widgets/project_card.dart';
import '../widgets/project_filter_sheet.dart';

/// Projects page for Sanad app
class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Project> _projects = [
    Project(
      id: '1',
      title: 'مطعم الشرق التقليدي',
      description: 'مطعم يقدم المأكولات الشرقية التقليدية في قلب المدينة',
      category: 'مطاعم',
      location: 'الجزائر العاصمة',
      targetAmount: 500000,
      currentAmount: 350000,
      minimumInvestment: 25000,
      expectedReturn: 18.5,
      duration: 12,
      status: ProjectStatus.funding,
      type: ProjectType.traditional,
      ownerId: 'owner1',
      ownerName: 'أحمد محمد',
      tags: ['مطاعم', 'تقليدي', 'مربح'],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    Project(
      id: '2',
      title: 'تطبيق توصيل الطعام',
      description: 'تطبيق هاتف ذكي لتوصيل الطعام من المطاعم المحلية',
      category: 'تقنية',
      location: 'وهران',
      targetAmount: 800000,
      currentAmount: 680000,
      minimumInvestment: 50000,
      expectedReturn: 25.0,
      duration: 18,
      status: ProjectStatus.funding,
      type: ProjectType.technology,
      ownerId: 'owner2',
      ownerName: 'فاطمة علي',
      tags: ['تقنية', 'تطبيق', 'توصيل'],
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    Project(
      id: '3',
      title: 'متجر إلكتروني للأزياء',
      description: 'متجر إلكتروني متخصص في الأزياء والملابس العصرية',
      category: 'تجارة إلكترونية',
      location: 'قسنطينة',
      targetAmount: 300000,
      currentAmount: 180000,
      minimumInvestment: 20000,
      expectedReturn: 15.0,
      duration: 10,
      status: ProjectStatus.funding,
      type: ProjectType.retail,
      ownerId: 'owner3',
      ownerName: 'محمد أحمد',
      tags: ['تجارة إلكترونية', 'أزياء', 'متجر'],
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
    Project(
      id: '4',
      title: 'مصنع الأثاث الخشبي',
      description: 'مصنع لإنتاج الأثاث الخشبي التقليدي والحديث',
      category: 'صناعة',
      location: 'سطيف',
      targetAmount: 1200000,
      currentAmount: 900000,
      minimumInvestment: 100000,
      expectedReturn: 22.0,
      duration: 24,
      status: ProjectStatus.funding,
      type: ProjectType.traditional,
      ownerId: 'owner4',
      ownerName: 'علي حسن',
      tags: ['صناعة', 'أثاث', 'خشبي'],
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
    ),
    Project(
      id: '5',
      title: 'مركز تعليمي للأطفال',
      description: 'مركز تعليمي متخصص في تعليم الأطفال المهارات الأساسية',
      category: 'تعليم',
      location: 'عنابة',
      targetAmount: 400000,
      currentAmount: 400000,
      minimumInvestment: 30000,
      expectedReturn: 12.0,
      duration: 8,
      status: ProjectStatus.completed,
      type: ProjectType.service,
      ownerId: 'owner5',
      ownerName: 'سارة أحمد',
      tags: ['تعليم', 'أطفال', 'مهارات'],
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
    ),
  ];

  ProjectStatus? _selectedStatus;
  String _selectedCategory = 'الكل';
  bool _isLoading = false;

  List<Project> get _filteredProjects {
    return _projects.where((project) {
      final matchesSearch = _searchController.text.isEmpty ||
          project.title.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          project.description.toLowerCase().contains(_searchController.text.toLowerCase());

      final matchesStatus = _selectedStatus == null || project.status == _selectedStatus;

      final matchesCategory = _selectedCategory == 'الكل' || project.category == _selectedCategory;

      return matchesSearch && matchesStatus && matchesCategory;
    }).toList();
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ProjectFilterSheet(
        selectedStatus: _selectedStatus,
        selectedCategory: _selectedCategory,
        onApply: (type, status, category) {
          setState(() {
            _selectedStatus = status;
            _selectedCategory = category;
          });
        },
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      _selectedStatus = null;
      _selectedCategory = 'الكل';
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('المشاريع'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and Filters
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'البحث في المشاريع...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                // Active Filters
                if (_selectedStatus != null || _selectedCategory != 'الكل')
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: AppSpacing.sm,
                          children: [
                            if (_selectedStatus != null)
                              Chip(
                                label: Text(_selectedStatus!.displayName),
                                onDeleted: () {
                                  setState(() {
                                    _selectedStatus = null;
                                  });
                                },
                              ),
                            if (_selectedCategory != 'الكل')
                              Chip(
                                label: Text(_selectedCategory),
                                onDeleted: () {
                                  setState(() {
                                    _selectedCategory = 'الكل';
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: _clearFilters,
                        child: const Text('مسح الكل'),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Projects List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredProjects.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                        itemCount: _filteredProjects.length,
                        itemBuilder: (context, index) {
                          final project = _filteredProjects[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: AppSpacing.md),
                            child: ProjectCard(
                              project: project,
                              onTap: () {
                                context.go('/project-details', extra: project);
                              },
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to create project page
        },
        icon: const Icon(Icons.add),
        label: const Text('مشروع جديد'),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'لا توجد مشاريع',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'جرب تغيير معايير البحث أو إضافة مشروع جديد',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 
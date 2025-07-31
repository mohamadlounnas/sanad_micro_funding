import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../shared/models/project_model.dart';

/// Project filter bottom sheet widget
class ProjectFilterSheet extends StatefulWidget {
  final ProjectType? selectedType;
  final ProjectStatus? selectedStatus;
  final String selectedCategory;
  final Function(ProjectType?, ProjectStatus?, String) onApply;

  const ProjectFilterSheet({
    super.key,
    this.selectedType,
    this.selectedStatus,
    required this.selectedCategory,
    required this.onApply,
  });

  @override
  State<ProjectFilterSheet> createState() => _ProjectFilterSheetState();
}

class _ProjectFilterSheetState extends State<ProjectFilterSheet> {
  late ProjectType? _selectedType;
  late ProjectStatus? _selectedStatus;
  late String _selectedCategory;

  final List<String> _categories = [
    'الكل',
    'مطاعم',
    'تقنية',
    'تجارة إلكترونية',
    'خدمات',
    'صناعة',
    'زراعة',
    'سياحة',
  ];

  @override
  void initState() {
    super.initState();
    _selectedType = widget.selectedType;
    _selectedStatus = widget.selectedStatus;
    _selectedCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusLg)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: AppSpacing.md),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Row(
              children: [
                Text(
                  'تصفية المشاريع',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedType = null;
                      _selectedStatus = null;
                      _selectedCategory = 'الكل';
                    });
                  },
                  child: const Text('مسح الكل'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Filter options
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Type Filter
                  _buildFilterSection(
                    'نوع المشروع',
                    ProjectType.values.map((type) => type.displayName).toList(),
                    _selectedType?.displayName,
                    (value) {
                      setState(() {
                        _selectedType = value == null
                            ? null
                            : ProjectType.values.firstWhere((t) => t.displayName == value);
                      });
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  // Project Status Filter
                  _buildFilterSection(
                    'حالة المشروع',
                    ProjectStatus.values.map((status) => status.displayName).toList(),
                    _selectedStatus?.displayName,
                    (value) {
                      setState(() {
                        _selectedStatus = value == null
                            ? null
                            : ProjectStatus.values.firstWhere((s) => s.displayName == value);
                      });
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  // Category Filter
                  _buildFilterSection(
                    'الفئة',
                    _categories,
                    _selectedCategory,
                    (value) {
                      setState(() {
                        _selectedCategory = value ?? 'الكل';
                      });
                    },
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),

          // Action buttons
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: AppColors.divider),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('إلغاء'),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply(_selectedType, _selectedStatus, _selectedCategory);
                      Navigator.pop(context);
                    },
                    child: const Text('تطبيق'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(
    String title,
    List<String> options,
    String? selectedValue,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: options.map((option) {
            final isSelected = selectedValue == option;
            return FilterChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (selected) {
                onChanged(selected ? option : null);
              },
              selectedColor: AppColors.primary.withValues(alpha: 0.2),
              checkmarkColor: AppColors.primary,
              labelStyle: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
} 
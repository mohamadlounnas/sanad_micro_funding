/// Project model for investment platform
class Project {
  final String id;
  final String title;
  final String description;
  final String category;
  final String location;
  final double targetAmount;
  final double currentAmount;
  final double minimumInvestment;
  final double expectedReturn;
  final int duration; // in months
  final ProjectStatus status;
  final ProjectType type;
  final String ownerId;
  final String ownerName;
  final String? imageUrl;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final Map<String, dynamic>? details;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.targetAmount,
    required this.currentAmount,
    required this.minimumInvestment,
    required this.expectedReturn,
    required this.duration,
    required this.status,
    required this.type,
    required this.ownerId,
    required this.ownerName,
    this.imageUrl,
    required this.tags,
    required this.createdAt,
    this.startDate,
    this.endDate,
    this.details,
  });

  /// Create project from JSON
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      location: json['location'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      currentAmount: (json['currentAmount'] as num).toDouble(),
      minimumInvestment: (json['minimumInvestment'] as num).toDouble(),
      expectedReturn: (json['expectedReturn'] as num).toDouble(),
      duration: json['duration'] as int,
      status: ProjectStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ProjectStatus.funding,
      ),
      type: ProjectType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => ProjectType.traditional,
      ),
      ownerId: json['ownerId'] as String,
      ownerName: json['ownerName'] as String,
      imageUrl: json['imageUrl'] as String?,
      tags: List<String>.from(json['tags'] ?? []),
      createdAt: DateTime.parse(json['createdAt'] as String),
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'] as String)
          : null,
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      details: json['details'] as Map<String, dynamic>?,
    );
  }

  /// Convert project to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'targetAmount': targetAmount,
      'currentAmount': currentAmount,
      'minimumInvestment': minimumInvestment,
      'expectedReturn': expectedReturn,
      'duration': duration,
      'status': status.name,
      'type': type.name,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'imageUrl': imageUrl,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'details': details,
    };
  }

  /// Get funding progress percentage
  double get fundingProgress => (currentAmount / targetAmount) * 100;

  /// Get remaining amount
  double get remainingAmount => targetAmount - currentAmount;

  /// Get days remaining for funding
  int get daysRemaining {
    if (endDate == null) return 0;
    final now = DateTime.now();
    final remaining = endDate!.difference(now).inDays;
    return remaining > 0 ? remaining : 0;
  }

  /// Check if project is fully funded
  bool get isFullyFunded => currentAmount >= targetAmount;

  /// Check if project is active for funding
  bool get isActiveForFunding => status == ProjectStatus.funding && !isFullyFunded;

  /// Create a copy of project with updated fields
  Project copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? location,
    double? targetAmount,
    double? currentAmount,
    double? minimumInvestment,
    double? expectedReturn,
    int? duration,
    ProjectStatus? status,
    ProjectType? type,
    String? ownerId,
    String? ownerName,
    String? imageUrl,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? startDate,
    DateTime? endDate,
    Map<String, dynamic>? details,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      location: location ?? this.location,
      targetAmount: targetAmount ?? this.targetAmount,
      currentAmount: currentAmount ?? this.currentAmount,
      minimumInvestment: minimumInvestment ?? this.minimumInvestment,
      expectedReturn: expectedReturn ?? this.expectedReturn,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      type: type ?? this.type,
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      details: details ?? this.details,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Project && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Project(id: $id, title: $title, status: $status)';
  }
}

/// Project status
enum ProjectStatus {
  funding,     // في التمويل
  active,      // نشط
  completed,   // مكتمل
  suspended,   // معلق
  cancelled,   // ملغي
}

/// Project type
enum ProjectType {
  traditional, // تقليدي
  technology,  // تقني
  saas,       // برمجي
  retail,     // تجاري
  service,    // خدمي
}

/// Extension for project status display names
extension ProjectStatusExtension on ProjectStatus {
  String get displayName {
    switch (this) {
      case ProjectStatus.funding:
        return 'في التمويل';
      case ProjectStatus.active:
        return 'نشط';
      case ProjectStatus.completed:
        return 'مكتمل';
      case ProjectStatus.suspended:
        return 'معلق';
      case ProjectStatus.cancelled:
        return 'ملغي';
    }
  }

  String get englishDisplayName {
    switch (this) {
      case ProjectStatus.funding:
        return 'Funding';
      case ProjectStatus.active:
        return 'Active';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.suspended:
        return 'Suspended';
      case ProjectStatus.cancelled:
        return 'Cancelled';
    }
  }
}

/// Extension for project type display names
extension ProjectTypeExtension on ProjectType {
  String get displayName {
    switch (this) {
      case ProjectType.traditional:
        return 'تقليدي';
      case ProjectType.technology:
        return 'تقني';
      case ProjectType.saas:
        return 'برمجي';
      case ProjectType.retail:
        return 'تجاري';
      case ProjectType.service:
        return 'خدمي';
    }
  }

  String get englishDisplayName {
    switch (this) {
      case ProjectType.traditional:
        return 'Traditional';
      case ProjectType.technology:
        return 'Technology';
      case ProjectType.saas:
        return 'SaaS';
      case ProjectType.retail:
        return 'Retail';
      case ProjectType.service:
        return 'Service';
    }
  }
} 
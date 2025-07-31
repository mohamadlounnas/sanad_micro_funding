/// User model for authentication and user management
class User {
  final String id;
  final String email;
  final String name;
  final String? phoneNumber;
  final String? profileImage;
  final UserType userType;
  final UserStatus status;
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  final Map<String, dynamic>? preferences;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.phoneNumber,
    this.profileImage,
    required this.userType,
    required this.status,
    required this.createdAt,
    this.lastLoginAt,
    this.preferences,
  });

  /// Create user from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      profileImage: json['profileImage'] as String?,
      userType: UserType.values.firstWhere(
        (e) => e.name == json['userType'],
        orElse: () => UserType.investor,
      ),
      status: UserStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => UserStatus.active,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLoginAt: json['lastLoginAt'] != null
          ? DateTime.parse(json['lastLoginAt'] as String)
          : null,
      preferences: json['preferences'] as Map<String, dynamic>?,
    );
  }

  /// Convert user to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'userType': userType.name,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'lastLoginAt': lastLoginAt?.toIso8601String(),
      'preferences': preferences,
    };
  }

  /// Create a copy of user with updated fields
  User copyWith({
    String? id,
    String? email,
    String? name,
    String? phoneNumber,
    String? profileImage,
    UserType? userType,
    UserStatus? status,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    Map<String, dynamic>? preferences,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      userType: userType ?? this.userType,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      preferences: preferences ?? this.preferences,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, userType: $userType)';
  }
}

/// User types in the system
enum UserType {
  investor,    // المستثمر
  projectOwner, // صاحب المشروع
  admin,       // المدير
}

/// User status
enum UserStatus {
  active,      // نشط
  inactive,    // غير نشط
  suspended,   // معلق
  pending,     // في الانتظار
}

/// Extension for user type display names
extension UserTypeExtension on UserType {
  String get displayName {
    switch (this) {
      case UserType.investor:
        return 'مستثمر';
      case UserType.projectOwner:
        return 'صاحب مشروع';
      case UserType.admin:
        return 'مدير';
    }
  }

  String get englishDisplayName {
    switch (this) {
      case UserType.investor:
        return 'Investor';
      case UserType.projectOwner:
        return 'Project Owner';
      case UserType.admin:
        return 'Admin';
    }
  }
}

/// Extension for user status display names
extension UserStatusExtension on UserStatus {
  String get displayName {
    switch (this) {
      case UserStatus.active:
        return 'نشط';
      case UserStatus.inactive:
        return 'غير نشط';
      case UserStatus.suspended:
        return 'معلق';
      case UserStatus.pending:
        return 'في الانتظار';
    }
  }

  String get englishDisplayName {
    switch (this) {
      case UserStatus.active:
        return 'Active';
      case UserStatus.inactive:
        return 'Inactive';
      case UserStatus.suspended:
        return 'Suspended';
      case UserStatus.pending:
        return 'Pending';
    }
  }
} 
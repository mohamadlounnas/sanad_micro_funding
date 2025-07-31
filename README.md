# ساند (Sanad) - منصة الاستثمار الصغير

## نظرة عامة (Overview)

ساند هي منصة استثمارية مبتكرة تهدف إلى ربط المستثمرين الصغار مع أصحاب المشاريع التقليدية والتكنولوجية في السوق الجزائري. المنصة تتيح للمستثمرين الحصول على حصص في مشاريع متنوعة مقابل استثمارات تبدأ من أقل من 20,000 دينار جزائري.

**Sanad** is an innovative investment platform designed to connect micro-investors with traditional and tech project owners in the Algerian market. The platform enables investors to acquire shares in diverse projects for investments starting from less than 20,000 Algerian Dinar.

## الميزات الرئيسية (Core Features)

### للمستثمرين (For Investors)

- **إعداد سريع**: اختيار نوع الحساب (مستثمر) مع واجهة سهلة
- **استكشاف المشاريع**: تصفح المشاريع المتاحة مع تفاصيل شاملة
- **إدارة المحفظة**: تتبع استثماراتك وأرباحك مع رسوم بيانية تفاعلية
- **التنويع**: استثمر في مشاريع متنوعة (متاجر تقليدية، تقنية، SaaS)
- **الشفافية**: معلومات مفصلة عن كل مشروع ومخاطره
- **تجربة سهلة**: واجهة مستخدم بسيطة مثل منصات العملات الرقمية

### لأصحاب المشاريع (For Project Owners)

- **إعداد سريع**: اختيار نوع الحساب (صاحب مشروع) مع واجهة سهلة
- **طلب التمويل**: إنشاء طلبات تمويل مع تحديد النسب المطلوبة
- **إدارة المشروع**: تحديث حالة المشروع والتقدم مع إحصائيات مفصلة
- **التواصل**: تفاعل مباشر مع المستثمرين
- **تتبع الأداء**: مراقبة تقدم التمويل والمستثمرين

## التقنيات المستخدمة (Technologies)

- **Frontend**: Flutter (Cross-platform mobile & web)
- **Design System**: Clean iOS-style design like RedotPay/crypto apps
- **Language**: Arabic (RTL support) with English fallback
- **State Management**: Provider pattern
- **Navigation**: Go Router
- **Charts**: FL Chart for investment analytics
- **Data**: Mocked data for UI development
- **Architecture**: Clean Architecture with MVVM pattern

## التصميم (Design Guidelines)

### Clean iOS-Style Design

- **Minimal Design**: Clean, modern interfaces with subtle shadows
- **Single Color Theme**: Deep blue primary color like crypto apps
- **Professional Colors**: Clean whites and slate grays
- **Modern Typography**: Clear, readable Arabic fonts with proper hierarchy
- **Card-based Layout**: Information organized in clean cards
- **Interactive Elements**: Smooth animations and hover effects
- **Data Visualization**: Charts and graphs for investment tracking

### Arabic RTL Support

- **Right-to-Left Layout**: Full RTL support for Arabic interface
- **Typography**: Optimized Arabic font rendering
- **Cultural Adaptation**: Design elements suitable for Arabic-speaking users

## هيكل المشروع (Project Structure)

```
sanad_micro_funding/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   ├── navigation/
│   │   ├── theme/
│   │   ├── utils/
│   │   └── widgets/
│   ├── features/
│   │   ├── setup/
│   │   │   └── presentation/
│   │   │       ├── pages/
│   │   │       └── widgets/
│   │   ├── investor/
│   │   │   └── presentation/
│   │   │       ├── pages/
│   │   │       └── widgets/
│   │   ├── project_owner/
│   │   │   └── presentation/
│   │   │       ├── pages/
│   │   │       └── widgets/
│   │   ├── auth/
│   │   ├── dashboard/
│   │   ├── projects/
│   │   └── profile/
│   ├── shared/
│   │   ├── models/
│   │   ├── services/
│   │   └── widgets/
│   └── main.dart
├── assets/
│   ├── images/
│   ├── fonts/
│   └── icons/
├── test/
└── pubspec.yaml
```

## المهام المطلوبة (TODO Tasks)

### المرحلة الأولى: الإعداد الأساسي (Phase 1: Basic Setup)

- [x] **إعداد مشروع Flutter**

  - [x] إنشاء مشروع Flutter جديد
  - [x] تكوين pubspec.yaml مع التبعيات المطلوبة
  - [x] إعداد هيكل المجلدات
- [x] **نظام التصميم (Design System)**

  - [x] إنشاء نظام الألوان (Color Palette) - Clean iOS-style
  - [x] تعريف Typography للعربية
  - [x] إنشاء مكونات UI الأساسية (Buttons, Cards, Inputs)
  - [x] إعداد Theme للوضعين الفاتح والداكن
- [x] **دعم اللغة العربية**

  - [x] إعداد RTL Layout
  - [x] تكوين Localization
  - [x] اختبار عرض النصوص العربية

### المرحلة الثانية: الميزات الأساسية (Phase 2: Core Features)

- [x] **صفحة الإعداد (Setup Page)**

  - [x] اختيار نوع الحساب (مستثمر / صاحب مشروع)
  - [x] واجهة سهلة ومتجاوبة
  - [x] تصميم Clean iOS-style
- [x] **لوحة تحكم المستثمر (Investor Dashboard)**

  - [x] ملخص المحفظة مع الإحصائيات
  - [x] رسوم بيانية لنمو الاستثمارات
  - [x] قائمة الاستثمارات النشطة
  - [x] إجراءات سريعة
- [x] **لوحة تحكم صاحب المشروع (Project Owner Dashboard)**

  - [x] ملخص التمويل مع الإحصائيات
  - [x] قائمة المشاريع مع التقدم
  - [x] إدارة المشاريع
  - [x] إجراءات سريعة
- [x] **إدارة المشاريع (Projects Management)**

  - [x] نموذج المشروع
  - [x] قائمة المشاريع المتاحة
  - [x] تفاصيل المشروع
  - [x] تصفية وبحث المشاريع
  - [x] نظام التصنيفات

### المرحلة الثالثة: ميزات الاستثمار (Phase 3: Investment Features)

- [ ] **عملية الاستثمار**

  - [ ] اختيار المشروع
  - [ ] تحديد مبلغ الاستثمار
  - [ ] مراجعة التفاصيل
  - [ ] تأكيد الاستثمار
- [ ] **إدارة المحفظة**

  - [ ] عرض الاستثمارات الحالية
  - [ ] تتبع الأرباح والخسائر
  - [ ] تاريخ المعاملات
  - [ ] تحليلات الأداء
- [ ] **طلبات التمويل (لأصحاب المشاريع)**

  - [ ] إنشاء طلب تمويل جديد
  - [ ] تحديد النسب المطلوبة
  - [ ] رفع المستندات
  - [ ] متابعة حالة الطلب

### المرحلة الرابعة: الميزات المتقدمة (Phase 4: Advanced Features)

- [ ] **نظام الإشعارات**

  - [ ] إشعارات فورية
  - [ ] تنبيهات السوق
  - [ ] تحديثات المشاريع
- [ ] **التواصل والتفاعل**

  - [ ] نظام الرسائل
  - [ ] التعليقات والمراجعات
  - [ ] تقارير المشاريع
- [ ] **الأمان والخصوصية**

  - [ ] تشفير البيانات
  - [ ] إعدادات الخصوصية
  - [ ] إدارة الأذونات

### المرحلة الخامسة: التحسينات والاختبار (Phase 5: Optimization & Testing)

- [ ] **تحسين الأداء**

  - [ ] تحسين سرعة التطبيق
  - [ ] تقليل استهلاك الذاكرة
  - [ ] تحسين تجربة المستخدم
- [ ] **الاختبار الشامل**

  - [ ] Unit Tests
  - [ ] Widget Tests
  - [ ] Integration Tests
  - [ ] اختبار الأداء
- [ ] **التوثيق**

  - [ ] توثيق الكود
  - [ ] دليل المطور
  - [ ] دليل المستخدم

## متطلبات النظام (System Requirements)

### للمطورين (For Developers)

- Flutter SDK 3.0+
- Dart 3.0+
- Android Studio / VS Code
- Git

### للمستخدمين (For Users)

- Android 6.0+ (API 23+)
- iOS 12.0+
- Web browsers (Chrome, Firefox, Safari)

## التثبيت والتشغيل (Installation & Setup)

```bash
# Clone the repository
git clone https://github.com/your-username/sanad_micro_funding.git

# Navigate to project directory
cd sanad_micro_funding

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## الحالة الحالية (Current Status)

### ✅ المكتمل (Completed)

- **نظام التصميم**: نظام ألوان وطباعة متكامل مع دعم الوضعين الفاتح والداكن
- **دعم اللغة العربية**: RTL كامل مع خطوط Cairo العربية
- **صفحة الإعداد**: اختيار نوع الحساب مع تصميم Clean iOS-style
- **لوحة تحكم المستثمر**: عرض المحفظة والاستثمارات مع الرسوم البيانية
- **لوحة تحكم صاحب المشروع**: إدارة المشاريع وتتبع التمويل
- **نظام التنقل**: استخدام Go Router للتنقل بين الصفحات
- **نماذج البيانات**: نماذج المستخدم والمشروع مع التحويل من/إلى JSON
- **الرسوم البيانية**: رسوم بيانية تفاعلية لعرض أداء الاستثمارات
- **إدارة المشاريع**: قائمة المشاريع المتاحة مع البحث والتصفية
- **تفاصيل المشروع**: صفحة تفصيلية للمشروع مع إمكانية الاستثمار
- **نموذج الاستثمار**: نموذج تفاعلي للاستثمار في المشاريع
- **تصميم Clean iOS-style**: واجهة مستخدم حديثة ومتطورة مثل RedotPay
- **هيكل مبسط**: كود منظم ونظيف مع إزالة التعقيدات غير الضرورية
- **تصميم موحد**: واجهة متناسقة عبر جميع الصفحات
- **أداء محسن**: تحسين سرعة التطبيق وتقليل استهلاك الذاكرة
- **قابلية الصيانة**: كود سهل القراءة والتعديل
- **نظام التنقل المحسن**: إصلاح أخطاء التنقل واستخدام Go Router بشكل صحيح
- **تنقل سلس**: انتقالات سلسة بين الصفحات بدون أخطاء
- **تجربة سهلة**: واجهة بسيطة مثل منصات العملات الرقمية

### 🔄 قيد التطوير (In Progress)

- **نظام الاستثمار**: عملية الاستثمار وإدارة المحفظة
- **نظام الإشعارات**: إشعارات فورية وتنبيهات السوق
- **نظام الدفع**: تكامل مع بوابات الدفع

### 📋 المخطط (Planned)

- **نظام الدفع**: تكامل مع بوابات الدفع
- **التقارير المتقدمة**: تحليلات مفصلة للأداء
- **نظام التقييم**: تقييم المشاريع والمستثمرين
- **التواصل**: نظام رسائل وتعليقات

## الميزات المطورة (Developed Features)

### 🚀 صفحة الإعداد (Setup Page)
- **اختيار نوع الحساب**: مستثمر أو صاحب مشروع
- **واجهة سهلة**: تصميم بسيط ومتجاوب
- **تصميم Clean iOS-style**: ألوان وظلال احترافية مثل RedotPay
- **تجربة سلسة**: انتقال سريع للوحة التحكم المناسبة

### 💼 لوحة تحكم المستثمر (Investor Dashboard)
- **ملخص المحفظة**: إحصائيات شاملة للاستثمارات
- **نمو المحفظة**: رسوم بيانية تفاعلية
- **الاستثمارات النشطة**: قائمة بالمشاريع المستثمر فيها
- **الإجراءات السريعة**: استثمار جديد وسحب الأرباح
- **تتبع الأرباح**: عرض الأرباح والخسائر بالتفصيل

### 🏢 لوحة تحكم صاحب المشروع (Project Owner Dashboard)
- **ملخص التمويل**: إحصائيات شاملة للمشاريع
- **إدارة المشاريع**: عرض تقدم التمويل لكل مشروع
- **تتبع المستثمرين**: عدد المستثمرين لكل مشروع
- **إنشاء مشاريع**: إضافة مشاريع جديدة بسهولة
- **التقارير**: تحليلات مفصلة للأداء

### 🎨 نظام التصميم (Design System)
- **الألوان**: نظام ألوان متكامل مع دعم الوضعين الفاتح والداكن
- **الطباعة**: خطوط Cairo العربية مع أحجام وأنماط متنوعة
- **المكونات**: أزرار وحقول نص وبطاقات مخصصة
- **RTL**: دعم كامل للغة العربية والتصميم من اليمين لليسار
- **Clean iOS-style**: تصميم احترافي مثل RedotPay ومنصات العملات الرقمية

### 🧭 نظام التنقل (Navigation)
- **Go Router**: نظام تنقل متقدم مع إدارة الحالة
- **التوجيه**: توجيه ذكي بين الصفحات
- **معالجة الأخطاء**: صفحات خطأ مخصصة
- **التنقل السفلي**: شريط تنقل سفلي للوصول السريع

### 📱 واجهة المستخدم (User Interface)
- **التصميم المتجاوب**: يعمل على جميع أحجام الشاشات
- **الرسوم المتحركة**: انتقالات سلسة بين الصفحات
- **إمكانية الوصول**: دعم للمستخدمين ذوي الاحتياجات الخاصة
- **الأداء**: تحسين الأداء وسرعة الاستجابة
- **تجربة سهلة**: واجهة بسيطة مثل منصات العملات الرقمية

## المساهمة (Contributing)

نرحب بالمساهمات! يرجى اتباع الخطوات التالية:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## الترخيص (License)

هذا المشروع مرخص تحت رخصة MIT - انظر ملف [LICENSE](LICENSE) للتفاصيل.

## التواصل (Contact)

- **Email**: contact@sanad.dz
- **Website**: https://sanad.dz
- **LinkedIn**: [Sanad Platform](https://linkedin.com/company/sanad-platform)

---

**ساند - دعم الاستثمار الصغير في الجزائر**

*Sanad - Supporting Micro-Investment in Algeria*

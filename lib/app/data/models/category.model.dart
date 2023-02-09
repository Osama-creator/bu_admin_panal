class PackageCategory {
  final int id;
  final String name;
  final String image;

  PackageCategory({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<PackageCategory> generateCategories() {
  return [
    PackageCategory(
      id: 1,
      name: 'إدراة المنتجات',
      image:
          'https://thumbs.dreamstime.com/b/customer-journey-vector-icon-illustration-creative-sign-crm-icons-collection-web-sites-mobile-customer-journey-vector-170116008.jpg',
    ),
    PackageCategory(
      id: 2,
      name: 'إدارة الطلبات',
      image:
          'https://static.vecteezy.com/system/resources/previews/002/258/706/original/line-icon-for-functional-analysis-vector.jpg',
    ),
    PackageCategory(
      id: 3,
      name: 'إدارة المستخدمين',
      image:
          'https://thumbs.dreamstime.com/b/customer-journey-vector-icon-illustration-creative-sign-crm-icons-collection-web-sites-mobile-customer-journey-vector-170116008.jpg',
    ),
    PackageCategory(
      id: 4,
      name: 'الإعدادات',
      image:
          'https://static.vecteezy.com/system/resources/previews/002/258/706/original/line-icon-for-functional-analysis-vector.jpg',
    ),
  ];
}

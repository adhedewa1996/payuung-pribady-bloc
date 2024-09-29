class MenuItem {
  MenuItem({
    required this.title,
    required this.icon,
    this.isNew = false,
    this.showNotification = false,
    this.notificationCount = 0,
  });
  final String title;
  final String icon;
  final bool isNew;
  final bool showNotification;
  final int notificationCount;
}

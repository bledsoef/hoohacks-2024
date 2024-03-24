class Task {
  const Task({
    required this.gameName,
    required this.title,
    required this.taskDescription,
    required this.rewardDescription,
    required this.networkImage,
    required this.expirationDate,
    required this.status,
    required this.dateCompleted,
    required this.quantity, 
    required this.metric,
    required this.category,
    this.progress = 0,
    this.needsVerification = false
  });

  final String gameName;
  final String title;
  final String taskDescription;
  final String rewardDescription;
  final String networkImage;
  final String expirationDate;
  final String status;
  final String dateCompleted;
  final int quantity;
  final String metric;
  final String category;
  final double progress;
  final bool needsVerification;
} 

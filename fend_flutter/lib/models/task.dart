class GameTask {
  const GameTask({
    required this.gameName,
    required this.id,
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
    required this.progress
  });

  final String gameName;
  final int id;
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
  final int progress;
} 

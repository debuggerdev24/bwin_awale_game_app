import 'package:flutter/material.dart';

enum NotificationType { win, deposit, bonus, friend, challenge, kyc, loss }

class NotificationItemData {
  final String id;
  final String title;
  final String description;
  final String time;
  final NotificationType type;
  bool isUnread;

  NotificationItemData({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.type,
    this.isUnread = true,
  });
}

class NotificationProvider with ChangeNotifier {
  final List<NotificationItemData> _notifications = [
    NotificationItemData(
      id: "1",
      title: "You won!",
      description: "Congratulations! You won ₹380 in Game #GM7841",
      time: "2 minutes ago",
      isUnread: true,
      type: NotificationType.win,
    ),
    NotificationItemData(
      id: "2",
      title: "Deposit successful",
      description: "₹1,000 has been added to your wallet",
      time: "1 hour ago",
      isUnread: true,
      type: NotificationType.deposit,
    ),
    NotificationItemData(
      id: "3",
      title: "Bonus unlocked!",
      description: "You earned ₹50 reward for winning 5 games this week",
      time: "3 hours ago",
      isUnread: false,
      type: NotificationType.bonus,
    ),
    NotificationItemData(
      id: "4",
      title: "Friend request",
      description: "Vikram Singh wants to be your friend",
      time: "5 hours ago",
      isUnread: false,
      type: NotificationType.friend,
    ),
    NotificationItemData(
      id: "5",
      title: "New challenge",
      description: "Rajesh Kumar challenged you to a game for ₹500",
      time: "Yesterday",
      isUnread: false,
      type: NotificationType.challenge,
    ),
    NotificationItemData(
      id: "6",
      title: "KYC reminder",
      description: "Complete your KYC to unlock unlimited withdrawals",
      time: "2 days ago",
      isUnread: false,
      type: NotificationType.kyc,
    ),
  ];

  List<NotificationItemData> get notifications => _notifications;

  int get unreadCount => _notifications.where((n) => n.isUnread).length;

  void markAllAsRead() {
    for (var notification in _notifications) {
      notification.isUnread = false;
    }
    notifyListeners();
  }

  void markAsRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index].isUnread = false;
      notifyListeners();
    }
  }
}

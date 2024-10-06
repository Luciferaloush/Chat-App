class Chat {
  final String name;
  final String icon;
  final bool isGroup;
  final String time;
  final String currentMessage;
  final String status;
    bool isSelect;

  Chat(
      {required this.name,
      required this.icon,
       this.isGroup = false,
      required this.time,
      required this.currentMessage,
      required this.status,
        this.isSelect = false,
      });
}

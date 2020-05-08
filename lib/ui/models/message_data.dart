class MessageData {
  String email;
  String content;

  MessageData(this.email, this.content);
  MessageData.copy(MessageData from) : this(from.email, from.content);
}

List<MessageData> mockData = [
  MessageData('Nur Amira', 'Meeting at 8'),
  MessageData('Nur Amiraa', 'Meeting at 8'),
  MessageData('Nur Amiraaa', 'Meeting at 8'),
  MessageData('Nur Amiraaaa', 'Meeting at 8'),
];





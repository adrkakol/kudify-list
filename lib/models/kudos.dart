class Kudos {
  Recipient recipient;
  Sender sender;
  String description;

  Kudos(
    String recipientName,
    String senderName,
    String avatarUrl,
    String description,
  ) {
    this.recipient = Recipient(recipientName);
    this.sender = Sender(senderName, avatarUrl);
    this.description = description;
  }
}

class Recipient {
  String name;

  Recipient(this.name);
}

class Sender {
  String name;
  String avatarUrl;

  Sender(this.name, this.avatarUrl);
}

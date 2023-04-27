enum Origin { chatGpt, user }

class Message {
  final String messageText;
  final Origin origin;

  Message({
    required this.messageText,
    required this.origin,
  });
}

final messageMock = <Message>[
  Message(
    messageText: "Dime una frase por favor",
    origin: Origin.user,
  ),
  Message(
    messageText:
        "Sueña como si fueras a vivir para siempre, vive como si fueses a morir hoy.” James Dean",
    origin: Origin.chatGpt,
  ),
];

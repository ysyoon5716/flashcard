class Card {
  String? id;
  String front;
  String back;

  Card({this.id, required this.front, required this.back});

  Card.fromJson(Map<String, dynamic> json)
      : id = json['id']!,
        front = json['front'],
        back = json['back'];
    
  Map<String, dynamic> toJson() => {
    'id': id,
    'front': front,
    'back': back,
  };
}

class User{

  int userId;
  String title;
  bool completed;

  User(this.userId, this.title, this.completed);

  User.fromJson(Map<String, dynamic> json)
      : userId=json['userId'],
        title=json['title'],
        completed=json['completed'];

  Map<String, dynamic> toJson() =>
      {
        'userId':userId,
        'title': title,
        "completed" :completed
      };
}
class User{

  String ?username;
  String ?email;
  String ?phone;
  String ?password;

  User({this.username,this.email,this.phone,this.password});


  User.fromJson(Map<String, dynamic> json):
        username = json['username'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'];

  Map<String, dynamic> toJson(){
    return {
      'username':username,
      'email':email,
      'phone':phone,
      'password':password
    };
  }

}
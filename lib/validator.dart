import 'dart:async';

class Validators {
  var emailValidator =
      StreamTransformer<String,String>.fromHandlers(handleData: (String email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("Please Enter A valid Email ID");
    }
  });
  var passwordValidator =
      StreamTransformer<String,String>.fromHandlers(handleData: (String password, sink) {
    if (password.trim().length<4) {
      sink.addError("Please Enter A valid Password");
    } else {
      sink.add(password);
    }
  });
}

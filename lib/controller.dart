import 'dart:convert' as convert;
// import 'package:flutter_google_sheets/model/form.dart';
import 'package:brightcare_admin/models/form.dart';
import 'package:http/http.dart' as http;

class FormController {
  // Callback function to give response of status of current request.
  final void Function(String) callback;

  // Google App Script Web URL
  static const String URL =
      "https://script.google.com/macros/s/AKfycbxcJWcEYqVpQxwub5Stn8h6kWziiYOx2rVDsYG--U7AYkW6QiNg0n8tSxHl1AgLwo0-tA/exec";
  // "https://script.google.com/macros/s/AKfycbzfCO8Ube4GyZT9kWc0OYMMPEK3Gok5QHZ64k9rPuLUw0rge7mA4DvypLgjQ8M2hdxS/exec";
  // "https://script.google.com/macros/s/AKfycbzfCO8Ube4GyZT9kWc0OYMMPEK3Gok5QHZ64k9rPuLUw0rge7mA4DvypLgjQ8M2hdxS/exec";
  // static const String URL = "https://script.google.com/macros/s/AKfycbzFd5Cw0itASDzFgIrdr97j8PbfWHw1iVcoJWhbChPKfO2c2sA/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get(URL + feedbackForm.toParams()).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}


// web:
// https://script.google.com/macros/s/AKfycbzgcj7HDukk8Ukc26pPhgAvM565nef1XD-MAp75quCnw3hVwUPfZosZhIdpKCpzVA41Cw/exec
// deployment
// AKfycbzgcj7HDukk8Ukc26pPhgAvM565nef1XD-MAp75quCnw3hVwUPfZosZhIdpKCpzVA41Cw
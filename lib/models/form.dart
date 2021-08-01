class FeedbackForm {
  String _name;
  String _email;
  String _phone;
  String _guardian;

  FeedbackForm(this._name, this._email, this._phone, this._guardian);

  // Method to make GET parameters.
  String toParams() =>
      "?name=$_name&email=$_email&phone=$_phone&guardian=$_guardian";
}

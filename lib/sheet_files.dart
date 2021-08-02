import 'package:brightcare_admin/controller.dart';
import 'package:brightcare_admin/models/form.dart';
import 'package:brightcare_admin/view_bookings.dart';
import 'package:flutter/material.dart';

class SheetFiles extends StatefulWidget {
  // const SheetFiles({ Key? key }) : super(key: key);

  @override
  _SheetFilesState createState() => _SheetFilesState();
}

class _SheetFilesState extends State<SheetFiles> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController guardianController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(nameController.text,
          emailController.text, phoneController.text, guardianController.text);

      FormController formController = FormController((String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          //
          _showSnackbar("Feedback Submitted");
        } else {
          _showSnackbar("Error Occurred!");
        }
      });

      _showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheet

      formController.submitForm(feedbackForm);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Patient Records",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        elevation: 0.0,
        centerTitle: false,
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => Bookings()),
        //       );
        //     },
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 16),
        //       child: Icon(Icons.arrow_back_sharp),
        //     ),
        //   ),
        // ],
        // leading: Icon(
        //   Icons.arrow_back,
        //   size: 26.0,
        // ),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Valid Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Name"),
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Valid Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                      TextFormField(
                        controller: phoneController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Valid Phone Number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Phone Number"),
                      ),
                      TextFormField(
                        controller: guardianController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Valid Guardian Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Guardian"),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: _submitForm,
                        child: Text('Submit Feedback'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

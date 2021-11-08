import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:homam/constants/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;



void main() => runApp(const Volunteer());

class Volunteer extends StatelessWidget {

  const Volunteer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Volunteer';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lime[600],
          title: const Text(
              appTitle,
          ),
        ),
        body: const VolunteerLayout(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

enum Gender {Male,Female}
// Create a Form widget.
class VolunteerLayout extends StatefulWidget {
  const VolunteerLayout({Key? key}) : super(key: key);

  @override
  VolunteerLayoutState createState() {
    return VolunteerLayoutState();
  }
}


// Create a corresponding State class.
// This class holds data related to the form.
class VolunteerLayoutState extends State<VolunteerLayout> {
  final _formKey = GlobalKey<FormState>();
  String birthDate = "";
  int age = -1;
  late DateTime selectedData;
  List<String> zones = ['Manali','Thiruvotriyur','Anna nagar','Kodambakam'];
  String zone  = '';
  String selectedZone = "";

  TextEditingController dateinput = TextEditingController();
  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    final cityselected = TextEditingController();
    Gender? _character = Gender.Male;


    return SingleChildScrollView(
      child: Form(
        key: _formKey,


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,


          children: [
            SizedBox(height: 20.0,),

            Container(
                padding: const EdgeInsets.only(left: 260.0, top: 0.0),
                child: new RaisedButton(
                  child: const Text('Back'),
                  onPressed:() {

                  },
                  color: Colors.lime[600],

                )),

            Padding(padding: EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
              child: Text(
                'NAME',
                style: TextStyle(

                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                    fontFamily: Constants.LORA),
              ),
            ),
            SizedBox(height: 13.0,),
            TextFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.blueAccent),
                contentPadding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
                fillColor: Color(0xFFF9FBE7),
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                suffixIcon: Icon(Icons.person),
                hintText: 'Enter your name',


              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },


            ),
            SizedBox(height: 34.0,),
            Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
              child : Text(
                'GENDER',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                    fontFamily: Constants.LORA),
              ),
            ),
            SizedBox(height: 13.0,),
            ListTile(
              title: const Text('Male'),
              leading: Radio(
                value: Gender.Male,
                autofocus: false,
                activeColor: Colors.red,
                groupValue: _character,
                onChanged: (Gender? value) {
                  setState(() {

                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio(
                value: Gender.Female,
                groupValue: _character,
                activeColor: Colors.red,
                onChanged: (Gender? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          Column(
                children: <Widget>[
                ListTile(
                title: const Text('Lafayette'),
                  leading: Radio<Gender>(
            value: Gender.Male,
            groupValue: _character,
            onChanged: (Gender? value) {
              setState(() {
                _character = value;
          });
        },
      ),
    ),
                  ListTile(
                    title: const Text('Lafayette'),
                    leading: Radio<Gender>(
                      value: Gender.Female,
                      groupValue: _character,
                      onChanged: (Gender? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
      ],
    ),


            SizedBox(height: 34.0,),
            Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
              child : Text(
                'PHONE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                    fontFamily: Constants.LORA),
              ),
            ),
            SizedBox(height: 13.0,),
            TextFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.blueAccent),
                contentPadding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
                fillColor: Color(0xFFF9FBE7),
                filled: true,
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                suffixIcon: Icon(Icons.phone),
                hintText: 'Enter your phone number',


              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                final RegExp phoneRegex = new RegExp(r'^[6-9]\d{9}$');
                if (!phoneRegex.hasMatch(value!)) {
                  return 'Please enter valid phone number';
                }
                return null;
              },



            ),
            SizedBox(height: 34.0,),
            Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
              child : Text(
                'DATE OF BIRTH',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                    fontFamily: Constants.LORA),
              ),),
            SizedBox(height: 13.0,),

            //
            TextFormField(

              controller: dateinput, //editing controller of this TextField

              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.blueAccent),
                contentPadding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
                fillColor: Color(0xFFF9FBE7),
                filled: true,
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                suffixIcon: Icon(Icons.calendar_today),
                hintText: 'Date of birth',


              ),

              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Date';
                }
                return null;
              },
              readOnly: true,  //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context, initialDate: DateTime.now(),
                  firstDate: DateTime(1920), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Container(
                            height: 900,
                            width: 900,
                            child: child,
                          ),
                        ),
                      ],
                    );
                  },
                );


                if(pickedDate != null ){
                  print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                  DateTime formattedDate = pickedDate;
                  print(formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement
                  this.age = calculateAge(formattedDate);
                  print('$age');

                  setState(() {
                    dateinput.text = "${formattedDate.day}-${formattedDate.month}-${formattedDate.year}"; //set output date to TextField value.
                  });
                }else{
                  print("Date is not selected");
                }
              },
            ),


            SizedBox(height: 34.0,),
            Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
              child : Text(
                'AGE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                    fontFamily: Constants.LORA),
              ),
            ),
            SizedBox(height: 13.0,),
            TextFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.blueAccent),
                contentPadding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
                fillColor: Color(0xFFF9FBE7),
                filled: true,
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),

                hintText: 'Enter your Age',


              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Age';
                }
                else if(value != '$age')
                {
                  return 'Enter valid age';
                }
                return null;
              },





            ),
            SizedBox(height: 34.0,),
            Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
              child : Text(
                'ZONE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                    fontFamily: Constants.LORA),
              ),
            ),
            SizedBox(height: 13.0,),
            DropdownSearch<String>(
              //mode of dropdown
              mode: Mode.DIALOG,
              //to show search box
              showSearchBox: true,
              showSelectedItem: true,
              //list of dropdown items
              items: zones,

              label: "Select zone",
              onChanged: (value) {

                setState(() {

                  this.zone = value!;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter zone';
                }
                return null;
              },

            ),


            SizedBox(height: 34.0,),
            Align(
              alignment: Alignment.center,
              child : Text(
                'ADDRESS',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.7,
                  fontFamily: Constants.LORA,

                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height:34.0),
            Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
              child : Text(
                'DOOR NO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.7,
                  fontFamily: Constants.LORA,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 13.0,),
            TextFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.blueAccent),
                contentPadding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
                fillColor: Color(0xFFF9FBE7),
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                suffixIcon: Icon(Icons.home),
                hintText: 'Enter your door no',


              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter door no';
                }
                return null;
              },
            ),


            SizedBox(height:34.0),
            Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
              child : Text(
                'STREET',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.7,
                  fontFamily: Constants.LORA,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 13.0,),
            TextFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.blueAccent),
                contentPadding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
                fillColor: Color(0xFFF9FBE7),
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                suffixIcon: Icon(Icons.pin_drop),
                hintText: 'Enter your Street',


              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Street';
                }
                return null;
              },
            ),
            SizedBox(height: 34.0,),
            Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
              child : Text(
                'PINCODE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.7,
                  fontFamily: Constants.LORA,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 13.0,),
            TextFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.blueAccent),
                contentPadding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
                fillColor: Color(0xFFF9FBE7),
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),

                hintText: 'Enter your pin code',


              ),
              validator: (value) {

                if (value!.length != 6) {
                  return 'Please enter valid pin code';
                }
                return null;
              },
            ),
            new Container(
              padding: const EdgeInsets.only(left: 0.0, top: 30.0,bottom: 10.0),
              child: SizedBox(
                height: 50,
                width : 360,
                child : ElevatedButton(
                  onPressed:() {
                    if (_formKey.currentState!.validate()) {
                      print("Process data");
                    }
                    else {
                      print('Error');
                    }
                  },

                  style: ButtonStyle(


                    backgroundColor: MaterialStateProperty.resolveWith<
                        Color>((Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Theme.of(context).colorScheme.primary.withOpacity(0.0);
                      return Color(0xFFC0CA33); // Use the component's default.
                    },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                              color: Colors.white.withOpacity(0.0))
                      ),
                    ),

                  ),
                  child: const Text(
                    'Submit',

                    style: TextStyle(

                      fontFamily: Constants.LORA,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),


                  // This trailing comma makes auto-formatting nicer for build methods.
                ),
              ),




            ),
          ],
        ),
      ),
    );
  }
}
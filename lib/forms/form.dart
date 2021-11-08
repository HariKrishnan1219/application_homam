import 'package:date_field/date_field.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:homam/constants/constants.dart';
import 'package:homam/ui_view/GetStarted.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'dart:ui' as ui;



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Homam';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF66BB6A),
          title: const Text(
              appTitle,
          textAlign: TextAlign.center,
          style: TextStyle(

          ),),
        ),
        body: const FormLayout(

        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}


// Create a Form widget.
class FormLayout extends StatefulWidget {
  const FormLayout({Key? key}) : super(key: key);

  @override
  FormLayoutState createState() {
    return FormLayoutState();
  }
}


// Create a corresponding State class.
// This class holds data related to the form.
class FormLayoutState extends State<FormLayout> {
  late DateTime selectedData;


  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  List<String> options = <String>['Mesham', 'Rishabam', 'Mithunam', 'Kadakam','Simmam','kanni','Thulam','Vrichikam','Dhanush','Makaram','Kumbham','Meenam'];
  List<String> n = <String>['Ashvini', 'Bharani', 'Karthigai', 'Rohini','Mirugasheersham','Thiruvathirai','Punarpoosam','poosam','Aayilyam','Makam','Pooram','Uthiram','Hastham','Chithirai','Swathi','Visaakam','Anusham','Kettai','Moolam','Pooradam','Utharadam','Thiruvonam','Avittam','Chathayam','Pooratathi','Uthiratathi','Revathi'];
  String dropdownValue = 'Mesham';
  List nat = [''];
  List natcha = [['Astham','Poosam'],['Ashvini','Bharani'],['Karthigai','Rohini']];
  List<String> zones = ['Manali','Thiruvotriyur','Anna nagar','Kodambakam'];
  String zone  = '';
   String selectedSalutation = '';
  String selected = '';
  String selectedZone = "";
  String birthDate = "";
  int age = -1;
  int i = 0;

  late String name;

  TextEditingController dateinput = TextEditingController();

 List l = [];

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field



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

  natchathiram(v)
  {
    if (v == 'Rishabam') {
      i = 0;
    } else if (v == 'kanni') {
      i = 1;
    }
    else if(v == 'Kadakam'){
      i = 2;
    }
return i;
  }
  bool isactive = false;
  void navigateToStartScreenLayout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen(isactive)));
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    final myController = TextEditingController();

  return SingleChildScrollView(


    child : Form(
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
                  StartScreen(true);
                },
              color: Color(0xFF66BB6A),

              )),

      Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
        child : Text(
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
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
              fillColor: Color(0xFFE8F5E9),
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
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
              fillColor: Color(0xFFE8F5E9),
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
                errorStyle: TextStyle(color: Colors.redAccent),
                contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
                fillColor: Color(0xFFE8F5E9),
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
                          height: 600,
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
              'TIME OF BIRTH',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.7,
                  fontFamily: Constants.LORA),
            ),),
          SizedBox(height: 13.0,),

      TextFormField(
        controller: timeinput, //editing controller of this TextField
        decoration: const InputDecoration(
          hintStyle: TextStyle(color: Colors.black45),
          errorStyle: TextStyle(color: Colors.redAccent),
          contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
          fillColor: Color(0xFFE8F5E9),
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          suffixIcon: Icon(Icons.timer),
          hintText: 'time of birth',


        ),
        readOnly: true,  //set it true, so that user will not able to edit text
        onTap: () async {
          TimeOfDay? pickedTime =  await showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
          );

          if(pickedTime != null ){
            print(pickedTime.format(context));   //output 10:51 PM
            DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
            //converting to DateTime so that we can further format on different pattern.
            print(parsedTime); //output 1970-01-01 22:53:00.000
            String formattedTime = DateFormat('HH:mm').format(parsedTime);
            print(formattedTime); //output 14:59:00
            //DateFormat() is from intl package, you can format the time on any pattern you need.

            setState(() {
              timeinput.text = formattedTime; //set the value of text field.
            });
          }else{
            print("Time is not selected");
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
          SizedBox(height: 10.0,),
          TextFormField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
              fillColor: Color(0xFFE8F5E9),
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
            'RAASI',
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
            popupBarrierColor: Color(0xFFE8F5E9),
            showSelectedItem: true,
            //list of dropdown items
            items: [
              'Mesham', 'Rishabam', 'Mithunam', 'Kadakam','Simmam','kanni','Thulam','Vrichikam','Dhanush','Makaram','Kumbham','Meenam'
            ],
            label: "Select Raasi",
            onChanged: (value) {
              natchathiram(selectedSalutation);
              setState(() {

                this.selectedSalutation = value!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Raasi';
              }
              return null;
            },

          ),


          SizedBox(height: 34.0,),
      Padding(padding: EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
        child : Text(
            'NATCHATHIRAM',
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
            popupBarrierColor: Color(0xFFE8F5E9),
            showSelectedItem: true,
            //list of dropdown items
            items: natcha[i],

            label: "Select Natchathiram",
            onChanged: (value) {

              setState(() {

                this.selected = value!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Nakshathiram';
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
            popupBarrierColor: Color(0xFFE8F5E9),
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
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
              fillColor: Color(0xFFE8F5E9),
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


          SizedBox(height:32.0),
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
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
              fillColor: Color(0xFFE8F5E9),
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
              errorStyle: TextStyle(color: Colors.redAccent),
              contentPadding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
              fillColor: Color(0xFFE8F5E9),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF66BB6A))
              ),

              hintText: 'Enter your pin code',



            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter name';
              }
              else if (value!.length != 6) {
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
                  return Color(0xFF66BB6A); // Use the component's default.
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
    ),);

  }



}
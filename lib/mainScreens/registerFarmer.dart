import 'dart:ui';
//import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class registerFarmer extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<registerFarmer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cropController = TextEditingController();

  String? name;
  String? address;
  String? email;
  String? password;
  int? mobile;

  Widget _buildNameField() {
    return TextFormField(
      validator: (text) {
        if (text!.isEmpty) {
          return "Name can't be empty";
        }
        if (text.length < 2) {
          return "Name must be at least 2 characters long";
        }
        return null;
        //return HelperValidator.nameValidate('text');
      },
      maxLength: 20,
      maxLines: 1,
      decoration: const InputDecoration(
        labelText: 'Name',
        hintText: 'Enter your full name',
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
      onSaved: (text) {
        name = text;
      },
    );
  }

  Widget _buildNICField() {
    return TextFormField(
      validator: (text) {
        if (text!.isEmpty) {
          return "NIC can't be empty";
        }
        return null;
        //return HelperValidator.nameValidate('text');
      },
      maxLength: 20,
      maxLines: 1,
      decoration: const InputDecoration(
        labelText: 'NIC',
        hintText: 'Enter your NIC',
        prefixIcon: Icon(
          Icons.add_card,
          color: Colors.grey,
        ),
      ),
      onSaved: (text) {
        name = text;
      },
    );
  }

  Widget _buildFarmField() {
    return TextFormField(
      validator: (text) {
        if (text!.isEmpty) {
          return "Farm Name can't be empty";
        }
        return null;
        //return HelperValidator.nameValidate('text');
      },
      maxLength: 20,
      maxLines: 1,
      decoration: const InputDecoration(
        labelText: 'Farm Name',
        hintText: 'Enter your Farm name',
        prefixIcon: Icon(
          Icons.agriculture,
          color: Colors.grey,
        ),
      ),
      onSaved: (text) {
        name = text;
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      maxLength: 100,
      validator: (text) {
        if (text!.isEmpty) {
          return "Address cannot be empty";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Address',
        hintText: 'Enter your address',
        prefixIcon: Icon(
          Icons.home,
          color: Colors.grey,
        ),
      ),
      onSaved: (text) {
        address = text;
      },
    );
  }

  Widget _buildFarmAddressField() {
    return TextFormField(
      maxLength: 100,
      validator: (text) {
        if (text!.isEmpty) {
          return "Address cannot be empty";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Farm Address',
        hintText: 'Enter your Farm address',
        prefixIcon: Icon(
          Icons.location_on,
          color: Colors.grey,
        ),
      ),
      onSaved: (text) {
        address = text;
      },
    );
  }

  Widget _buildFarmAreaField() {
    return TextFormField(
      maxLength: 100,
      validator: (text) {
        if (text!.isEmpty) {
          return "Arae cannot be empty";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Area of Farm',
        hintText: 'Enter your Farm area',
        prefixIcon: Icon(
          Icons.area_chart,
          color: Colors.grey,
        ),
      ),
      onSaved: (text) {
        address = text;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      maxLength: 20,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a valid email";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.grey,
        ),
      ),
      onSaved: (text) {
        email = text;
      },
    );
  }

  Widget _buildCropField() {
    return DropdownButtonFormField<String>(
      // value: _selectedItem,
      onChanged: (value) {
        setState(() {
          _cropController.text = value!;
        });
      },
      items: [
        //DropdownMenuItem(child: Text("Select a crop"), value: ""),
        DropdownMenuItem(child: Text("Vegetable"), value: "vegetable"),
        DropdownMenuItem(child: Text("Chilli"), value: "chilli"),
        DropdownMenuItem(child: Text("Leeks"), value: "leeks"),
      ],
      decoration: const InputDecoration(
        labelText: 'Choose a crop',
        prefixIcon: Icon(
          Icons.select_all,
          color: Colors.grey,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a crop';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      maxLength: 10,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a password";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: Icon(
          Icons.key,
          color: Colors.grey,
        ),
      ),
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      obscureText: true,
      maxLength: 10,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a password";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Re-enter your password',
        prefixIcon: Icon(
          Icons.key_sharp,
          color: Colors.grey,
        ),
      ),
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget _buildMobileNumberField() {
    return TextFormField(
        maxLength: 10,
        keyboardType: TextInputType.number,
        validator: (text) {
          if (text!.isEmpty) {
            return "Please enter a mobile Number";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Mobile Number',
          hintText: 'Enter a mobile number',
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.grey,
          ),
        ),
        onSaved: (value) {
          if (value != null && int.tryParse(value) != null) {
            mobile = int.parse(value);
          } else {
            // Handle invalid input
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register as a Farmer'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, Placeholder());
            },
            icon: const Icon(Icons.arrow_back),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("bgAppbar.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Stack(
            children: [
              Image.asset("assets/bg.png"),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                    //color: Colors.black.withOpacity(0.1),
                    ),
              ),
              // Title(
              //   color: Colors.black,
              //   child: const Text("Personal Information"),
              // ),
              Container(
                margin: const EdgeInsets.all(24.0),
                // decoration: BoxDecoration(
                //   color: Colors.transparent,
                //   border: Border.all(
                //     color: Colors.black, // Border color
                //     width: 0.5, // Border width
                //   ),
                //   borderRadius: BorderRadius.circular(10.0), // Border radius
                // ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // const Text(
                      //   'Personal Information',
                      //   style: TextStyle(
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildNameField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildNICField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildAddressField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildFarmField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildFarmAddressField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildFarmAreaField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCropField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildMobileNumberField(),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildEmailField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildPasswordField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildConfirmPasswordField(),
                      ),

                      // const Text(
                      //   'Cultivation Information',
                      //   style: TextStyle(
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      const SizedBox(height: 50),
                      Container(
                        width: 150,
                        
                        child: ElevatedButton(
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Color.fromARGB(255, 25, 25, 25),
                                fontSize: 16.0,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('valid form');
                                _formKey.currentState!.save();
                              } else {
                                print('not valid form');
                                return;
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 192, 226, 190)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                            )),
                      ),
                      SizedBox(height: 25)
                    ],
                  ),
                ),
              ),
            ],
          )),
        )
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.message),
        //       label: 'Messages',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       label: 'Profile',
        //     ),
        //   ],
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        //       return Fifthpage();
        //     }));
        //   },
        //   child: const Icon(Icons.add),
        // ),
        );
  }
}
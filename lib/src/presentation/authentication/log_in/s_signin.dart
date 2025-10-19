import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_campus/core/util/constants/all_enums.dart';
import 'package:go_campus/core/util/controller/c_authectication.dart';
import 'package:go_campus/core/util/helper_method/hm_validator.dart';
import 'package:go_campus/core/util/services/sv_navigaton.dart';
import 'package:go_campus/src/presentation/authentication/s_signup.dart/s_signup.dart';

class SSignIn extends StatefulWidget {
  @override
  _SSignInState createState() => _SSignInState();
}

class _SSignInState extends State<SSignIn> {
  Role  _selectedRole = Role.Student;
  final _formKey = GlobalKey<FormState>();
  CAuthentication cAuthentication = currentContext().read();

  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Go_Campus",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField<Role>(
                          initialValue: _selectedRole,
                          decoration: InputDecoration(
                            labelText: "Select Role",
                            border: OutlineInputBorder(),
                          ),
                          items:
                              Role.values
                                  .map(
                                    (role) => DropdownMenuItem(
                                      value: role,
                                      child: Text(role.name),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            setState(() => _selectedRole = value!);
                          },
                        ),
                        SizedBox(height: 20),
                        if (_selectedRole == Role.Student)
                          Column(
                            children: [
                              TextFormField(
                                controller: _studentIdController,
                                decoration: InputDecoration(
                                  labelText: 'Student ID',
                                  border: OutlineInputBorder(),
                                ),
                                validator:
                                    (value) => validateID(value)
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          validator:
                              (value) => validatePhone(value),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator:
                              (value) => value!.isEmpty ? 'Enter password' : null,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton.icon(
                          icon: Icon(Icons.login),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                            backgroundColor: Colors.indigo,
                          ),
                          onPressed: () {
                            _login();
                          },
                          label: Text("Login", style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              HaveAccountWidget (label: "Don't Have Account?", acctionText: "SignUp", ontap: () {SvNavigaton().navigateTo(screen: SSignUp());},)
            ],
          ),
          
        ),
      ),
    );
  }


  // login
  void _login() async {
    if (_formKey.currentState!.validate()) {
      cAuthentication.add(SignInEvent(phone: _phoneController.text, pass: _passwordController.text, role : _selectedRole));
    }
  }

  

}

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
    this.label,
    required this.acctionText,
    required this.ontap,
    });

  final String ?label;
  final String acctionText;
  final Function() ontap; 
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label??"" , style: TextStyle(color: Colors.blue, fontSize: 20),),
        TextButton(onPressed: ontap, child: Text(acctionText,style: TextStyle(color: Colors.orange, fontSize: 20),),),
      ],
    );
  }
}


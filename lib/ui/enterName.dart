import 'dart:async';
import 'package:alwarsha2/models/StaticVirables.dart';
import 'package:alwarsha2/ui/frontBage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'PageRoute.dart';
import 'dart:io';
class EnterName extends StatefulWidget {
  @override
  _EnterNameState createState() => _EnterNameState();
}
String tabelNameSet;
var _formKey = GlobalKey<FormState>();
class _EnterNameState extends State<EnterName> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();

  }

  getName()async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    setState(() {
      _nameController = TextEditingController(text: sharedPref.getString('name'));
    });

    Timer(Duration(milliseconds: 100),(){
      tabelNameSet = sharedPref.getString('name');
     print(sharedPref.getString('name').toString());
     if(sharedPref !=null){
       Navigator.pushReplacement(context, BouncyPageRoute(widget: FrontBageful()));
     }
    });
  }
  saveName()async{
    tabelNameSet = _nameController.text;
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('name', _nameController.text);
  }

  TextEditingController  _nameController = TextEditingController();

  @override
  void dispose()
  {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Virables.table = tabelNameSet;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 40)),
              Center(child: Text('data')),
              Padding(padding: EdgeInsets.only(top: 40)),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[900]),
          height: 93,
          width: 364,
          child:
          Padding(
            padding: EdgeInsets.only(top: 1,right: 1,left:1,bottom:1),
            child: Text('قم بإدارة سجلات عملك بطريقة ذكية ومريحة وبكل بساطة , ودون أن تفقد سجلاتك تحت أي ضرف',
              textAlign:TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily:'AmiriQuran',
                  height: 2,
                  color: Colors.white
              ),),
          ),
        ),
              Padding(padding: EdgeInsets.only(top: 100)),

              Container(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 240,
                      height: 40,
                      child: TextFormField(
                        controller: _nameController,
                        // ignore: missing_return
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter principal amount';
                          }
                        },
                        maxLines: 2,

                        textAlign: TextAlign.right,
                        decoration: InputDecoration(

                          alignLabelWithHint: true,
                          hintText:
                          '!...أدخل إسم العامل هنا',
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                        cursorRadius: Radius.circular(10),
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        if(_formKey.currentState.validate()){
                        }
                        saveName();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.blue[900]),
                        width: 60,
                        height: 40,
                        child: Center(
                          child: Text('data',style: TextStyle(
                              fontSize: 16,
                              fontFamily:'AmiriQuran',
                              height: 1,
                              color: Colors.white
                          ),),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

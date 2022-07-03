

import 'dart:ffi';

import 'package:flutter/material.dart';

 class CurrencyConvert extends StatefulWidget{
  @override
  State<CurrencyConvert> createState() => _CurrencyConvertState();
}

class _CurrencyConvertState extends State<CurrencyConvert> {
   String? valuechoose;
   String? valuechoose1;

   @override
  Widget build(BuildContext context) {
    final _amount =TextEditingController();
    final _tot=TextEditingController();
    int cal;
    int result;
    // TODO: implement build
    var size=MediaQuery.of(context).size;
  return Scaffold(
    body: SafeArea(child:
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Container(
        child: Column(children: [
          Text('Currency Convertor',style: TextStyle(fontSize: 30,color: Colors.black),),
          SizedBox(height: 15,),
          TextField(
            controller:_amount ,
            decoration: InputDecoration(
              labelText: "Amount",
              labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
          SizedBox(height: 15,),

DropdownButton<String>(
        value: this.valuechoose,
        items: <String>['JOD','USD'].map((String value) {
        return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
        );
        }).toList(),
        onChanged: (value)=> setState(()=> this.valuechoose=value,
        )),
          SizedBox(height: 15,),
          DropdownButton<String>(
            value: this.valuechoose1,
              items: <String>['ILS',].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value)=> setState(()=> this.valuechoose1=value,
              )),

          TextField(
            controller:_tot ,
            decoration: InputDecoration(
                labelText: "Total",
                labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          SizedBox(height: 15,),
   GestureDetector(
     onTap: (){
       if(valuechoose=="JOD" && valuechoose1=="ILS"){
         cal=int.parse(_amount.text) * 5;
         result=cal;
         _tot.text=result.toString();
       }else if(valuechoose=="USD" &&  valuechoose1=="ILS"){
         cal=int.parse(_amount.text) * 3;
         result=cal;
         _tot.text=result.toString();

       }
     },
           child: Container(
             alignment: Alignment.center,
               height: size.height/14,
               width: size.width,
               decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
               child: Text("CONVERT",
                 style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),

        ],
             ),
      ),
    ),),
  );
  }
}
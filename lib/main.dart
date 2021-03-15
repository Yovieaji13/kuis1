import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.yellow,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Conversion Power Watt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  //Melakukan deklarasi controller
  final inputan = TextEditingController();
  final hasil = TextEditingController();
  //Melakukan deklarasi untuk listview
  List<String> listViewItem = List<String>();
  //Melakukan deklarasi untuk value pada dropdown 
  String _newValue1 = "Watt";
  String _newValue2 = "Megawatt";
  //Melakukan deklarasi variable listitem yang ada pada dropdown
  var listItem1 = ["Watt", "Megawatt", "Kilowatt"];
  var listItem2 = ["Watt", "Megawatt", "Kilowatt"];
  //Melakukan deklarasi inputan dan hasil untuk method perhitungan
  double _hasil = 0;
  double _input = 0;

  //Melakukan perhitungan conver antara watt, megawatt dan kilowatt
  void perhitunganPower() {
    setState(() {
      _input = double.parse(inputan.text);
      if (_newValue1 == "Watt") {
       if(_newValue2 == "Watt"){
         _hasil = _input;
       } else if(_newValue2 == "Megawatt"){
         _hasil = _input / 100000;
       } else if(_newValue2 == "Kilowatt"){
         _hasil = _input / 1000;
       }
      } else if(_newValue1 == "Megawatt") {
          if(_newValue2 == "Megawatt"){
            _hasil = _input;
          } else if(_newValue2 == "Watt"){
            _hasil = 1000000 * _input;
          } else if(_newValue2 == "Kilowatt"){
            _hasil = 1000 * _input;
          }
        } else{
          if(_newValue2 == "Watt"){
            _hasil = _input / 1000;
          } else if(_newValue2 == "Megawatt"){
            _hasil = _input / 1000;
          } else if(_newValue2 == "Kilowatt"){
            _hasil = _input;
          }
        }
    });
  }

  //Membuat method onchange untuk value1
  void onChange(String changeValue){
    setState((){
      _newValue1 = changeValue;
    });
  }

  //Membuat method onchange2 untuk value2
  void onChange2(String changeValue){
    setState((){
      _newValue2 = changeValue;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    
      body: ListView(
        children: <Widget>[

          Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                //Membuat jarak antara dropdown dengan tulisan Convert Power Watt 
                Stack(
                  children: [
                      Container(
                        height: 10,
                        )  
                ],),

                  //Membuat sebuah dropdown pertama untuk pertukaran dengan dropdown kedua
                  Text("Dari : "),
                    DropdownButton<String>(
                    items: listItem1.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue1,
                    onChanged: onChange
                  ),

                  //Membuat sebuah dropdown kedua untuk pertukaran dengan dropdown pertama
                  Text("      Ke : "),
                  DropdownButton<String>(
                    items: listItem2.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue2,
                    onChanged: onChange2
                  ),
                ],
              ),

              //Membuat tulisan Inputan Nominal dengan menggunakan stack agar terdapat jarak diantara form text field dengan dropdown
              Stack(
               children: [
                  Container(
                   margin: EdgeInsets.only(top: 20),
                   padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                      // padding: EdgeInsets.only(left: 20.0, bottom: 15.0),
                      child: Text(
                         "Inputkan Nominal : ", style: TextStyle(fontSize: 14, color: Colors.black),
                       ),
                     )  
                ],),

              //Membuat sebuah inputan untuk menginputkan angka yang akan di konversi dengan max 5 angka
               TextFormField(
                  maxLength: 5,
                  controller: inputan,
                  decoration: InputDecoration(
                    hintText: "",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9+\,]'))
                  ],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),

                //Membuat tulisan Inputan Nominal dengan menggunakan stack agar terdapat jarak diantara form text field dengan dropdown
                Stack(
                  children: [
                      Container(
                        alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Result : ", style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        )  
                  ],
                ),
              
              //Membuat sebuah inputan yang isinya sebuah hasil dari hasil konversi dan inputan itu tidak bisa diisi atau bernilai false pada enabled
               TextFormField(
                 enabled: false,
                  controller: hasil,
                  decoration: InputDecoration(
                    hintText: "$_hasil",
                  ),
               ), 

              //Membuat jarak antara textformfield dengan raised button
                Stack(
                  children: [
                      Container(
                        height: 10,
                        )  
                ],),
                
                //Membuat sebuah button dengan menggunakan sizebox dalam mengatur ukuran box 
                SizedBox(
                  width: 200,
                  child:RaisedButton(
                    color: Colors.yellow,
                    padding: EdgeInsets.all(10),
                    onPressed: perhitunganPower,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Convert Power',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )
                  ),
                ),  
              ],
           ),
        ],
      ),
    );
  }
}

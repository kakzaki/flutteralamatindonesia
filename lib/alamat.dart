import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:alamatapp/Misc.dart';

class Alamat extends StatefulWidget {
  @override
  AlamatPageState createState() => new AlamatPageState();
}
class AlamatPageState extends State<Alamat> {
  String _myProvinsi;
  String _myKabupaten;
  String _myKecamatan;
  String _mynamaProvinsi;
  String _mynamaKabupaten;
  String _mynamaKecamatan;
  List<Map> _provinsis = provinsis;
  List<Map> _kabupatens= kabupatens;
  List<Map> _kecamatans = kecamatans;

  @override
  Widget build(BuildContext context) {
    var _kabupatenfilter =_kabupatens.where((kabupaten) => kabupaten["province_id"] =="$_myProvinsi").toList();
    var _kecamatanfilter =_kecamatans.where((kecamatan)=>kecamatan["regency_id"]=="$_myKabupaten").toList();


    return new Scaffold(
      appBar: new AppBar(
        title: Text('Edit Profile',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:40,right:20.0,left:20.0),
                child: Text("DATA USER",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),textAlign: TextAlign.start,),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40,right:20.0,left:20.0),
                child: new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Provinsi',
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: _myProvinsi == '',
                      child: IgnorePointer(
                        ignoring: false,
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            hint: Text(""),
                            value: _myProvinsi,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _myKabupaten=null;
                                _myKecamatan=null;
                                _mynamaKabupaten=null;
                                _mynamaKecamatan=null;
                                _myProvinsi = newValue;
                                _mynamaProvinsi = _provinsis[int.parse(newValue)-1]['name'];
                              });
                              print (_myProvinsi);
                            },
                            items: _provinsis.map((Map prov) {
                              return new DropdownMenuItem<String>(
                                value: prov['id'],
                                child: new Text(prov['name']),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                  validator: (val) {
                    return val != '' ? null : 'Provinsi';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40,right:20.0,left:20.0),
                child: new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        //icon: const Icon(Icons.color_lens),
                        labelText: 'Kabupaten',
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: _myKabupaten == '',
                      child: IgnorePointer(
                        ignoring: false,
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            hint: Text(""),
                            value: _myKabupaten,
                            isDense: true,
                            onChanged: (String newKab) {
                              setState(() {
                                _myKecamatan=null;
                                _mynamaKecamatan=null;
                                _myKabupaten = newKab;
                                _mynamaKabupaten = _kabupatens[int.parse(newKab)-1]['name'];
                              });
                              print (_myKabupaten);
                            },
                            items: _kabupatenfilter.map((Map kab) {
                              return new DropdownMenuItem<String>(
                                value: kab['id'],
                                child: new Text(kab['name']),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40,right:20.0,left:20.0),
                child: new FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        //icon: const Icon(Icons.color_lens),
                        labelText: 'Kecamatan',
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: _myKecamatan == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton<String>(
                          hint: Text(""),
                          value: _myKecamatan,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _myKecamatan = newValue;
                              _mynamaKecamatan = _kecamatans[int.parse(newValue)-1]['name'];
                            //  kabmati=true;
                            });
                            print (_myKecamatan);
                          },
                          items: _kecamatanfilter.map((Map kec) {
                            return new DropdownMenuItem<String>(
                              value: kec['id'],
                              child: new Text(kec['name']),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                  validator: (val) {
                    return val != '' ? null : 'Kecamatan';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Text(_mynamaProvinsi??""),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Text( _mynamaKabupaten??""),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Text(_mynamaKecamatan??""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


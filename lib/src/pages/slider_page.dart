import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 0.0;
  bool _canResize = true;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(
              child: _createImage()
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _sliderValue,
      min: 0.0,
      max: 500.0,
      onChanged: (_canResize) ? (v) {
        _sliderValue = v;

        setState(() {

        });
      } : null,
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://cdn.dribbble.com/users/480393/screenshots/2493348/dribbble.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //   value: _canResize,
    //   onChanged: (v) {
    //     setState(() {
    //        _canResize = v;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _canResize,
      onChanged: (v) {
        setState(() {
           _canResize = v;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _canResize,
      onChanged: (v) {
        setState(() {
           _canResize = v;
        });
      },
    );
  }
}
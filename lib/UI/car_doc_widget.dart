import 'package:drives_scheduler/DATA/Model/car_doc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarDocWidget extends StatefulWidget {
  final CarDoc documment;
  const CarDocWidget({
    Key? key,
    required this.documment,
  }) : super(key: key);

  @override
  _CarDocWidgetState createState() => _CarDocWidgetState(documment);
}

class _CarDocWidgetState extends State<CarDocWidget> {
  _CarDocWidgetState(this._documment);

  final CarDoc _documment;
  bool _loading = true;
  bool _clickable = false;

  void isClickable() async {
    String url = _documment.DocPathName;
    if (await canLaunch(url))
      setState(() {
        _clickable = true;
      });
    //done loading when done waiting
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    isClickable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //load
    if (_loading) return Center(child: CircularProgressIndicator());
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        title: _clickable
            ? RichText(
                text: TextSpan(
                    text: '${_documment.DocTitle}',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launch(_documment.DocPathName);
                      },
                    style: TextStyle(
                      color: Colors.blue,
                    )))
            : Text('${_documment.DocTitle}'),
      ),
    );
  }
}

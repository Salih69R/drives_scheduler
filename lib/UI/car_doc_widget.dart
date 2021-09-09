import 'package:drives_scheduler/DATA/Model/car_doc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDocWidget extends StatelessWidget {
  CarDoc documment;

  CarDocWidget(
    this.documment,
  );

  @override
  Widget build(BuildContext context) {
    Widget divider = const Divider(
      color: Colors.grey,
      height: 10,
      thickness: 0.7,
      indent: 25,
      endIndent: 25,
    );
    return SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Title(
                  color: Colors.black,
                  child: Text(
                    '${documment.DocTitle}',
                  )),
              divider,
              Text('DocName: ${documment.DocName}'),
              Text('DocPathName: ${documment.DocPathName}'),
              Text('Code: ${documment.Code}'),

              // Title(color: Colors.black, child: Text('Title')),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text('Back'))
            ],
          ),
        ));
  }
}

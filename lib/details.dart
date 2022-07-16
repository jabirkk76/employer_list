import 'package:employee_app/controller.dart';
import 'package:employee_app/home_view.dart';
import 'package:employee_app/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class details extends StatelessWidget {
  details({Key? key, required this.dat, required this.color}) : super(key: key);
  ClassController b = ClassController();
  var dat;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(''),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: b.controller(),
            builder: (BuildContext context, AsyncSnapshot<MODEL> snapshot) {
              print(dat.name);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dat.name ?? "",
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            dat.experience.toString(),
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                      height: 120,
                      width: 330,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(22))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (c) {
                            return const homescreen();
                          }));
                        },
                        child: const Text('OK')),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

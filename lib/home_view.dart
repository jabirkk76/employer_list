import 'package:employee_app/employee_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 8, 226),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/6226e802de6107f5d8c0c25afc16bb71bf488b9634f159d107aaef6906b6ed61.0.JPG',
                scale: 1,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return Employee();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    child: Center(
                        child: Text(
                      'Employers',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                    height: 55,
                    width: 330,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 127, 125, 125),
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

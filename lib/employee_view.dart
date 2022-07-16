import 'package:employee_app/controller.dart';
import 'package:employee_app/details.dart';
import 'package:employee_app/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Employee extends StatelessWidget {
  Employee({Key? key}) : super(key: key);

  ClassController a = ClassController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'NAME',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 212, 5, 248),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: a.controller(),
            builder: (BuildContext context, AsyncSnapshot<MODEL> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              return Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 15),
                            child: Container(
                              height: 55,
                              width: 330,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22))),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 14, left: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return;
                                      }
                                      if (snapshot.data?.employeeDetails?[index]
                                                  .active ==
                                              true &&
                                          snapshot.data!.employeeDetails![index]
                                                  .experience! >=
                                              5) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (ctx) {
                                          return details(
                                            dat: snapshot
                                                .data?.employeeDetails?[index],
                                            color: Colors.green,
                                          );
                                        }));
                                      } else {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (ctx) {
                                          return details(
                                            color:
                                                Color.fromARGB(255, 235, 22, 6),
                                            dat: snapshot
                                                .data?.employeeDetails?[index],
                                          );
                                        }));
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Text(
                                        snapshot.data?.employeeDetails?[index]
                                                .name ??
                                            "",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

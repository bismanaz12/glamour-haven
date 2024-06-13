import 'package:beauty_app/cshipping.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC67416),
      body: Container(
        color: Color(0xffC67416),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 25,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Total',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Popp1',
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Chat',
                                fontSize: 20,
                              ),
                            ),
                            Text('\$500',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Chat',
                                  fontSize: 20,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text('\$800',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Chat',
                                  fontSize: 20,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text('\$300',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Chat',
                                  fontSize: 20,
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                'Payment Method',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Popp1',
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(400, 150),
                      shape: RoundedRectangleBorder(),
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                    onPressed: () {},
                    child: Image.asset('assets/images/images.png')),
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(300, 50),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {
                    showDialog(
                        context: context, builder: (context) => Shipping());
                  },
                  child: Text(
                    'Confirm Payment',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MeFont',
                        fontSize: 19),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

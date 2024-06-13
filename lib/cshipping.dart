import 'package:beauty_app/order.dart';
import 'package:flutter/material.dart';

class Shipping extends StatelessWidget {
  const Shipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        width: 300,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                height: 190,
                child: Image.asset(
                  'assets/images/download.png',
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 20,
            ),
            Text('Successfully Completed',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'MYFont',
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fixedSize: Size(230, 40)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Orders()));
                },
                child: Text(
                  'Continue Shipping',
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: 'MeFont'),
                ))
          ],
        ),
      ),
    );
  }
}

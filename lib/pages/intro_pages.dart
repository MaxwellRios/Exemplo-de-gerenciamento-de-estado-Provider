import 'package:flutter/material.dart';
import 'package:store/home_page.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo inicial
          Padding(
            padding: const EdgeInsets.all(90),
            child: Lottie.asset('lib/images/likeb.json'),
          ),

          //Text Bem vindo
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'We Deliver Groceries at your doorstep',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Text(
            'Fresh items everyday',
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),
          //get start button
          GestureDetector(
            onTap: (() => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                )),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(24),
                child: Text('Vamos Inciar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 25,
            ),
            // shop name
            Text(
              'SUSHI MAN',
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/assets/img/gunkan.png'),
            ),
            // title
            Text(
              'THE TASTE OF JAPANESE FOOD',
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            // subtitle
            const Text(
              'Feel the taste of the most popular Japanese food from anywhere and anytime',
              style: TextStyle(color: Colors.white60, height: 2),
            ),
            // get started button
            Button(
              text: 'Get Started!',
              onTap: () {
                // go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}

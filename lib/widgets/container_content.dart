import 'package:flutter/material.dart';
import 'package:taskat_apk/widgets/check_box.dart';

class ContainerContentWidget extends StatelessWidget {
  const ContainerContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 10,
        bottom: 10,
      ),
      child: Container(
        width: 360,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomChaeckBox(0, false),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                      top: 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'تمرین زبان انگلیسی',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('تمرین زبان انگلیسی کتاب آموزشگاه'),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/english.png',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 20,
              ),
              child: Row(
                children: [
                  Container(
                    width: 83,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Color(0xff18DAA3),
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '10:00',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Image.asset(
                          'assets/images/Time.png',
                          width: 16,
                          height: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 83,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Color(0xffE2F6F1),
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'ویرایش',
                          style: TextStyle(
                            color: Color(0xff18DAA3),
                          ),
                        ),
                        Image.asset(
                          'assets/images/Edit.png',
                          width: 16,
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

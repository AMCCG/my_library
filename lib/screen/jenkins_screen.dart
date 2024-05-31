import 'package:flutter/material.dart';

class JenkinsScreen extends StatelessWidget {
  const JenkinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    String title = arguments['title'] ?? 'Title';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.asset(
                "assets/images/jenkins.png",
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Jenkins คืออะไร?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "Jenkins เป็น Software (Tool) ตัวนึงที่เอามาใช้ทำ CI/CD (Continuous Integration/Continuous Delivery) เพื่อให้เราสามารถที่จะผลิตและส่งมอบ Software ไปยังผู้ใช้ได้อย่างต่อเนื่อง เกิดความราบรื่น และลดต้นทุนด้านเวลาในระหว่างการพัฒนา Software",
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "โดยอาศัยหลักการของ Automation คือ การทำทุกอย่างให้เป็นไปอย่างอัตโนมัติ ตั้งแต่",
                    ),
                    Text(
                      " • การ Build Source Code",
                    ),
                    Text(
                      " • การทดสอบ (Test) Source Code",
                    ),
                    Text(
                      " • การ Release Source Code",
                    ),
                    Text(
                      " • การ Deploy Source Code ไปยัง Environment ต่าง ๆ",
                    ),
                    Text(
                      "โดยไม่ต้องใช้คนทำ",
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

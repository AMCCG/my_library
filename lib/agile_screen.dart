import 'package:flutter/material.dart';

class AgileScreen extends StatelessWidget {
  const AgileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "Agile Methodology",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "คนเก่งๆเขาการจัดการโปรเจคยังไงให้มีประสิทธิภาพกันนะ ?",
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "Agile Manifesto มีไรบ้าง ?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "1. คนและการมีปฏิสัมพันธ์กัน มากกว่าการทำตามขั้นตอนและเครื่องมือ",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "2. ซอฟต์แวร์ที่นำไปใช้งานได้จริง มากกว่าเอกสารที่ครบถ้วนสมบูรณ์",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                  "3. ร่วมมือทำงานกับลูกค้า มากกว่าการต่อรองให้เป็นไปตามสัญญา"),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "4. การตอบรับกับการเปลี่ยนแปลง มากกว่าการทำตามแผนที่วางไว้",
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "หลักการเบื้องหลังคำแถลงอุดมการณ์แห่งอไจล์ (หลักปฏิบัติ 12 ข้อ)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "1. ความสำคัญสูงสุดของพวกเราคือความพึงพอใจของลูกค้า ที่มีต่อการส่งมอบซอฟท์แวร์ที่มีคุณค่าต่อลูกค้า ตั้งแต่ต้นอย่างต่อเนื่อง",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "2. ยอมรับการเปลี่ยนแปลงความต้องการของลูกค้าแม้ในช่วงท้ายของการพัฒนา เพราะอไจล์สามารถแปรเอาความเปลี่ยนแปลง มาเป็นความได้เปรียบในการแข่งขันของลูกค้า",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "3. ส่งมอบซอฟท์แวร์ที่ใช้งานได้จริงอย่างสม่ำเสมอ อาจเป็นทุกสองถึงสามสัปดาห์หรือทุกสองถึงสามเดือน โดยควรทำให้ระยะเวลาระหว่างการส่งมอบนั้นสั้นที่สุดเท่าที่เป็นไปได้",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "4. ตัวแทนจากฝ่ายธุรกิจและนักพัฒนา จะต้องทำงานร่วมกันเป็นประจำทุกวันตลอดโครงการ",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "5. ทำให้แน่ใจว่าสมาชิกโครงการเข้าใจและมีจุดมุ่งหมายของโครงการร่วมกัน สร้างสภาวะแวดล้อมและให้การสนับสนุนในสิ่งที่พวกเขาต้องการ และให้ความไว้วางใจแก่พวกเขาในการที่จะทำงานให้บรรลุเป้าหมายนั้น",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "6. วิธีที่มีประสิทธิภาพและประสิทธิผลสูงสุดในการถ่ายทอดข้อมูลต่างๆ ไปสู่ทีมพัฒนาและภายในทีมพัฒนาเองคือการพูดคุยแบบซึ่งหน้า",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "7. ซอฟท์แวร์ที่ใช้งานได้จริงเป็นตัวหลักในการวัดความก้าวหน้าของโครงการ",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "8. กระบวนการอไจล์สนับสนุนให้เกิดการพัฒนาแบบยั่งยืน กล่าวคือผู้สนับสนุนนักพัฒนา และตัวแทนผู้ใช้ควรจะสามารถรักษาอัตราเร็วในการทำงานร่วมกันให้คงที่ได้ตลอดไป",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "9. การใส่ใจในความเป็นเลิศทางเทคนิค และงานออกแบบที่ดีอย่างต่อเนื่องจะช่วยเพิ่มความเป็นอไจล์",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "10. ความเรียบง่าย หรือศิลปะในการทำงานอย่างพอเพียง นั้นสำคัญยิ่ง",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "11. สถาปัตยกรรมซอฟต์แวร์ ความต้องการของลูกค้า และงานออกแบบที่ดีที่สุด เกิดจากทีมที่บริหารจัดการตัวเองได้",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "12. ทุกช่วงเวลาหนึ่งเป็นประจำ ทีมจะต้องย้อนกลับไปตรองดูสิ่งที่ผ่านมา เพื่อหาทางที่จะพัฒนาความมีประสิทธิผลของทีมแล้วนำสิ่งเหล่านั้นมาปรับปรุงและเปลี่ยนแปลงพฤติกรรมของทีม",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}

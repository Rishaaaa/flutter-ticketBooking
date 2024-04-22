import 'package:flutter/material.dart';
import 'package:ticket_booking/screens/custom_container.dart';
import 'package:ticket_booking/utils/app_styles.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.vehicle1,
    required this.vehicle2,
    required this.place1,
    required this.place2,
    required this.amount,
  }) : super(key: key);

  final String vehicle1;
  final String vehicle2;
  final String place1;
  final String place2;
  final String amount;

  @override
  _DetailPageState createState() => _DetailPageState();
}

Widget _buildImageContainer(String imagePath, String name, String amount) {
  return Column(
    children: [
      Container(
        height: 75,
        width: 75,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Styles.bgColor,
          boxShadow: [
            BoxShadow(
              color: Styles.bgColor.withOpacity(0.5),
              spreadRadius: 6,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}

Widget _buildLocationContainer(String place, String timing, Color color) {
  return Container(
    height: 50,
    margin: const EdgeInsets.only(bottom: 5, right: 50, left: 50),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        Icon(Icons.location_on, color: color),
        SizedBox(width: 8),
        Text(
          place,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8),
        Text(
          timing,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + 10), paint);
      startY += 20;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _DetailPageState extends State<DetailPage> {
  String? selectedOption = 'Myself';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "<",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        title: Text("Details",style: Styles.headLineStyle6,),
      ),
      body: ListView(
        children: [
          CustomContainer(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Styles.bgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(widget.vehicle1, style: Styles.headLineStyle3),
                      const SizedBox(width: 8),
                      Text(widget.vehicle2, style: Styles.headLineStyle3),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.amount,
                            style: Styles.headLineStyle7,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildLocationContainer(widget.place1,
                                "[10:00 AM - 11:30 AM]", Colors.green[300]!),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildImageContainer("assets/images/bus.png",
                                    "Your Name", "Amount"),
                                const SizedBox(width: 40),
                                CustomPaint(
                                  size: const Size(80, 80),
                                  painter: DottedLinePainter(),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bus",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "₹ 50 /-",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            _buildLocationContainer("Adyar",
                                "[11:30 AM - 12:00 PM]", Colors.grey[400]!),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildImageContainer(
                                    widget.vehicle2 == "+ Car"
                                        ? "assets/images/bus.png"
                                        : "assets/images/train.png",
                                    "Your Name",
                                    "Amount"),
                                const SizedBox(width: 40),
                                CustomPaint(
                                  size: const Size(80, 80),
                                  painter: DottedLinePainter(),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.vehicle2 == "+ Car"
                                          ? "Bus"
                                          : "Train",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "₹ 45 /-",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            _buildLocationContainer("Selam",
                                "[12:00 PM - 01:30 PM]", Colors.grey[400]!),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildImageContainer("assets/images/cab.png",
                                    "Your Name", "Amount"),
                                const SizedBox(width: 40),
                                CustomPaint(
                                  size: const Size(80, 80),
                                  painter: DottedLinePainter(),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Car",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "₹ 50 /-",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            _buildLocationContainer(widget.place2,
                                "[01:30 PM - 02:00 PM]", Colors.purple[300]!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.purple.shade300,
                          Colors.blue.shade300,
                          Colors.green.shade300,
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Proceed to Book",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
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

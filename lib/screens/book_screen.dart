import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/screens/custom_container.dart';
import 'package:ticket_booking/screens/detail_screen.dart';
// import 'package:ticket_booking/screens/home_screen.dart';
import 'package:ticket_booking/utils/app_styles.dart';

class BookPage extends StatefulWidget {
  const BookPage(
      {Key? key,
      required this.selectedDate,
      required this.selectedTime,
      required this.adultsCount,
      required this.infantsCount,
      required this.dropdownvalue1,
      required this.dropdownvalue2})
      : super(key: key);

  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final int adultsCount;
  final int infantsCount;
  final String dropdownvalue1;
  final String dropdownvalue2;

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  String? selectedOption = 'Myself';
  String? selectedImage;
  String? selectedAutoCabMoto;
  String? selectedTrainMetroBus;
  bool isBookedCard1 = false;
  bool isBookedCard2 = false;
  late DateTime? selectedDate;
  late TimeOfDay? selectedTime;
  late int adultsCount;
  late int infantsCount;
  late String dropdownvalue1;
  late String dropdownvalue2;

  @override
  void initState() {
    super.initState();
    // Assign values from widget to state variables
    selectedDate = widget.selectedDate;
    selectedTime = widget.selectedTime;
    adultsCount = widget.adultsCount;
    infantsCount = widget.infantsCount;
    dropdownvalue1 = widget.dropdownvalue1;
    dropdownvalue2 = widget.dropdownvalue2;
  }

  Map<String, bool> isHoveredMap = {
    "train": false,
    "bus": false,
    "metro": false,
    "cab": false,
    "auto": false,
    "moto": false,
  };

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
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 5),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

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
        title: Text("Bookings", style: Styles.headLineStyle6,),
      ),
      body: ListView(
        children: [
          const CustomContainer(),
          const SizedBox(height: 10),
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
                      Text(dropdownvalue1, style: Styles.headLineStyle3),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_right_alt_outlined),
                      const SizedBox(width: 8),
                      Text(dropdownvalue2, style: Styles.headLineStyle3),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurple.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.deepPurple),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Icon(Icons.calendar_today, color: Colors.deepPurple),
                      SizedBox(width: 8),
                      Text(
                        '${DateFormat('E, MMM d, y').format(selectedDate!)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 50),
                      const Icon(Icons.access_time, color: Colors.deepPurple),
                      SizedBox(width: 8),
                      Text(
                        '${selectedTime!.format(context)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10),
                      Container(
                        child: const Row(
                          children: [
                            Icon(Icons.directions, color: Colors.deepPurple),
                            SizedBox(width: 8),
                            Text(
                              "Single Journey",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Colors.deepPurple),
                            SizedBox(width: 8),
                            Text(
                              "Adults: ${widget.adultsCount}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.child_care, color: Colors.deepPurple),
                            SizedBox(width: 8),
                            Text(
                              "Children: ${widget.infantsCount}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                decoration: BoxDecoration(
                  color: Styles.bgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Available Packages",
                      style: Styles.headLineStyle3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Text("Bus", style: Styles.headLineStyle3),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_right_alt_outlined),
                              const SizedBox(width: 8),
                              Text("Car", style: Styles.headLineStyle3),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "₹ 145 /-",
                                      style: Styles.headLineStyle7,
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildImageContainer(
                                  "assets/images/bus.png", "Bus-A/C", "₹ 45"),
                              const Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.deepPurple,
                              ),
                              _buildImageContainer(
                                  "assets/images/bus.png", "Bus-Ord", "₹ 60"),
                              const Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.deepPurple,
                              ),
                              _buildImageContainer(
                                  "assets/images/cab.png", "Car-Suv", "₹ 40"),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isBookedCard1 = !isBookedCard1;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: isBookedCard1
                                        ? Colors.grey
                                        : Colors.green,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: Text(
                                    isBookedCard1 ? "Booked" : "Book",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            place1: dropdownvalue1,
                                            place2: dropdownvalue2,
                                            vehicle1: "Bus",
                                            vehicle2: "+ Car",
                                            amount: "₹ 145 /-")),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: const Text(
                                    "Details",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First Row
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Text("Bus", style: Styles.headLineStyle3),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_right_alt_outlined),
                              const SizedBox(width: 8),
                              Text("Train", style: Styles.headLineStyle3),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_right_alt_outlined),
                              const SizedBox(width: 8),
                              Text("Car", style: Styles.headLineStyle3),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "₹ 120 /-",
                                      style: Styles.headLineStyle7,
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildImageContainer(
                                  "assets/images/bus.png", "Bus-Ord", "₹ 10"),
                              const Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.deepPurple,
                              ),
                              _buildImageContainer(
                                  "assets/images/train.png", "Train", "₹ 10"),
                              const Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.deepPurple,
                              ),
                              _buildImageContainer(
                                  "assets/images/cab.png", "Car_Suv", "₹ 100"),
                            ],
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isBookedCard2 = !isBookedCard2;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: isBookedCard2
                                        ? Colors.grey
                                        : Colors.green,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: Text(
                                    isBookedCard2 ? "Booked" : "Book",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            place1: dropdownvalue1,
                                            place2: dropdownvalue2,
                                            vehicle1: "Bus",
                                            vehicle2: "+ Train + Car",
                                            amount: "₹ 120 /-")),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: const Text(
                                    "Details",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

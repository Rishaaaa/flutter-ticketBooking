import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/screens/book_screen.dart';
import 'package:ticket_booking/screens/custom_container.dart';
import 'package:ticket_booking/utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedOption = 'Myself';
  bool isSwapped = false;
  String? selectedImage;
  String? selectedAutoCabMoto;
  String? selectedTrainMetroBus;
  bool isParkingBooked = false;
  String dropdownValue1 = 'Chennai';
  String dropdownValue2 = 'Bangalore';
  DateTime? _selectedDate = DateTime.now();
  TimeOfDay? _selectedTime = TimeOfDay.now();
  int adultsCount = 1;
  int infantsCount = 0;

  Map<String, bool> isHoveredMap = {
    "train": false,
    "bus": false,
    "metro": false,
    "cab": false,
    "auto": false,
    "moto": false,
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Widget _buildImageContainer(
      String imagePath, String name, String boxKey, String groupKey) {
    final bool isSelected = groupKey == "trainMetroBus"
        ? selectedTrainMetroBus == name
        : selectedAutoCabMoto == name;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHoveredMap[boxKey] = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHoveredMap[boxKey] = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (groupKey == "trainMetroBus") {
              selectedTrainMetroBus = name;
            } else if (groupKey == "autoCabMoto") {
              selectedAutoCabMoto = name;
            }
          });
        },
        child: Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? Colors.deepPurple
                : isHoveredMap[boxKey]!
                    ? Styles.bgColor.withOpacity(0.8)
                    : Styles.bgColor,
            boxShadow: [
              BoxShadow(
                color: Styles.orangeColor.withOpacity(0.5),
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
                width: 30,
                height: 30,
              ),
              const SizedBox(height: 5),
              Text(
                name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomContainer(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Styles.bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.only(bottom: 5, right: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: const Border(
                                left: BorderSide(
                                  color: Colors.green,
                                  width: 5,
                                ),
                              ),
                            ),
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: isSwapped
                                      ? dropdownValue2
                                      : dropdownValue1,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      isSwapped
                                          ? dropdownValue2 = newValue!
                                          : dropdownValue1 = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Chennai',
                                    'Bangalore',
                                    'Hosur',
                                    'Mysore'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.only(bottom: 5, right: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: const Border(
                                left: BorderSide(
                                  color: Colors.deepPurple,
                                  width: 5,
                                ),
                              ),
                            ),
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: isSwapped
                                      ? dropdownValue1
                                      : dropdownValue2,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      isSwapped
                                          ? dropdownValue1 = newValue!
                                          : dropdownValue2 = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Chennai',
                                    'Bangalore',
                                    'Hosur',
                                    'Mysore'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Primary Services",
                            style: Styles.headLineStyle3,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildImageContainer("assets/images/train.png",
                                  "Train", "train", "trainMetroBus"),
                              _buildImageContainer("assets/images/bus.png",
                                  "Bus", "bus", "trainMetroBus"),
                              _buildImageContainer("assets/images/metro.png",
                                  "Metro", "metro", "trainMetroBus"),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Secondary Services",
                            style: Styles.headLineStyle3,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildImageContainer("assets/images/cab.png",
                                  "Cab", "cab", "autoCabMoto"),
                              _buildImageContainer("assets/images/auto.png",
                                  "Auto", "auto", "autoCabMoto"),
                              _buildImageContainer("assets/images/moto.png",
                                  "Moto", "moto", "autoCabMoto"),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        right: 50,
                        top: 50,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSwapped = !isSwapped;
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.swap_vert,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Styles.bgColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.location_on,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Parking",
                      style: Styles.headLineStyle4,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isParkingBooked = !isParkingBooked;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isParkingBooked ? Colors.grey : Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Text(
                        isParkingBooked ? "Booked" : "Book Parking",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Styles.bgColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Scheduled Date & Time",
                      style: Styles.headLineStyle6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: const Border(
                                  left: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 3,
                                  ),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 8),
                                  Text(
                                    _selectedDate != null
                                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                        : '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.deepPurple,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectTime(context),
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: const Border(
                                  left: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 3,
                                  ),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 8),
                                  Text(
                                    _selectedTime != null
                                        ? DateFormat('hh:mm a').format(
                                            DateTime(
                                                2022,
                                                1,
                                                1,
                                                _selectedTime!.hour,
                                                _selectedTime!.minute),
                                          )
                                        : DateFormat('hh:mm a')
                                            .format(DateTime.now()),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.deepPurple,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Styles.bgColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Passengers",
                      style: Styles.headLineStyle6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      const Row(
                                        children: [
                                          SizedBox(width: 8),
                                          Icon(
                                            Icons.person,
                                            color: Colors.deepPurple,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "No of Adults",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey[300],
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                setState(() {
                                                  if (adultsCount > 0)
                                                    adultsCount--;
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Colors.grey[300]!,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              adultsCount
                                                  .toString(), 
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey[300],
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  adultsCount++;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      const Row(
                                        children: [
                                          SizedBox(width: 8),
                                          Icon(
                                            Icons.child_friendly,
                                            color: Colors.deepPurple,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "No of Infants",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey[300],
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                setState(() {
                                                  if (infantsCount > 0) {
                                                    infantsCount--;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Colors.grey[300]!,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              infantsCount.toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey[300],
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  infantsCount++;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
          ),
          const SizedBox(height: 10),
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
                    if (adultsCount < 1) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Cannot Book"),
                            content:
                                const Text("Adults count should be 1 and above."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookPage(
                            selectedDate: _selectedDate,
                            selectedTime: _selectedTime,
                            adultsCount: adultsCount,
                            infantsCount: infantsCount,
                            dropdownvalue1:
                                isSwapped ? dropdownValue2 : dropdownValue1,
                            dropdownvalue2:
                                isSwapped ? dropdownValue1 : dropdownValue2,
                          ),
                        ),
                      );
                    }
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

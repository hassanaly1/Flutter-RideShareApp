import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/home/payment_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class BookingBusSeatScreen extends StatefulWidget {
  const BookingBusSeatScreen({Key? key}) : super(key: key);

  @override
  _BookingBusSeatScreenState createState() => _BookingBusSeatScreenState();
}

class _BookingBusSeatScreenState extends State<BookingBusSeatScreen> {
  List<Seat> seats = List.generate(4, (index) {
    if (index == 3) {
      return Seat(index + 1, 20.0, false, isDriverSeat: true);
    } else {
      return Seat(index + 1, 20.0, false);
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Bus Booking Seat'),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                ),
                itemCount: seats.length,
                itemBuilder: (context, index) {
                  final seat = seats[index];
                  return _SeatLayout(seat);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black87,
        onPressed: _showSelectedSeats,
        label: CustomTextWidget(
          text: 'Show Selected Seats',
          textColor: Colors.white,
        ),
        icon: const Icon(
          Icons.event_seat,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _toggleSeatSelection(Seat seat) {
    if (!seat.isDriverSeat) {
      setState(() {
        seat.isSelected = !seat.isSelected;
      });
    }
  }

  void _showSelectedSeats() {
    final selectedSeats = seats.where((seat) => seat.isSelected).toList();
    if (selectedSeats.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const CustomTextWidget(
              text: 'No Seats Selected',
              fSize: 20,
              fWeight: FontWeight.w400,
            ),
            content: const CustomTextWidget(
              text: 'Please select at least one seat.',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const CustomTextWidget(text: 'OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    String selectedSeatNumbers = '';
    double totalPrice = 0;

    for (final seat in selectedSeats) {
      selectedSeatNumbers += '${seat.number}, ';
      totalPrice += seat.price;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const CustomTextWidget(
            text: 'Selected Seats',
            fSize: 20,
            fWeight: FontWeight.w400,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextWidget(
                text: 'Seat Numbers: ${selectedSeatNumbers.substring(
                  0,
                  selectedSeatNumbers.length - 2,
                )}',
                fSize: 18,
              ),
              const SizedBox(height: 10),
              CustomTextWidget(
                text: 'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                fSize: 18,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.to(PaymentScreen(), transition: Transition.rightToLeft);
              },
              child: const CustomTextWidget(text: 'Pay'),
            ),
          ],
        );
      },
    );
  }

  Widget _SeatLayout(Seat seat) {
    return GestureDetector(
      onTap: () {
        if (!seat.isDriverSeat) {
          _toggleSeatSelection(seat);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              seat.number.toString(),
              style: TextStyle(
                color: seat.isSelected
                    ? Color.fromARGB(255, 182, 16, 16)
                    : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Image.asset(
              'assets/seat.png',
              height: 35,
              alignment: Alignment.center,
              color: seat.isSelected
                  ? Color.fromARGB(255, 182, 16, 16)
                  : Colors.black45,
            ),
            if (seat.isDriverSeat)
              Text(
                'Driver',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Seat {
  final int number;
  final double price;
  bool isSelected;
  final bool isDriverSeat;

  Seat(this.number, this.price, this.isSelected, {this.isDriverSeat = false});
}

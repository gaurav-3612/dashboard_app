import 'package:flutter/material.dart';
import 'constants.dart';

class RightSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBlue,
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          // FIX: Wrap icons to prevent overflow on narrow width
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.calendar_today, color: Colors.white70),
              Icon(Icons.notifications, color: Colors.white70),
              Icon(Icons.power_settings_new, color: Colors.white70),
              CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      NetworkImage("https://i.pravatar.cc/150?img=12")),
            ],
          ),
          SizedBox(height: 30),
          // FIX: Allow text to wrap if needed
          Text(
            "GENERAL 10:00 AM TO 7:00 PM",
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          _buildCalendar(),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Today Birthday",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          _buildEventCard(
              "Total", "2", "Birthday Wishing", Colors.purpleAccent),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Anniversary",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          _buildEventCard(
              "Total", "3", "Anniversary Wishing", Colors.pinkAccent),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("OCT 2023", style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: "Mo Tu We Th Fr Sa Su"
                .split(" ")
                .map((e) =>
                    Text(e, style: TextStyle(color: Colors.grey, fontSize: 12)))
                .toList(),
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 20,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, mainAxisSpacing: 10),
            itemBuilder: (context, index) => Center(
              child: Text(
                "${index + 10}",
                style: TextStyle(
                    color: index == 5 ? Colors.white : Colors.black,
                    backgroundColor:
                        index == 5 ? Colors.purple : Colors.transparent),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(
      String label, String count, String btnText, Color color) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      NetworkImage("https://i.pravatar.cc/150?img=30")),
              SizedBox(width: 10),
              CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      NetworkImage("https://i.pravatar.cc/150?img=40")),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(color: Colors.grey)),
              Text("|", style: TextStyle(color: Colors.grey)),
              Text(count,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(btnText,
                    style: TextStyle(color: Colors.white, fontSize: 12))),
          )
        ],
      ),
    );
  }
}

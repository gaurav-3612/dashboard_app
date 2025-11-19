import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'constants.dart';
import 'responsive.dart';

class MiddleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightColor,
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: kDefaultPadding),
          _buildBanner(),
          SizedBox(height: kDefaultPadding),
          Responsive(
            mobile: Column(
              children: [
                _buildProjectCard(),
                SizedBox(height: kDefaultPadding),
                _buildCreatorsCard(),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildProjectCard()),
                SizedBox(width: kDefaultPadding),
                Expanded(child: _buildCreatorsCard()),
              ],
            ),
            // For tablet, we use the desktop layout logic but it handles resizing better
            tablet: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildProjectCard()),
                SizedBox(width: kDefaultPadding),
                Expanded(child: _buildCreatorsCard()),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Text("Over All Performance",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: kDefaultPadding),
          Container(
            height: 250,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: _buildChart(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        Text("Home",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        if (Responsive.isDesktop(context)) Spacer(), // Only spacer on desktop
        if (!Responsive.isDesktop(context))
          SizedBox(width: 10), // Small gap on mobile

        // SEARCH BAR: Expanded on Mobile/Tablet to prevent overflow
        Responsive.isDesktop(context)
            ? Container(
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              )
            : Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: kBannerGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ETHEREUM 2.0", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 10),
          Text("Top Rating\nProject",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Trending project and high rating\nProject Created by team",
              style: TextStyle(color: Colors.white70)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
            child: Text("Learn More", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("All Projects",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          _buildProjectItem(
              "Technology behind the Blockchain", Colors.redAccent),
          _buildProjectItem(
              "Technology behind the Blockchain", Colors.blueAccent),
          _buildProjectItem(
              "Technology behind the Blockchain", Colors.greenAccent),
        ],
      ),
    );
  }

  Widget _buildProjectItem(String title, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(width: 40, height: 40, color: color), // Placeholder image
          SizedBox(width: 10),
          // FIX: Expanded + TextOverflow to prevent overflow on small screens
          Expanded(
              child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
          SizedBox(width: 8),
          Icon(Icons.edit, color: Colors.white70, size: 16),
        ],
      ),
    );
  }

  Widget _buildCreatorsCard() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top Creators",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Name", style: TextStyle(color: Colors.grey, fontSize: 10)),
              Text("Artworks",
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
              Text("Rating",
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
          SizedBox(height: 10),
          _buildCreatorRow("@maddison_c21", 9821),
          _buildCreatorRow("@karl_will02", 7032),
          _buildCreatorRow("@maddison_c21", 9821),
          _buildCreatorRow("@maddison_c21", 9821),
        ],
      ),
    );
  }

  Widget _buildCreatorRow(String name, int score) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          CircleAvatar(radius: 10, backgroundColor: Colors.grey),
          SizedBox(width: 5),
          // FIX: Expanded + TextOverflow
          Expanded(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 11),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text("$score", style: TextStyle(color: Colors.white, fontSize: 11)),
          SizedBox(width: 10),
          Container(
            height: 4,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 30)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 30)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 10),
              FlSpot(2, 25),
              FlSpot(4, 15),
              FlSpot(6, 40),
              FlSpot(8, 20),
              FlSpot(10, 35),
            ],
            isCurved: true,
            color: Colors.purpleAccent,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
                show: true, color: Colors.purpleAccent.withOpacity(0.2)),
          ),
          LineChartBarData(
            spots: [
              FlSpot(0, 20),
              FlSpot(2, 10),
              FlSpot(4, 30),
              FlSpot(6, 20),
              FlSpot(8, 45),
              FlSpot(10, 30),
            ],
            isCurved: true,
            color: Colors.blueAccent,
            barWidth: 4,
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}

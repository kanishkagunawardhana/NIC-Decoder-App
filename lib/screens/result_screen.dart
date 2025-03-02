import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/nic_controller.dart';

class ResultScreen extends StatelessWidget {
  final NICController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NIC Details", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.result.isEmpty) {
            return Center(
              child: Text(
                "No Data Available",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }
          return Column(
            children: [
              _buildInfoCard(Icons.cake, "Birth Year", controller.result['birthYear']),
              _buildInfoCard(Icons.calendar_today, "Birth Date", "${controller.result['birthDate']}"),
              _buildInfoCard(Icons.event, "Day of the Week", controller.result['dayOfWeek']),
              _buildInfoCard(Icons.person, "Gender", controller.result['gender']),
              _buildInfoCard(Icons.timeline, "Age", "${controller.result['age']} years"),
              _buildInfoCard(
                  controller.result['canVote'] ? Icons.how_to_vote : Icons.block,
                  "Can Vote",
                  controller.result['canVote'] ? "Yes" : "No",
                  color: controller.result['canVote'] ? Colors.green : Colors.red),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value, {Color color = Colors.black}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple, size: 30),
        title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: TextStyle(fontSize: 18, color: color)),
      ),
    );
  }
}


class NICDecoder {
  static Map<String, dynamic> decode(String nic) {
    bool isNewFormat = nic.length == 12;

    String birthYear = isNewFormat ? nic.substring(0, 4) : "19${nic.substring(0, 2)}";
    int dayOfYear = int.parse(isNewFormat ? nic.substring(4, 7) : nic.substring(2, 5));
    String serialNumber = isNewFormat ? nic.substring(7) : nic.substring(5, 9);
    bool canVote = !isNewFormat && nic.toUpperCase().endsWith("V");

    String gender = dayOfYear > 500 ? "Female" : "Male";
    if (dayOfYear > 500) dayOfYear -= 500;

    DateTime birthDate = DateTime(int.parse(birthYear), 1, 1).add(Duration(days: dayOfYear - 1));
    int age = DateTime.now().year - birthDate.year;

    return {
      "birthYear": birthYear,
      "birthDate": birthDate,
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"][birthDate.weekday - 1],
      "gender": gender,
      "age": age,
      "serialNumber": serialNumber,
      "canVote": canVote
    };
  }
}

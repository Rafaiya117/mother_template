class Utils {
  // Email validation
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  // Phone number validation (basic)
  static bool isValidPhone(String phone) {
    return phone.length >= 10;
  }

  // Date formatting
  static String formatDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }

  // Capitalize first letter
  static String capitalize(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }

  // Safe parse int
  static int parseInt(dynamic value, {int fallback = 0}) {
    try {
      return int.parse(value.toString());
    } catch (_) {
      return fallback;
    }
  }
}

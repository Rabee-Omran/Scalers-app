import '../resources/strings_manager.dart';

String generateResponseErrorMessage(Map<String, dynamic> response,
    [bool showFieldName = false]) {
  List errorMessages = [];

  response.forEach((key, value) {
    if (value is List) {
      if (showFieldName) {
        errorMessages
            .addAll(["$key: ${value.map((e) => e).toList().join(",")}"]);
      } else {
        errorMessages.addAll(value);
      }
    }
  });

  String errorMessage = errorMessages.join('\n');
  return errorMessage.isNotEmpty
      ? errorMessage
      :AppStrings.someThingWentWrong;
}

// ignore_for_file: file_names

class CalculateManager {
  // ignore: non_constant_identifier_names
  int CalculateBMI(int height, int weight, int age) {
    int bodyMassIndex = 0;

    height = height * height;
    int heightPercent = (height ~/ 10000);
    bodyMassIndex = (weight ~/ heightPercent);

    return bodyMassIndex;
  }

  String evaluateBMIResult(int bodyMassIndex) {
    String result = 'result could not be evaluated';

    if (bodyMassIndex >= 25) {
      result = "Overweight";
    } else if (bodyMassIndex >= 18.5) {
      result = "Normal";
    } else {
      result = "Underweight";
    }

    return result;
  }

  String getComment(int bodyMassIndex) {
    if (bodyMassIndex >= 25) {
      return "You have a higher than normal bodyweight.";
    } else if (bodyMassIndex >= 18.5) {
      return "You have a normal bodyweight. Good job!";
    } else {
      return "You have a lower than normal bodyweight. Try to eat more.";
    }
  }
}

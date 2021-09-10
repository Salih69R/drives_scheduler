import 'package:drives_scheduler/DATA/Model/Car/car.dart';

bool isDateFarEnough(String? date) {
  // date = 'dd/mm/yyyy'
  if (date == null) return false;

  int day = int.parse(date.substring(0, 2));
  int month = int.parse(date.substring(3, 5));
  int year = int.parse(date.substring(6, 10));
  DateTime today = DateTime.now();
  return year * 365 + month * 30 + day >=
      today.year * 365 + (today.month + 1) * 30 + today.day;
}

bool isCarDatesValid(Car car) {
  if (!isDateFarEnough(car.AdminDate)) return false;
  if (!isDateFarEnough(car.VInsuDate)) return false;
  if (!isDateFarEnough(car.VTestDate)) return false;
  if (!isDateFarEnough(car.BrakesDate)) return false;
  if (!isDateFarEnough(car.WinterDate)) return false;
  if (!isDateFarEnough(car.ActivatDate)) return false;

  return true;
}

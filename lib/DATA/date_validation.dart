import 'package:drives_scheduler/data/model/car/car.dart';

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

int carCountUnValidDates(Car car) {
  int count = 0;
  if (!isDateFarEnough(car.AdminDate)) ++count;
  if (!isDateFarEnough(car.VInsuDate)) ++count;
  if (!isDateFarEnough(car.VTestDate)) ++count;
  if (!isDateFarEnough(car.BrakesDate)) ++count;
  if (!isDateFarEnough(car.WinterDate)) ++count;
  if (!isDateFarEnough(car.ActivatDate)) ++count;

  return count;
}

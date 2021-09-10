import 'package:drives_scheduler/DATA/Model/car.dart';

bool isDateFarEnough(String? date) {
  //TODO: get today
  //  return trueif  Date >= today + month -> okay

  //var string = 'dartlang';
// string.substring(1);    // 'artlang'
// string.substring(1, 4); // 'art'

  // date = 'dd/mm/yyyy'
  if (date == null) return false;

  int day = int.parse(date.substring(0, 2));
  int month = int.parse(date.substring(3, 5));
  int year = int.parse(date.substring(6, 10));
  // print('date = $date\nday = $day, month = $month, year = $year');
  DateTime today = DateTime.now();
  return year * 365 + month * 30 + day >=
      today.year * 365 + (today.month + 1) * 30 + today.day;
}

bool isCarDatesValid(Car car) {
  print('car number ${car.VehNumber}');
  if (!isDateFarEnough(car.AdminDate)) {
    print('car.AdminDate ${car.AdminDate}');
    return false;
  }
  if (!isDateFarEnough(car.VInsuDate)) {
    print('car.VInsuDate ${car.VInsuDate}');
    return false;
  }
  if (!isDateFarEnough(car.VTestDate)) {
    print('car.VTestDate ${car.VTestDate}');
    return false;
  }
  if (!isDateFarEnough(car.BrakesDate)) {
    print('car.BrakesDate ${car.BrakesDate}');
    return false;
  }
  if (!isDateFarEnough(car.WinterDate)) {
    print('car.WinterDate ${car.WinterDate}');
    return false;
  }
  if (!isDateFarEnough(car.ActivatDate)) {
    print('car.ActivatDate ${car.ActivatDate}');
    return false;
  }
  print('all dates valid');
  return true;
}

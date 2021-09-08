//
//

// screen 1 - all cars in the system - invoke api - fget allcars
// taping a car opens a detailed car page view - includes: sublist of all possible cars (from these^^)

// bus/trimp rides scheduling app

//  many drivers, each has a couple of cars he can use,
//  and scheduled drives for him for the next epoch of work
//  (a day or a weak)

//  each ride has clients that need to be picked up, at a certain times and locations

// a car has many documents (legal documents like licence, betua7...)
//

import 'package:flutter/material.dart';

class Location {
} //used for Location, TODO: get library for physical adresses/ gps locations

class Driver {
  String IDstr;

  String name;
  List<Car> cars; // might be List<int> that saves just the id of the car
  List<ScheduledDrive>
      drives; // might be List<String> that saves the IDstr of the ride

  Driver(this.IDstr, this.cars, this.drives, this.name);
}

class CarDoc {}

class Car {
  int IDint;

  List<CarDoc> docs;
  List<ScheduledDrive>
      drives; // might be List<String> that saves the IDstr of the ride
  List<Driver>
      drivers; // might be List<String> that saves the IDstr of the driver
  Car(this.IDint, this.drivers, this.drives, this.docs);
}

class ScheduledDrive {
  String IDstr;

  Car car;
  Driver driver;
  List<Passenger> passengers;
  Location start_location;
  Location end_location;
  TimeOfDay start_time;
  TimeOfDay end_time;

  ScheduledDrive(this.IDstr, this.car, this.driver, this.end_location,
      this.end_time, this.passengers, this.start_location, this.start_time);
}

class Passenger {
  String IDstr;

  String name;
  Location pickup_location;
  Location destination_location;
  TimeOfDay pickup_time;
  //maybe add arrival_time

  Passenger(this.IDstr, this.name, this.destination_location,
      this.pickup_location, this.pickup_time);
}

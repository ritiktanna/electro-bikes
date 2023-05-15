abstract class PhoneEvent {}

class PhoneChangeEvent extends PhoneEvent {
  String number;
  PhoneChangeEvent(this.number);
}

class PhoneNumberSubmitEvent extends PhoneEvent {
  String number;
  PhoneNumberSubmitEvent(this.number);
}

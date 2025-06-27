

String phoneAddDash(String phoneNum) {
  if (phoneNum.length >= 4) {
    return '${phoneNum.substring(0, 2)}-${phoneNum.substring(2)}';
  }
  return phoneNum;
}

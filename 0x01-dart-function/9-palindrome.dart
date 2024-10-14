bool isPalindrome(String s) {
  if (s.length < 3) {
    return false;
  }

  String normalizedString = s.toLowerCase();
  return normalizedString == normalizedString.split('').reversed.join('');
}

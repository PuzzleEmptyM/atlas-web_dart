bool isPalindrome(String s) {
  if (s.length < 3) {
    return false;
  }
  String normalizedString = s.toLowerCase();
  return normalizedString == normalizedString.split('').reversed.join('');
}

String longestPalindrome(String s) {
  String longest = "none";
  int maxLength = 0;

  for (int i = 0; i < s.length; i++) {
    for (int j = i + 3; j <= s.length; j++) {
      String substring = s.substring(i, j);
      if (isPalindrome(substring) && substring.length > maxLength) {
        longest = substring;
        maxLength = substring.length;
      }
    }
  }

  return longest;
}

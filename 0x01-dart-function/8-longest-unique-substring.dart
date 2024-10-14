String longestUniqueSubstring(String str) {
  int n = str.length;
  String longestSubstr = '';
  int left = 0;
  Map<String, int> seen = {};

  for (int right = 0; right < n; right++) {
    String currentChar = str[right];

    if (seen.containsKey(currentChar) && seen[currentChar]! >= left) {
      left = seen[currentChar]! + 1;
    }

    seen[currentChar] = right;

    if (right - left + 1 > longestSubstr.length) {
      longestSubstr = str.substring(left, right + 1);
    }
  }

  return longestSubstr;
}

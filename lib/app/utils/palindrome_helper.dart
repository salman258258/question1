bool isPalindrome(String input) {
  final cleaned = input.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  if (cleaned.isEmpty) return false;

  final reversed = String.fromCharCodes(cleaned.runes.toList().reversed);
  return cleaned == reversed;
}

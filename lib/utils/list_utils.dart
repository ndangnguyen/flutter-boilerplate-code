class ListUtils {
  static List<List<T>> partition<T>(List<T> list, {required int partitionSize}) {
    final List<List<T>> chunks = [];
    for (var i = 0; i < list.length; i += partitionSize) {
      chunks.add(list.sublist(i, i + partitionSize > list.length ? list.length : i + partitionSize));
    }
    return chunks;
  }
}

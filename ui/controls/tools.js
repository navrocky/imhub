.pragma library

/**
  Get items maximum implicit width. Useful for ListView items.
  */
function getMaxItemsImplicitWidth(itemsArray) {
    var max = 0
    for (var key in itemsArray) {
        var item = itemsArray[key];
        max = Math.max(item.implicitWidth, max)
    }
    return max
}

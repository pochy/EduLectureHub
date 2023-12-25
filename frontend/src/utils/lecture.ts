export const periodLabel = (period: number) => {
  switch (period) {
    case 1:
      return '1限'
    case 2:
      return '2限'
    case 3:
      return '3限'
    case 4:
      return '4限'
    case 5:
      return '5限'
    case 6:
      return '6限'
    default:
      return '不明'
  }
}

export const dayOfWeekLabel = (day_of_week: number) => {
  switch (day_of_week) {
    case 1:
      return '月曜日'
    case 2:
      return '火曜日'
    case 3:
      return '水曜日'
    case 4:
      return '木曜日'
    case 5:
      return '金曜日'
    case 6:
      return '土曜日'
    default:
      return '不明'
  }
}

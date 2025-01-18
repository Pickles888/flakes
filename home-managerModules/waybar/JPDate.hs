import Data.Functor ((<&>))
import Data.Text qualified as T
import Data.Time.Calendar
import Data.Time.Calendar.OrdinalDate (mondayStartWeek)
import Data.Time.Clock

type Date = (Integer, Int, Int)

main :: IO ()
main = date >>= putStrLn . T.unpack . showDate

date :: IO Date
date = getCurrentTime <&> (toGregorian . utctDay)

showDate :: Date -> T.Text
showDate date@(year, month, day) =
  let weekDay = weekDayToStr (getDayOfWeek date)
   in T.intercalate
        T.empty
        [showYear year, space, showMonth month, space, showDay day, space, weekDay]

showYear :: Integer -> T.Text
showYear a = T.pack $ showNum a ++ "年"

showMonth :: Int -> T.Text
showMonth a = T.pack $ showNum a ++ "月"

showDay :: Int -> T.Text
showDay a = T.pack $ showNum a ++ "日"

space :: T.Text
space = T.pack " "

weekDayToStr :: Int -> T.Text
weekDayToStr 1 = T.pack "月曜日"
weekDayToStr 2 = T.pack "火曜日"
weekDayToStr 3 = T.pack "水曜日"
weekDayToStr 4 = T.pack "木曜日"
weekDayToStr 5 = T.pack "金曜日"
weekDayToStr 6 = T.pack "土曜日"
weekDayToStr 7 = T.pack "日曜日"
weekDayToStr _ = T.empty

showNum :: (Show a) => a -> String
showNum = map numToJP . show

numToJP :: Char -> Char
numToJP '1' = '一'
numToJP '2' = '二'
numToJP '3' = '三'
numToJP '4' = '四'
numToJP '5' = '五'
numToJP '6' = '六'
numToJP '7' = '七'
numToJP '8' = '八'
numToJP '9' = '九'
numToJP '0' = '〇'
numToJP _ = '?'

getDayOfWeek :: Date -> Int
getDayOfWeek (a, b, c) = snd $ mondayStartWeek $ fromGregorian a b c

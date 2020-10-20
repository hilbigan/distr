import qualified Data.Text.IO as TIO
import qualified Data.Text as T
import Control.Monad
import Data.List
import System.Exit
import Text.Printf

pad = 0

main = do
    text <- TIO.getContents
    let sorted = sortAndGroup $ T.lines text
    if null sorted then
        exitSuccess
    else do
        let total = sum $ map snd $ sorted
        let maxLength = (+pad) $ length $ show $ total
        mapM_ (printEntry maxLength total) sorted
        printf "%s%s --------- ---\n" (replicate pad ' ') (replicate (maxLength - pad) '-')
        let smry = printf "total, %d buckets" $ length sorted
        printEntry maxLength total (T.pack smry, total)


printEntry :: Int -> Int -> (T.Text, Int) -> IO ()
printEntry len total (str, count) = do
    printf "%*d (%6.2f%%) %s\n" len count share str
    where share = (fromIntegral count / fromIntegral total) * 100 :: Float


sortAndGroup :: Ord a => [a] -> [(a, Int)]
sortAndGroup = mapLength . sortOn length . group . sort
    where mapLength = map (\x -> (head x, length x))

module Main where

import Control.Lens
import Control.Monad
import Control.Monad.Fix
import Data.Text as T
import Reflex.Dom


main :: IO ()
main = mainWidgetWithHead headWidget rootWidget

headWidget :: Widget t ()
headWidget = do
  meta ("charset" =: "utf-8")
  meta ("http-equiv" =: "x-ua-compatible" <> "content" =: "ie-edge")
  meta ("name" =: "viewport"
    <>  "content" =: "width=device-width, initial-scale=1")
  where
    meta a = elAttr "meta" a $ pure ()

rootWidget :: MonadWidget t m => m ()
rootWidget = do
  text "Hello"
  void $ inputMonth def

-- | input element which is changes while edited.
-- It is useful to input dates, phones etc
inputCorrect
  :: (MonadFix m, DomBuilder t m, MonadHold t m)
  => (Text -> Text -> Text) -- ^ old value and new value
  -> InputElementConfig er t (DomBuilderSpace m)
  -> m (InputElement er (DomBuilderSpace m) t)
inputCorrect correct ec = mdo
  ie <- inputElement $ ec & inputElementConfig_setValue .~ eNewValue
  dV <- holdUniqDyn $ value ie
  let
    eNewValue = attachWith correct (current dV)
      $ leftmost [ec ^. inputElementConfig_setValue, updated dV]
  pure ie

-- | input element in form "__/__" (e.g. for credit card)
inputMonth
  :: (MonadFix m, DomBuilder t m, MonadHold t m)
  => InputElementConfig er t (DomBuilderSpace m)
  -> m (InputElement er (DomBuilderSpace m) t)
inputMonth ec = inputCorrect correct $ ec
  & initialAttributes %~ (<> "type" =: "text" <> "maxlength" =: "5")
  where
    correct ov nv = case (T.length ov, T.length nv) of
        (x,2) | x < 2 -> nv <> "/"
        (x,3) | x > 3 -> T.take 2 nv
        (_, x) | x > 2 && T.head (T.drop 2 nv) /= '/' ->
          T.take 5 $ T.take 2 nv <> "/" <> T.drop 2 nv
        _     -> nv

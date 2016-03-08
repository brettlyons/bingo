module Bingo (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)


newEntry phrase points id =
  { phrase = phrase
  , points = points
  , wasSpoken = False
  , id = id
  }


title : String -> Int -> Html
title message times =
  message
    ++ " "
    |> toUpper
    |> repeat times
    |> trimRight
    |> text


pageHeader : Html
pageHeader =
  h1 [] [ title "bingo!" 3 ]


pageFooter : Html
pageFooter =
  footer
    []
    [ a
        [ href "https://pragmaticstudio.com" ]
        [ text "The Pragmatic Studio" ]
    ]


entryItem entry =
  li
    []
    [ span [ class "phrase" ] [ text entry.phrase ]
    , span [ class "points" ] [ text (toString entry.points) ]
    ]


entryList : Html
entryList =
  ul
    []
    [ entryItem (newEntry "Future-Proof" 100 1)
    , entryItem (newEntry "Doing Agile" 200 2)
    ]


view : Html
view =
  div
    [ id "container" ]
    [ pageHeader
    , entryList
    , pageFooter
    ]


main : Html
main =
  view

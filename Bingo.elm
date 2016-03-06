module Bingo (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)


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


entryItem : String -> a -> Html
entryItem phrase points =
  li
    []
    [ span [ class "phrase" ] [ text phrase ]
    , span [ class "points" ] [ text (toString points) ]
    ]


entryList : Html
entryList =
  ul
    []
    [ entryItem "Future-Proof" 100
    , entryItem "Doing Agile" 200
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

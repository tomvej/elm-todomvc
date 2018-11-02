module Utils exposing (onClickControlled)
import Html.Events exposing (custom)
import Json.Decode as Decode

onClickControlled message =
    custom "click" (Decode.succeed { message = message, stopPropagation = True, preventDefault = True})

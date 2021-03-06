import Browser
import Html exposing (Html, input, div, text, button, label)
import Html.Attributes exposing (type_, value, checked)
import Html.Events exposing (onInput, onClick)
import Debug exposing (log)
import Utils exposing (onClickControlled)

main = Browser.sandbox { init = init, update = update, view = view }

type alias Todo =
    { id: Int
    , text: String
    , complete: Bool
    }

type alias Model =
    { nextId: Int
    , todos: List Todo
    , inputText: String
    }

init : Model
init =
    { nextId = 1
    , todos = []
    , inputText = ""
    }

type Msg = UpdateInputText String | AddTodo String | CompleteTodo Int

updateTodo : (Todo -> Todo) -> Int -> Model -> Model
updateTodo updater id model =
    { model | todos = List.map (\todoItem -> if todoItem.id == id then updater todoItem else todoItem) model.todos }

update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateInputText newText -> { model | inputText = newText }
        AddTodo todoText ->
            { model | nextId = model.nextId + 1
            , inputText = ""
            , todos = { id = model.nextId, text= todoText, complete = False }::model.todos
            }
        CompleteTodo todoId -> updateTodo (\todoItem -> {todoItem | complete = True}) todoId model

view : Model -> Html Msg
view model =
    div [] ((todoInput model)::(List.map todo model.todos))

todoInput : Model -> Html Msg
todoInput model = div []
    [ input [ type_ "text", value model.inputText, onInput UpdateInputText] []
    , button [ onClick (AddTodo model.inputText) ] [ text "Add todo" ]
    ]

todo : Todo -> Html Msg
todo todoItem = label []
    [ input [ type_ "checkbox", checked todoItem.complete, onClickControlled (CompleteTodo todoItem.id) ] []
    , text todoItem.text
    ]

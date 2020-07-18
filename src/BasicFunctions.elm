module BasicFunctions exposing (..)

getValue : List a -> Int -> Maybe a
getValue lst index =
    getValue_ index 1 lst

getValue_ : Int -> Int -> List a -> Maybe a
getValue_ index indicator lst =
    let
        head = List.head lst
        tail =
            case List.tail lst of
                Just t ->
                    t
                Nothing ->
                    []
    in
        if index < 1 || lst == [] then
            Nothing
        else if index == indicator then
            head
        else
            getValue_ index (indicator + 1) tail

getValueIndex : a -> List a -> Int
getValueIndex element lst =
    getValueIndex_ element lst 1



getValueIndex_ : a -> List a -> Int -> Int
getValueIndex_ element lst indicator =
    let
        head = List.head lst
        tail =
             case List.tail lst of
                    Just t ->
                        t
                    Nothing ->
                        []
    in
        if head == Just element then
            indicator
        else if tail == [] then
            0
        else
            getValueIndex_ element tail (indicator+1)

replace : List a ->  Int -> a -> List a
replace lst  index value =
    let
        front = List.take (index - 1) lst
        back = List.drop index lst
    in
        front ++ [value] ++ back

backgroundSize : Float
backgroundSize =
    2400


display : (Float,Float)
display =
    (800,600)

unitAmount : Int
unitAmount = 100

unitSize : Float
unitSize =
    backgroundSize / toFloat unitAmount

posToRealPos : (Int,Int) -> (Float,Float)
posToRealPos (xP,yP) =
    ((toFloat xP)*unitSize,(toFloat yP)*unitSize)






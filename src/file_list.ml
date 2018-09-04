type t

external length : t -> int = "length" [@@bs.get]
external item: t -> int -> File.t Js.Nullable.t = "item" [@@bs.send]

let to_list files =
  let num = length files in
  let rec append index list =
    if index < num then
      match Js.Nullable.toOption (item files index) with
      | Some file -> file :: (append (index + 1) list)
      | None -> list
    else
      list
  in
  append 0 []

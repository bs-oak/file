module FileReader = struct
  type t
  external new' : unit -> t = "FileReader" [@@bs.new]
  external add_event_listener : t -> string  -> (Dom.progressEvent -> unit)  -> unit = "addEventListener" [@@bs.send]
  external result_data_url : t -> string = "result" [@@bs.get]
  external read_as_data_url : t -> File.t -> unit = "readAsDataURL" [@@bs.send]
end

let read_as_data_url file =
  Scheduler.binding (fun callback -> 
    let fr = FileReader.new' () in
    let () = FileReader.add_event_listener fr "error" (fun event ->  
      callback (Scheduler.fail event)
    )
    in
    let () = FileReader.add_event_listener fr "load" (fun _event ->  
      callback (Scheduler.succeed (FileReader.result_data_url fr))
    )
    in    
    let () = FileReader.read_as_data_url fr file in
    fun _ -> ()
  )
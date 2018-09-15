let help = "Invalid argument, use -s <keyword> for searching."

let read_lines name : string list =
  let ic = open_in name in
  let try_read () =
    try Some (input_line ic) with End_of_file -> None in
  let rec loop acc = match try_read () with
    | Some s -> loop (s :: acc)
    | None -> close_in ic; List.rev acc in
  loop []

let search_lines lines search =
  List.filter
    (fun a -> BatString.exists a search)
    lines

let join_list lines =
  List.fold_left (fun acc s -> acc ^ s ^ "\n") "" lines

let add_line name line =
  let lines = (join_list (read_lines name) ^ line) in
  BatFile.write_lines name (BatEnum.ising lines)

let handleArgs args path = match args with
    [| |] -> "empty"
  | [| _; truth |] -> add_line path truth; "Added statement: " ^ truth ^ "\n"
  | [| _; "-s"; keyword |] -> join_list (search_lines (read_lines path) keyword)
  | _ -> help

let filePath () =
  (Unix.getenv "HOME") ^ "/.memb"

let createFileIfNotExists path =
  if not (Sys.file_exists path)
  then let oc = open_out path in
       Printf.fprintf oc "";
       close_out oc;
       true
  else false

let () =
  let path = filePath () in
  if createFileIfNotExists path
  then BatPrintf.printf "Created .memb file at %s\n" path;
  Printf.printf "%s" (handleArgs Sys.argv (filePath ()))

import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {
  // create datatype, the data which will be saved
  // add public to access the datatype in JS part
  public type Note = {
    title: Text;
    content: Text;
  };

  // variable: List. = type de données (List) qui doit contenir une liste de Note objects
  // avec valeur initiale à nil
  // creation of an array of Note objects
  var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text){

    let newNote: Note = {
      title= titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));
  }
};

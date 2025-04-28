#!/usr/bin/env Rscript
suppressPackageStartupMessages({
  library(argparse)
})

TASK_FILE <- "test_list.txt" # nolint

add_task <- function(task) { # this function does not work, not sure why
  tasks <- readLines(TASK_FILE)
  new_task <- readLines(file("stdin"),1)
  counter <- 1
  output_string <- ""
  for (task in tasks) {
    if (counter < 5) { 
      output_string <- paste0(output_string, counter, ". ", task, "\n")
      counter <- counter + 1
      return(output_string)
    }
    else {
      output_string <- paste0(output_string, counter, ". ", task, new_task) 
  }
  return(output_string)
}
}

list_tasks <- function() { #this function works
  tasks <- readLines(TASK_FILE)
  counter <- 1
  output_string <- ""
  for (task in tasks) {
    if (counter < length(tasks)) { #Looks for the end of the task list
      output_string <- paste0(output_string, counter, ". ", task, "\n")
    counter <- counter + 1
    }
    else {
      output_string <- paste0(output_string, counter, ". ", task) #Removes \n from the end of the list
    }
  }
  return(output_string)
}


remove_task <- function(index) { #Just can't figure out/find the right functions
  tasks <- readLines(TASK_FILE)
  task_removed <- readLines(file("stdin"),1)
 for (task in tasks) {
    if (task_removed==task) {
      task <- NULL
      #a function that loops through the list, looks at the index of the matching text, 
      #and removes it without disrupting list_task()
    }
    }
  }


main <- function(args) {

  if (!is.null(args$add)) {
    add_task(args$add)
  } else if (args$list) {
    tasks <- list_tasks()
    print(tasks)
  } else if (!is.null(args$remove)) {
    remove_task(args$remove)
  } else {
    print("Use --help to get help on using this program")
  }
}


if (sys.nframe() == 0) { #very confused on how to use these in my functions
  
  # main program, called via Rscript
  parser <- ArgumentParser(description = "Command-line Todo List")
  parser$add_argument("-a", "--add",
                      help = "Add a new task")
  parser$add_argument("-l", "--list",
                      action = "store_true",
                      help = "List all tasks")
  parser$add_argument("-r", "--remove",
                      help = "Remove a task by index")
  
  args <- parser$parse_args()
  main(args) 
}
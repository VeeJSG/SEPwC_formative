#!/usr/bin/env Rscript
suppressPackageStartupMessages({
  library(argparse)
})

TASK_FILE <- "test_list.txt" # nolint

add_task <- function(task) {

}

list_tasks <- function() {
  tasks <- readLines(TASK_FILE)
  counter <- 1
  output_string <- ""
  for (item in tasks) {
    if (counter < length(tasks)) { #Looks for the end of the task list
      output_string <- paste0(output_string, counter, ". ", item, "\n")
    counter <- counter + 1
    }
    else {
      output_string <- paste0(output_string, counter, ". ", item) #Removes \n from the end of the list
    }
  }
  print(output_string)
}
list_tasks()


remove_task <- function(index) {

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


if (sys.nframe() == 0) {

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


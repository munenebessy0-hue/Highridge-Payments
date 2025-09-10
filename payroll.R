# Generate 400 workers dynamically
generate_workers <- function(num_workers = 400) {
  workers <- data.frame(
    id = 1:num_workers,
    name = paste("Worker", 1:num_workers, sep = "_"),
    gender = sample(c("Male", "Female"), num_workers, replace = TRUE),
    salary = sample(5000:35000, num_workers, replace = TRUE),
    stringsAsFactors = FALSE
  )
  return(workers)
}

# Function to assign employee level
assign_level <- function(salary, gender) {
  if (salary > 10000 & salary < 20000) {
    return("A1")
  } else if (salary > 7500 & salary < 30000 & gender == "Female") {
    return("A5-F")
  } else {
    return("General")
  }
}

# Generate payment slips
generate_payment_slips <- function(workers) {
  for (i in 1:nrow(workers)) {
    worker <- workers[i, ]
    level <- tryCatch({
      assign_level(worker$salary, worker$gender)
    }, error = function(e) {
      "Unknown"
    })
    
    cat("Payment Slip for", worker$name, "\n")
    cat("ID:", worker$id, "\n")
    cat("Gender:", worker$gender, "\n")
    cat("Salary: $", worker$salary, "\n", sep = "")
    cat("Level:", level, "\n")
    cat("----------------------------------------\n")
  }
}

# Main Program
workers_list <- generate_workers(400)
generate_payment_slips(workers_list)
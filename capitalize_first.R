# capitalize_first_letter.R

    capitalize_first <- function(x) {
      str_c(str_to_upper(str_sub(x, 1, 1)), str_sub(x, 2))
    }
    
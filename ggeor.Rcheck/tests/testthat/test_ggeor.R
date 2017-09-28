#package ggeor testsuites

context("gaddress")

test_that("Outputs are correct", {
  test <- gaddress("linkoping")
  
  expect_output(print(test),"590 92 Totebo")
  expect_output(print(test),"57.62")
  expect_output(print(test),"16.18")
})

test_that("data_address and plot_address seems to work", {
  expect_error(data_address("den_har_adressen_finns_ej"))
  expect_error(data_address(10))
  
  expect_error(plot_address("den_har_adressen_finns_ej"))
  expect_error(plot_address(zoom = 10))
  expect_error(plot_address("den_har_adressen_finns_ej",10))
})



test_that("class of data_address is correct", {
  
  expect_true(class(data_address("Totebo")) == "data.frame")
})
#package ggeor testsuites

context("gaddress")

test_that("Outputs are correct", {
  test <- gaddress("linkoping")
  
  expect_output(print(test), "    address      lat      lng")
  expect_output(print(test), "linkoping 58.41081 15.62137")
})

test_that("Wrong inputs give error",{
  expect_error(gaddress(37.56654))
  expect_error(gaddress(seoul))
})

test_that("Proper error message",{
  expect_error(gaddress("kim josh hyungyum"))
  expect_error(gaddress("cant find anything"))
})

test_that("Class of the return value",{
  test <- gaddress("linkoping")
  
  expect_is(test,"data.frame")
})

context("glatlng")

test_that("Output is correct", {
  test <- glatlng("37.56654, 126.978")
  
  expect_output(print(test), "International Finance Center Seoul, Myeong-dong, Seoul")
})

test_that("Wrong inputs give error",{
  expect_error(glatlng(37.56654))
  expect_error(glatlng(seoul))
})

test_that("Proper error message",{
  expect_error(glatlng("99999999999, 0000000000"))
  expect_error(glaglng("+-!@#$%^&*&"))
})


test_that("Class of the return value",{
  test <- glatlng("37.56654, 126.978")
  
  expect_is(test,"character")
})
#include <catch2/catch.hpp>

#include <oravi/oravi.hpp>

TEST_CASE("simple test", "[simple]") { REQUIRE(oravi::add(1, 2) == 3); }

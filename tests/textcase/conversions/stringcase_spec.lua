local casing = require("textcase.conversions.stringcase")

describe("to_parts", function()
  it("should split upper case", function()
    assert.are.same(casing.to_parts("LOREM"), { "LOREM" })
    assert.are.same(casing.to_parts("LOREM IPSUM DOLOR"), { "LOREM", "IPSUM", "DOLOR" })
    assert.are.same(casing.to_parts(" LOREM IPSUM DOLOR "), { "LOREM", "IPSUM", "DOLOR" })
    assert.are.same(casing.to_parts("LOREM1 IPSUM２ DOLOR三"), { "LOREM1", "IPSUM２", "DOLOR三" })
    assert.are.same(casing.to_parts(" LOREM1 IPSUM２ DOLOR三 "), { "LOREM1", "IPSUM２", "DOLOR三" })
  end)

  it("should split lower case", function()
    assert.are.same(casing.to_parts("lorem"), { "lorem" })
    assert.are.same(casing.to_parts("lorem ipsum dolor"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts(" lorem ipsum dolor "), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("lorem1 ipsum２ dolor三"), { "lorem1", "ipsum２", "dolor三" })
    assert.are.same(casing.to_parts(" lorem1 ipsum２ dolor三 "), { "lorem1", "ipsum２", "dolor三" })
  end)

  it("should split snake case", function()
    assert.are.same(casing.to_parts("lorem_ipsum_dolor"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("Lorem_Ipsum_Dolor"), { "Lorem", "Ipsum", "Dolor" })
    assert.are.same(casing.to_parts("LOREM_IPSUM_DOLOR"), { "LOREM", "IPSUM", "DOLOR" })
    assert.are.same(casing.to_parts("_lorem_ipsum_dolor_"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("lorem1_ipsum２_dolor三"), { "lorem1", "ipsum２", "dolor三" })
    assert.are.same(casing.to_parts("_lorem1_ipsum２_dolor三_"), { "lorem1", "ipsum２", "dolor三" })
  end)

  it("should split dash case", function()
    assert.are.same(casing.to_parts("lorem-ipsum-dolor"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("Lorem-Ipsum-Dolor"), { "Lorem", "Ipsum", "Dolor" })
    assert.are.same(casing.to_parts("LOREM-IPSUM-DOLOR"), { "LOREM", "IPSUM", "DOLOR" })
    assert.are.same(casing.to_parts("-lorem-ipsum-dolor-"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("lorem1-ipsum２-dolor三"), { "lorem1", "ipsum２", "dolor三" })
    assert.are.same(casing.to_parts("-lorem1-ipsum２-dolor三-"), { "lorem1", "ipsum２", "dolor三" })
  end)

  it("should split constant case", function()
    assert.are.same(casing.to_parts("LOREM_IPSUM_DOLOR"), { "LOREM", "IPSUM", "DOLOR" })
    assert.are.same(casing.to_parts("_LOREM_IPSUM_DOLOR_"), { "LOREM", "IPSUM", "DOLOR" })
    assert.are.same(casing.to_parts("LOREM1_IPSUM２_DOLOR三"), { "LOREM1", "IPSUM２", "DOLOR三" })
    assert.are.same(casing.to_parts("_LOREM1_IPSUM２_DOLOR三_"), { "LOREM1", "IPSUM２", "DOLOR三" })
  end)

  it("should split dot case", function()
    assert.are.same(casing.to_parts("lorem.ipsum.dolor"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("Lorem.Ipsum.Dolor"), { "Lorem", "Ipsum", "Dolor" })
    assert.are.same(casing.to_parts("LOREM.IPSUM.DOLOR"), { "LOREM", "IPSUM", "DOLOR" })
    assert.are.same(casing.to_parts(".lorem.ipsum.dolor."), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("lorem1.ipsum２.dolor三"), { "lorem1", "ipsum２", "dolor三" })
    assert.are.same(casing.to_parts(".lorem1.ipsum２.dolor三."), { "lorem1", "ipsum２", "dolor三" })
  end)

  it("should split comma case", function()
    assert.are.same(casing.to_parts("lorem,ipsum,dolor"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("Lorem,Ipsum,Dolor"), { "Lorem", "Ipsum", "Dolor" })
    assert.are.same(casing.to_parts("LOREM,IPSUM,DOLOR"), { "LOREM", "IPSUM", "DOLOR" })
    assert.are.same(casing.to_parts(",lorem,ipsum,dolor,"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("lorem1,ipsum２,dolor三"), { "lorem1", "ipsum２", "dolor三" })
    assert.are.same(casing.to_parts(",lorem1,ipsum２,dolor三,"), { "lorem1", "ipsum２", "dolor三" })
  end)

  it("should split camel case", function()
    assert.are.same(casing.to_parts("loremIpsumDolor"), { "lorem", "Ipsum", "Dolor" })
    assert.are.same(casing.to_parts("lorem1Ipsum２Dolor三"), { "lorem1", "Ipsum２", "Dolor三" })
  end)

  it("should split pascal case", function()
    assert.are.same(casing.to_parts("LoremIpsumDolor"), { "Lorem", "Ipsum", "Dolor" })
    assert.are.same(casing.to_parts("Lorem1Ipsum２Dolor三"), { "Lorem1", "Ipsum２", "Dolor三" })
  end)

  it("should split title case", function()
    assert.are.same(casing.to_parts("Lorem Ipsum Dolor"), { "Lorem", "Ipsum", "Dolor" })
    assert.are.same(casing.to_parts(" Lorem Ipsum Dolor "), { "Lorem", "Ipsum", "Dolor" })
    assert.are.same(casing.to_parts("Lorem1 Ipsum２ Dolor三"), { "Lorem1", "Ipsum２", "Dolor三" })
    assert.are.same(casing.to_parts(" Lorem1 Ipsum２ Dolor三 "), { "Lorem1", "Ipsum２", "Dolor三" })
  end)

  it("should split path case", function()
    assert.are.same(casing.to_parts("lorem/ipsum/dolor"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("/lorem/ipsum/dolor/"), { "lorem", "ipsum", "dolor" })
    assert.are.same(casing.to_parts("lorem1/ipsum２/dolor三"), { "lorem1", "ipsum２", "dolor三" })
    assert.are.same(casing.to_parts("/lorem1/ipsum２/dolor三/"), { "lorem1", "ipsum２", "dolor三" })
  end)

  it("should split mixed case", function()
    assert.are.same(casing.to_parts("lorem_IPSUM_dolor"), { "lorem", "I", "P", "S", "U", "M", "dolor" })
    assert.are.same(casing.to_parts("lorem-ipsuM-dolor"), { "lorem", "ipsu", "M", "dolor" })
    assert.are.same(casing.to_parts("lorem.ipsumDolor"), { "lorem", "ipsum", "Dolor" })
    assert.are.same(casing.to_parts("lorem,ipsumDolor"), { "lorem", "ipsum", "Dolor" })
  end)
end)

local UNFORMATTED_STRING = "lorem ipsum dolor sit amet ááaa"
local UPPER_STRING = "LOREM IPSUM DOLOR SIT AMET ÁÁAA"
local LOWER_STRING = "lorem ipsum dolor sit amet ááaa"
local SNAKE_STRING = "lorem_ipsum_dolor_sit_amet_ááaa"
local DASH_STRING = "lorem-ipsum-dolor-sit-amet-ááaa"
local TITLE_DASH_STRING = "Lorem-Ipsum-Dolor-Sit-Amet-Ááaa"
local CONSTANT_STRING = "LOREM_IPSUM_DOLOR_SIT_AMET_ÁÁAA"
local DOT_STRING = "lorem.ipsum.dolor.sit.amet.ááaa"
local COMMA_STRING = "lorem,ipsum,dolor,sit,amet,ááaa"
local PHRASE_STRING = "Lorem ipsum dolor sit amet ááaa"
local CAMEL_STRING = "loremIpsumDolorSitAmetÁáaa"
local PASCAL_STRING = "LoremIpsumDolorSitAmetÁáaa"
local TITLE_STRING = "Lorem Ipsum Dolor Sit Amet Ááaa"
local PATH_STRING = "lorem/ipsum/dolor/sit/amet/ááaa"

describe("to_upper_case", function()
  it("should convert from other cases to upper_case", function()
    assert.are.same("", casing.to_upper_case(""))
    assert.are.same(UPPER_STRING, casing.to_upper_case(UNFORMATTED_STRING))
    assert.are.same(UPPER_STRING, casing.to_upper_case(UPPER_STRING))
    assert.are.same(UPPER_STRING, casing.to_upper_case(LOWER_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_upper_case(SNAKE_STRING))
    assert.are.same(CONSTANT_STRING:gsub("_", "-"), casing.to_upper_case(DASH_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_upper_case(CONSTANT_STRING))
    assert.are.same(CONSTANT_STRING:gsub("_", "."), casing.to_upper_case(DOT_STRING))
    assert.are.same(CONSTANT_STRING:gsub("_", ","), casing.to_upper_case(COMMA_STRING))
    assert.are.same(UPPER_STRING, casing.to_upper_case(PHRASE_STRING))
    assert.are.same(CONSTANT_STRING:gsub("_", ""), casing.to_upper_case(CAMEL_STRING))
    assert.are.same(CONSTANT_STRING:gsub("_", ""), casing.to_upper_case(PASCAL_STRING))
    assert.are.same(UPPER_STRING, casing.to_upper_case(TITLE_STRING))
    assert.are.same(CONSTANT_STRING:gsub("_", "/"), casing.to_upper_case(PATH_STRING))

    assert.are.same("SOME UNICODE あいうえお", casing.to_upper_case("some unicode あいうえお"))
  end)
end)

describe("to_lower_case", function()
  it("should convert from other cases to lower_case", function()
    assert.are.same("", casing.to_lower_case(""))
    assert.are.same(LOWER_STRING, casing.to_lower_case(UNFORMATTED_STRING))
    assert.are.same(LOWER_STRING, casing.to_lower_case(UPPER_STRING))
    assert.are.same(LOWER_STRING, casing.to_lower_case(LOWER_STRING))
    assert.are.same(SNAKE_STRING, casing.to_lower_case(SNAKE_STRING))
    assert.are.same(SNAKE_STRING:gsub("_", "-"), casing.to_lower_case(DASH_STRING))
    assert.are.same(SNAKE_STRING, casing.to_lower_case(CONSTANT_STRING))
    assert.are.same(SNAKE_STRING:gsub("_", "."), casing.to_lower_case(DOT_STRING))
    assert.are.same(SNAKE_STRING:gsub("_", ","), casing.to_lower_case(COMMA_STRING))
    assert.are.same(LOWER_STRING, casing.to_lower_case(PHRASE_STRING))
    assert.are.same(SNAKE_STRING:gsub("_", ""), casing.to_lower_case(CAMEL_STRING))
    assert.are.same(SNAKE_STRING:gsub("_", ""), casing.to_lower_case(PASCAL_STRING))
    assert.are.same(LOWER_STRING, casing.to_lower_case(TITLE_STRING))
    assert.are.same(SNAKE_STRING:gsub("_", "/"), casing.to_lower_case(PATH_STRING))
  end)
end)

describe("to_snake_case", function()
  it("should convert from other cases to snake_case", function()
    assert.are.same("", casing.to_snake_case(""))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(UNFORMATTED_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(UPPER_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(LOWER_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(SNAKE_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(DASH_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(CONSTANT_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(DOT_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(COMMA_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(PHRASE_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(CAMEL_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(PASCAL_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(TITLE_STRING))
    assert.are.same(SNAKE_STRING, casing.to_snake_case(PATH_STRING))
  end)
end)

describe("to_dash_case", function()
  it("should convert from other cases to dash_case", function()
    assert.are.same("", casing.to_dash_case(""))
    assert.are.same(DASH_STRING, casing.to_dash_case(UNFORMATTED_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(UPPER_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(LOWER_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(SNAKE_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(DASH_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(CONSTANT_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(DOT_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(COMMA_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(PHRASE_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(CAMEL_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(PASCAL_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(TITLE_STRING))
    assert.are.same(DASH_STRING, casing.to_dash_case(PATH_STRING))
  end)
end)

describe("to_title_dash_case", function()
  it("should convert from other cases to dash_case", function()
    assert.are.same("", casing.to_title_dash_case(""))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(UNFORMATTED_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(UPPER_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(LOWER_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(SNAKE_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(DASH_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(CONSTANT_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(DOT_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(COMMA_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(PHRASE_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(CAMEL_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(PASCAL_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(TITLE_STRING))
    assert.are.same(TITLE_DASH_STRING, casing.to_title_dash_case(PATH_STRING))
  end)
end)

describe("to_constant_case", function()
  it("should convert from other cases to constant_case", function()
    assert.are.same("", casing.to_constant_case(""))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(UNFORMATTED_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(UPPER_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(LOWER_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(SNAKE_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(DASH_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(CONSTANT_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(DOT_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(COMMA_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(PHRASE_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(CAMEL_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(PASCAL_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(TITLE_STRING))
    assert.are.same(CONSTANT_STRING, casing.to_constant_case(PATH_STRING))
  end)
end)

describe("to_dot_case", function()
  it("should convert from other cases to dot_case", function()
    assert.are.same("", casing.to_dot_case(""))
    assert.are.same(DOT_STRING, casing.to_dot_case(UNFORMATTED_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(UPPER_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(LOWER_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(SNAKE_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(DASH_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(CONSTANT_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(DOT_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(COMMA_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(PHRASE_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(CAMEL_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(PASCAL_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(TITLE_STRING))
    assert.are.same(DOT_STRING, casing.to_dot_case(PATH_STRING))
  end)
end)

describe("to_comma_case", function()
  it("should convert from other cases to comma_case", function()
    assert.are.same("", casing.to_comma_case(""))
    assert.are.same(COMMA_STRING, casing.to_comma_case(UNFORMATTED_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(UPPER_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(LOWER_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(SNAKE_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(DASH_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(CONSTANT_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(DOT_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(COMMA_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(PHRASE_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(CAMEL_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(PASCAL_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(TITLE_STRING))
    assert.are.same(COMMA_STRING, casing.to_comma_case(PATH_STRING))
  end)
end)

describe("to_phrase_case", function()
  it("should convert from other cases to phrase_case", function()
    assert.are.same("", casing.to_phrase_case(""))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(UNFORMATTED_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(UPPER_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(LOWER_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(SNAKE_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(DASH_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(CONSTANT_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(DOT_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(COMMA_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(PHRASE_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(CAMEL_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(PASCAL_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(TITLE_STRING))
    assert.are.same(PHRASE_STRING, casing.to_phrase_case(PATH_STRING))
  end)
end)

describe("to_camel_case", function()
  it("should convert from other cases to camel_case", function()
    assert.are.same("", casing.to_camel_case(""))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(UNFORMATTED_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(UPPER_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(LOWER_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(SNAKE_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(DASH_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(CONSTANT_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(DOT_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(COMMA_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(PHRASE_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(CAMEL_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(PASCAL_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(TITLE_STRING))
    assert.are.same(CAMEL_STRING, casing.to_camel_case(PATH_STRING))
  end)
end)

describe("to_pascal_case", function()
  it("should convert from other cases to pascal_case", function()
    assert.are.same("", casing.to_pascal_case(""))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(UNFORMATTED_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(UPPER_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(LOWER_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(SNAKE_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(DASH_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(CONSTANT_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(DOT_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(COMMA_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(PHRASE_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(CAMEL_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(PASCAL_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(TITLE_STRING))
    assert.are.same(PASCAL_STRING, casing.to_pascal_case(PATH_STRING))
  end)
end)

describe("to_title_case", function()
  it("should convert from other cases to title_case", function()
    assert.are.same("", casing.to_title_case(""))
    assert.are.same(TITLE_STRING, casing.to_title_case(UNFORMATTED_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(UPPER_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(LOWER_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(SNAKE_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(DASH_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(CONSTANT_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(DOT_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(COMMA_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(PHRASE_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(CAMEL_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(PASCAL_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(TITLE_STRING))
    assert.are.same(TITLE_STRING, casing.to_title_case(PATH_STRING))
  end)
end)

describe("to_path_case", function()
  it("should convert from other cases to path_case", function()
    assert.are.same("", casing.to_path_case(""))
    assert.are.same(PATH_STRING, casing.to_path_case(UNFORMATTED_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(UPPER_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(LOWER_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(SNAKE_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(DASH_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(CONSTANT_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(DOT_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(COMMA_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(PHRASE_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(CAMEL_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(PASCAL_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(TITLE_STRING))
    assert.are.same(PATH_STRING, casing.to_path_case(PATH_STRING))
  end)
end)

describe("to_constant_case", function()
  it("keep empty spaces around the word", function()
    assert.are.same(" " .. CONSTANT_STRING, " " .. casing.to_constant_case(CAMEL_STRING))
    assert.are.same(" t_task", casing.to_snake_case(" tTask"))
  end)
end)

-- to_upper_case
-- to_lower_case
-- to_snake_case
-- to_dash_case
-- to_title_dash_case
-- to_constant_case
-- to_dot_case
-- to_comma_case
-- to_phrase_case
-- to_camel_case
-- to_pascal_case
-- to_title_case
-- to_path_case

require File.expand_path('../test_helper.rb', File.dirname(__FILE__))

describe RipperRubyParser::SexpBuilder do
  def parse_with_builder str
    builder = RipperRubyParser::SexpBuilder.new str
    builder.parse
  end

  describe "handling comments" do
    it "produces a comment node surrounding a commented def" do
      result = parse_with_builder "# Foo\ndef foo; end"
      result.must_equal [:program,
                         [[:comment,
                           "# Foo\n",
                           [:def,
                            [:@ident, "foo", [2, 4]],
                            [:params, nil, nil, nil, nil, nil],
                            [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]]
    end

    it "does not produce a comment node surrounding a def that has no comment" do
      result = parse_with_builder "def foo; end"
      result.must_equal [:program,
                         [[:def,
                           [:@ident, "foo", [1, 4]],
                           [:params, nil, nil, nil, nil, nil],
                           [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]
    end
  end
end


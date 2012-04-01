require File.expand_path('../test_helper.rb', File.dirname(__FILE__))

describe RipperRubyParser::Parser do
  describe "#parse" do
    describe "for postfix if" do
      it "normalizes negative conditions" do
        "foo if not bar".
          must_be_parsed_as s(:if,
                              s(:call, nil, :bar, s(:arglist)),
                              nil,
                              s(:call, nil, :foo, s(:arglist)))
      end
    end
  end
end
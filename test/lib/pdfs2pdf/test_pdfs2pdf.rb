require_relative "../../test_helper"
describe Pdfs2Pdf do
  context "#page_count" do
    it "returns result for valid command" do
      input_file = "demo1_xxx.rb.xhtml.pdf"
      result = Pdfs2Pdf.page_count("./test/fixtures/samples", input_file)
      result.must_equal 1
    end
  end
end

require_relative '../../test_helper'
describe Pdfs2Pdf::Utils do
  context '#page_count' do
    it 'returns result for valid command' do
      input_file = 'test/fixtures/samples/demo1_xxx.rb.xhtml.pdf'
      result = Pdfs2Pdf::Utils.page_count(input_file)
      result.must_equal 1
    end
  end
end

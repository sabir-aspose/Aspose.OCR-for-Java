module Asposeocrjava
  module GetTextPartHierarchyOfText
    def initialize()
        data_dir = File.dirname(File.dirname(File.dirname(File.dirname(__FILE__)))) + '/data/'
                
        # Initialize an instance of OcrEngine
        ocr_engine = Rjb::import('com.aspose.ocr.OcrEngine').new

        # Set the Image property by loading the image from file path location
        ocr_engine.setImage(Rjb::import('com.aspose.ocr.ImageStream').fromFile(data_dir + 'ocr.png'))

        # Process the image
        if ocr_engine.process()
            # Retrieve the first block of the recognized text part
            first_block = ocr_engine.getText().getPartsInfo()[0]

            # Get the children of the first block that will the the lines in the block
            lines_of_first_block = first_block.getChildren()

            # Retrieve the fist line from the collection of lines
            first_line = lines_of_first_block[0]

            # Display the level of line
            puts first_line.getLevel()

            # Retrieve the fist word from the collection of words
            first_word = first_line.getChildren()[0]

            # Display the level of word
            puts first_word.getLevel()

            # Retrieve the fist character from the collection of characters
            first_character = first_word.getChildren()[0]

            # Display the level of character
            puts first_character.getLevel()
        end
    end
  end
end

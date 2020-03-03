COLOUR_CODE = {r: 31, #red
                g: 32, #green
                y: 33, #yellow
                be: 34, #blue
                pk: 35, #pink
                lb: 36, #light blue
                bd: 1, #bold
                bl: 30, #black
                cl:0}.freeze #clear

COLOUR_ABBREV = {'red': 'r',
                'green': 'g',
                'yellow': 'y',
                'blue': 'be',
                'pink': 'p',
                'light_blue': 'lb',
                'bold': 'bd',
                'black': 'bk',
                'clear': 'c'}.freeze

COLOUR_ABBR = COLOUR_CODE.keys.map(&:to_s)

p COLOUR_ABBR


def format_code(type)
  type = type.to_sym
  COLOUR_CODE[type]
end

def format_type(text,type1="",type2)

  code1 = format_code(type1)
  code2 = format_code(type2)

  puts "\e[#{code1};#{code2}m#{text}\e[0m"
end


puts "Please enter any text"

your_text = gets.chomp

Random_colour = ''

format_type(your_text,'bd','pk') # format_type (text,format,additional_format)

format_type(your_text,'bd',COLOUR_ABBR.sample)
#puts "\e[42mHello\e[0m"

#\e[bold;foreground;background\e[om

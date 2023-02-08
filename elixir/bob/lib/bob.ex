defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      # "if you yell a question at him."
      is_phrase?(input) and is_question(input) and is_shout?(input) ->
        "Calm down, I know what I'm doing!"

      # "if you YELL AT HIM (in all capitals)."
      is_phrase?(input) and is_shout?(input) ->
        "Whoa, chill out!"

      # "if you ask him a question"
      is_phrase?(input) and is_question(input) ->
        "Sure."

      # "if you address him without actually saying anything."
      String.trim(input) == "" ->
        "Fine. Be that way!"

      true ->
        "Whatever."
    end
  end

  def is_phrase?(input) do
    String.match?(input, ~r/[[:word:][:blank:]]/)
  end

  def is_question(input) do
    String.ends_with?(input, "?")
  end

  def is_shout?(input) do
    input == String.upcase(input)
  end

  # def is_shout_question?(input) do
  #   String.ends_with?(input, "?") and is_upcase_phrase?(input)
  # end

  # def is_question?(input) do
  #   String.ends_with?(input, "?") and String.match?(input, ~r/[[:word:]]+/)
  # end

  # def is_upcase_phrase?(input) do
  #   input == String.upcase(input) and String.match?(input, ~r/[[:word:]]+/)
  # end
end

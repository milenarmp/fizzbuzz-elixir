defmodule FizzBuzz do
  @moduledoc """
  Implementação do FizzBuzz que lê números de um arquivo.
  """

  @doc """
  Lê um arquivo com números separados por vírgula e aplica as regras do FizzBuzz.
  """
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    response =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate/1)

    {:ok, response}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Could not read the file: #{reason}"}

  defp convert_and_evaluate(elem) do
    elem
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number
end

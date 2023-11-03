defmodule BisseccaoFalsaPosicao do
  def bisseccao(f, a, b, e) do
    x = (a + b) / 2.0

    f_x = f.(x)
    f_a = f.(a)

    cond do
      abs(f_x) <= e ->
        x

      f_x * f_a < 0 ->
        b = x
        bisseccao(f, a, b, e)

      true ->
        a = x
        bisseccao(f, a, b, e)
    end
  end
end

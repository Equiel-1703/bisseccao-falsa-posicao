defmodule BisseccaoFalsaPosicao do
  @moduledoc false

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

  def falsa_posicao(f, a, b, e) do
    f_a = f.(a)
    f_b = f.(b)

    x = (a * f_b - b * f_a) / (f_b - f_a)
    f_x = f.(x)

    cond do
      abs(f_x) <= e ->
        x

      f_x * f_a < 0 ->
        b = x
        falsa_posicao(f, a, b, e)

      true ->
        a = x
        falsa_posicao(f, a, b, e)
    end
  end

  def falsa_posicao_it(f, a, b, it) do
    f_a = f.(a)
    f_b = f.(b)

    x = (a * f_b - b * f_a) / (f_b - f_a)
    f_x = f.(x)

    cond do
      it - 1 < 0 ->
        x

      f_x * f_a < 0 ->
        b = x
        falsa_posicao_it(f, a, b, it - 1)

      true ->
        a = x
        falsa_posicao_it(f, a, b, it - 1)
    end
  end
end

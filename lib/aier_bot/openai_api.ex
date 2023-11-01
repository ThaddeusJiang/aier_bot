defmodule AierBot.OpenaiApi do
  alias OpenaiEx.Image

  def openai() do
    api_key = Application.fetch_env!(:aier_bot, :openai_api_key)
    openai = OpenaiEx.new(api_key)

    openai
  end

  def image_generation(prompt) do
    openai = openai()

    res_urls =
      openai
      |> Image.create(%{
        prompt: prompt,
        n: 2,
        size: "1024x1024"
      })
      #   |> IO.inspect()
      |> Map.get("data")
      |> Enum.map(fn x -> x["url"] end)

    {:ok, %{data: res_urls}}
  end
end

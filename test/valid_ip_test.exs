defmodule Solution do

    def is_valid_ip(ip) do
      split = String.split(ip, ".")
      if length(split) != 4 do
        false
      else
        split |> Enum.all?(&valid_octet/1)
      end
    end

    defp valid_octet(part) when is_number(part) and part > -1 and part < 256 do
       true
    end

    defp valid_octet(part) when part == "0",  do: true

    defp valid_octet(part) when is_binary(part) and byte_size(part) > 0  do
      <<head :: binary-size(1)>> <> _ = part
      if head == "0" do
         false
      else
        case Integer.parse(part) do
          {number, ""} -> valid_octet(number)
          _ -> false
        end
      end
    end


    defp valid_octet(part) do
      false
    end

end


defmodule TestSolution do
  use ExUnit.Case
  doctest App


  @ips [{"12.255.56.1",true},
  {"",false},
  {"abc.def.ghi.jkl",false},
  {"123.456.789.0",false},
  {"12.34.56",false},
  {"12.34.56 .1",false},
  {"12.34.56.-1",false},
  {"123.045.067.089",false},
  {"127.1.1.0",true},
  {"0.0.0.0",true},
  {"0.34.82.53",true},
  {"192.168.1.300",false}
  ]

  test "Test ip validity" do
     for {ip,result} <- @ips do
      IO.puts "expect"
      IO.puts(result)
       IO.puts "Testing " <> ip
       assert Solution.is_valid_ip(ip) == result
     end
  end
end

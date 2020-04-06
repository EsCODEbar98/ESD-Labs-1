  signal sum: std_logic_vector(15 downto 0);
  signal g, p : std_logic_vector(15 downto 0); --generate, propagate
  signal ovfs : std_logic_vector(3 downto 0);
  
begin
  
  --set up
  g <= x and y;
  p <= x xor y;
  
  cin(0) <= c_in;

  CSA1: carryselectadder port map (g(15 downto 12), p(15 downto 12), cin(0), sum(15 downto 12), cin(1), ovfs(0));
  CSA2: carryselectadder port map (g(11 downto 8), p(11 downto 8), cin(1), sum(11 downto 8), cin(2), ovfs(1));
  CSA3: carryselectadder port map (g(7 downto 4), p(7 downto 4), cin(2), sum(7 downto 4), cin(3), ovfs(2)); 
  CSA4: carryselectadder port map (g(3 downto 0), p(3 downto 0), cin(3), sum(3 downto 0), c_out, ovfs(3));
  
  s <= signed(sum);
  
  --ovf 
  ovf <= ovfs(3);
  
end sum;

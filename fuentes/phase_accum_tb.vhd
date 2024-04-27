library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.param_package.all;

entity phase_accum_tb is
    begin
    end phase_accum_tb;

architecture phase_accum_tb_arch of phase_accum_tb is

    component phase_accum

        port (

          clk         : in  std_logic;
          reset       : in  std_logic;
          en          : in  std_logic;

          phase_inc   : in  std_logic_vector((ADDRES_BITS-1) downto 0);

          sine_out    : out std_logic_vector((AMPLITUDE_BITS-1) downto 0);
          saw_out     : out std_logic_vector((AMPLITUDE_BITS-1) downto 0)
          );

    end component;


    signal  clk        : std_logic := '0';
    signal  reset      : std_logic := '0';
    signal  en         : std_logic := '1';

    signal  phase_inc  : std_logic_vector((ADDRES_BITS-1) downto 0) := (others => '0');

    signal  sine_out   : std_logic_vector((AMPLITUDE_BITS-1) downto 0);
    signal  saw_out    : std_logic_vector((AMPLITUDE_BITS-1) downto 0);

    signal  sine_int   : integer;
    signal  saw_int    : integer;


    begin


    -- Generacion de reloj clk = 100MHz
    clk <= not clk after 5 ns;


-----------------------------------------------
-- Incremento de Fase de 12bits              --
-----------------------------------------------
    phase_inc <= X"045";

-----------------------------------------------
-- Inicializacion del Test Bench             --
-----------------------------------------------
    test_bench_control: process
    begin
        wait for 30 ns;
        wait until clk'event and clk = '1';
        reset <= '1';
    end process test_bench_control;

    -- DUT
    nco: phase_accum

        port map (

          clk         => clk,
          reset       => reset,
          en          => en,

          -- Control de frecuencia NCO
          phase_inc   => phase_inc,

          sine_out    => sine_out,
          saw_out     => saw_out
          );
  
    -- Conversion de salidas a enteros
    sine_int <= conv_integer(signed(sine_out));
    saw_int  <= conv_integer(signed(saw_out));
  
end phase_accum_tb_arch;

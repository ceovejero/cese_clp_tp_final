
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.param_package.all;


entity phase_accum is

    port (

      clk         : in  std_logic;
      reset       : in  std_logic;
      en          : in  std_logic;

      phase_inc   : in  std_logic_vector((ADDRES_BITS-1) downto 0);

      sine_out    : out std_logic_vector((AMPLITUDE_BITS-1) downto 0);
      saw_out     : out std_logic_vector((AMPLITUDE_BITS-1) downto 0)
      );
  
end entity;


architecture phase_accum_arq of phase_accum is


    component sine_rom

        port (

          clk           : in  std_logic;
          en            : in  std_logic;
          rom_addr      : in  std_logic_vector((ADDRES_BITS-1) downto 0);
          sine_out      : out std_logic_vector((AMPLITUDE_BITS-1) downto 0)
          );

    end component;


    signal  phase_acc     : std_logic_vector((ADDRES_BITS-1) downto 0);
    signal  lut_addr      : std_logic_vector((ADDRES_BITS-1) downto 0);
    signal  lut_addr_reg  : std_logic_vector((ADDRES_BITS-1) downto 0);


    begin

------------------------------------------------------
-- El Acumulador de Fase incrementa por 'phase_inc' --
------------------------------------------------------

    phase_acc_reg: process(clk, reset)
    begin
      if reset = '0' then
        phase_acc <= (others => '0');
      elsif clk'event and clk = '1' then
        if en = '1' then
          phase_acc <= unsigned(phase_acc) + unsigned(phase_inc);
        end if;
      end if;
    end process phase_acc_reg;

-----------------------------------------------------
--  Acumulador de Fase se conecta a lut_addr para  --
--  para luego direccionar SINE_ROM por rom_addr   --
-----------------------------------------------------

    lut_addr <= phase_acc((ADDRES_BITS-1) downto 0);

-----------------------------------------------------
-- Conexion de señales con sine_rom                --
-----------------------------------------------------

    lut: sine_rom

      port map (

        clk       => clk,
        en        => en,
        rom_addr  => lut_addr,
        sine_out  => sine_out
        );

-----------------------------------------
-- condiciones para señal lut_addr_reg --
-----------------------------------------

    delay_regs: process(clk)
    begin
      if clk'event and clk = '1' then
        if en = '1' then
          lut_addr_reg <= lut_addr;
        end if;
      end if;
    end process delay_regs;

-------------------------------------------------------
-- Señal lut_addr_reg como salida "diente de sierra" --
-------------------------------------------------------

    saw_out <= lut_addr_reg;
    
    
end phase_accum_arq;

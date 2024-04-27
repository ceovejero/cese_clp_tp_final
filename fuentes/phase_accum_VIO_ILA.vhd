library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.param_package.all;


entity phase_accum_VIO_ILA is

    port (
            clk : in  std_logic
        );

end entity;

architecture phase_accum_VIO_ILA_arq of phase_accum_VIO_ILA is

    -- Parte declarativa
    component phase_accum     -- is
    port (
      clk         : in  std_logic;
      reset       : in  std_logic;
      en          : in  std_logic;

      phase_inc   : in  std_logic_vector((ADDRES_BITS-1) downto 0);

      sine_out    : out std_logic_vector((AMPLITUDE_BITS-1) downto 0);
      saw_out     : out std_logic_vector((AMPLITUDE_BITS-1) downto 0)
     );

    end component;

    COMPONENT vio
      PORT (
        clk : IN STD_LOGIC;
        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out2 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT ila
    
    PORT (
        clk : IN STD_LOGIC;
    
        probe0 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        probe1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
    END COMPONENT  ;

    -- señales de salida
    signal probe_reset      : std_logic_vector(0 downto 0);
    signal probe_en         : std_logic_vector(0 downto 0);
    signal prove_phase_inc  : std_logic_vector(11 DOWNTO 0);
    -- señales de entrada
    signal probe_sine       : std_logic_vector(11 DOWNTO 0);
    signal probe_saw        : std_logic_vector(11 DOWNTO 0);

begin

    -- Parte descriptiva
        phase_accum_inst : phase_accum
          port map(
              clk       => clk,
              reset     => probe_reset(0),
              en        => probe_en(0),
              phase_inc => prove_phase_inc,
              sine_out  => probe_sine,
              saw_out   => probe_saw
          );

        vio_inst : vio
          PORT MAP (
            clk => clk,
            probe_out0 => probe_reset,
            probe_out1 => probe_en,
            probe_out2 => prove_phase_inc
            );

        ila_inst : ila
        PORT MAP (
            clk => clk,

            probe0 => probe_sine,
            probe1 => probe_saw
        );

end;

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


segments = [ 63, 6, 91, 79, 102, 109, 124, 7, 127, 103, 119, 124, 88, 94, 121, 113 ]

@cocotb.test()
async def test_7seg(dut):
    dut._log.info("start")
    clock = Clock(dut.latch, 10, units="us")
    cocotb.start_soon(clock.start())

    dut._log.info("check all segments")
    for i in range(16):
        dut._log.info("check segment {}".format(i))
        dut.data.value = i
        dut.blank.value = 0
        dut.decimal_in.value = 0
        await ClockCycles(dut.latch, 2)
        assert int(dut.segments.value) == segments[i]
        dut.decimal_in.value = 0
        await ClockCycles(dut.latch, 1)
        assert int(dut.decimal.value) == 0
        dut.decimal_in.value = 1
        await ClockCycles(dut.latch, 1)
        assert int(dut.decimal.value) == 1
        dut.blank.value = 1
        await ClockCycles(dut.latch, 1)
        assert int(dut.segments.value) == 0
        await ClockCycles(dut.latch, 1)

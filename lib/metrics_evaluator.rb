module MetricsEvaluator
  include Math
  extend self

  # とりあえず電圧は100[V](AC)でOK(実効値)
  VOLTAGE = 100.0 # [V]
  Vm = VOLTAGE * sqrt(2) # [V]
  Im = 15 # [A]
  BASE_BILL = 27 # [円/Wh]

  # 有効電力 [W]
  def watt(ec)
    phase_diff = phase_current(ec) - phase_voltage
    p = VOLTAGE * ec * cos(phase_diff)
    return p
  end

  # 電気料金 [円]
  def bill(ec, duration)
    w = watt(ec)
    bill = w * duration / 1000 * BASE_BILL
    return bill
  end

  private

  # 取得した電流量についての位相を返す
  def phase_current(c)
    asin(c / Im)
  end

  # 電圧の位相を返す
  def phase_voltage
    asin(VOLTAGE / Vm)
  end
end

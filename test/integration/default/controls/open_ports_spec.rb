control 'open_ports' do
  describe port(80) do
    it { should_not be_listening }
  end

  describe port(22) do
    it { should be_listening }
  end
end

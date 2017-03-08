control 'internet_access' do
  describe host('8.8.8.8', proto: 'icmp') do
    it { should be_reachable }
  end
end

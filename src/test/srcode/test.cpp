std::shared_ptr<ProcessGroupNCCL::WorkNCCL> ProcessGroupNCCL::initWork(
    std::vector<at::Device> devices,
    int rank,
    OpType opType) {
  return std::make_shared<ProcessGroupNCCL::WorkNCCL>(devices, rank, opType);
}
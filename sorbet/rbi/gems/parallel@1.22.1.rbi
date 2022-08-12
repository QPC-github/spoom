# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `parallel` gem.
# Please instead update this file by running `bin/tapioca gem parallel`.

module Parallel
  extend ::Parallel::ProcessorCount

  class << self
    # @return [Boolean]
    def all?(*args, &block); end

    # @return [Boolean]
    def any?(*args, &block); end

    def each(array, options = T.unsafe(nil), &block); end
    def each_with_index(array, options = T.unsafe(nil), &block); end
    def flat_map(*args, &block); end
    def in_processes(options = T.unsafe(nil), &block); end
    def in_threads(options = T.unsafe(nil)); end
    def map(source, options = T.unsafe(nil), &block); end
    def map_with_index(array, options = T.unsafe(nil), &block); end
    def worker_number; end

    # TODO: this does not work when doing threads in forks, so should remove and yield the number instead if needed
    def worker_number=(worker_num); end

    private

    def add_progress_bar!(job_factory, options); end
    def call_with_index(item, index, options, &block); end
    def create_workers(job_factory, options, &block); end

    # options is either a Integer or a Hash with :count
    def extract_count_from_options(options); end

    def instrument_finish(item, index, result, options); end
    def instrument_start(item, index, options); end
    def process_incoming_jobs(read, write, job_factory, options, &block); end
    def replace_worker(job_factory, workers, index, options, blk); end
    def with_instrumentation(item, index, options); end
    def work_direct(job_factory, options, &block); end
    def work_in_processes(job_factory, options, &blk); end
    def work_in_ractors(job_factory, options); end
    def work_in_threads(job_factory, options, &block); end
    def worker(job_factory, options, &block); end
  end
end

class Parallel::Break < ::StandardError
  # @return [Break] a new instance of Break
  def initialize(value = T.unsafe(nil)); end

  # Returns the value of attribute value.
  def value; end
end

class Parallel::DeadWorker < ::StandardError; end

class Parallel::ExceptionWrapper
  # @return [ExceptionWrapper] a new instance of ExceptionWrapper
  def initialize(exception); end

  # Returns the value of attribute exception.
  def exception; end
end

class Parallel::JobFactory
  # @return [JobFactory] a new instance of JobFactory
  def initialize(source, mutex); end

  def next; end

  # generate item that is sent to workers
  # just index is faster + less likely to blow up with unserializable errors
  def pack(item, index); end

  def size; end

  # unpack item that is sent to workers
  def unpack(data); end

  private

  # @return [Boolean]
  def producer?; end

  def queue_wrapper(array); end
end

class Parallel::Kill < ::Parallel::Break; end

# TODO: inline this method into parallel.rb and kill physical_processor_count in next major release
module Parallel::ProcessorCount
  # Number of physical processor cores on the current system.
  def physical_processor_count; end

  # Number of processors seen by the OS, used for process scheduling
  def processor_count; end
end

Parallel::Stop = T.let(T.unsafe(nil), Object)

class Parallel::UndumpableException < ::StandardError
  # @return [UndumpableException] a new instance of UndumpableException
  def initialize(original); end

  # Returns the value of attribute backtrace.
  def backtrace; end
end

class Parallel::UserInterruptHandler
  class << self
    def kill(thing); end

    # kill all these pids or threads if user presses Ctrl+c
    def kill_on_ctrl_c(pids, options); end

    private

    def restore_interrupt(old, signal); end
    def trap_interrupt(signal); end
  end
end

Parallel::UserInterruptHandler::INTERRUPT_SIGNAL = T.let(T.unsafe(nil), Symbol)
Parallel::VERSION = T.let(T.unsafe(nil), String)
Parallel::Version = T.let(T.unsafe(nil), String)

class Parallel::Worker
  # @return [Worker] a new instance of Worker
  def initialize(read, write, pid); end

  # might be passed to started_processes and simultaneously closed by another thread
  # when running in isolation mode, so we have to check if it is closed before closing
  def close_pipes; end

  # Returns the value of attribute pid.
  def pid; end

  # Returns the value of attribute read.
  def read; end

  def stop; end

  # Returns the value of attribute thread.
  def thread; end

  # Sets the attribute thread
  #
  # @param value the value to set the attribute thread to.
  def thread=(_arg0); end

  def work(data); end

  # Returns the value of attribute write.
  def write; end

  private

  def wait; end
end

module RequestStore
  def self.store
    Thread.current[:request_store] ||= {}
  end

  def self.store=(store)
    Thread.current[:request_store] = store
  end

  def self.clear!
    Thread.current[:request_store] = {}
  end

  def self.clear!
    Thread.current[:request_store] = {}
  end

  def self.read(key)
    store[key]
  end

  def self.[](key)
    store[key]
  end

  def self.write(key, value)
    store[key] = value
  end

  def self.[]=(key, value)
    store[key] = value
  end

  def self.exist?(key)
    store.key?(key)
  end

  def self.fetch(key)
    store[key] = yield unless exist?(key)
    store[key]
  end

  def self.delete(key, &block)
    store.delete(key, &block)
  end
end

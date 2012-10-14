module PhantomStatic

  class Runner

    def self.run(webpage, builder_obj)
      file = PhantomStatic.generate_random_file(builder_obj.output)
      options = builder_obj.bridge_settings

      PhantomStatic.bridge_invoke(webpage, file, options)
      return nil unless File.exists?(file)

      file
    end

    def self.as_file(webpage, &block)
      settings = Builder.build(&block)

      self.run(webpage, settings)
    end
  end

end
# -*- coding: utf-8 -*-
module Hiroshimarb

  # コマンドを実装する際の基底クラス
  class Command

    class << self

      def commands
        @commands ||= {}
      end

      def inherited(subclass)
        name = subclass.command_name
        commands[name] = subclass
      end

      def find(command_name)
        if command = commands[command_name.to_sym]
          command.new
        else
          nil
        end
      end

      def command_name
        name.split('::').last.downcase.to_sym
      end
    end

    def call(arg)
    end

  end
end

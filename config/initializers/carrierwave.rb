module CarrierWave
  module MiniMagick
    def fix_rotation
      manipulate! do |img|
        img.auto_orient
        img = yield(img) if block_given?
        img
      end
    end
  end
end
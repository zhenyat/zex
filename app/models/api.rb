################################################################################
# Model:  Api
#
# Purpose:  Dotcoms' APIs
#
# Api attributes:
#   dotcom_id   - FK
#   mode        - API mode: enum { demo_api (0) | public_api (1) | private_api (2) }
#   path        - path added to endpoint
#   user        - string
#   status      - enum { active (0) | archived (1) }
#
#  16.10.2022 ZT
#  15.11.2022 key & secret were removed
################################################################################
class Api < ApplicationRecord
  belongs_to :dotcom, required: true
  has_many   :calls, dependent: :destroy

  enum mode:   %w(demo_api public_api private_api)
  enum status: %w(active archived)

  def endpoint
    self.base_url + self.path
  end

  def show_key
    get_key
  end

  def show_secret
    get_secret
  end

  private
    def get_key
      Rails.application.credentials.config[self.dotcom.name.to_sym][self.mode.to_sym][:key]
    end

    def get_secret
      Rails.application.credentials.config[self.dotcom.name.to_sym][self.mode.to_sym][:secret]
    end
end

class Site < ApplicationRecord
  resourcify

  has_one :site_view, dependent: :destroy

  after_create :create_site_view

  validates :name, :subdomain, uniqueness: true

  class << self
    def default
      site = Site.new(id: 0, name: "root", subdomain: "")
      site.site_view = SiteView.default
      site
    end
  end

  def save_editors(editor_emails)
    emails = editor_emails.is_a?(Array) ? editor_emails : [editor_emails]
    existing = id.blank? ? [] : User.with_role(:site_editor, self)
    new_editors = User.where(email: emails).to_a
    (new_editors - existing).map do |user|
      user.add_role(:site_editor, self)
    end
    (existing - new_editors).map do |user|
      user.remove_role(:site_editor, self)
    end
  end

  private

  def create_site_view
    self.site_view = SiteView.new
    save!
  end
end

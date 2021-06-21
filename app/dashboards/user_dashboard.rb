require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    workshop_bookings: Field::HasMany,
    projects: Field::HasMany,
    investments: Field::HasMany,
    likes: Field::HasMany,
    avatar_attachment: Field::HasOne,
    avatar_blob: Field::HasOne,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    first_name: Field::String,
    last_name: Field::String,
    phone_number: Field::String,
    is_entrepreneur: Field::Boolean,
    is_teacher: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    balance: Field::Number,
    language: Field::String,
    admin: Field::Boolean,
    done_pitch_lesson: Field::Boolean,
    next_action: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    watched_tutorial: Field::Boolean,
    is_approved_for_workshop: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    workshop_bookings
    projects
    investments
    likes
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    workshop_bookings
    projects
    investments
    likes
    avatar_attachment
    avatar_blob
    id
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    first_name
    last_name
    phone_number
    is_entrepreneur
    is_teacher
    created_at
    updated_at
    balance
    language
    admin
    done_pitch_lesson
    next_action
    watched_tutorial
    is_approved_for_workshop
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    workshop_bookings
    projects
    investments
    likes
    avatar_attachment
    avatar_blob
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    first_name
    last_name
    phone_number
    is_entrepreneur
    is_teacher
    balance
    language
    admin
    done_pitch_lesson
    next_action
    watched_tutorial
    is_approved_for_workshop
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end

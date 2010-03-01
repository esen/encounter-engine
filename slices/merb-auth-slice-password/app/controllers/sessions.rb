# Classes needed for authentication bridge with Joomla

$JOOMLA_BRIDGE = "ON"

class Joomla_Database < ActiveRecord::Base
	establish_connection(
		:adapter  => "mysql",
		:host     => "localhost",
		:database => "joomlasite",
		:username => "root",
		:password => ""
	)
end

class JoomlaSession < Joomla_Database
	set_table_name 'jos_session'
	set_primary_key 'session_id'
end

# Till here

class MerbAuthSlicePassword::Sessions < MerbAuthSlicePassword::Application

  before :_maintain_auth_session_before, :exclude => [:destroy] # Need to hang onto the redirection during the session.abandon!
  before :_abandon_session, :only => [:update, :destroy]
  before :_maintain_auth_session_after, :exclude => [:destroy] # Need to hang onto the redirection during the session.abandon!
  before :ensure_authenticated, :only => [:update]

  # redirect from an after filter for max flexibility
  # We can then put it into a slice and ppl can easily
  # customize the action
  after :redirect_after_login, :only => :update, :if => lambda{ !(300..399).include?(status) }
  after :redirect_after_logout, :only => :destroy

  def update
    "Add an after filter to do stuff after login"
  end

  def destroy
    "Add an after filter to do stuff after logout"
  end


  private
  # @overwritable
  def redirect_after_login
    redirect_back_or "/dashboard", :ignore => [slice_url(:login), slice_url(:logout)]
  end

  # @overwritable
  def redirect_after_logout

		# Code neede for authentication bridge with Joomla
		if $JOOMLA_BRIDGE == "ON" then
			enc_session_id = cookies[Merb::Config[:session_id_key]]
			enc_ses_data = Merb::ActiveRecordSessionStore.retrieve_session(enc_session_id)
			enc_user_id = enc_ses_data["user"] if enc_ses_data!=nil

			JoomlaSession.delete_all("userid = #{enc_user_id}") if enc_user_id
		end
		# till here

    redirect "/"
  end

  # @private
  def _maintain_auth_session_before
    @_maintain_auth_session = {}
    Merb::Authentication.maintain_session_keys.each do |k|
      @_maintain_auth_session[k] = session[k]
    end
  end

  # @private
  def _maintain_auth_session_after
    @_maintain_auth_session.each do |k,v|
      session[k] = v
    end
  end

  # @private
  def _abandon_session
    session.abandon!
  end
end
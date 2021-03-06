# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module AbusiveexperiencereportV1
      # Abusive Experience Report API
      #
      # Views Abusive Experience Report data, and gets a list of sites that have a
      #  significant number of abusive experiences.
      #
      # @example
      #    require 'google/apis/abusiveexperiencereport_v1'
      #
      #    Abusiveexperiencereport = Google::Apis::AbusiveexperiencereportV1 # Alias the module
      #    service = Abusiveexperiencereport::AbusiveExperienceReportService.new
      #
      # @see https://developers.google.com/abusive-experience-report/
      class AbusiveExperienceReportService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://abusiveexperiencereport.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Gets a summary of the abusive experience rating of a site.
        # @param [String] name
        #   The required site name. This is the site property whose abusive
        #   experiences have been reviewed, and it must be URL-encoded. For example,
        #   sites/https%3A%2F%2Fwww.google.com. The server will return an error of
        #   BAD_REQUEST if this field is not filled in. Note that if the site property
        #   is not yet verified in Search Console, the reportUrl field
        #   returned by the API will lead to the verification page, prompting the user
        #   to go through that process before they can gain access to the Abusive
        #   Experience Report.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AbusiveexperiencereportV1::SiteSummaryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AbusiveexperiencereportV1::SiteSummaryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_site(name, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::AbusiveexperiencereportV1::SiteSummaryResponse::Representation
          command.response_class = Google::Apis::AbusiveexperiencereportV1::SiteSummaryResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists sites with Abusive Experience Report statuses of "Failing".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AbusiveexperiencereportV1::ViolatingSitesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AbusiveexperiencereportV1::ViolatingSitesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_violating_sites(fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/violatingSites', options)
          command.response_representation = Google::Apis::AbusiveexperiencereportV1::ViolatingSitesResponse::Representation
          command.response_class = Google::Apis::AbusiveexperiencereportV1::ViolatingSitesResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end

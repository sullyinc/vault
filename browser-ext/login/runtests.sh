#!/bin/sh
#
# *****************************************************************************
# Copyright (c) 2012, 2013, 2014 Lectorius, Inc.
# Authors:
# Vijay Pandurangan
# Evan Jones
# Adam Hilss
#
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#     You can contact the authors at team@vaultapp.xyz.
# *****************************************************************************
#

# Runs all Javascript unit tests, in node or in the browser

set -e

JASMINE="../api/build/node/bin/jasmine-node --captureExceptions --matchall --nohelpers --verbose"
KARMA="../api/build/node/lib/node_modules/karma/bin/karma"

$JASMINE frontend/static/js/exportsecrets_test.js frontend/static/js/import-common_test.js ../api/js/cli/password_generator_test.js ../api/js/cli/mitroclient_test.js frontend/static/js/userdata_test.js || exit $?
$KARMA start karma_conf.js --single-run || exit $?
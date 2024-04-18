<?php
remove_action('um_submit_form_errors_hook_login', 'um_submit_form_errors_hook_login');
add_action('um_submit_form_errors_hook_login', 'zf_submit_form_errors_hook_login');

function zf_submit_form_errors_hook_login($submitted_data) {

    $user_password = $submitted_data['user_password'];

	if ( isset( $submitted_data['username'] ) && $submitted_data['username'] == '' ) {
		UM()->form()->add_error( 'username', __( 'Please enter your username or email', 'ultimate-member' ) );
	}

	if ( isset( $submitted_data['user_login'] ) && $submitted_data['user_login'] == '' ) {
		UM()->form()->add_error( 'user_login', __( 'Please enter your username', 'ultimate-member' ) );
	}

	if ( isset( $submitted_data['user_email'] ) && $submitted_data['user_email'] == '' ) {
		UM()->form()->add_error( 'user_email', __( 'Please enter your email', 'ultimate-member' ) );
	}

	if ( isset( $submitted_data['username'] ) ) {
		$authenticate = $submitted_data['username'];
		$field = 'username';
		if ( is_email( $submitted_data['username'] ) ) {
			$data = get_user_by('email', $submitted_data['username'] );
			$user_name = isset( $data->user_login ) ? $data->user_login : null;
		} else {
			$user_name  = $submitted_data['username'];
		}
	} elseif ( isset( $submitted_data['user_email'] ) ) {
		$authenticate = $submitted_data['user_email'];
		$field = 'user_email';
		$data = get_user_by('email', $submitted_data['user_email'] );
		$user_name = isset( $data->user_login ) ? $data->user_login : null;
	} else {
		$field = 'user_login';
		$user_name = $submitted_data['user_login'];
		$authenticate = $submitted_data['user_login'];
	}

	if ( $submitted_data['user_password'] == '' ) {
		UM()->form()->add_error( 'user_password', __( 'Please enter your password', 'ultimate-member' ) );
	}

	$user = apply_filters( 'authenticate', null, $authenticate, $submitted_data['user_password'] );

	if (is_wp_error( $user )) {
		UM()->form()->add_error( $user->get_error_code(), $user->get_error_message() );
	} else {
		UM()->login()->auth_id = username_exists( $user_name );
	}

	// if there is an error notify wp
	if ( UM()->form()->has_error( $field ) || UM()->form()->has_error( $submitted_data['user_password'] ) || UM()->form()->count_errors() > 0 ) {
		do_action( 'wp_login_failed', $user_name, UM()->form()->get_wp_error() );
	}
}

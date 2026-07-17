Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B8E3C9EE6
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 07:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272737; cv=none; b=FeSyfXwrrGDG8Lc9MZC0jBkSX6D7jRr1S9OxRvUum/9joTdjQFzM6gzV0xEw+W6o9i0aN2qkZtQVlXin7ltgpJnRrxYTfcUMmxFiPTChldLwE98QAr/Iq2I/8ABxo3b+1MIKo2u1e8Rj+5oLCBRJbKLKCgK9QWDFUTWO+N26r4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272737; c=relaxed/simple;
	bh=REDMdXrjeT208MP684AvhlcUAjeABzkkY37ChbGrbCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGE1n7syBDTKsxfCL2uSpCgLkRAiadY/17ZQF+JPd1jTVb2XK7IWw7YMi89d0s7NxjCuap1T8pUNFYSJBN2XxllaN+vOTMCXvVOIIfkLCZUVAABj6krvRLNlKA+htq6UVC1RcZg+W9x1gEnhIZKiKlZqaKsEX+cxUHVeHg0obIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MY+oa9hJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r4wVOO8O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MY+oa9hJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r4wVOO8O; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MY+oa9hJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r4wVOO8O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MY+oa9hJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r4wVOO8O"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BB83B3E46;
	Fri, 17 Jul 2026 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784272733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xwa6Xhq/oyDKCOLYR5Qzr8wRbj2P/ruHJXx2OEL8gTk=;
	b=MY+oa9hJ4wx/+A5jFwJ1c3lZaptJDjM7oHSPtK3rlvop+gnkzi0U799M9dh4G53ECxvEVd
	hVOLCLpU+4Gw13jyJ5dTdOVde1/Fvd+LbC5HWfrGgSrT5kUmO0GyJEsf1GMP/TDiNp2nx4
	OTbUpZf+NSQuQfnDuEi1aFkpmaN1USo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784272733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xwa6Xhq/oyDKCOLYR5Qzr8wRbj2P/ruHJXx2OEL8gTk=;
	b=r4wVOO8OYDaYD3XXEnffeP9LU9RMPllvCt9kRhhq9TM+vrhdg/xLHgR2Cf5Io1aSnYNrF7
	hi/8IfWTNoW45gCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784272733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xwa6Xhq/oyDKCOLYR5Qzr8wRbj2P/ruHJXx2OEL8gTk=;
	b=MY+oa9hJ4wx/+A5jFwJ1c3lZaptJDjM7oHSPtK3rlvop+gnkzi0U799M9dh4G53ECxvEVd
	hVOLCLpU+4Gw13jyJ5dTdOVde1/Fvd+LbC5HWfrGgSrT5kUmO0GyJEsf1GMP/TDiNp2nx4
	OTbUpZf+NSQuQfnDuEi1aFkpmaN1USo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784272733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xwa6Xhq/oyDKCOLYR5Qzr8wRbj2P/ruHJXx2OEL8gTk=;
	b=r4wVOO8OYDaYD3XXEnffeP9LU9RMPllvCt9kRhhq9TM+vrhdg/xLHgR2Cf5Io1aSnYNrF7
	hi/8IfWTNoW45gCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 346A2779AA;
	Fri, 17 Jul 2026 07:18:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fEKZC13XWWpeegAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 17 Jul 2026 07:18:53 +0000
Message-ID: <26981ae1-4aef-4965-8600-f5e30a1b564a@suse.de>
Date: Fri, 17 Jul 2026 09:18:52 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
To: Ze Huang <ze.huang@oss.qualcomm.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, xen-devel@lists.xenproject.org
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
 <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,qualcomm.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-Spam-Level: 
X-Spam-Score: -2.80

Hi

Am 16.07.26 um 11:01 schrieb Ze Huang:
> Convert gm12u320 to direct primary plane, CRTC and encoder setup.
>
> Keep shadow-plane helper state, framebuffer access helpers and
> no-scaling plane-state check from simple-KMS path.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/tiny/gm12u320.c | 132 ++++++++++++++++++++++++++++++++--------
>   1 file changed, 107 insertions(+), 25 deletions(-)
>
[...]
>   
> -static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
> -				 struct drm_crtc_state *crtc_state,
> -				 struct drm_plane_state *plane_state)
> +static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					       struct drm_atomic_commit *commit)
>   {
>   	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
> -	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
> +	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
> +	struct drm_plane_state *plane_state = gm12u320->plane.state;

Did you see the reply from the Sashiko bot?

What happens is that user space can apply multiple atomic commits in a 
row, but they are applied to hardware asynchronously. So if you take the 
plane state here directly from the plane, it could have been replaced by 
a later atomic commit already.  Rather get the correct plane state with 
the helper drm_atomic_get_new_plane_state(). I did not look at all of 
the series' patches for this problem, but the rule applies to all of the 
mode-setting code. Best regards Thomas
>   	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>   
>   	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
>   	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], &rect);
>   }
>   
> -static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
> +static void gm12u320_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +						struct drm_atomic_commit *commit)
>   {
> -	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
> +	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
>   
>   	gm12u320_stop_fb_update(gm12u320);
>   }
>   
> -static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
> -				 struct drm_plane_state *old_state)
> +static void gm12u320_plane_helper_atomic_update(struct drm_plane *plane,
> +						struct drm_atomic_commit *commit)
>   {
> -	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(commit, plane);
> +	struct drm_plane_state *state = drm_atomic_get_new_plane_state(commit, plane);
>   	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
>   	struct drm_rect rect;
>   
> +	if (!state->fb)
> +		return;
> +
>   	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>   		gm12u320_fb_mark_dirty(state->fb, &shadow_plane_state->data[0], &rect);
>   }
>   
> -static const struct drm_simple_display_pipe_funcs gm12u320_pipe_funcs = {
> -	.enable	    = gm12u320_pipe_enable,
> -	.disable    = gm12u320_pipe_disable,
> -	.update	    = gm12u320_pipe_update,
> -	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
> +static const struct drm_plane_funcs gm12u320_plane_funcs = {
> +	.update_plane	= drm_atomic_helper_update_plane,
> +	.disable_plane	= drm_atomic_helper_disable_plane,
> +	.destroy	= drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> +};
> +
> +static int gm12u320_plane_helper_atomic_check(struct drm_plane *plane,
> +					      struct drm_atomic_commit *commit)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
> +	struct drm_crtc *crtc = plane_state->crtc;
> +	struct drm_crtc_state *crtc_state = NULL;
> +
> +	if (crtc)
> +		crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
> +
> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   false, false);
> +}
> +
> +static const struct drm_plane_helper_funcs gm12u320_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check	= gm12u320_plane_helper_atomic_check,
> +	.atomic_update	= gm12u320_plane_helper_atomic_update,
> +};
> +
> +static int gm12u320_crtc_helper_atomic_check(struct drm_crtc *crtc,
> +					     struct drm_atomic_commit *commit)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
> +	int ret;
> +
> +	if (crtc_state->enable) {
> +		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return drm_atomic_add_affected_planes(commit, crtc);
> +}
> +
> +static const struct drm_crtc_helper_funcs gm12u320_crtc_helper_funcs = {
> +	.atomic_check	= gm12u320_crtc_helper_atomic_check,
> +	.atomic_enable	= gm12u320_crtc_helper_atomic_enable,
> +	.atomic_disable	= gm12u320_crtc_helper_atomic_disable,
> +};
> +
> +static const struct drm_crtc_funcs gm12u320_crtc_funcs = {
> +	.set_config		= drm_atomic_helper_set_config,
> +	.page_flip		= drm_atomic_helper_page_flip,
> +	.reset			= drm_atomic_helper_crtc_reset,
> +	.destroy		= drm_crtc_cleanup,
> +	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_encoder_funcs gm12u320_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
>   };
>   
>   static const uint32_t gm12u320_pipe_formats[] = {
> @@ -677,13 +743,29 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
>   	if (ret)
>   		return ret;
>   
> -	ret = drm_simple_display_pipe_init(&gm12u320->dev,
> -					   &gm12u320->pipe,
> -					   &gm12u320_pipe_funcs,
> -					   gm12u320_pipe_formats,
> -					   ARRAY_SIZE(gm12u320_pipe_formats),
> -					   gm12u320_pipe_modifiers,
> -					   &gm12u320->conn);
> +	ret = drm_universal_plane_init(dev, &gm12u320->plane, 0,
> +				       &gm12u320_plane_funcs,
> +				       gm12u320_pipe_formats,
> +				       ARRAY_SIZE(gm12u320_pipe_formats),
> +				       gm12u320_pipe_modifiers,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ret;
> +	drm_plane_helper_add(&gm12u320->plane, &gm12u320_plane_helper_funcs);
> +
> +	ret = drm_crtc_init_with_planes(dev, &gm12u320->crtc, &gm12u320->plane, NULL,
> +					&gm12u320_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +	drm_crtc_helper_add(&gm12u320->crtc, &gm12u320_crtc_helper_funcs);
> +
> +	ret = drm_encoder_init(dev, &gm12u320->encoder, &gm12u320_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret)
> +		return ret;
> +	gm12u320->encoder.possible_crtcs = drm_crtc_mask(&gm12u320->crtc);
> +
> +	ret = drm_connector_attach_encoder(&gm12u320->conn, &gm12u320->encoder);
>   	if (ret)
>   		return ret;
>   
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)



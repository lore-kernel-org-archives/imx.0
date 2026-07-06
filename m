Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB772BFC7B
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322875; cv=none; b=bbMXRUrA1dBZEe+we2MgNmNyNpGeToOb5txk5XhdfbTskpWWGlbB+cDMaB80GbUgGsDwjeLTNO8pSIc9/lws6ZJfSq8HACkt0za3sNCCkVW16ryOcBNbhucFSFTJwLt4bKrMIvK9Bxesuwp+qPteJqGZFSTBQhHbqARYLNfrou0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322875; c=relaxed/simple;
	bh=E2IPGWg6g9z+kmInCDCaFk0puYcvTRbJqMUseelOiNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/KlXUDMKes9IvV6sRsc4F7jOhnJURcxAGAAZb6LmYdq84XyS9P83+R+K2m78nvsdVSA9RQXxGrvIQdjIUJxolHYbZ+0eseyCVvu9dyJwhofT3YXDga+obmvseXzGju+oJ8qr0o2Vfr7MwolonMKlMO1lOXvWE1wLc+KU3FkNsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0wpOaniI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vRZoMy4m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0wpOaniI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vRZoMy4m; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0wpOaniI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vRZoMy4m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0wpOaniI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vRZoMy4m"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F04575D1A;
	Mon,  6 Jul 2026 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783322868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+2Djb0q9WRkslYZbyJ71zpFQjsAPKkL2tq9BmdbU6nU=;
	b=0wpOaniIIGdIp6z0GgnhUgcX7Ud0CNlgNZsCsQlsgePgV/syB4GI+NetQO74Bu88DWebkJ
	JV4RcnUvOxIyYy8sZyMKhb2UP77fMvZEMirZrApFrnCjD5L+0SYMYo+ZFQQ5lID32YXDF1
	lItEzeSK46VQqsmy5ExgcL0vPlIuQ7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783322868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+2Djb0q9WRkslYZbyJ71zpFQjsAPKkL2tq9BmdbU6nU=;
	b=vRZoMy4mlXVDCDDzBHVKqK0jVdeF3GKGuTQBv6rpUASi6BEc+d8w4iSN5qdOKqb9Ez4Cpc
	/dCOcX9RcSAElJAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783322868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+2Djb0q9WRkslYZbyJ71zpFQjsAPKkL2tq9BmdbU6nU=;
	b=0wpOaniIIGdIp6z0GgnhUgcX7Ud0CNlgNZsCsQlsgePgV/syB4GI+NetQO74Bu88DWebkJ
	JV4RcnUvOxIyYy8sZyMKhb2UP77fMvZEMirZrApFrnCjD5L+0SYMYo+ZFQQ5lID32YXDF1
	lItEzeSK46VQqsmy5ExgcL0vPlIuQ7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783322868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+2Djb0q9WRkslYZbyJ71zpFQjsAPKkL2tq9BmdbU6nU=;
	b=vRZoMy4mlXVDCDDzBHVKqK0jVdeF3GKGuTQBv6rpUASi6BEc+d8w4iSN5qdOKqb9Ez4Cpc
	/dCOcX9RcSAElJAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3D21779AA;
	Mon,  6 Jul 2026 07:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WgXvJfNYS2pBcQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 06 Jul 2026 07:27:47 +0000
Message-ID: <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
Date: Mon, 6 Jul 2026 09:27:47 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] drm: replace simple display pipe users with atomic
 helpers
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
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
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
In-Reply-To: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,qualcomm.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -2.80

Hi

Am 04.07.26 um 20:31 schrieb Ze Huang:
> struct drm_simple_display_pipe was meant to simplify simple DRM
> drivers, but instead adds an extra wrapper around normal DRM atomic
> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
> should be converted to regular atomic helpers and stop depending on the
> simple-KMS interfaces.
>
> This series converts the following drivers:
>
>    - arcpgu
>    - aspeed
>    - imx lcdc
>    - mcde
>    - pl111
>    - gm12u320
>    - repaper
>    - tve200
>    - xen frontend
>
> Each patch replaces drm_simple_display_pipe_init() with explicit
> primary plane, CRTC and encoder setup, and moves the old simple-pipe
> callbacks into regular plane and CRTC helper callbacks named according
> to local driver conventions.
>
> The conversions preserve helper behavior that used to be implicit in
> drm_simple_kms_helper.c, including plane-state validation, CRTC
> primary-plane checks, affected-plane propagation, framebuffer prepare
> handling, and existing event/vblank flow where applicable.
>
> Result is less helper indirection and more explicit driver-side atomic
> wiring, with no remaining simple-KMS dependency in these drivers.
>
> These changes are build-tested only. No hardware testing has been
> performed on the affected devices.

Thanks a lot for the series. That's quite a nice cleanup.  Did you use 
any AI to create these patches?

Best regards
Thomas

>
> This series is based on drm-next-2026-06-27.
>
> Thanks,
> Ze Huang
>
> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
> ---
> Ze Huang (9):
>        drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers
>
>   drivers/gpu/drm/aspeed/aspeed_gfx.h      |   5 +-
>   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 156 ++++++++++++++++------
>   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
>   drivers/gpu/drm/imx/lcdc/imx-lcdc.c      | 178 ++++++++++++++++++-------
>   drivers/gpu/drm/mcde/mcde_display.c      | 162 ++++++++++++++++------
>   drivers/gpu/drm/mcde/mcde_drm.h          |   6 +-
>   drivers/gpu/drm/mcde/mcde_drv.c          |   3 +-
>   drivers/gpu/drm/pl111/pl111_display.c    | 174 ++++++++++++++++++------
>   drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
>   drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
>   drivers/gpu/drm/tiny/arcpgu.c            | 165 ++++++++++++++++++-----
>   drivers/gpu/drm/tiny/gm12u320.c          | 128 ++++++++++++++----
>   drivers/gpu/drm/tiny/repaper.c           | 130 ++++++++++++++----
>   drivers/gpu/drm/tve200/tve200_display.c  | 221 +++++++++++++++++++++----------
>   drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
>   drivers/gpu/drm/tve200/tve200_drv.c      |  17 ++-
>   drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
>   drivers/gpu/drm/xen/xen_drm_front_kms.c  | 177 +++++++++++++++++++------
>   18 files changed, 1164 insertions(+), 381 deletions(-)
> ---
> base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
> change-id: 20260704-drm-simple-kms-removal-01a031c6a129
>
> Best regards,
> --
> Ze Huang <ze.huang@oss.qualcomm.com>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F95438464
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 15:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562860; cv=none; b=mgnIUYB40goctpVlgYS8T9RI8uG+BTrvJJmaIEFDvFVv+EaPkMiQOk1vBu3u4A82HtpWI9sd3uMSM88pBtdWGcfvEaGuUb5mLydwwLKKTDJ2h0qKzRUrT+G4gQrAoCoOVWxesakMZ+wBZmnkHDhw6emZk/N/2aPfQOEAE5m2i6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562860; c=relaxed/simple;
	bh=8FdJ4eZW+PsVWWv1YG9aE+derJzdrC6TQH5IPjsYR/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iIk2T8JJeZB0G6lGWj140RUoW3bobHoSPu73a2b1qkMdRM6Oy4WhYYT6yEEZyjq+zhTyKc47LY+q1BHf5ofWw5qhD/5kcbV/RKpIod7hhhIWFmBjGFEx+mltNl0jsfBbychXa7eRrBzK1xexlhnUJdhiq8iQM5umoIWAX+NIT0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcveVqC7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcveVqC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773541F000E9;
	Mon, 20 Jul 2026 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784562858;
	bh=h4FtL+GwCY7Mo+W4nkJ1CUNyHo99Pgq0iuKUvWe5hNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DcveVqC7Fgu3NEKvExRHo/w/gxLBE1kaLqLiFg1uNuhrCYPCD78scfcOdN6DIzVEB
	 Svw5cGQvBNW+Yfvr+RHLA5T8UzhpTX2oPn1wT1SKPJKl9dLd6tdwDoqEgtRjWoJ2v5
	 fCDLPchrOSFks4mpbuCW6E1iYo63m3GLApCauvxx8ORdIOHvX0C63Ex8tFdjASzE3A
	 fEf4VRqIwjtPNk4XYZ5N5HVTVoz7O7a08PDoLEG9CKEzAYe3PtwnSU1Eb8X2o4SC07
	 /rqW/i+42Hp1Zu+N3H4Es3ndto56dbneUc0Kus8tzUqb24C+rDPzZLkcttl8FdF+N5
	 M9lEpBET7OPyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, wsa+renesas@sang-engineering.com, neil.armstrong@linaro.org
In-Reply-To: <20260720-drm_simple_encoder_init-v2-14-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-14-5020b630668a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 15:54:18 +0000
Message-Id: <20260720155418.773541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Removing drm_simple_encoder_init() breaks the build for the gma500 =
driver, which still has unconverted callers.
- [Low] The task to remove `drm_simple_encoder_init()` is still listed in t=
he GPU TODO list, leaving the documentation stale.
--

--- Patch [14]: [PATCH v2 14/15] drm/drm_simple: remove deprecated drm_simp=
le_encoder_init function ---
commit 017140dd8a05d473cb61f897db90d827140d76fc
Author: Diogo Silva <diogompaissilva@gmail.com>

drm/drm_simple: remove deprecated drm_simple_encoder_init function

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

All driver users of drm_simple_encoder_init() have been converted to
drm_encoder_init(). Drop the helper and open-code its remaining internal
use in drm_simple_display_pipe_init() to prevent new users.

> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/dr=
m_simple_kms_helper.c
> index 8e1d07b9f1e30..7878b9d7d5248 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -20,16 +20,6 @@ static const struct drm_encoder_funcs drm_simple_encod=
er_funcs_cleanup =3D {
>  	.destroy =3D drm_encoder_cleanup,
>  };
> =20
> -int drm_simple_encoder_init(struct drm_device *dev,
> -			    struct drm_encoder *encoder,
> -			    int encoder_type)
> -{
> -	return drm_encoder_init(dev, encoder,
> -				&drm_simple_encoder_funcs_cleanup,
> -				encoder_type, NULL);
> -}
> -EXPORT_SYMBOL(drm_simple_encoder_init);

[Severity: Low]
Does removing this helper break the build for the gma500 driver?

The commit message states that all driver users have been converted, but
it looks like the gma500 driver still has unconverted callers.

For example, in drivers/gpu/drm/gma500/cdv_intel_crt.c:cdv_intel_crt_init():

    ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);

and in drivers/gpu/drm/gma500/cdv_intel_dp.c:cdv_intel_dp_init():

    drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);

Removing the definition and declaration here causes implicit function
declaration and undefined reference errors when building with
CONFIG_DRM_GMA500 enabled.

Also, this isn't a bug, but should the task to remove
drm_simple_encoder_init() be removed from Documentation/gpu/todo.rst
as well, since this patch completes that task?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-drm_simple=
_encoder_init-v2-0-5020b630668a@gmail.com?part=3D14

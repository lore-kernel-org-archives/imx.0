Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C56221D89
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325155; cv=none; b=AaKm5aZF+JoYD9VeHklwYmAvLnfAjvfMgXyxYwfvTuOsqvUVPc2ZJWbVhvd3gTsWHQvlIk0hLkxhrzz2HIAEoBvWW+tlG9cDAZ2fXwku0EtwIcpHu5pNLh+lncb3QVtuCmatvqM28bK65Ru4lea9CcMpmUUEMpe4BL9gg8gahxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325155; c=relaxed/simple;
	bh=uQpS6j7GXgxCnvAQtSMxqL6ThjBj7ThrnHcxXk/ait0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UeWsDWwI6Jm88cD58bk/u6l3/q/KRMmL2UC4rsmQP+QijBy5KA7SeP/VyGjzGy2O/+I6vO+wbkFFhebhAE3J3OCxBqDA36YfDMa1bP9ZSAQ4KKMrpzLvM52NEOhxCxwx7jada/m3iQAAoQYOrkshfpNMlyZCv+xzQ4F1Q/ahwyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNTcTHL5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNTcTHL5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC081F00A3A;
	Fri, 21 Aug 2026 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787325154;
	bh=1qIxlelW6GO+clJiEDLuqs9LPoIB2mcTKDcKb+OyS4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eNTcTHL5efd6jeBoOfPzRhCis+4/PyHckd4gpT1ezH46nG9GYPP+yUvGMbdgzlm5P
	 ya8Qb5tV8FFzHn9DUSX3jIhI/a27hpHaumYZy0khfSiDAoAFAB8mwbNuHaN3LkZTCR
	 qikWmW5GLA8aCMJ4pZ+k/UTHEJIfiynYBgwTnLFepr5x3ZiQo8lLjmsj35b3o/PAzT
	 2wt44r5gXe1gMFndrdB/IH49Vcc2x9Zw7z86CYCTGiab71YNpuht/BfzD2ZzoREoDm
	 8wac4131sZ61JJcjF8blvSUMUmwXE5fU3X7/CbuxTNVm74V21BhZtI4npCMe6kwsTB
	 UMN2ltbrfbwng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/70] drm/mxs: mxsfb: Switch to
 drm_atomic_helper_crtc_create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-18-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
 <20260821-drm-no-more-crtc-reset-v1-18-fb793475c05a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 15:12:33 +0000
Message-Id: <20260821151234.0FC081F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free in DRM cleanup paths on driver unbind due to devm_k=
zalloc allocated driver private data.
--

--- Patch [18]: [PATCH 18/70] drm/mxs: mxsfb: Switch to drm_atomic_helper_c=
rtc_create_state ---
commit 176787b6391787b0d414456f33f183b472ea7c41
Author: Maxime Ripard <mripard@kernel.org>

drm/mxs: mxsfb: Switch to drm_atomic_helper_crtc_create_state

This commit replaces the deprecated drm_atomic_helper_crtc_reset() hook
with drm_atomic_helper_crtc_create_state() for the mxsfb CRTC implementatio=
n.

> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mx=
sfb_kms.c
> index d8ebebc5314bb..36ea285182b48 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -484,7 +484,7 @@ static const struct drm_crtc_helper_funcs mxsfb_crtc_=
helper_funcs =3D {
>  };
> =20
>  static const struct drm_crtc_funcs mxsfb_crtc_funcs =3D {
> -	.reset =3D drm_atomic_helper_crtc_reset,
> +	.atomic_create_state =3D drm_atomic_helper_crtc_create_state,
>  	.destroy =3D drm_crtc_cleanup,
>  	.set_config =3D drm_atomic_helper_set_config,
>  	.page_flip =3D drm_atomic_helper_page_flip,

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the mxsfb
driver, I noticed a potential use-after-free during driver unbind.

The driver private structure is allocated with devm_kzalloc() in mxsfb_load=
()
in drivers/gpu/drm/mxsfb/mxsfb_drv.c:

    mxsfb =3D devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);

And the DRM device is allocated independently via drm_dev_alloc() in
mxsfb_probe():

    drm =3D drm_dev_alloc(&mxsfb_driver, &pdev->dev);

During driver unbind, mxsfb_remove() calls drm_dev_put(drm). If user space
currently holds an open file descriptor for the DRM device, the DRM device's
refcount is > 0 and it will not be freed immediately.

When mxsfb_remove() returns, devres cleanup will free the mxsfb_drm_private
structure. Later, when user space closes the file descriptor,
drm_dev_release() will trigger drmm_mode_config_cleanup().=20

Since drmm_mode_config_cleanup() will access CRTCs and planes embedded
within the already-freed mxsfb_drm_private structure, could this result in
a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-drm-no-mor=
e-crtc-reset-v1-0-fb793475c05a@kernel.org?part=3D18

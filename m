Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA92370AE1
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188233; cv=none; b=JfebmIWt4AmBahSdKGawas+tv382w3lvmVN4Aat4r6Qv/ZROm3hCGra5tuuhWbrXS/QN3UuLttoObeaphqGKtMPZLtv8zruJfR0taX1gh1TioDnQm5vsUAbDY6js08FttlGQOEQGh1o9mgYK5J1v5Ei/eqKmFXxU3meIHIdRAnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188233; c=relaxed/simple;
	bh=7MZ1guN0UkiPXWcHW5Uy5DvV9Cpvsw3IXkzXQiNKLvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A9RvQCfREeN42cpV0ZlHqdCft5ppRMz0x8rT0drDsHXGWVgBWPFVMbMktERT8LmnvqcOSwkYLWpEY7Nk5WkNv2kwD/dQRIvCOWuPigClRQYs0mhvw3+3dU636i/dugYZz78/9CmQu4RDLFubHgyyUYkoKfKS4LSjDXcUMVqY8w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cj3qUN64; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cj3qUN64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2799C2BCB3;
	Tue, 19 May 2026 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188233;
	bh=7MZ1guN0UkiPXWcHW5Uy5DvV9Cpvsw3IXkzXQiNKLvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Cj3qUN64jcAE+F4mIMZ/y90nMmMO1ht2qxJ9LASOZhpbO4VOLQ5suldyzRz3kzQZ3
	 qR09yhFPUKTNv9BvmGMkHqcChKZhG5a0BGn9+Qe46co8yRGIkjZmp9S3n+pJbf5l9z
	 +ayJ4STva0sKpCeQRGPIQ/76QeKpVMrC2R241s6SSa3G35btapViHHsw/DVDCWcZdB
	 Qbe5uLbaJCxvTTTuzeeV9w6UwK1u2OAireErNUblNODJAjOFUC1r03fTARWJOk8M5x
	 Q7S4y/thDY060KxsL7wCvEPAL24xnCyFrKzOOaLkwCVw6xvFxK6wyfWyLi66QSxTs5
	 8awBZeOMn0gvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 24/37] drm/atomic: move drm_atomic_helper_disable_all()
 and drm_atomic_helper_shutdown() from drm_atomic_helper to drm_atomic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519-drm-bridge-hotplug-v1-24-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-24-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 10:57:12 +0000
Message-Id: <20260519105712.D2799C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Outdated function references in kernel-doc blocks after rename.
- [Low] Use of return with an expression in a void function.
--

commit 8c33c13c9d809fde9c0dc4ffcc59c09b05d47d10
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/atomic: move drm_atomic_helper_disable_all() and drm_atomic_helper_shut=
down() from drm_atomic_helper to drm_atomic

This commit moves drm_atomic_helper_shutdown() and
drm_atomic_helper_disable_all() to the drm_atomic module, renaming them to
drop the "_helper" infix. The move resolves a module dependency loop to
support upcoming DRM bridge hotplug features, replacing the original
functions with deprecated wrappers.

> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 170de30c28ae4..36fc57e147cb5 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1987,6 +1987,121 @@ int __drm_atomic_helper_set_config(struct drm_mod=
e_set *set,
[ ... ]
> + * This is used for example in suspend/resume to disable all currently a=
ctive
> + * functions when suspending. If you just want to shut down everything a=
t e.g.
> + * driver unload, look at drm_atomic_helper_shutdown().

This isn't a bug, but since the functions were renamed, should this
kernel-doc comment be updated to point to the new drm_atomic_shutdown()
function instead of the deprecated drm_atomic_helper_shutdown() wrapper?

[ ... ]
> + * See also:
> + * drm_atomic_helper_suspend(), drm_atomic_helper_resume() and
> + * drm_atomic_helper_shutdown().
> + */
> +int drm_atomic_disable_all(struct drm_device *dev,

Similar to the above, should this refer to drm_atomic_shutdown()?

[ ... ]
> +/**
> + * drm_atomic_shutdown - shutdown all CRTC
> + * @dev: DRM device
> + *
> + * This shuts down all CRTC, which is useful for driver unloading. Shutd=
own on
> + * suspend should instead be handled with drm_atomic_helper_suspend(), s=
ince
> + * that also takes a snapshot of the modeset state to be restored on res=
ume.
> + *
> + * This is just a convenience wrapper around drm_atomic_helper_disable_a=
ll(),
> + * and it is the atomic version of drm_helper_force_disable_all().
> + */
> +void drm_atomic_shutdown(struct drm_device *dev)

Should this documentation state that it is a wrapper around the new
drm_atomic_disable_all() rather than the deprecated
drm_atomic_helper_disable_all()?

> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 51f39edc31edc..afedfab9b5682 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
[ ... ]
> @@ -3673,21 +3623,7 @@ EXPORT_SYMBOL(drm_atomic_helper_reset_crtc);
>   */
>  void drm_atomic_helper_shutdown(struct drm_device *dev)
>  {
> -	struct drm_modeset_acquire_ctx ctx;
> -	int ret;
> -
> -	if (dev =3D=3D NULL)
> -		return;
> -
> -	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> -
> -	ret =3D drm_atomic_helper_disable_all(dev, &ctx);
> -	if (ret)
> -		drm_err(dev,
> -			"Disabling all crtc's during unload failed with %i\n",
> -			ret);
> -
> -	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> +	return drm_atomic_shutdown(dev);
>  }

Since both drm_atomic_helper_shutdown() and drm_atomic_shutdown() are decla=
red
as returning void, does returning an expression here violate ISO C standard=
s?
It might be better to just call drm_atomic_shutdown(dev) without the return
keyword to avoid compiler warnings from stricter configurations like sparse=
 or
Clang.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D24

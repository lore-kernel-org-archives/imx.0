Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63778486430
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859815; cv=none; b=izq1yJEqpfu8VlB8zpO8mdPebp2MOq9FXPTFVx8QrYCs4kWt9lLQCGUN1jxA/hw2l5OEUtolSq/DNN0pn9uCS22zT5gG3M3ZWDDaN9XWnItZ5GrgrjZCVYnOkmIS0/SSEPjwxzZKTnm2S8hOxJSBBBN1McUZIXM6fo/MvlXHHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859815; c=relaxed/simple;
	bh=bc87cBLIuOjfXMBYxx3VjcIpk+uoiR+m8eUvgQNYQ38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uFPsuHxyczgAIxru9L82RByi7Z/qHuBSdE2aib53m6O0nZTiDp6ZRES7DOvUX7UTsi2YS2ybFHe7t1UA31Z6gXwhkwIdIWJqXYj0dBFZCDERhIab6im4GguYL4MlS1amdU3jy5XJT5faydNZpBZxCdOdq536KWdC838XulG6rv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHDKmt7+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHDKmt7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C691F000FF;
	Thu,  1 Oct 2026 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859814;
	bh=u2bxlgfIDf0Jyo6crFBUa9Oz+4rgTdAA8aLHqy71Mgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KHDKmt7+eF3IfJUD02mHVfEiuPymtoTIVQs92As/UgJkymnrREV4S9Qy5mcGccOPC
	 a/KO/4Dw8PbHx367/yZd+q+BlUBkLQDiLYmHvq9wUGKXt9gPWLAQonxVtLMz2UoeK7
	 FKPL8BdT9sCE77TwQE7ontGqHJ1COhU6bc4C5ynIrXYwLKeU6y3z9KIqy3JGY/JzEQ
	 2RrfhKCJM/oDUFF1bsezUFaAoCtu/SF6IRczAR1tJ7S2gm4ShEJa8EUcSFqc44rhHb
	 foh/DIwraD5zNPMc/il+LOaPYEEk7JxxwDsB+EYZ9BbuN0bt35dRBak+jdTWcS+Co1
	 zzaxixQf0ujZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 11/24] drm/atomic: move
 drm_atomic_helper_disable_all() and drm_atomic_helper_shutdown() from
 drm_atomic_helper to drm_atomic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261001-drm-bridge-hotplug-v2-11-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
 <20261001-drm-bridge-hotplug-v2-11-8e34986dcb68@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:03:33 +0000
Message-Id: <20261001130334.07C691F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm: outdated helper function names in drm_atomic documentation
--

commit 1f801641406daea3f9369bcd8c55bd29b23f3328
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/atomic: move drm_atomic_helper_disable_all() and drm_atomic_helper_shut=
down() from drm_atomic_helper to drm_atomic

This patch moves drm_atomic_helper_shutdown() and its callee
drm_atomic_helper_disable_all() from the drm_kms_helper module to the drm
module, renaming them to drm_atomic_shutdown() and drm_atomic_disable_all().
The original functions are kept as deprecated wrappers to avoid a module
dependency loop.

> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 9bb761eda59f4..ec7a0f369c8b0 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -2081,6 +2081,121 @@ int __drm_atomic_helper_set_config(struct drm_mod=
e_set *set,

[ ... ]

> + * Note that if callers haven't already acquired all modeset locks this =
might
> + * return -EDEADLK, which must be handled by calling drm_modeset_backoff=
().
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + *
> + * See also:
> + * drm_atomic_helper_suspend(), drm_atomic_helper_resume() and
> + * drm_atomic_helper_shutdown().
> + */
> +int drm_atomic_disable_all(struct drm_device *dev,
> +			   struct drm_modeset_acquire_ctx *ctx)

[Severity: Low]
Should this "See also" section refer to the newly renamed
drm_atomic_shutdown() instead of the deprecated
drm_atomic_helper_shutdown() wrapper?

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

[Severity: Low]
Does this documentation need to be updated to mention it wraps
drm_atomic_disable_all() instead of the deprecated
drm_atomic_helper_disable_all() function?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-drm-bridge=
-hotplug-v2-0-8e34986dcb68@bootlin.com?part=3D11

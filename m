Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC83793AA
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095961; cv=none; b=beolDLvhVk/0ZtGHHdCL/eWX5x5GDEhk5TwPuqAMJ4xNPAmstj+aUQDLTDyETLFOiwGyfF1dPPz8FJO6UdLifK3ECo7r9apgEMrkpHxacAzvq2dC6SanoUzQM0lxSDquy6mLKptVJLB9rUZTiDeUIXeuE7ILq7ohuwX59bk//cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095961; c=relaxed/simple;
	bh=mRa3A/kv17icQbLc3AXBM2VxhUtRHTOLGJtso76HEgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tCpGkRCzpny09dqyS8OCTAJNwDRgnUDldNyCQRB6kx/o9XGIduJUNupWXsHQOAJcd4pqJvk95HZQ27i15HlOqtgIgD5zqQcajvzX3XzejDh8cDwRgqR9IZ6Zi8ie6pjT+g0nM5GcGIj4FQjFuoo2MDEdVNve18rkqwjw17qVZ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlA0HIr+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlA0HIr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70021F000E9;
	Sun, 26 Jul 2026 19:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785095960;
	bh=tDgBnfo9W8njKTHDwGQ1C2bWOZPCiYR1448n/Vy+uz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SlA0HIr+WqF9uOt63YfJ6df4q965mrYo8ccr/B2qT4OQqNwBBmHU6sZr3mlIHatVk
	 xzMKd7ohtO0CzwFa6qwI/W3lwORj48bT59VT+TeDtqGQv2Db+qsCCm06dEoijtnnwI
	 eILGperRKv99MJHaRWdoQMgcGla44eOUVPW33t3/zH1HD688ww7qWFGrUanxnJf90B
	 ne/wpKBw5wf2GEj3pEjcwPkx2PdEedET8uztBVTUQxyybt//eRwVvUZDfog2HgGVQa
	 IdvJT0b1WaGCmDmBiko3YBHTN2uwWT0YebskMNnPNPzRKFfbe4vMbwlx3lFFDE+ctX
	 WGmenVf2osw7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 19:59:19 +0000
Message-Id: <20260726195919.D70021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calls to sleeping functions (`clk_prepare_enable` and `clk_disable=
_unprepare`) from the plane atomic update and CRTC enable/disable callbacks=
, violating DRM atomic context requirements.
--

--- Patch [1]: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable =
---
commit 48c4f154b28e9de1d485ea56766c8a24df823739
Author: Ze Huang <ze.huang@oss.qualcomm.com>

drm/imx/lcdc: avoid duplicate clk_per enable

The simple-KMS helper calls the pipe update after enabling the CRTC,
which causes imx_lcdc_update_hw_registers() to be called again. This
patch avoids the duplicate clock enable by skipping the register update
when the CRTC already needs a modeset.

> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lc=
dc/imx-lcdc.c
> index c67fe80b8115e..e00e52c1c46ec 100644
> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> @@ -310,7 +310,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_di=
splay_pipe *pipe,
>  	else if (old_crtc !=3D crtc)
>  		mode_changed =3D true;
> =20
> -	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
> +	if (!drm_atomic_crtc_needs_modeset(crtc->state))
> +		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);

[Severity: High]
This is a pre-existing issue, but does calling imx_lcdc_update_hw_registers=
()
from imx_lcdc_pipe_update() risk sleeping in an atomic context?

imx_lcdc_pipe_update() acts as a plane atomic update callback, which execut=
es
in an atomic context where sleeping is forbidden. However, it calls
imx_lcdc_update_hw_registers(), which in turn calls sleeping functions:

imx_lcdc_update_hw_registers() {
    ...
    clk_disable_unprepare(lcdc->clk_per);
    ...
    clk_prepare_enable(lcdc->clk_per);
    ...
}

Will this cause 'scheduling while atomic' panics when a plane format changes
without a full modeset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-drm-simple=
-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F973F9F45
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374144; cv=none; b=ZliuwigDqS+jot2CpA5wiN1Isv3wBMDi5u3vtUrd6/nS3otEfwcgatFJXLUTxMr2lv3uLnQPefhfygVAmbKi9QzJ6PpxoiYPRCkjzuI6wrsG2AfMMUunawdshwxcsoz/OYAe9+ip5h++cSO6fMrt+/Umn6ATj6YB4z68DJvGSZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374144; c=relaxed/simple;
	bh=0p6Q8mPngRpndZ0inyj9gZOX/JAqZuONXoEsxg3LEp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VhYTNmrIVRfeIfn1+jtdHDmA2qQw1oZwYBBRnrmrUBPenDx7D8yKbIqOd8la1DlsCkYOwL2tybZUVr6jHpwql9SLzCysW2nNbjoNtMc2A2FZJciP295x94V+ADFcUxx3HzIMoAGj1IywWvPDRYv5wS5JH5IcZ2BMsnt6hw/Isjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXJL9lal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXJL9lal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F301F00A3D;
	Mon, 10 Aug 2026 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786374142;
	bh=lSUxke8DpL6AHLnr3xW6roBkc2fszgvn0DLFtdKHWIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FXJL9lalsNgEcJMMtcXMZPbJ5s4U3jljvHuOJXiIalVU6drQIVyh2fkCQgo2tRJP4
	 DBOD8q9JKzLIuBUQvHbfy9PdTP+XjyrZ5hcWOUYVgl+WpCRYh7Bf6UxTLgVyynrQYG
	 QEOBSpqeqY7CihJ2yF1wXOayL4/xVgHNP0aEaUpCHnOJ6hcKNTXrAWuSzrAzT+wsj1
	 PrLmHbocHoPs2tmAaMNPtqmvvofQBXck/qCWkmchdYr6YlEkBs0JVA0Lc+2dya8AaF
	 3dNDPSjOzAeMEdm+3uyOYRmrzyrt+2bf6T3Iawi1b9lclq9OloX9qoOfyl05+OhPFv
	 fCtS3IjAVss6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] drm/imx: ipuv3-plane: add the pixel blend mode
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260810-imx53-fix-hdmi-v1-2-fff9b1b17f25@oss.qualcomm.com>
References: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
 <20260810-imx53-fix-hdmi-v1-2-fff9b1b17f25@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:02:21 +0000
Message-Id: <20260810150222.54F301F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Plane atomic update callback calls functions that acquire a sleepi=
ng lock (mutex).
--

--- Patch [2]: [PATCH 2/4] drm/imx: ipuv3-plane: add the pixel blend mode p=
roperty ---
commit 166d0e9ef492a9f6b268953776bb8c6c929a2acc
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/imx: ipuv3-plane: add the pixel blend mode property

This commit adds a pixel blend mode property to IPUv3 planes. It configures
the planes to support coverage or none based on whether they are part of a
DP flow, and uses this blend mode to decide between global and per-pixel
alpha during plane updates.

> diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/im=
x/ipuv3/ipuv3-plane.c
> index a0fd39eebbbc2..bde5892264f4a 100644
> --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c

[ ... ]

> @@ -593,8 +621,8 @@ static void ipu_plane_atomic_update(struct drm_plane =
*plane,
>  	case IPU_DP_FLOW_SYNC_BG:
>  		if (new_state->normalized_zpos =3D=3D 1) {
>  			ipu_dp_set_global_alpha(ipu_plane->dp,
> -						!fb->format->has_alpha, 0xff,
> -						true);
> +						!ipu_plane_use_pixel_alpha(new_state),
> +						0xff, true);

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to call
ipu_dp_set_global_alpha() from the atomic update callback?

The DRM core invokes ipu_plane_atomic_update() in an atomic context
where sleeping is forbidden. However, ipu_dp_set_global_alpha()
unconditionally acquires a sleeping lock:

drivers/gpu/ipu-v3/ipu-dp.c:ipu_dp_set_global_alpha() {
	...
	mutex_lock(&priv->mutex);
	...
}

Could this trigger kernel warnings or deadlocks if the thread is scheduled
out while executing in a non-blocking DRM atomic commit phase?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-imx53-fix-=
hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com?part=3D2

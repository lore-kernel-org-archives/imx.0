Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C4C379C23
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095997; cv=none; b=qMkXkFdo4947PYim3Ho6sCNifmKHx+uk1KphWz9PUdjGiDzxZB2K0qJ8npJzhqr9KAZUuvBb01L31ck8oVFes88/o62jPq5da8QieyF+GTDYtQazU6Rf0KEsHQlu5eXxF8htrcKXeneJE9eY7g1zSL53z1anZDBl8NOiFV+Ibuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095997; c=relaxed/simple;
	bh=ssTz4AFrgWb7HEGyq3vlnqdHvTowJd7aqbQoKs7AwDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YrsIq/jASgsTP/9m4lXAYL3TlrlIWTVxi0f2eCLmHe0mXv3G0PQvDboIwil2F/mftKyC5Nc6ie7SPmbht87b0R25l2Ldz+jwG2LuAOeCh7godP4BkyS98KusbUvc6z4pqg8Ho5Uk2BO/wBzEpeCihVkGDp5ofDhpqTA2Q4YTvWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTuW46Pm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTuW46Pm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36731F000E9;
	Sun, 26 Jul 2026 19:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785095995;
	bh=5MpO2wjZ6Y+/a0vLgju6lRAC9fYKuQvEJPxbKzXYo10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CTuW46Pm74MAwvglggcP+Fi94j0CX03mFX/LANokalh21YEpW0uan1xO6jbcy+zFa
	 179yrpMr8lbzIZv401v8+urtbFOwKVxyuiLAhOCfmyqYO9VLyGwJ2cXxGU6OXUEVFU
	 a5RTJ7Hsa2tkx6JqLmP46IrWvu3mksbiJmyL6w/qtxQj2WKP1Ku77yMOFNAHKMFgj0
	 v6FzCmKA3SEvf6aVK9n0KiboCRinnlEFJEMrp5Yul7a5MJVEFCPK/laDugxJuE8PXC
	 VWf0iL3xU8O9cGGOSiL9hhzGE0tQtdq4kCaCmLjwCTL92B8ki48xfn1QO+VVJ99RwG
	 Gbv9wh2APKipw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] drm/pl111: replace struct
 drm_simple_display_pipe with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260727-drm-simple-kms-removal-v3-4-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-4-cd5dc89858c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 19:59:55 +0000
Message-Id: <20260726195955.A36731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] CRTC atomic enable and disable callbacks call sleeping functions (=
`msleep`, `clk_prepare_enable`, `clk_disable_unprepare`), which violates th=
e subsystem rules regarding atomic contexts.
--

--- Patch [4]: [PATCH v3 4/8] drm/pl111: replace struct drm_simple_display_=
pipe with regular atomic helpers ---
commit e2dfe2bacf45ede4c23cfee6fb0f779ed622850c
Author: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: drm/pl111: replace struct drm_simple_display_pipe with regular ato=
mic helpers

This commit replaces the PL111 simple display pipe with explicit plane, CRT=
C,
and encoder objects. It also moves timing and format validation to explicit
atomic check paths, and page-flip event handling to the CRTC commit path.

> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl11=
1/pl111_display.c
> index 5d10bc5fdf1f6..deac1dee7838a 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
[ ... ]
> -static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
> -				 struct drm_crtc_state *cstate,
> -				 struct drm_plane_state *plane_state)
> +static void pl111_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					    struct drm_atomic_commit *commit)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but does this function safely run
in an atomic context?

CRTC atomic enable callbacks execute in an atomic context where sleeping is
forbidden. Looking at the wider implementation of
pl111_crtc_helper_atomic_enable(), it appears to still call sleeping functi=
ons
like clk_prepare_enable() and msleep().

Could this lead to scheduling-while-atomic kernel warnings or potential
deadlocks when userspace sets a display mode and triggers the enable path?

[ ... ]
> -static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
> +static void pl111_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					     struct drm_atomic_commit *commit)
>  {
[ ... ]
>  	/* Disable */
>  	writel(0, priv->regs + priv->ctrl);
> =20
>  	clk_disable_unprepare(priv->clk);
>  }

[Severity: High]
This is also a pre-existing issue, but is it safe to use sleeping functions
like clk_disable_unprepare() and msleep() during the disable sequence?

Similar to the enable path, pl111_crtc_helper_atomic_disable() operates as
an atomic disable callback, which also runs in an atomic context. Could the=
se
sleep calls cause system instability or scheduling warnings when the CRTC is
powered off?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-drm-simple=
-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com?part=3D4

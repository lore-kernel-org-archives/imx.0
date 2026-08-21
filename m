Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17D0331EA4
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324421; cv=none; b=NubPSyXEP8tAtKjErNRLyzm7WpxE0xChpeiClLjwOLTGn4INGuuGhUkvPCXGazlN8D6i3KnKeeoDJHSrQAok6zM30ZRB/JGVt9ADqdDDrxpZXpHuLoHr7X9Vb7NR3rwof+JlENINYLIr2mjHuYVZbVBtTrpCXfBO/cv18RqITi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324421; c=relaxed/simple;
	bh=7Vbk60L3jipuD4xn4wxWRf1VJB8jkOSr2jAP0cJfY5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D3cLrArdaKVUeNoCIru1MLuuKW/Ap2r9k0SCQBEsK75cXW5G+IuxyDjdwBTupkVA/bvGUi+QDhrdZjOTeVrsOaVHHEoHMmB+huszLH6dL/SseH32murWPzX2CVvZF+JwA63sx04fWSILjnp5XuHkjz6YGPSNGaqLqYqbLITosCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8C5OBhg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8C5OBhg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD231F000E9;
	Fri, 21 Aug 2026 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787324420;
	bh=Mx7o0pxh1N8DIFo6t/yMJED3R6/L2vgYy1tRfCxz1po=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G8C5OBhgfMi+BhPZBv4Z3HLA81ja1DFivbC00tg38eAsOz5F/j8bxJLWBbLjvwCQ7
	 wHTow39qFgMa5NhzmzeDmRfkJNU0eaHX2dWGulBmIcrPDBS9Ns1/2Jp69jpTGe7D/l
	 FiZhqWX65BIDExc3mw5bmFNRVH2JL5icwhTc8ED+RTWGGZuv5n/KomME1HRfOt5MdI
	 qlKqX/2kXyXywIuq1A0nMRXFaueMQfUDySoP6aVFp2yHC119bcXLlWbUupZp7+hKS4
	 +UavR1aEZ26E0L+/H44fvfnJJO9+jCrOF8IMxamkqN6gxe91A27+G4dty9zZNZs98m
	 o1LpcbNBgFAmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/70] drm/imx: dc: Switch to
 drm_atomic_helper_crtc_create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-11-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
 <20260821-drm-no-more-crtc-reset-v1-11-fb793475c05a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 15:00:19 +0000
Message-Id: <20260821150020.6FD231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] CRTC atomic callbacks call sleeping functions in atomic context.
--

--- Patch [11]: [PATCH 11/70] drm/imx: dc: Switch to drm_atomic_helper_crtc=
_create_state ---
commit 81ac70d774e55256bc7f69e9538e45aed1e198c8
Author: Maxime Ripard <mripard@kernel.org>

drm/imx: dc: Switch to drm_atomic_helper_crtc_create_state

The imx dc crtc implementation uses the deprecated
drm_atomic_helper_crtc_reset() as its reset hook. Switch to
drm_atomic_helper_crtc_create_state() instead.

> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc=
-crtc.c
> index 764510ff90a4a..0d64186a99018 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -98,7 +98,7 @@ static void dc_crtc_disable_vblank(struct drm_crtc *crt=
c)
>  }
> =20
>  static const struct drm_crtc_funcs dc_crtc_funcs =3D {
> -	.reset			=3D drm_atomic_helper_crtc_reset,
> +	.atomic_create_state =3D drm_atomic_helper_crtc_create_state,

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the CRTC
implementation in this file, I noticed that several atomic callbacks might =
be
calling sleeping functions.

For example, does dc_crtc_atomic_enable() call pm_runtime_resume_and_get(),
which can sleep?

Additionally, it looks like dc_crtc_atomic_enable(), dc_crtc_atomic_flush(),
and dc_crtc_atomic_disable() all use DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(),
which waits for a completion and puts the task to sleep.

According to DRM subsystem guidelines, CRTC atomic enable, disable, and upd=
ate
callbacks run in an atomic context where sleeping is forbidden. Could this
cause scheduling while atomic panics or warnings during non-blocking commits
and page flips?

>  	.destroy		=3D drm_crtc_cleanup,
>  	.set_config		=3D drm_atomic_helper_set_config,
>  	.page_flip		=3D drm_atomic_helper_page_flip,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-drm-no-mor=
e-crtc-reset-v1-0-fb793475c05a@kernel.org?part=3D11

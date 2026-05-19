Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8FE481227
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189377; cv=none; b=mb1Q4YsOyYAx3EUnifZXoQ/+7Jse5gQZ+Bospn7/zJaUXwCJKFVXd1W/ikuYF7H7RjzNaln5/SfAxxuH4MgHBfP7r8ehiCM8ZCmLxQ0Bj36Beu/hXk5biIpfo+4wnXcmkcFFHPbD7XABhaQnovrNgyNRA3HBr3ENdgyUW1YqLtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189377; c=relaxed/simple;
	bh=urflexjXIdARgjs4wt3ZjC8l+b2mqz+xWXPPbf11FCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nLs4w0xSPlBgDUy9dXI1IyXFRwxxoehgMzdMO5SnTVescuyLkAqwFkNOUrMvlf5UUOWMxGvqnZ8jkB0VVVnu12hWUyTKHIVNo/rQAIaBixdkPn3EitW7zP4JyT6YRCXDCXtT+WJxm6aL1GVm+QZQn6Wx9gC6pPUk8TDXtuYiAhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nR5afop1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nR5afop1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BCCC2BCB3;
	Tue, 19 May 2026 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189377;
	bh=urflexjXIdARgjs4wt3ZjC8l+b2mqz+xWXPPbf11FCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nR5afop1fZjQWT3zWluV3+fuLvJhOkTyJoLXeYFbGUJCKIU4N+B/s9jjCrbzipl91
	 kQcUA+uEMHNg+2Vgv/xTKzZdH51GxXGj9Gd8WRmuwumFi8piUycMGGrPUEj4Le2R/A
	 OErUwt0e50Z10RB1QBk1ktxglG14MZVUZRAlohEl2ZMXlSedlcd4dv/CvBe6RKGCus
	 q7EwOXcjLDRjZbrrWveQIB5h7UelIkNorR+Cguay2nFpbSJq585YyNgUBXZ5WpLtui
	 N/pBR9Dv+O8SUQTnceDOtO1bIvQaMgyV82GPKdIa+qnMBG4f0ynGlnmNFET7QlK3UQ
	 XiT7NGDZ8kX1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/37] drm/bridge: samsung-dsim: move drm_bridge_add()
 call to probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-19-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-19-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:16:16 +0000
Message-Id: <20260519111617.40BCCC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Moving drm_bridge_add() to probe() breaks probe deferral, causing =
a permanent -EINVAL failure.
- [Medium] Lockless data race on bridge state and next_bridge pointer when =
the panel attaches asynchronously.
--

commit 8b9a88707049c09bf2d0cddc2aeab67e8c2ea0b4
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: samsung-dsim: move drm_bridge_add() call to probe

This commit moves the drm_bridge_add() call from the DSI host attach
callback to the probe function to allow the DRM card to populate even
without a connected DSI device.

> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
[ ... ]
> @@ -2222,6 +2217,8 @@ int samsung_dsim_probe(struct platform_device *pdev)
>  			goto err_disable_runtime;
>  	}
> =20
> +	drm_bridge_add(&dsi->bridge);
> +
>  	return 0;

Does moving drm_bridge_add() to the probe function break probe deferral?

By registering the DRM bridge here, the bridge becomes immediately available
to the DRM master (like imx-lcdif) before the downstream DSI panel has prob=
ed.
When the DRM master probes, it finds the bridge and calls drm_bridge_attach=
().
This routes to samsung_dsim_attach(), which unconditionally attempts to att=
ach
dsi->bridge.next_bridge.=20

Because the panel hasn't attached yet, next_bridge is NULL. Passing a NULL
bridge to drm_bridge_attach() returns -EINVAL. This seems to cause the
display controller's probe to fail permanently instead of properly deferring
via -EPROBE_DEFER.

I noticed this is resolved later in the series by commit b9977e0ebaa4d
(drm/bridge: samsung-dsim: attach: return -EPROBE_DEFER is next bridge not =
yet
available), but it introduces a regression at this point in the tree.

Also, does this introduce a data race on the bridge state when the panel
attaches asynchronously?

Since the bridge is now exposed to the global bridge_list early, the DRM co=
re
or master could access it while the downstream panel is still probing. The
dsi->bridge.next_bridge pointer and configurations like lanes, format, and
mode_flags are updated later in samsung_dsim_host_attach() without acquiring
any locks.=20

Is it possible for atomic callbacks or the DRM master's probe to read a
partially-updated next_bridge pointer or uninitialized configuration state
during this window?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D19

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50352CCFD
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690139; cv=none; b=IGBSk+XtMmluEmRkBTXJjI9et9wol/ABoE8o6iyoYDMoX3bm31XsU79hYXufX5IIJGT1HCbx1oQdsvdrVzIl03Of9DC/nJYPksgBaCuR8xBgx53P4/D6unETyMd5qkK62Yr2L+aLhO+VM3q7x5WkhENt473TcGQIKYmS6oZI42c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690139; c=relaxed/simple;
	bh=OexPsvPhYr/6taH/XP0uSsaJr4IR0deCNH94J7XNbGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LjbIZsa7q/qjrIdtUQDbb31K17H8P54rajfUYTFujClwd3tJybl6m5HtNch3mgFULn4CZfqCIaeoI4sw4uz+ZykdBeN6l5C37GCSxDCXjUg7O9PLFmKYXwQkOer1Wps13EL+RSN18vfZCz7Q6nEDWnLjvfZg0mISh3EqqOwL/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BATqKG+y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BATqKG+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E85C1F00898;
	Tue, 29 Sep 2026 13:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790690137;
	bh=bhPQL9nmUv7tix5fr7cw0pj2KNa3GBtv76yx7GiG3M8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BATqKG+ymTggXaCbXdwW4xgkNQ247faoq6Z92S77UvUtRJSqYeq12VMlMs/Csywi6
	 NcW/E2GZEwGM2eMeUN6y0DYTfcb3bZgxtYG47iGwNGNpIUIHvtxbHzslPUxkgddplR
	 usvIxiICIzma0W07e62d4xYKumukdg96eMU9z15jdwZtzn+biyqzSA72dmBt9wSl3T
	 Z1wgB91nuVFVfNK99CKbasejpbeR8I6p530/WYqXENUV99XToNEYRcg1KYZkPs4vX6
	 6Gi7B8EDH1Xlvs/88f4m/aA2EX4rqBHk+/QW7XjUdnDJs3EDbpJGhWEJ3hcl/1ejq6
	 nXvKvaeHdgeMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] drm/bridge: dw-mipi-dsi: stop using deprecated
 devm_drm_of_get_bridge()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: wsa+renesas@sang-engineering.com, imx@lists.linux.dev, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-3-6da431d8f180@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
 <20260929-drm-fix-of_get_bridge-build-regression-v2-3-6da431d8f180@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:55:36 +0000
Message-Id: <20260929135537.5E85C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm: bridge reference leak on dw_mipi_dsi_host_detach early retu=
rn
--

commit b7207f37872ee6fe7eb2903e38f89975b930c392
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: dw-mipi-dsi: stop using deprecated devm_drm_of_get_bridge()

This commit switches from the deprecated devm_drm_of_get_bridge() to
of_drm_get_bridge_by_endpoint() to resolve a build failure when CONFIG_OF
is disabled. Since of_drm_get_bridge_by_endpoint() returns a refcounted
bridge, it adds the necessary put operations to release the reference.

Link: https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org
Link: https://lore.kernel.org/oe-kbuild-all/202609291109.9RGna4XZ-lkp@intel=
.com/

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c
> index 5dd475fcaacf8..22d1b8cbe1d57 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
[ ... ]
> @@ -368,9 +368,8 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_ho=
st *host,
>  			return ret;

[Severity: Medium]
If pdata->host_ops->detach() returns a negative error code (e.g., during
device unbind or PHY teardown errors) and takes this early return, does this
leak the bridge reference acquired in the attach function?

Since the bridge is now dynamically refcounted and we skip the newly added
drm_bridge_clear_and_put(&dsi->bridge.next_bridge), it looks like the
reference count will not be properly decremented on this error path.

>  	}
> =20
> -	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
> -
>  	drm_bridge_remove(&dsi->bridge);
> +	drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-drm-fix-of=
_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com?part=3D3

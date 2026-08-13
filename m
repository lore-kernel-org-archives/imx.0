Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519CE3624CC;
	Thu, 13 Aug 2026 23:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786663464; cv=none; b=AzYm6mUPa6C0NVE7+Of2TOLVcJdSLnGS0kIn+vvfzOyoe9/LPyh6zUQXzbjR/Pq7FTj98dZUnO3GWrePxQO9FmEcQV3eTEOtCa2H5LKkw60qYOtF6nFvnLMjvj1jVVVXJy62MQtoT+4dRPjm3Sp/wga0KEybxgf7K6jjD17LIh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786663464; c=relaxed/simple;
	bh=4CTmX3zy/Ko+ADWlQWN18zpXY2Txwhmeoqq2mqhWYmI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iJ0cLzmKJxFKjq7wXMw2zOXFhDSfsslfP7rU6lRDSBBg+Hdrb82T7g0iLk2y10RWp1YecmwCFTpjt5VtnDz0F2QV+MlsvW0IrijzygnvxnL5W8745ZTNbp7ihz6xhjjc6/SyUwmA0qj8I5Viqj4CBPP0iF/sAi8xx5q9++uQJtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3DyCflN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3DyCflN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247FA1F000E9;
	Thu, 13 Aug 2026 23:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786663463;
	bh=UexpTxonDeyjyNgX0id6CyC3EnHFg3zc8j3q05oQmpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W3DyCflNlD5rqFamgdAaTyZj00aEx8bydxEVOAyp2oOqBynYl0OLGH31Hct+fZ1p7
	 G+5YL9NZHEXk1IZHeI1mUEM25E4oNLCuai1jcM65DsaTTeLNgUoNDMNvjAhLQhttUa
	 VW3vTd/Kjpen00f9KQKBmG2Qp/DXxUR/Keyv/bS72jJrRKy43ox/G/UIsmvPsiaji+
	 AcyBN81x246Tj4UHS0cRrP0OuFsqe/lZsms8XqWgKRG2x1VWB/bl0oRkX1tTSzmD97
	 Ye6m65EIMUwPpbHz1X4itSHd+WUvuti/MWNbwUSoToMEH6wJLOBnjA6eZJp/WHZzBF
	 GC55H04Nzj2kQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/11] drm/mxsfb/lcdif: simplify ep pointer
 management using __free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260402-drm-lcdif-dbanc-v3-2-27cd247a0847@bootlin.com>
References: <20260402-drm-lcdif-dbanc-v3-2-27cd247a0847@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:24:17 +0000
Message-Id: <20260813232418.247FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] devm_kzalloc allocated drm_encoder causes Use-After-Free on device=
 unbind
--

--- Patch [2]: [PATCH v3 02/11] drm/mxsfb/lcdif: simplify ep pointer manage=
ment using __free ---
commit f0c5403b21d20b71e67b52fb4f76773fe1e9a4f5
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/mxsfb/lcdif: simplify ep pointer management using __free

This patch simplifies endpoint device_node pointer management in lcdif_drv.c
by utilizing the __free(device_node) cleanup action to eliminate manual
of_node_put() calls on early return paths.

> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index 7719629487da5..8da8a265c05c8 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
[ ... ]
> @@ -65,23 +65,19 @@ static int lcdif_attach_bridge(struct lcdif_drm_priva=
te *lcdif)
[ ... ]
>  		bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, of_ep.id);
> -		if (IS_ERR(bridge)) {
> -			of_node_put(ep);
> +		if (IS_ERR(bridge))
>  			return dev_err_probe(dev, PTR_ERR(bridge),
>  					     "Failed to get bridge for endpoint%u\n",
>  					     of_ep.id);
> -		}
> =20
>  		encoder =3D devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);

[Severity: High]
This isn't a bug introduced by this patch, but could this devm_kzalloc()
cause a use-after-free on device unbind?

If a user opens the DRM device file, keeping the drm_device reference count
greater than 0, and the platform driver is concurrently unbound, the driver=
's
remove callback will return and the driver core will execute devm cleanup.

This cleanup frees the encoder. However, because the DRM device is still al=
ive
due to the open file descriptor, the freed encoder remains linked in the
drm->mode_config lists.

When the user later closes the file and the DRM device refcount drops to 0,
will drm_mode_config_cleanup() iterate over the lists and access this freed
memory? Should this instead use a DRM-managed allocator to properly tie the
encoder's lifetime to the DRM device rather than the platform device?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260402-drm-lcdif-=
dbanc-v3-0-27cd247a0847@bootlin.com?part=3D2

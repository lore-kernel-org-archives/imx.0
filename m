Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D223CEBA7;
	Thu, 13 Aug 2026 23:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786663835; cv=none; b=B+QnwmPMt9trnwci40V4pXErbzA//qqxftTLn8PZ5UkXPRSAtYBcqUimqs0tPjNiJk26ln8h8Xkhd5/oq7CE3Us8h3eB+xhglxveeht59jgR/WRyBRZF4vGxS5QRycqnxZr3QY5/OWo2OOMnKIg+BZt5z3XdEU7e20WOlgTZI1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786663835; c=relaxed/simple;
	bh=Xbw+P25nNU9tZw1MmwQh/Rh0VrMZWqM/7/Kz14ZRDbo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kp0i9RHqlDYt5oqY65CEzHqwQF/mvGBC67H+NgM8tl8th0x4M+H99xlBPlMqQknPmNQoSXK9Z9ETVNUtrNgf7YpYADlL50EA0JPFXzA0vaGAe3RMbGB20j7z/BdiFfWChlNKjJVyYYmQJm2iVd3yRRL37uYyxeIZzsoJO2HhA6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc/DoWY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc/DoWY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FB71F000E9;
	Thu, 13 Aug 2026 23:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786663834;
	bh=2p/tvAmkE331J7bGXirjEiV5xOjnbanukneGZ5STwOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jc/DoWY/4e9CdlXRRo+2GnK2NDuulA0G+hEIx3eUg1x1opz5tHFSLTLqbHAts028J
	 +bdW95sSCAyeueRsMSMdUzfKN0rLziDieMb+riTXmUn2nq5bgZ/bl2IlIhy0WmLx0f
	 /uPV7z108coZctgCVzTzgYpAb/p21Pz1FLOpPnh7SCL4wdziu44iIq+7z3+J6jQhIh
	 ADXuD6Q4rQptf6x9gtCqCkUQWlGwx+lr5ui2uQ0NOJRGbNOCBvihU2SZj6RjY88CkV
	 9PWSCh4laT2oIa+GKtHdb+3KTYlCblgtXf47FGhjmKWMZajCuEZ0BV069KyQcXaFTF
	 UXt7/yDcmByzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/11] drm/mxsfb/lcdif: use dev_err_probe()
 consistently in lcdif_attach_bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260402-drm-lcdif-dbanc-v3-3-27cd247a0847@bootlin.com>
References: <20260402-drm-lcdif-dbanc-v3-3-27cd247a0847@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:30:33 +0000
Message-Id: <20260813233034.35FB71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Allocating the DRM encoder with devm_kzalloc() causes a use-after-=
free on device unbind if userspace holds a DRM file descriptor open.
--

--- Patch [3]: [PATCH v3 03/11] drm/mxsfb/lcdif: use dev_err_probe() consis=
tently in lcdif_attach_bridge ---
commit acad1a96fd5b86c6ee99f36bf8b226bbe0b10059
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/mxsfb/lcdif: use dev_err_probe() consistently in lcdif_attach_bridge

This commit updates error paths in lcdif_attach_bridge() to consistently use
dev_err_probe() instead of dev_err(), simplifying the code and improving
error reporting.

> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index 8da8a265c05c8..1c76709c4d94d 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
[ ... ]
> @@ -75,20 +73,18 @@ static int lcdif_attach_bridge(struct lcdif_drm_priva=
te *lcdif)
>  					     of_ep.id);
> =20
>  		encoder =3D devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);

[Severity: High]
This is a pre-existing issue, but could this devm_kzalloc() cause a
use-after-free on device unbind?

The DRM device is initialized with drmm_mode_config_init(), which ties
drm_mode_config_cleanup() to the drm_device lifetime. If userspace holds a =
DRM
file descriptor open during driver unbind, devres will free the encoder mem=
ory
tied to the physical device.

Later, when the last DRM file descriptor is closed, drm_mode_config_cleanup=
()
will iterate over the mode config's encoder list and access the already fre=
ed
encoder to call encoder->funcs->destroy(), leading to a use-after-free.

> -		if (!encoder) {
> -			dev_err(dev, "Failed to allocate encoder for endpoint%u\n",
> -				of_ep.id);
> -			return -ENOMEM;
> -		}
> +		if (!encoder)
> +			return dev_err_probe(dev, -ENOMEM,
> +					     "Failed to allocate encoder for endpoint%u\n",
> +					     of_ep.id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260402-drm-lcdif-=
dbanc-v3-0-27cd247a0847@bootlin.com?part=3D3

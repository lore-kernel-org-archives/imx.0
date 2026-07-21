Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5051E434E38;
	Tue, 21 Jul 2026 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625967; cv=none; b=gbpK28jtTPyVtBehw9eeErZlHyekHV+wIWZwxX9pcvMxqlwMXDdaWEPQQ07VSRT1Sfw8kMLytUTIVK1/08kHeh0K+/UDJxYCu735viQktkEa/0Z9dW8RLg/tgYOspFhWlhUtErSIHSpfZHralXNnLqvEjVFKPH2Q5zQ0O8UEIqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625967; c=relaxed/simple;
	bh=lHNhqHMNv0HRrTUnmYbQgTBMbfalTzMIcudhq/yjb0M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GH7GsrGpOF68mjqOHlrzgQkT0pDGWyh4XY8NqVqx+bi1vX8dY3BTdqJL7PDt+YMFH50f5SBH2jAzaBa2h/PjRmOXMtvKSAWvG7+eHAwOA9wkcUdbjDgRDgvnJggajE2maHBaosygJol4jIRd0FMod0kYk6a13MnC+2ZJ28wrBdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aa2d0EPw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aa2d0EPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBFA1F00A3D;
	Tue, 21 Jul 2026 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625966;
	bh=0e595y6VFu+CPsEplt8sdaX23lvDx9si+hr+p+PnvKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aa2d0EPw7LUQOYoCVRJlJ7BEnaereL3IISdzoxM733gnKvCeQRNyrzJ6qnb+XZFgN
	 WKTDzW1uci9ZQ72CPySiQq3YcdUuliW+SwruaWs3CvEJoeMTTdEHkCKBsir15yqIuG
	 Ac6aFbR2aDCFvALAZeliYJ3qXrOVpCAY01y4kLgpNHP/m+XsDvhFUuc7UDJj1tiE3Z
	 tFZL4wwxyvrEdE9pQ2ZwSgQELRahTVbo3davjK4KIEd52CW7MPmp3a7KmsIUY3dPR3
	 s2ufnDSU0NRZRnJI+MO8v4T71bF4H/aQx0mBQ95nsfwgPdop8F2Vzi6vQyKDpJb/NP
	 nXuCFhFrKVfvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:26:05 +0000
Message-Id: <20260721092605.DCBFA1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing leak of dynamically added child `platform_device`s on=
 probe error or unbind, leading to use-after-free of parent's devm-managed =
resources.
--

--- Patch [5]: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode() =
---
commit 4ab43e8055c75d8cfe06f1c383c67f571e59d263
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

pmdomain: imx: use platform_device_set_fwnode()

This commit updates the driver to prefer the higher-level
platform_device_set_fwnode() over the OF-specific
platform_device_set_of_node() for dynamically allocated platform devices.

> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
>  			domain->ipg_rate_mhz =3D ipg_rate_mhz;
> =20
>  			pd_pdev->dev.parent =3D &pdev->dev;
> -			platform_device_set_of_node(pd_pdev, np);
> +			platform_device_set_fwnode(pd_pdev, of_fwnode_handle(np));
> =20
>  			ret =3D platform_device_add(pd_pdev);
>  			if (ret) {
>  				platform_device_put(pd_pdev);
>  				return ret;
>  			}

[Severity: High]
This isn't a bug introduced by this patch, but does this error path leave
previously added child platform devices registered?

In imx_gpc_probe(), the child imx-pgc-power-domain platform devices are
added in a loop. If a subsequent iteration fails and returns here, it
triggers devres cleanup for the parent device, freeing resources like
the devm-managed regmap.

Because the previously added child devices are not unregistered on this
error path, will they remain bound with a dangling domain->regmap pointer?

Additionally, looking at imx_gpc_remove(), it entirely omits child
unregistration when the new DT binding is used, leaving the child
devices registered while parent devm resources are torn down:

drivers/pmdomain/imx/gpc.c:imx_gpc_remove() {
    ...
		}
	}

	of_node_put(pgc_node);
}

Could this also lead to a similar use-after-free of the regmap struct
on an explicit sysfs unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-pdev-set-f=
wnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com?part=3D5

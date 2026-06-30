Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D0035C1AD;
	Tue, 30 Jun 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811118; cv=none; b=pbxVvuzrJmpGr/oSgSWkaYJbQ/9eHFy/S2D+F//CBJO16xlPsJ6LIe7amBKEgUrPQ6ZpCS8lZ/FT9VIuwgqJJB8cKeP58C6OkQKhk06SSqHKgA5SkPTfxSCx6X2MjxbOdPDuq4Wabw+DQM5g1+wVUd66EfEEh0ZkHvX4+vftcl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811118; c=relaxed/simple;
	bh=NgCcF+DWkrvNa8uWNLG9CT7iyPGffkmholjY9I52tPA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mFbpbTnC18TGc5gDnIoqz+Tbjkm76uB7OYqKBnYNcm0LY9tI4pVENAM1nMHBvp/NB7Szkz5fv1gbP5u2dWp7Df1zsCBCZDNq3/Km5GMRHMBYjPk24pry3D0G0IpuKDvo1GMszvaCk+TOtKx7hZZ4Me23anMFHcIbvA/Y2WjMNTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/m9TGcY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/m9TGcY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472D21F00A3A;
	Tue, 30 Jun 2026 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782811117;
	bh=+rs0ZUF0if/Za3Uiro3OrWLPieYVGjbTD0wnfhoEsq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k/m9TGcY2lNPGdxdvQg/CTDjj7CAcDHJJzGSGpe4ymRjkBosds1MY+MPV+Jx5Gs6o
	 0v/ow/eHvFDgsNQBCiHGJKiTL2ctlkQbEzEIiapRyCWfPnXugtqVz08h8tzVJJDRLg
	 Igq1choNcdTNjuuK5fYuYyRV78JoO5IDmuSHTNVvrpyUiWMDWKVmlyoSVsP+8sDdJN
	 sXAV2wQhk6SrrWPhoLv3sU5elQbzLo2JB5CMnUSkwdT48LXXL+aF2FMJ4sEiGGGzIN
	 BWkAEw3ChIQ0ZoW/0PxXUyUcF9eZKLmZ4blzWe2V1Uu9D0oYAw6FciVg3iXEzGsb3n
	 0ZltdEAOGsD0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/19] net: bcmgenet: use
 platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260629-pdev-fwnode-ref-v2-9-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
 <20260629-pdev-fwnode-ref-v2-9-8abe2513f96e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 09:18:36 +0000
Message-Id: <20260630091837.472D21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mixing goto-based error handling and scope-based cleanup (__free) i=
n the same function.
--

commit 6b5f2b27db1f7295943bada498301e27ac1e7653
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

net: bcmgenet: use platform_device_set_of_node()

This commit encapsulates the assignment of the OF node for dynamically
allocated platform devices with the provided helper. This is done ahead
of reworking the reference counting logic for platform devices.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/e=
thernet/broadcom/genet/bcmmii.c
> index a4e0d5a682687..451b23a039ceb 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
[ ... ]
> @@ -490,10 +490,14 @@ static int bcmgenet_mii_register(struct bcmgenet_pr=
iv *priv)
>  	/* Retain this platform_device pointer for later cleanup */
>  	priv->mii_pdev =3D ppdev;
>  	ppdev->dev.parent =3D &pdev->dev;
> -	if (dn)
> -		ppdev->dev.of_node =3D bcmgenet_mii_of_find_mdio(priv);
> -	else
> +
> +	if (dn) {
> +		struct device_node *np __free(device_node) =3D bcmgenet_mii_of_find_md=
io(priv);

[Severity: Low]
Does introducing a __free() variable in a function that already relies on
goto-based error handling conflict with the kernel's cleanup design guideli=
nes?

Looking at bcmgenet_mii_register(), the function uses goto out for its error
paths. According to include/linux/cleanup.h, the expectation is that usage =
of
goto and cleanup helpers is never mixed in the same function. It is general=
ly
recommended to either convert all resources that need a goto cleanup to
scope-based cleanup, or convert none of them, to avoid creating confusing
ownership semantics.

> +
> +		platform_device_set_of_node(ppdev, np);
> +	} else {
>  		ppd.phy_mask =3D ~0;
> +	}
> =20
>  	ret =3D platform_device_add_resources(ppdev, &res, 1);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-pdev-fwnod=
e-ref-v2-0-8abe2513f96e@oss.qualcomm.com?part=3D9

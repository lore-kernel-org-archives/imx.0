Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77B243303B;
	Tue, 21 Jul 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625964; cv=none; b=Kk5VLBe2B/udpR/PrKSyGgOzTiPxgbLA0VpAE0rEr2GzWSQScsz1RauVohPhtz9s4faFaj2kCoDg6Dr1MfeXYRVUwIw0M/EV2luuD65T3nvpE29106aXiCLPSn4ybh12HWABNTczUgAkMOgfSZApMo4FuAchUzE93Vr/4jiEFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625964; c=relaxed/simple;
	bh=hHYDCICXMeEN52dm4OPnvmMR/dIW1SLgIDoQFovzzdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nw9N9fYGhXaMSxRrJZ8vf3pSspskHS8ORh/hA06eSmO5VliDhR08OipLJk6h5aqpPT3xbzH4ttXVnRFh242PiMWqJy4V+hDwFATAH+cK7FmGruWzpatPbk51gIAGMzNMpaKxzZoroW1Ro6i7FApxVshZ4UVtrjTg3QAcCYavl6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/GRrawj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/GRrawj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BB41F00A3A;
	Tue, 21 Jul 2026 09:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625963;
	bh=DobvS7g6dj3yeshc+hCK/FxRJrzcJvf2cKDFlnTYGXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P/GRrawjodyAPCluqh/eurC4IqvrlA3Tv5rNcUeQxy29XOc7yzO0hp79/jrxUWbae
	 mvZaNjQr5MfYq2iQeSyEMqZ1ZrHHX6ZjN4ImUXa7nnE+XU2paIQQoMcz6c9P031rwQ
	 82ewoInTAauxp0WnU7Xt1jxZ5JWn6+4rYwbc9XKryKXRZOT8vSvNwS5+YiR29A1NxO
	 d04XfzaZ58ofi7hqKtYJSDkK/2Wq8EKlQERbx20ahbzt3+EEHQ05K+BZl3sPd7GFxf
	 B4nTlJZ9poNdfkmnMb7gHproaldWnxRBf181+eMCElvCLvDesMNoLKq70ESaVBgyDF
	 z3yUolRGi7kIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] mfd: tps6586: use platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-6-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-6-2dee93f42c54@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:26:02 +0000
Message-Id: <20260721092603.42BB41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message uses non-standard capitalization for the descrip=
tion, violating MFD subsystem prefix rules.

Pre-existing issues:
- [High] Manual assignment of `pdev->dev.platform_data` bypasses `platform_=
device_add_data()`, causing a bad free and kernel panic during device relea=
se.
--

--- Patch [6]: [PATCH 6/8] mfd: tps6586: use platform_device_set_fwnode() -=
--
commit 0c67148d3505d89af495783abc48f5f8ff3075d3
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

mfd: tps6586: use platform_device_set_fwnode()

This commit updates the tps6586 driver to prefer the higher-level
platform_device_set_fwnode() over the OF-specific
platform_device_set_of_node() for dynamically allocated platform devices.

> mfd: tps6586: use platform_device_set_fwnode()

[Severity: Low]
This isn't a bug, but should the description after the subsystem prefix
be capitalized?

The MFD subsystem guidelines dictate always capitalizing the description
after the subsystem prefix for MFD, LED, and Backlight subsystems.

> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> --- a/drivers/mfd/tps6586x.c
> +++ b/drivers/mfd/tps6586x.c

[ ... ]

> @@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6=
586x,
> =20
>  		pdev->dev.parent =3D tps6586x->dev;
>  		pdev->dev.platform_data =3D subdev->platform_data;

[Severity: High]
This is a pre-existing issue, but does assigning the platform_data pointer
directly like this cause a bad free and kernel panic during device release?

When platform_device_release() is called, either due to a failure in
platform_device_add() or when the device is unregistered later, it
unconditionally calls kfree() on the platform_data pointer.

Since subdev->platform_data is typically statically allocated by board files
rather than dynamically allocated by the platform bus, bypassing the proper
duplication handled by platform_device_add_data() can lead to a crash.

> -		platform_device_set_of_node(pdev, subdev->of_node);
> +		platform_device_set_fwnode(pdev, of_fwnode_handle(subdev->of_node));
> =20
>  		ret =3D platform_device_add(pdev);
>  		if (ret) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-pdev-set-f=
wnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com?part=3D6

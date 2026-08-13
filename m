Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF38D48167F;
	Thu, 13 Aug 2026 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631287; cv=none; b=GGyedmASGmcXXv+AkQ1EtQDt/ABp+25eeFBpKh/FhdfZDUCh1Bvjupvn1mY/AxVLIT+FAhxfRx5SV9wGZN1dIOa1DTgQKKRhDbHSN2jftc7QRuE+Ol51zV1mHnP1IaOR/27D/OZ0oGDw7P2jktj8TRkF3pGUocDJjqonthvM5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631287; c=relaxed/simple;
	bh=lTkiSCe9M6AP+9FJL2AgxajbmSx5FLbRXYr2Mndl6zo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iwQvEYnLcUUEq8hWZAKuKLcfjkj7gawWy13N2kS3G9iUMTRaSnRD+8ytKxZEm6DZ0LnkK+BXrqmWRNNU0y/fZPJmdWvFtxbFEpygjvB3wa+WdNAXR70USjC2KAEC2qLfVIB0vzpVFWeTFfIXga8L6/qHp9g/3tcGec+XgeotA40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEFhWGLb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEFhWGLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F14C1F00A3D;
	Thu, 13 Aug 2026 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786631286;
	bh=5D+q3259PLUTdYOBn8sgR+53qz8PpUmEp6Ht5CZ8NYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AEFhWGLbQHgpaRHK9UXpHfq0CcFmTqZ7fJOYuVe7uscRCsahb891+LuQEhEkw2hvH
	 4olPA+0UaVDGm8SwhytEraWzr9OQRF88Gg+yNtnAd5/354Nen6Yzln2OFoqKNZdbzO
	 cvbYSkGgpNV5xIFSB6iq9tQOp4puDN2t5Q/57T72aTMpXkFexsHFfkv9eWElP4z0ml
	 VxoufspsfuLXjhMEHtSsiYbg1xPdnch6XlGh4jL9C2BE5dhhk+bJT+8xHjTiBTrnch
	 3TRscUDjhHX0OQ9ZWjCoGMdQTwoW+S+xlZTjvCUSAyMuRHovh6Ayd9+f7/pT9ULUPV
	 geJ2DWnXxxYjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 DSI to LVDS adapter with the 10.1" V2 display
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leonardo Costa" <leoreis.costa@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260813133335.1941580-6-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-6-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:28:05 +0000
Message-Id: <20260813142806.1F14C1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree overlay introduces an undocumented vendor prefix ('=
optologic') and an undocumented panel compatible string ('optologic,scx1001=
511ggc49').
--

--- Patch [5]: [PATCH 5/6] arm64: dts: freescale: imx8mp-verdin: Add Torade=
x DSI to LVDS adapter with the 10.1" V2 display ---
commit b2139ef088f077532b33f4e92f5d9bfd6e20a265
Author: Leonardo Costa <leonardo.costa@toradex.com>

arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with =
the 10.1" V2 display

This commit adds a device tree overlay for the Toradex DSI to LVDS Adapter
with the Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connec=
ts
to the Verdin DSI_1 interface and uses a TI SN65DSI84 bridge to drive the
panel.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-a=
dapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-lvds

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-p=
anel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-ds=
i-to-lvds-v2-panel-cap-touch-10inch.dtso
> new file mode 100644
> index 0000000000000..32828e9bc5345
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-ca=
p-touch-10inch.dtso
[ ... ]
> +&{/} {
> +	panel-lvds-bridge {
> +		compatible =3D "optologic,scx1001511ggc49", "panel-lvds";

[Severity: Low]
Are the vendor prefix "optologic" and panel compatible string
"optologic,scx1001511ggc49" missing from the devicetree bindings?

Using undocumented compatible strings causes static analysis and
make dtbs_check warnings when running devicetree schema validation.
Should these be documented in the bindings prior to or alongside
this patch?

> +		backlight =3D <&backlight>;
> +		data-mapping =3D "vesa-24";
> +		power-supply =3D <&reg_dsi_lvds>;
> +		height-mm =3D <136>;
> +		width-mm =3D <217>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813133335.1941=
580-1-leoreis.costa@gmail.com?part=3D5

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76342586E;
	Mon, 27 Jul 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183263; cv=none; b=SAL6XmX7P1h6YC2kxtkVxcDBf/4YADj4NVd2a483qyZnXeTT2gKsBl/6V4hLTrwYWlqjqRLFSpFqD0QBrn5lIwSkANBfab4lgPqRJh0LARihfasnfeIe8morHXLyfS0qyn/+SGvncX8Ebb6UUcAxY/FN4MOjo0ayuEHyew2zUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183263; c=relaxed/simple;
	bh=u/ulQbj+3Rra9c5DXgwkJdZNNbh1gPdZByVNR2WSe5A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fOWcdEjIu3BVRcJTXzraKJcM5SpoRGyJ1f22XMaX+Nz0YtAD4MjHTGByTZRs/Y0we+YgDk5iy67RznVMw+Iua9RH40/SKuZ3AeFbkUZc3WzYi5P1S+LDLHgW6bVIoQW8vbCLABIJbEp54rSuIBu8R8HQknEuJx4GmoY5KPpCWMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeLQfVeN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeLQfVeN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B831F000E9;
	Mon, 27 Jul 2026 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183258;
	bh=/O3VOL2meA1dzij/h6aLzmZsicQmeyfTXlJ0sMWwOZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JeLQfVeNBnaDjE7wheQ4ebztHHAdjxf2MdHrkMAboAID/EZDHnTfJZWYV0ZhmgFuK
	 IzFqecsLlW64gaN+VieLnz8RScWdNdCB8daAyqr16f55o+KAbUgNzNt6RwShyQueoZ
	 rZMhI3WWKJ6p9Fby+cFvaTv9N5nfJWwpwHW+H3Tg7OBJ6BxR7w7tuASmmJoWu8nyiS
	 sTSxIVNeUlpDMYl27+hdwWvFavuI0wuZWjE6rkiKtCG1PpXCcL33dVfkhoqB7qUJcV
	 SD0tMRmXI4intyJtOM6afxTJH/Q63ft+DcJrPHhhFnZuf7wZa0FC+hR+75G/t6fOBo
	 FGoD/rJ16ITwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/7] arm64: dts: imx8mm: imx8mp: Add legacy board
 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727195244.78199-3-marex@nabladev.com>
References: <20260727195244.78199-1-marex@nabladev.com>
 <20260727195244.78199-3-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:14:18 +0000
Message-Id: <20260727201418.A2B831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Chaining overlays in a multi-dtb rule fails at build time because p=
receding overlays do not export `__symbols__` for subsequent overlays to re=
solve their `__fixups__`.
--

--- Patch [3]: [PATCH v6 3/7] arm64: dts: imx8mm: imx8mp: Add legacy board =
DTOs for Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 68e606cc871d4844f2966698d1f9194823c8f933
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Min=
i and Plus eDM SBC

This patch adds legacy board revision compatibility DT overlays for both
i.MX8M Mini and Plus eDM SBC boards. It includes adjustments to support
these legacy board revisions.

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 9da078bb6380b..c3de54507aae0 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
[ ... ]
> @@ -344,6 +350,24 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvd=
s-mi1010z1t-1cp11-dtbs :=3D \
>  	imx8mp-data-modul-edm-sbc.dtb \
>  	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.d=
tbo
> =20
> +imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900-dtbs :=3D \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo

[Severity: Low]
Does this multi-dtb rule cause an fdtoverlay failure at build time?

Because the Kbuild system compiles .dtbo files without the -@ flag unless
explicitly requested, the first overlay (...lvds-g070y2-l01.dtbo) does not
export __symbols__ for the subsequent overlay (...lvds-rev900.dtbo) to reso=
lve
its __fixups__ against.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds-rev900.dtso b/arch/arm64/boot/dts/freescale/imx8mp-=
data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
> new file mode 100644
> index 0000000000000..427585b78e45d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds-rev900.dtso
[ ... ]
> +&reg_panel_bl_supply {
> +	status =3D "disabled";
> +};

[Severity: Low]
Will this label reference fail to resolve during the build since it relies
on the preceding overlay in the chain which does not have symbols enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727195244.7819=
9-1-marex@nabladev.com?part=3D3

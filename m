Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3694D2EC0;
	Thu,  3 Sep 2026 17:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455615; cv=none; b=kmpdkOF6R2xm9nlV7xJY/XiaZ+n5Kk+PatK8TB9R2UwxTFVog1hZEEZUu8VhyQXGidjWugzlEnd7l/tmwbfbbKFhAHf84u2NYfnl2CuSfBKxsRu76JlLCwCoJk7stY2Ywad3MOB0VecIJC5OxSuz+/WwAqncub9dvJpo58cv3/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455615; c=relaxed/simple;
	bh=R66FxBIYir0QdQQTT/vtLTGAdaKa/a4MhCMM+e0tavo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ODEITKephWRdxO7KbBwU10VmGBHvaLBxfKBQnf99S2WN4CBAuyI5ENenE9vzG/b7gegz3N1xPiMMJCxb2Kq3AeJpkh0fBVqAXshUJbxGW8AebfZmt9XMCG50/4BEEq01Dj8XvUPrvNq4sKmaav1Td53Km7s1fdBJZzVta4Trh4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILTgpAJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILTgpAJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F291F000E9;
	Thu,  3 Sep 2026 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455614;
	bh=nGrHEKNFmHMs4D1H1YMKWL9z4uD/BM4vpQhnVD8Oqnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ILTgpAJi52N71+dFWRRCo7oQCgHwvKYd6h+XIXqI33zqAS1V6hZLyfeRFbJzg+LEb
	 Vz4F8wl+JyObsutBlNe8eIQi9qWUH7TeLqk3bwKAuN4XZEEB4TeZB3HBaM/etCWC5q
	 adNCECeH6Fc9ttUkZCnUgB4A4xdn15XX9vhViLY0r9+JARWzuCPLZmdS6tqVUr5Krq
	 8+d4UJv0mJ3ZaLwJ93A2K6UFQF2knqxj8d4eqJg3UEdiMPEJGCX4Pkyeb0NoO2P41L
	 YDAczut6hB+K7c2QpdkAqJzBtLyywkJwOpcwyR04cwPbh+nVtPtsxCMyXsUaAjfnfU
	 DKwNTOiajX+9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port
 2 in SGMII mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Franz Schnyder" <fra.schnyder@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com>
References: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
 <20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 17:13:33 +0000
Message-Id: <20260903171334.09F291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect alphabetical ordering of Device Tree nodes in board file.
--

commit 0d298c35f819e60d18b42987638eda0dd342b16e
Author: Franz Schnyder <franz.schnyder@toradex.com>

arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode

This commit adds support for the Aquila ETH_2 using the ENETC port 2 as a
SGMII Ethernet interface. It enables the required nodes in both the dev
and clover carrier boards.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/ar=
m64/boot/dts/freescale/imx95-aquila-dev.dts
> index 3df17700b632f..2ff7bb8d6ac43 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> @@ -99,11 +99,29 @@ &dsi2dp_out {
>  	remote-endpoint =3D <&dp_1_connector_in>;
>  };
> =20
> +/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
> +&netc_emdio {

[Severity: Low]
This isn't a bug, but device tree node overrides in board files are
conventionally ordered alphabetically by their label. Could this
&netc_emdio node be placed after nodes starting with 'e', rather than before
the &enetc_port0 node just below it? It appears this alphabetical ordering
was followed correctly for imx95-aquila-clover.dts.

> +	ethphy2: ethernet-phy@4 {
> +		reg =3D <4>;
> +		interrupt-parent =3D <&som_gpio_expander_1>;
> +		interrupts =3D <8 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};
> +
>  /* Aquila ETH_1 */
>  &enetc_port0 {
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-add-enetc-=
port2-v1-0-2a21139d7a7c@toradex.com?part=3D2

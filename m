Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A9A3E3D92;
	Wed,  8 Jul 2026 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541249; cv=none; b=svDb89JBNGtkNjRjKcROOyReBrIgoBCSrup7drm5w6UHPdGF5OoD7+tPdUF53UwDytgoqgcTtDEQaa8MttUwY9P2H5MYyNOUPwYTxvr63NWChr4oApLfWrJtuoWDi2SoI/tLA8E2uh/u/RqkXyl5h/HwFe9YZ4P6X92OIsw7OnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541249; c=relaxed/simple;
	bh=UtCeGlGEqKLJ2DzRQm25uQLX2To5ls71NuZDcIb7rc8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fVqqCqiQhI4w/gYYSjTUyXqe5g9qoFmgTuwGAolJZisjyKqPO9fztg8jt7uJ3LyqCKfXQ1HcszwT55HCARCsI+EYnCbg2+3+Y++P417mZN+uLVddnwc6O3Qpx32knWDqlmwOFUfQBV/pYZiVSYdQhP/8ruxC13wRrSW5l8zVS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQp1N/7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQp1N/7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF06B1F000E9;
	Wed,  8 Jul 2026 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783541246;
	bh=0BSw9/730ukxJg/D1rWjqmXJCEzRjIn/kMEZHd/7FU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AQp1N/7r17AU21t6o+Bxyi2m1rc2lUOFhc2f7+OzAUeDmDt+eIzPXEPvGyYwioA+X
	 ZrOIWd4p/eJdxvIjeJRF9vISYimyBi3yIOIem94lox7yL8ddYlX3q01jldciVGnIG+
	 NyorJK7xIOqtUFmcsoiPoVlx+1PvjhW74mYw522hMcluWzW3pfM2l2e6SWCFHJ4OcO
	 lj02rES/uS6zSJ8USNcEXDV+HNH6PuB/3GMkYFJ0x49dURR/0p4rK6DCX+tu5YZlCy
	 Ky/q9vDtdRJ/dO+4opSCffM9Lx5CAYDZTPFCt0reonsiY+mDW+Ftnuk5ulAfoif8Xa
	 ZHpW8wNrN1yiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: imx53-ard: change node name eim-cs1 to
 eim-cs1-bus
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260708-imx53-eim-v1-2-913b4559e5b5@nxp.com>
References: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
 <20260708-imx53-eim-v1-2-913b4559e5b5@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 20:07:24 +0000
Message-Id: <20260708200724.CF06B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message and title state that the node is being rename=
d to 'eim-cs1-bus', but the diff actually renames it to 'eim-bus'.
--

--- Patch [2]: [PATCH 2/2] ARM: dts: imx53-ard: change node name eim-cs1 to=
 eim-cs1-bus ---
commit 86f73fc53c0394f0f24861992d60173147e1e27f
Author: Frank Li <Frank.Li@nxp.com>
ARM: dts: imx53-ard: change node name eim-cs1 to eim-cs1-bus

This commit updates the node name for the EIM bus in imx53-ard.dts to fix
CHECK_DTS warnings. The schema validation requires the node name to match
specific patterns from simple-bus.yaml.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-ard.dts b/arch/arm/boot/dts/=
nxp/imx/imx53-ard.dts
> --- a/arch/arm/boot/dts/nxp/imx/imx53-ard.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-ard.dts
> @@ -17,7 +17,7 @@ memory@70000000 {
>  		reg =3D <0x70000000 0x40000000>;
>  	};
> =20
> -	eim-cs1@f4000000 {
> +	eim-bus@f4000000 {

[Severity: Medium]
Does this change unintentionally drop the "cs1" identifier?=20

The commit message and subject line state the node is being renamed to
"eim-cs1-bus", but the diff actually renames it to "eim-bus". While this
satisfies the simple-bus regex requirement, it seems to contradict the
stated intent in the commit message.

>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
>  		compatible =3D "fsl,eim-bus", "simple-bus";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-imx53-eim-=
v1-0-913b4559e5b5@nxp.com?part=3D2

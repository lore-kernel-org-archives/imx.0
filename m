Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01765695;
	Sat, 16 May 2026 00:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778890708; cv=none; b=ZBD2mwg8Z1oZacAKFuoz3UltYCkqjKOQAB8XQDZIegcok0hoEcx84PvHl9P0g1sIOCNu2KGNk9ttEQkk2TYpxTLy/44wrnBq319NGF7nXwiLOlVqYmAc+UYBRGZJ78C6FrKiuDQCk3Oo5FgfmYy6iRDRYjXq7Na9lBEY8+XciNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778890708; c=relaxed/simple;
	bh=Tyq7mD6hXsGUCi+fVaRbLiqkQ90EYTsiUFCtMxpfUi4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NJ5XjZ/3rhMad1Y1V1l5LisoOX0bhpuogcjjLfXwpFyfG+dK5FIWlC+mWcTPCXyMVuTgdgY22njGqiMUnraWun6Tr+hvvpXX5XbX6zs2rEEUCnWnclGHIXrBygzYRSNIr3//MjJFC7bi1ISqTrxXA8XnlMV/zegABlq7d5BmDKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caJ2LKly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caJ2LKly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2C6C2BCB0;
	Sat, 16 May 2026 00:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778890708;
	bh=Tyq7mD6hXsGUCi+fVaRbLiqkQ90EYTsiUFCtMxpfUi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=caJ2LKly5r0HILD19wseqJVug1ZS8368NAYabqXVpFSseFq6/vor+Mtp5gM7VAU7J
	 ThwHdQM1KGhv583t6idWYyTWaxEnJAVfr8bdh5inbW1jvAfITCBtTQT2JcpCJ/SOPR
	 Y/Ll99EUzPh5QNabSZz7JR4+fRHugBJOgoXCqQG7gmPXDuASe6N9X0A/dbVC70DWLT
	 JlOIn5VzZpmOBPfXaSEaLEMJa9o1nTTDXSWcHuwb6Ijy1hV/qGaFGfC5Qxe/ix6TUp
	 eJazYbbI4QN9DQS+W0dUsPJ/5sZhuil+7v08HMJ7odG+qdB8qMv6Y0h/VF6/sikBMF
	 xRrsPVQCIDgug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] ARM: dts: imx: replace undocumented compatible
 string edt,edt-ft5x06 with edt,edt-ft5206
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Li via B4 Relay" <devnull+Frank.Li.nxp.com@kernel.org>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-imx25_dts_simple_warning_2-v1-5-b06bff192a05@nxp.com>
References: <20260515-imx25_dts_simple_warning_2-v1-5-b06bff192a05@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 00:18:27 +0000
Message-Id: <20260516001828.1C2C6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims that the 'edt,edt-ft5x06'=
 compatible string is not used by the existing driver.
- [Low] Incomplete replacement of the 'edt,edt-ft5x06' compatible string in=
 the i.MX device trees.
--

commit 41200cd2fe9679c5de99c8f7d34c6e5a590d761b
Author: Frank Li <Frank.Li@nxp.com>

ARM: dts: imx: replace undocumented compatible string edt,edt-ft5x06 with e=
dt,edt-ft5206

This commit replaces the undocumented edt,edt-ft5x06 compatible string with
edt,edt-ft5206 across various i.MX device trees to resolve dtbs_check
schema validation warnings.

> ABI impact consideration:
> Not affect Linux kernel ABI because edt,edt-ft5x06 is not used by the
> existing driver. U-Boot does not parse or use edt,edt-ft* touchscreen
> compatibles.

This isn't a bug, but is this explanation of the ABI impact accurate?

The I2C subsystem uses a legacy fallback mechanism where it strips the vend=
or
prefix from the compatible string to derive the client name, resulting in
edt-ft5x06.

This derived client name successfully matches against the driver's
i2c_device_id table in drivers/input/touchscreen/edt-ft5x06.c, which
explicitly contains an entry for:

	{ .name =3D "edt-ft5x06", .driver_data =3D (long)&edt_ft5x06_data },

Because of this, the driver was actively binding to these devices based on
this compatible string. While changing it to the documented edt,edt-ft5206
is functionally correct to cleanly match the of_match_table, does the
rationale provided in the commit message reflect the I2C/OF core matching
semantics?

[ ... ]
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts b/arch/arm/boot=
/dts/nxp/imx/imx53-m53menlo.dts
> index 2acbc86cabb31..aa1c7e5012c6a 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
> @@ -248,7 +248,7 @@ &i2c1 {
>  	status =3D "okay";
> =20
>  	touchscreen@38 {
> -		compatible =3D "edt,edt-ft5x06";
> +		compatible =3D "edt,edt-ft5206";

Are there still remaining instances of this undocumented compatible string
in the tree?

It appears the exact same string still remains in the tree:

arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi:
	touchscreen@38 {
		compatible =3D "edt,edt-ft5x06";
		reg =3D <0x38>;
		...
	};

Because this occurrence was omitted, will schema validation warnings
persist for any board incorporating this dtsi file?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-imx25_dts_=
simple_warning_2-v1-0-b06bff192a05@nxp.com?part=3D5

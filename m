Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434958;
	b=A5t57dNxrtFOXSdxJosiVmFUwcayjBiEwGL7nzuv7lewVc2Y35x2+IdkXM1Qu0dmQGja
	 rMFvTip7mcoOJbXTUra0wyawgfb+QdT9exP6LiSq+TvaBJ/fRM3H0l45rkTFN7qPRKfpU
	 K5Nv7SaGGnuWS/vmk6lJFUh4Y4tBgD/ewx/fKgMBQuWTuGe9b4OxecXPg6x84PZ5r/jFt
	 DzRFtIxZC7hcyjkdgRJN9w4k52MXCM57cAjHAawL1BiHLLOOMucyrvD9+MB9FQ4/Q2rXy
	 WHrcaxvU2lcwaKG7tV6KlDuv6MPQsy/tLN9zLg9qQ2hOydZKbNUQQIbdIZPvo5OMz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434958;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uQIfJEqiPJ1mQR35MsL2RHP/8XZtLWuKl9UFXZTtDWo=;
	b=qidy/YboJSLUasxq7DYscfQeAt7PMPSE/nX7YtA4s0Cp+wO2yHAIc1rJZgAGyQilDosq
	 Hi4/0vakgnTWV7PxoJnSLiaRotc90CCJkn2WiP+BK5VEVPGxnafCbsd37LJTqxGk2MCFx
	 KGDzh6Om8mhWVFthQ4fjsrtW07VbppEcD+PspVLpIY8HE7nonF1PonK6cXenoZ28IUSKa
	 FoUqXzKLblNqpYJy63u8qCmJ2rll3/36crczk1lKZWQMWgHCMiYIB1ZZUyGEeFHX+bIe7
	 CteWcDxtg1L6erUwHTGohyyHRFoZ+VEGLSoWEV6dwm00CiC+ErK19xOpmt7WnlzqNTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gAECp1jO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08405606A31F;
	Mon, 19 Oct 2026 18:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gAECp1jO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373FF1F000C4;
	Mon, 19 Oct 2026 18:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792434957;
	bh=uQIfJEqiPJ1mQR35MsL2RHP/8XZtLWuKl9UFXZTtDWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gAECp1jOXfZX3ztC9L56yzI50FaOCV6Hqzcf56wcDwvnkY7zaBnARJDSu9fx6wff7
	 BoxzwMUAogePQY0n9XDHze3VTHUWowEggWxaNBxSenni0HCdPYbHqHFXnvtQXUEfuG
	 x9dckImzjKfzf/e7OWIonHKseBFRe3BcYqZHz7RPMkhX3p09lgsRIGJo1u9YTo/wLY
	 7Fgo8M+zPQHFbz/Zm9sBqcdqBp/M1EWhahBzauGlcDRB6ThXoAE5/iuYkItEcWLty2
	 SJXD8e3U6ESwkOaFsxaDgS4GYypruu2gXIkTSl2DBs5jjFSDuAxyS76GIiBolvdMl1
	 Kzb6nW+FcNKLw==
Message-ID: <sashiko-outbox-178098@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/13] ARM: dts: imx6dl-b155v2: add touchscreen size
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019-arm_dts_cleanup2-v2-3-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
 <20261019-arm_dts_cleanup2-v2-3-dcdcbe6389c1@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 18:35:56 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ARM: dts: imx6dl-b155v2: commit message contradicts 16384 touchs=
creen size
--

commit 9dc060e080fedd6ab87ca8276cfb3bb59a468536
Author: Frank Li <Frank.Li@nxp.com>

ARM: dts: imx6dl-b155v2: add touchscreen size properties

This commit adds touchscreen-size-x and touchscreen-size-y properties to the
touchscreen@2a node in arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts to satis=
fy
the eeti,exc3000 binding schema.

>     ARM: dts: imx6dl-b155v2: add touchscreen size properties
>    =20
>     The eeti,exc3000 schema requires touchscreen-size-x and touchscreen-s=
ize-y
>     properties. Add them for the EXC80H84 touchscreen on the B155v2 board,
>     matching the 1366x768 resolution of the AUO G156XTN01 panel.
>    =20
>     Fix below CHECK_DTBS warnings:
>       arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dtb: touchscreen@2a (eeti,e=
xc80h84): 'touchscreen-size-x' is a required property
>             from schema $id: http://devicetree.org/schemas/input/touchscr=
een/eeti,exc3000.yaml
>    =20
>     Signed-off-by: Frank Li <Frank.Li@nxp.com>
>=20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts b/arch/arm/boot/=
dts/nxp/imx/imx6dl-b155v2.dts
> index 7edc788bcb8f3..dd7b892cf0722 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
> @@ -25,6 +25,8 @@ touchscreen@2a {
>  		pinctrl-0 =3D <&pinctrl_q7_gpio0>;
>  		interrupt-parent =3D <&gpio5>;
>  		interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +		touchscreen-size-x =3D <16384>;
> +		touchscreen-size-y =3D <16384>;
>  		touchscreen-inverted-x;
>  		touchscreen-inverted-y;
>  		reset-gpios =3D <&tca6424a 21 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
The commit message states that these properties are added "matching the
1366x768 resolution of the AUO G156XTN01 panel", but the touchscreen@2a nod=
e in
arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts sets both touchscreen-size-x and
touchscreen-size-y to 16384.

In drivers/input/touchscreen/exc3000.c, exc3000_info defines the native
coordinate range for EETI_EXC80H84 as 16K:

drivers/input/touchscreen/exc3000.c:exc3000_info[] =3D {
	...
	[EETI_EXC80H84] =3D {
		.name =3D "EETI EXC80H84 Touch Screen",
		.max_xy =3D SZ_16K - 1,
	},
	...
};

Should the commit message be updated to reflect that the properties are set=
 to
16384 to match the EXC80H84 controller's 16K coordinate range rather than t=
he
1366x768 panel resolution?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-arm_dts_cl=
eanup2-v2-0-dcdcbe6389c1@nxp.com?part=3D3

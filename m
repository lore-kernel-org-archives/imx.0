Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365033F4848;
	Fri, 26 Jun 2026 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476159; cv=none; b=JDJBqMKgNZe+jSAxHDuYq87JBSf9kURZ09tMe/T8I9Hy3dtmioPUZign+TSAHcxRS72Q/+8kTaupUExRXnfKyeKtkRVqdx88pgrH3wbcgWkNo6OjfdjZJxrj85qMjq9S8YJG2eOdLoem3mGZtdWnTgm9fxQ0+jxqi/StijcLmoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476159; c=relaxed/simple;
	bh=l+LL0qKVxsXNMvEVk38PwsT0oAsHI5BM+jVoH3sR16I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MJv8HKmSdpTo+NBkDcT1b+xnTyYRZx50d+UixzKgIHayBiqTy2a2IrV6GtPSGnUWWOVN0FGYUj3Z4Syu+mDUdaNBFXCdi85v0g9FfQK8yK5ybiOOtxcWa2HU1FHxFIPXfb4cZfb66hb33wUTazGcyhmtQqxyUP+UGTaoTikyQTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ty8PBRr2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ty8PBRr2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C6D1F000E9;
	Fri, 26 Jun 2026 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782476157;
	bh=zLQFaXhzNMKMTKhwKJXj/Oa0YPUoCfs8nckuiihE6Uc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ty8PBRr2c52B+oGFOJY/CYj3YDjyRjL8Vak/sfbUIJefAb8FMLSpAFIoRvNP9tAMP
	 3r57W9lBGDXkSULiH6UDHWs7wr8I5lppN+UqJSp6YeRg86nbtzJEwMTQSRdcTWZKZh
	 2NahjwvZCV+mIAbswhVA/lINpfTLSPLZwtrH2P08EA0KIgD4qq8MLKV9VqJseh3RSY
	 QUZ7edziQ1Mb/qUELW6P6AWUngM91g/jdRp69a9qfhC51zDXjEfjDqSQDCBpYN/gUx
	 BItnC28k+wyojQTkdBwVGNSGqJ6R+Wifi4hm0FH5FSMAs+UvD8E9H7S5v4+WPYPVcZ
	 0Qm523Z6Dk+Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] ARM: tegra: Convert to new media orientation
 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kieran Bingham" <kieran.bingham@ideasonboard.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260626-kbingham-orientation-v2-4-47178be927b4@ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-4-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 12:15:57 +0000
Message-Id: <20260626121557.92C6D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit introduces an undefined macro `MEDIA_ORIENTATION_REAR`, =
causing a Device Tree Compiler (dtc) build failure.
--

commit 26c9ba57e237b4ebfdbb6dbf2af353106c11c695
Author: Kieran Bingham <kieran.bingham@ideasonboard.com>

ARM: tegra: Convert to new media orientation definitions

The commit updates the NVIDIA device trees to use new media orientation
definitions instead of hardcoded integer values for video interface devices.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> index 60e8a19aa70ec..c58e3026a115e 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
[ ... ]
> @@ -1216,7 +1217,7 @@ rear-camera@10 {
>  			dvdd-supply =3D <&vdd_1v2_rear>;
>  			avdd-supply =3D <&vdd_2v7_rear>;
> =20
> -			orientation =3D <1>; /* Rear camera */
> +			orientation =3D <MEDIA_ORIENTATION_REAR>;

[Severity: Low]
Will this cause a Device Tree Compiler build failure?

Looking at the dt-bindings/media/video-interface-devices.h header, it
defines MEDIA_ORIENTATION_FRONT, MEDIA_ORIENTATION_BACK, and
MEDIA_ORIENTATION_EXTERNAL.

Since MEDIA_ORIENTATION_REAR is undefined, the C preprocessor will leave it
as an unexpanded token, which will cause a syntax error when dtc parses it.
Could this be updated to use MEDIA_ORIENTATION_BACK instead?

>  			rotation =3D <90>;
> =20
>  			nvmem =3D <&m24c08>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-kbingham-o=
rientation-v2-0-47178be927b4@ideasonboard.com?part=3D4

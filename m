Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED97047ECE8;
	Tue, 25 Aug 2026 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666573; cv=none; b=V3kPNFZXUifBcObbl4L8SxHuv+UzFteT+kaSDrhoCKcH09uLTFNMF9+V+u7toa58dP5vWXPivQ1Dov1rYGsPcopURfg2b9dUkQHYwKpXee0RVlVI1g9mDFFn08A6jKt8dmTW4a4eWs0GUGiWbNL0Sap4ZwdGB2+Z3OMhdXJ/TWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666573; c=relaxed/simple;
	bh=CGBbT9jSTKQqSxl+OYWS4wLQzdZ0UqkrqbyqFV19l2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gIbJ9SuTvRvR4mrz2dh+BwIa5RnNsMJ4ks3w5yVr4faTR+AZAe/IK1O3Zt7/tiujC3nb7Urf2L8mURzFtmtSNHQDxzYH4NT/C1GlHJ8q8oEakQwQCoDAQheFC8jjEi6vCYoECPSioE3w1pc0lB+iZng5MLOmdrn6sBUch8p35kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hq7IV0K+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hq7IV0K+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B981F00A3A;
	Tue, 25 Aug 2026 14:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787666571;
	bh=6k7ShBkUFVRUfGZQp76hAmgpkyN8cdPt7MamuTxv++E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hq7IV0K+prXcqGwLcWpgIq19aWZps21t6NOlfc2rdKZt2lk9uQ54z1c22MgO7jy3v
	 5sZOTSh0VfRd4k5RfALI/kBOzWI7vyt+4L1wrro7EbiFXvZQ7fi9rxW+Z65EEm6fug
	 oy4SXMWFxkACgKn2mRCpv1ACxn0a/RknqkmDvO8s5vsY9vKhdshkOmuOaTzr7JxPTH
	 jxeygiU8JXRJSS5tPw9oXZCnyZ9tdCU8ecM0qs1h+tclaOxj38CB3qRdi+Q5XsH3Ja
	 J6z4JhNo0DpeRkoQuAkRvmhHVAu/AS2894w1GX7DqraNtGIYsduCqAtLIAgacy8qAG
	 pIvGlPsf8BF8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard
 configuration EEPROM layout DTOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825135754.864501-1-marex@nabladev.com>
References: <20260825135754.864501-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 14:02:50 +0000
Message-Id: <20260825140251.28B981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree node for the software compatibility field is mis=
spelled as 'software-comatibility' (missing 'p'). As these fields are expos=
ed via the sysfs nvmem interface, this typo will become a permanent userspa=
ce ABI.
--

--- Patch [1]: [PATCH] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configur=
ation EEPROM layout DTOs ---
commit a29716c722da3485b2bb345e32239ee52540c286
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configuration EEPROM layout DTOs

Add DT overlays which describe configuration EEPROM VHIP section,
for VHIP section v1.0.0.0, v1.1.0.0, v2.0.0.0, used on ifm VHIP4
EvalBoard. With the DTO applied, the VHIP section fields become
accessible via the sysfs nvmem interface.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-10=
00.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dt=
so
> new file mode 100644
> index 0000000000000..41641c54164f1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dtso

[ ... ]

> +		product-type@64 {
> +			reg =3D <0x64 0x20>;
> +		};
> +
> +		software-comatibility@84 {

[Severity: Medium]
Is there a typo in this node name? It appears to be missing a 'p' and should
perhaps be software-compatibility@84.

> +			reg =3D <0x84 0x4>;
> +		};
> +
> +		manufacturing-date@88 {

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-11=
00.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dt=
so
> new file mode 100644
> index 0000000000000..5f89b1af6874d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dtso

[ ... ]

> +		product-type@84 {
> +			reg =3D <0x84 0x20>;
> +		};
> +
> +		software-comatibility@a4 {

[Severity: Medium]
Does this node name also contain the same missing 'p' typo?

> +			reg =3D <0xa4 0x4>;
> +		};
> +
> +		manufacturing-date@a8 {

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-20=
00.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dt=
so
> new file mode 100644
> index 0000000000000..01599bf46ac18
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dtso

[ ... ]

> +		product-type@90 {
> +			reg =3D <0x90 0x20>;
> +		};
> +
> +		software-comatibility@b0 {

[Severity: Medium]
Could this node name be corrected to software-compatibility as well?

> +			reg =3D <0xb0 0x4>;
> +		};
> +
> +		manufacturing-date@b4 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825135754.8645=
01-1-marex@nabladev.com?part=3D1

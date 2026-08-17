Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57683BB12A;
	Mon, 17 Aug 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956217; cv=none; b=g54IJO0GCVswrG3nEKzCyVPtoQLguDCOQ+MZcgW2x6HnE5uNmNEz+ejAf7I8QkPH3RfYMAsdWaB/EenE9kbNDgnD4IdA3pfHCE/NLNbRw3dTdf/gGrXEcUmvpxfoiEIJ3ohltI1wMZD0dslP7unrlgY+sAyXUE9S0j53Nz5oUKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956217; c=relaxed/simple;
	bh=rVKAC4FgxoxqYCOK3OBej1xJOJk+8CgXRr3vos9Zu/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WFMNuIO5nDRUzObZwcH0aYuPcEEKCldto6rvCfk2VzC+Xp3k4W6OaFDgc5HUvrqzh2VarzotUmRcUz2rbJmK97PIEBgsKE/4t7L/XRpsNfrbke2Bvgu1liPkkpbnhjKq24SqaVRDwRUJ9ZJxqOJih/QMPjySxLiCl4s8mFUjBz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LG3T9Q5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LG3T9Q5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67C01F000E9;
	Mon, 17 Aug 2026 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786956216;
	bh=UTpuV4dw0gYaitnSOGiHXM3clxP/kbnyYZ+LcWB594Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LG3T9Q5vn9hGwh/hT1frPokHMYdXVElVF6bCjOalm7XRbwtklfOl9LsqtrtHBTXs1
	 YMTdpCnsPl1F9mqeKxWzQy3EmxqIIq1r9rZ3SQ4nDdGXoNcTf70zqJLIxSj1ecMLuh
	 talrWTSXFqblssAmJbMJTEoTGLQx6G1YfgfIwwlyiG7HLMV/XLppNU2cAGIqtpYWS1
	 YAmnz51QtTxpomUOwNOjCxvChQTjGoSboZoWEJi43SZqIJt4qKnqYlKyqsry+rGPS4
	 CUWofmdiz8i0ERzd8V4SieM3xepjMPVLqlJHSOzX3I50ZFQYsfx5MFuPcbXSyVvid5
	 a6w4wCfl1TQMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v36 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGFua2FqIEd1cHRhIChPU1Mp?= <pankaj.gupta@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-imx-se-if-v36-6-45c42847bfd8@oss.nxp.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-6-45c42847bfd8@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 08:43:35 +0000
Message-Id: <20260817084335.D67C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'imx8ulp-firmware.dtsi' file referenced in the commit messag=
e is missing from the patch series and the repository.
- [Medium] The 'secure-enclave' node is missing the strictly required 'memo=
ry-region' property, causing device tree validation warnings.
--

--- Patch [6]: [PATCH v36 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 76f84ac1c1605ca082a46d0943f7054948bdd267
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave secure-enclave node to the i.MX8ULP
SoC dtsi. It notes that boards can enable the enclave and provide its memory
region by including imx8ulp-firmware.dtsi.

> Keep the node disabled in the SoC dtsi so it does not impose a
> reserved-memory requirement on every board. Boards enable the enclave and
> provide its memory-region by including imx8ulp-firmware.dtsi.

[Severity: Medium]
The commit message mentions that boards enable the enclave by including
imx8ulp-firmware.dtsi. Is this file missing from the patch series?=20

It doesn't appear to be included in this patch or present in the repository,
which might leave the feature incomplete and unusable.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi

[ ... ]

> @@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells =3D <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			compatible =3D "fsl,imx8ulp-se-ele-hsm";
> +			mbox-names =3D "tx", "rx";
> +			mboxes =3D <&s4muap 0 0>, <&s4muap 1 0>;
> +			sram =3D <&sram0>;

[Severity: Medium]
Will this cause dtbs_check validation to fail for all imx8ulp boards?

The fsl,imx-se.yaml schema strictly requires the memory-region property for
the fsl,imx8ulp-se-ele-hsm compatible. Even though the node is disabled,
dt-validate still evaluates all nodes.=20

Because the memory-region property is omitted here and no boards can curren=
tly
provide it due to the missing imx8ulp-firmware.dtsi, it seems this will
trigger validation warnings across all boards that include this dtsi during
make dtbs_check.

> +			status =3D "disabled";
> +		};
>  	};
> =20
>  	cm33: remoteproc-cm33 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-imx-se-if-=
v36-0-45c42847bfd8@oss.nxp.com?part=3D6

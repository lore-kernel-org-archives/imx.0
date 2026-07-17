Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6F92F851;
	Fri, 17 Jul 2026 05:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265547; cv=none; b=QxF517DGjlmfeY6uD1U3ueOWhqwxWDz58YoBjEXFnAKhlM+L9poVyy0OjW4/6pWeUjtPS5kL7ZnqoCZpHf8fWvEn+tTbLBrUd+5Jclkwg8aSrMVq1wHI7EeGc4KUcD89wOPrXJ0KK5gRS85eb4yJplkAsObFuJMsVI2XXM/ddxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265547; c=relaxed/simple;
	bh=47drAFxYJBpbcLgVKR/NqU7kkJlsbzdyGm1vwKikNTs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NN6senCGB8ZxzQbo4Pwx8OTRl3WvCOk9ZyB1C3KLaJ0eoyaJ3l87L0Pwokysotsih2aSDagR4GxgAaStR79xAfg3EHIu5ZCBWgqQFfheoEPfJNNYqDRp1WjzE6d8IGQUX1Txuxzp0TgIb4tSURIRCJfyrmpsj4zE+1YN68FS1xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqeDcgbo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqeDcgbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E741F000E9;
	Fri, 17 Jul 2026 05:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784265543;
	bh=75THfOhCphf87rKcu5MdYLh4dAUKxC4hfMAAywY+/M8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NqeDcgboFtLpDGrfdQQJIXYUK0I2QWOkNw1UhHyflhHB5s7sVDb68b4xDih90rzAX
	 Vha6SLjj30QAHAwc+4XzI8MB4ZuZwY2VWez9V9xvCiSNjusupHwVgURqVeZAZdDKDV
	 2MeV7LByuFuZZVIgo7g012SXAhlauJ9HA+zzLS1ojKs7zjA+gJfqxT/CoUPSNQYM5z
	 F+K2zttr8eCQ5L2gNnXhdZMn4B21YiTQsF21c10c8HW4TO7ZnpRK1eYGNauhLYzNyQ
	 Y3rz2wfNC10yjg3Tv+Fbhn7tfYqAUKAqbU/tMQffraimuz6iG3VAfiY0g/wJ4KJTCq
	 uTbnZe6oXYD2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: imx93-11x11-frdm: factor out common
 parts into dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Guo" <qijian.guo@nxp.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260717-imx93w_frdm-v1-1-0cca6c0ba2f5@nxp.com>
References: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
 <20260717-imx93w_frdm-v1-1-0cca6c0ba2f5@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:19:02 +0000
Message-Id: <20260717051903.00E741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Dangling phandle reference to a board-specific label in the comm=
on `.dtsi` file.
--

--- Patch [1]: [PATCH 1/3] arm64: dts: imx93-11x11-frdm: factor out common =
parts into dtsi ---
commit 75e389bfc1f27ac338bceffb58faf699a50fada0
Author: Joseph Guo <qijian.guo@nxp.com>
Subject: arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi

This commit extracts common hardware definitions from imx93-11x11-frdm.dts
into a new imx93-11x11-frdm-common.dtsi file to allow sharing with the
wireless FRDM board.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b=
/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
[ ... ]
> +&lpuart5 {
> +	pinctrl-0 =3D <&pinctrl_uart5>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible =3D "nxp,88w8987-bt";
> +		device-wakeup-gpios =3D <&pcal6408 3 GPIO_ACTIVE_HIGH>;
> +		reset-gpios =3D <&pcal6524 19 GPIO_ACTIVE_LOW>;
> +		vcc-supply =3D <&reg_usdhc3_vmmc>;
> +	};

[Severity: Medium]
Will other boards that include this common .dtsi fail to compile?

The bluetooth node in the new common .dtsi references &reg_usdhc3_vmmc, but
the definition for this regulator was left behind in the board-specific fil=
e.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/ar=
m64/boot/dts/freescale/imx93-11x11-frdm.dts
> index bd14ba28690c0..f2a31a0eacabf 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
[ ... ]
>  	reg_usdhc3_vmmc: regulator-usdhc3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "VPCIe_3V3";
> @@ -76,51 +19,6 @@ reg_usdhc3_vmmc: regulator-usdhc3 {
>  		enable-active-high;
>  	};

Since the reg_usdhc3_vmmc label is not defined in the common .dtsi, any oth=
er
board attempting to include the common file will hit a missing label error
during compilation.

Should this regulator definition be moved to the common file alongside the
bluetooth node, or should the vcc-supply property be set as an override in
the board-specific files instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-imx93w_frd=
m-v1-0-0cca6c0ba2f5@nxp.com?part=3D1

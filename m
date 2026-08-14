Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A373C35C181;
	Fri, 14 Aug 2026 06:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689921; cv=none; b=BIbtNVHaSRL0fuoKr0prTQVGPVedsQo7k6fAhLpVTFmO4UfOxzSwPYsXhJ6IBAE6z/a6BLs0hX+N34VkKut1kM5UtOvZhcaEzmFiVaoMurNH6Zx3Y64q7omdHvrEAZYVVelxKxgL6lhj1ZAeORPLWzFOiJTQGLk6cv8hIM90hPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689921; c=relaxed/simple;
	bh=0CFrfrl/kbiyaPKNbCpyKl7/npFXGAjgAO++KKn9eJQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EDEnxXbqJN51+FJIYcIjk4p0b7mZWdZnWNAIp6I9OYe3JqAsmTzOrA7r6RgDKLidngHy+XkuRvBf4IQJPX1aNZW2yZfE1cCZsUQgfbFFfgmq2MXlQzz5nIwz94VqkmfKwU5c2SOQR0tnW9n/jbBJElWg1Q5uxlxziA3kK/HR210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4pRE3KM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4pRE3KM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD781F000E9;
	Fri, 14 Aug 2026 06:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786689920;
	bh=eviLAHhCXKab9gwy+3KXy86ZEVkBz8v0ZVa2ZMAyGUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S4pRE3KMKo201S/QY5CR5Buv9lV/deawyVBZZM22I7iEz0cWpw0mTiAWj9TuRUHZg
	 XjM+SpM/QI463lwlU2P/A0gwcAgw2bj7LQL5j0SCG5NMGU8HXd19WKMIAH98Nfepiy
	 kUPAi50CZy5PpQWWqIJKZTixonC1bpdsl4O20/c8Vyb6oy5t5g852zp011gu7Q04Nu
	 IWfiRYgidrlLMouY4fSuAWEtiDw0lqkH7uC41bKEibvsDDUSB03F9tBqmClaGB4vjM
	 zaV4pFle0o/NvvkAPCA72wqj15/A+X/ONCyMjFEyonFSxliYmfBfpG1IPetktxazK5
	 cUwNY7NZ5ZzBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-15x15-frdm: add boot phase properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Guo" <qijian.guo@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260814-bootph-frdm-imx95-v1-1-c0e3f1b9d2ed@nxp.com>
References: <20260814-bootph-frdm-imx95-v1-1-c0e3f1b9d2ed@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 06:45:13 +0000
Message-Id: <20260814064514.ABD781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing device tree boot phase properties on provider dependencies=
 (`&gpio3`, `&scmi_clk`) causes early boot (SPL) failure for UART and SD/eM=
MC.
--

--- Patch [1]: [PATCH] arm64: dts: imx95-15x15-frdm: add boot phase propert=
ies ---
commit 9b9056eb20751b354934dfae8becee905da7d7b0
Author: Joseph Guo <qijian.guo@nxp.com>

arm64: dts: imx95-15x15-frdm: add boot phase properties

Add boot phase properties to essential resources during boot phase.
FRDM-IMX95 need UART, SD-Card, eMMC access during boot process.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/ar=
m64/boot/dts/freescale/imx95-15x15-frdm.dts
> index 0f43e3be70589..ba17d87f197a3 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -140,6 +140,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		regulator-name =3D "VDD_SD2_3V3";
>  		gpio =3D <&gpio3 7 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
> +		bootph-pre-ram;
>  	};

[Severity: High]
Will this regulator fail to probe during early boot (SPL)?

It appears that while this regulator is marked for SPL, its provider &gpio3
lacks boot phase tags. U-Boot's SPL device tree minification tool (fdtgrep)
drops any node lacking bootph-* tags unless it is an ancestor of a tagged n=
ode,
and phandle dependencies are not automatically kept.

If &gpio3 is excluded from the SPL DTB, could this fail to acquire the
enable GPIO and break MMC power?

[ ... ]

> @@ -445,6 +446,7 @@ led_backlight1: led@1 {
>  &lpuart1 {
>  	pinctrl-0 =3D <&pinctrl_uart1>;
>  	pinctrl-names =3D "default";
> +	bootph-pre-ram;
>  	status =3D "okay";
>  };

[Severity: High]
Is a boot phase tag also needed on the clock provider &scmi_clk for this UA=
RT?

Since phandle dependencies are stripped if not explicitly tagged, this could
cause clock acquisition to fail during SPL when &scmi_clk is missing from
the minified device tree.

[ ... ]

> @@ -1014,6 +1026,7 @@ &usdhc2 {
>  	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
>  	vmmc-supply =3D <&reg_usdhc2_vmmc>;
>  	fsl,tuning-step =3D <1>;
> +	bootph-pre-ram;
>  	status =3D "okay";
>  };

[Severity: High]
Could the missing provider tag on &gpio3 also cause a regression here for
the card detect GPIO?

Since this node is marked for early boot but relies on &gpio3 via cd-gpios,
SPL might fail to acquire the GPIO if &gpio3 is excluded from the SPL DTB.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-bootph-frd=
m-imx95-v1-1-c0e3f1b9d2ed@nxp.com?part=3D1

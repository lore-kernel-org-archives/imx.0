Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923229;
	b=0dRR2B1+AK/b2LE7+5OxEgiulLWTSk495BKd8ZT8ccgTxl2JMSfuPoGXHUzfRbatW2rP
	 1y29R7enVfynwyxFXDjGU2bDNcWbhNLgg2OOQpzeH4ifXgmAFiEbnTu6cf2w5pxk3NmRG
	 2DDmBN23ywGKpAAmp6yhw+KWaWtpWg1snmslYZTNkppeNvoLYEoVSiRKdCU13NQqKOI5i
	 y2bYzpbw26ORgc5oYSsmmsXx8TQoWI4mM0Osdt6qi6+P7RGLyvnF8HKA5wVeFY/9o+dbu
	 RUz24ZtELpS7HlYnB74YuA9mx44OhvI7epRzOEXYhZQrusNSuvTD2qNyL+qIFubBahA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923229;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=torjikHP0BVQTE6I1JqnyTxusN1zOWPbhKxT8rRtI+Q=;
	b=bXTv3Xh14ip2gcV8Q6wXRJe4LGP1/wQGUFJWZhOmkKfYUjRsWeRxJciiu/PocLbCgjFT
	 PHCFncGafHS2pVP/8RbSmLJZ2uO+S1goQEBVqCfcRQ5EMI7GIb1dqiqXrGKQnGI+19my3
	 qp4A5oCUmxu3kYI/G6HTeEo5Tdgi2v4KewBO8Y9tt4D13oUXJ5RtoQ2kQzOWJQaaH6hpn
	 4Fv6o01gnJWiskgtLTrPZII+6pbzFnODFT/jzdxUjqS+SFaIPJSDSWmd3AiPS5N7qx/ao
	 5z19phwIPGinlH3NHKYpKeuWMbGaO0jaWHpJ/MbvLXapCsWXHxqWDG7pwxXg9BMGApw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eogk4Zxu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E41606A335;
	Tue, 17 Nov 2026 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eogk4Zxu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E271F000CA;
	Tue, 17 Nov 2026 13:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923229;
	bh=torjikHP0BVQTE6I1JqnyTxusN1zOWPbhKxT8rRtI+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eogk4Zxu01fqtY5aGkbe9lr6VK+dpmDXaVjVfiZCexY1pVabpsI5rWYcsDa1DY0zG
	 wTfFd4LLuA+GamSdDJqHL2QczQim716OiMSUe5vxkSfYbx495ONP3sqcWHBjdEx3yY
	 M9wBCN6mTYC7tZcEdpO3J0H9x8yGubso27U3jK44uAsQfs/W3iLN1nvF66iqvSYOBz
	 eYb3ye5/vuQpZdJTsYK1ugOAcaNkq6e7nwWoYraSLPJufVvZaN4MXgZmVMCx3lH22f
	 5CPJfjOP8CdkWuT0KRQzyX3wZm+0Ygb5PdeQwc6adlPBrwy6sMbGGoLL73Vjfa96Gj
	 jhh7UB1ECFxyA==
Message-ID: <sashiko-outbox-218903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented,
 unapproved aliases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, imx@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:47:08 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: imx8q: removing vpu-core aliases breaks
  vpu_core_probe()
--

commit 385fa226f80390e2f0c1af946f31494af8162727
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: freescale: imx8q: Remove undocumented, unapproved aliases

This commit removes the undocumented vpu-core aliases from the i.MX8QM and
i.MX8QXP devicetree files.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/=
dts/freescale/imx8qm.dtsi
> index 9f9b34153ad54..f9d1c166bfccd 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> @@ -29,9 +29,6 @@ aliases {
>  		spi1 =3D &lpspi1;
>  		spi2 =3D &lpspi2;
>  		spi3 =3D &lpspi3;
> -		vpu-core0 =3D &vpu_core0;
> -		vpu-core1 =3D &vpu_core1;
> -		vpu-core2 =3D &vpu_core2;
>  	};
> =20
>  	cpus {
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8qxp.dtsi
> index 7c4a50e0ec9e9..82f640efc74e5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -50,8 +50,6 @@ aliases {
>  		spi1 =3D &lpspi1;
>  		spi2 =3D &lpspi2;
>  		spi3 =3D &lpspi3;
> -		vpu-core0 =3D &vpu_core0;
> -		vpu-core1 =3D &vpu_core1;
>  	};
> =20
>  	cpus {

[Severity: High]
Does removing the vpu-core aliases before updating the in-tree Amphion VPU
driver break VPU probing on all i.MX8QM and i.MX8QXP boards?

drivers/media/platform/amphion/vpu_core.c:vpu_core_probe() {
	...
	core->id =3D of_alias_get_id(dev->of_node, "vpu-core");
	if (core->id < 0) {
		dev_err(dev, "can't get vpu core id\n");
		return core->id;
	}
	...
}

Without these aliases, of_alias_get_id() returns -ENODEV and vpu_core_probe=
()
fails unconditionally, whereas vpu_imx8q_set_system_cfg_common() and
vpu_imx8q_on_firmware_loaded() also rely on core->id to select the per-core
register base and populate the firmware boot header.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117133842.2452=
62-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D2

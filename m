Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF51230BD9;
	Mon,  6 Jul 2026 22:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783375253; cv=none; b=bohHyhdw9BkU8Qm4ZrnLBpwlInELyMa2tNUY3d/oxrMWL0qCbu5fhDXOan5tHjwJWvVHf+J0smtezQtzmtLvFXO4J2eqp0GCJh767PHM1aEuuZ/aUYHg9BxgaYk7Ylzwv+KO/4jYWyFTqo7UKIXD/uLP1rNbPV32mEI1L59UEdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783375253; c=relaxed/simple;
	bh=TUJNlwnSqsV2xKA/JTrAHKjrb8Yy3B/R99TmxhIHBNs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WBMsHCiP/w7JLvMhrHGHR0DBLXmXSwJaplW8OS5EFretnJqovbj3fKDw3BA1V7EwQsOkaOw5d24dybi9YD3Bf8jKxyHT1NoVbAWhTNQG/y+cWraVB920ALY8jAQkZSa8cwQIsI3bwIA2+4y5GQuhJmd+mT0bVExjCye45e4CsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgWxUfwm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgWxUfwm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19FA1F000E9;
	Mon,  6 Jul 2026 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783375252;
	bh=viAKgeK7C5nOkcVfjt0bHjgt8VVJdenBAwm4C+17Qbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AgWxUfwmCNGfR7jApUJKTH7saoS1c7beOhVAh8+vdVURLvo0I7rY5dITDnEp49WC8
	 XxDe/OYwNMc+8xeDJLdQi04Of7WExJ4vLaIOu/7iLrJTp38mET1FtWTNfqOAi8pwEB
	 ELZMvltz2E13rOVVey6BsiVUAoKGyt416euStvkUcSbuJRXhBXFKmpo1gP/pjiTUt1
	 jiZmUKVcRCnKt9y/QbzHutbCDR7L+L2FWt5lHe9zR2J/EsL1huc+wIXNGOIZStw3o9
	 yJ9c+GeyyxOVa5G8GLneSYXAT/7kAewW1qPrzwGHJlK1ypMc6ylnb/bK1h8V9aA4F6
	 jLZv0AwgExW2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: imx8qm-ss-dma: add lpuart4 node
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260706-qm_dts-v1-1-14117a48fbdb@nxp.com>
References: <20260706-qm_dts-v1-0-14117a48fbdb@nxp.com>
 <20260706-qm_dts-v1-1-14117a48fbdb@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 22:00:51 +0000
Message-Id: <20260706220051.C19FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `lpuart4` node includes a `power-domain-names` prop=
erty which is undocumented in the `fsl-lpuart.yaml` device tree binding, ca=
using a devicetree schema validation failure.
--

--- Patch [1]: [PATCH 1/4] arm64: dts: imx8qm-ss-dma: add lpuart4 node ---
commit 5d53e06892d921423b269317c3426f0a50c063e7
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8qm-ss-dma: add lpuart4 node
   =20
This commit adds the lpuart4 node for the imx8qm SoC to the imx8qm-ss-dma.d=
tsi
device tree source.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8qm-ss-dma.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> @@ -8,6 +8,22 @@
>  /delete-node/ &adma_pwm_lpcg;
> =20
>  &dma_subsys {
> +	lpuart4: serial@5a0a0000 {
> +		compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> +		reg =3D <0x5a0a0000 0x1000>;
[ ... ]
> +		assigned-clocks =3D <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates =3D <80000000>;
> +		power-domains =3D <&pd IMX_SC_R_UART_4>;
> +		power-domain-names =3D "uart";

[Severity: Low]
Is this power-domain-names property strictly necessary here?=20

This property is undocumented in the fsl-lpuart.yaml device tree binding,
which restricts allowed properties. As a result, including it causes a
devicetree schema validation failure during dtbs_check.=20

Since there is only a single power domain specified for lpuart4, the kernel
PM core handles it automatically without needing it to be explicitly named.

> +		dmas =3D <&edma2 20 0 FSL_EDMA_RX>, <&edma2 21 0 0>;
> +		dma-names =3D "rx","tx";
> +		status =3D "disabled";
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-qm_dts-v1-=
0-14117a48fbdb@nxp.com?part=3D1

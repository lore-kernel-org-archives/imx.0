Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0348F82F;
	Wed, 30 Sep 2026 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764819; cv=none; b=a6H1oSSHvZ+mRMXJGPCylqmP6/7WKFbO7rG4wlxRQ5fTon307gXx3hTXwaXgwd5/Rthwa38zIjTyPYOF+zrNO1aqvGeBKZSrsyNLi6okMJW2tqg/z6VNxHS/PHhdZBuNryCVjzDJWR28MBq7KsQkbT8xY1uO1A4b9qUAlevJwis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764819; c=relaxed/simple;
	bh=2cryMlu0Uz8VoUDOgDSC9KBNv7Etwbanof9lkDx3Q5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CdoJhfnj9ixV8IUraoUkxk/4PlxJq7yIMZE6PIN1aAq9caj7sexKTEGZvIkzDlzEE0f9EiiJd8Epn+PxtvzPGtJX9POp0L25IDQqK+aqEMp6IWFg3MA2x4bq/hIrx3n01daVDkZ5Pt44VNPoEwTkgy+7kLzzXJXvxdwsIELU84E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWpUu1Dt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWpUu1Dt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC64F1F00893;
	Wed, 30 Sep 2026 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764807;
	bh=0fqBubpUTwG2KFAPSC3GSdsjlMiOxNbp+Acmpf21/pQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KWpUu1DtHsBIaRGDGIhpplg47vXKvV597TYvpm71NWabcdEmaVtEWYsbO9m3HsWLs
	 iK13CUBmdzPvV7N6cs4IjgxBHyLIfQ4DkW6bsfOKyOyCzuaWzq8LUqw6/9Hz8pzJdG
	 ZN6H+tWWuQAESvgHK+xwvwg3NIsBQaTjExjgqEckBf16OhijdzpEExI+PI3vuY9uW2
	 oA7/RvGk2oTFIoNjZDN0HnZ9FBa1Qp+gKYRzB6yh1/WGkIN4L+xyEfSdcsgfD+7XDV
	 fGJ3wZ709QuB12nnHDMhUDOIpL+0NiAdp9zaNi1XdzptCUPpDJ6dxnyBwnRVHwObIt
	 B3NTRhVVSH66g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx6dl-phytec-mira-nand: Enable all
 peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Primoz Fiser" <primoz.fiser@norik.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930103425.2315286-2-primoz.fiser@norik.com>
References: <20260930103425.2315286-1-primoz.fiser@norik.com>
 <20260930103425.2315286-2-primoz.fiser@norik.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 10:40:06 +0000
Message-Id: <20260930104006.EC64F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: imx6dl-phytec-mira: missing m25p80 SPI NOR flash enablement
--

commit 1324c8cd36593c2b5134e1d0d30d31d809ac1bc1
Author: Primoz Fiser <primoz.fiser@norik.com>

ARM: dts: imx6dl-phytec-mira-nand: Enable all peripherals

This commit syncs the i.MX6 DL NAND variant device tree to match the Full
Featured (FF) variants. It enables peripherals including CAN and PCIe, and
removes the speed limit on the Ethernet PHY.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts b/=
arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
> index d906a7f05aaad..1f827ad2ff5ee 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts

[ ... ]

> @@ -50,6 +50,10 @@ &i2c_rtc {
>  	status =3D "okay";
>  };
> =20
> +&pcie {
> +	status =3D "okay";
> +};
> +

[Severity: Medium]
Did this omit the SPI NOR flash enablement?

The commit message states the intent to sync the i.MX6 DL NAND variant to
match the Full Featured (FF) boards by enabling all peripherals.

The FF Quad variant (imx6q-phytec-mira-rdk-nand.dts) enables the SPI NOR fl=
ash
by including &m25p80 { status =3D "okay"; };. While &can1, &pcie, and the
unrestricted &ethphy are enabled, the &m25p80 node is missing here.

Does this leave the board missing its SPI flash feature and partially
unsynchronized compared to the other FF variants?

>  &uart3 {
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930103425.2315=
286-1-primoz.fiser@norik.com?part=3D1

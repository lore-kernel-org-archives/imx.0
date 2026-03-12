Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0BE2144D7;
	Thu, 12 Mar 2026 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317759; cv=none; b=KRFjh698PLzjv5Ot+fPBe+ta3BD0+PeOLHtk+qWRoeiUIuAxOE+ft2SN8RFcB4BaMSZ96OPW+OEGhZXY5PBkrjuc5bTXENOM/z4lU4ekViTOOhDxjtq58jxo11scdrDzGXK+fEvHqEtYrxb9h7E2KWwJyCZkCOrjUcH0f4odLGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317759; c=relaxed/simple;
	bh=3QOR4RBImHbJ4WdGpnzuQO8P0ymwKNo7nXQ+R7uV/JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XumZjZ/xczKLD9VETBTNiYR2o30RL3w89/2wE5paBUvQg++Z2e99WzVonkhbcfkEmckPB4cZ/LdU4ZKdJJcH9KwwlDNVGkN0j/ECHZTG7sf44cSEC5tkYU4ISyV+9JqWhO4jS17P/jausv7UQMNaG6+vOQ/uVZHZTxeUE2JV0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ZMsKOsdv; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ZMsKOsdv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=nL3Jsg1Kcl2JT56d/AZo0uTATM276sQcJqfKBYcoHw0=; b=ZMsKOsdv5anD+Fofc1NpW131No
	9lrMTrNxHlpG4pZBHESqAoIH9cidf6Bl+lg8Dsl4uu4xY5yQj9gLKMAIMWOBT0py8jRKl2Xd77OSm
	C0XULe8XwSMAvdHAZ5bT93nDHnQQpkbLRJ6a2wSsK7yozD5eOOPiEQd5IcnTJzgHYP57Tyh/DyO5/
	nSSy0QUvcmc6V40zy80EhvzL7uiP4paIivWl7OvFBS4O7asJzUJPXdHKUqelE3ttVirxBjAiOkw1g
	d3rtTHE265nJBwyEkH8ggoLCgKp2EtkWuLCsUaBxPoyVvPBJ/tex78IL+PQWtWMXGzShSuarFwKQE
	xNhmcNkQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0exG-0009ww-0t;
	Thu, 12 Mar 2026 13:15:54 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0exF-000Oxj-2C;
	Thu, 12 Mar 2026 13:15:53 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux@ew.tq-group.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 10/12] arm64: dts: imx8mq: Use undeprecated reset-gpios
Date: Thu, 12 Mar 2026 13:15:52 +0100
Message-ID: <3858513.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20260311-dts-snps-reset-gpios-v1-10-ea1cc09fba84@oss.qualcomm.com>
References:
 <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-10-ea1cc09fba84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)

Am Mittwoch, 11. M=E4rz 2026, 17:08:06 CET schrieb Krzysztof Kozlowski:
> Freescale i.MX6 PCIe host controller bindings through referenced
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts                | 4 ++--
>  arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts        | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts     | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi         | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mq-evk.dts
> index d48f901487d4..54826420740c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -369,7 +369,7 @@ mipi_dsi_out: endpoint {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio5 28 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 28 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE1_ROOT>,
>  		 <&pcie0_refclk>,
>  		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
> @@ -392,7 +392,7 @@ &pcie0_ep {
>  &pcie1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie1>;
> -	reset-gpio =3D <&gpio5 12 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 12 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE2_ROOT>,
>  		 <&pcie0_refclk>,
>  		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts =
b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
> index d8cf1f27c3ec..2296ff065467 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
> @@ -243,7 +243,7 @@ &i2c3 {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE1_ROOT>,
>  		 <&pcie0_refclk>,
>  		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/=
arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
> index 3ae3824be027..09f2fb1ad57b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
> @@ -195,7 +195,7 @@ mipi_dsi_out: endpoint {
>  &pcie1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie1>;
> -	reset-gpio =3D <&gpio3 23 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 23 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE2_ROOT>,
>  		 <&pcie1_refclk>,
>  		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/ar=
ch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
> index 0165f3a25985..aa54182def4f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
> @@ -93,7 +93,7 @@ &led2 {
> =20
>  /* PCIe slot on X36 */
>  &pcie0 {
> -	reset-gpio =3D <&expander0 14 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&expander0 14 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE1_ROOT>,
>  		 <&pcieclk 3>,
>  		 <&pcieclk 2>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> index c7bbba45f368..f3d0ebe98d5e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> @@ -547,7 +547,7 @@ &usb_dwc3_1 {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio1 3 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 3 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE1_ROOT>,
>  	         <&pcie0_refclk>,
>  	         <&clk IMX8MQ_CLK_PCIE1_PHY>,
> @@ -559,7 +559,7 @@ &pcie0 {
>  &pcie1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie1>;
> -	reset-gpio =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE2_ROOT>,
>  	         <&pcie1_refclk>,
>  	         <&clk IMX8MQ_CLK_PCIE2_PHY>,
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5403C35AC34;
	Thu, 12 Mar 2026 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773326963; cv=none; b=uAchi5FR6QypJfe/aFaIVAxfpTViamdINpBaePnmX8o+PmLdbUNCf1aguZrb/Cnby/j7L/vG8eOvqiqnOFMyKeNLxt8tA+ryFDC3ozQiKOh2KvN+RNiYdJt0mT+S/IUU+fNJTOXhW/Ddeww/ixnjBxuc32/ndHW1owQ3K98cCCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773326963; c=relaxed/simple;
	bh=cvc4REJqY8JM4iCJO7gHFafUYHigspWMdmkTZL9vhps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfHRtx+yUuUALlgKC4Wq47113fXTYmbioDbnzm49EpY/OLb8IHV765IWAYpMaPWrNaTGQt4UBAjlIRy+2uiSzVXYjN/yasi9GxtX7i4X7SXfonp8y68gEJ7sRe8CW+unmG74HoNVgCHCYo2Gk/esd+6zH/LzuvoZpySJNLKQ3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=DTuMplg/; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="DTuMplg/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=c5QsAZcxYXRQp5npZY097jPPuoS8V9KMbg0r8WNaSLE=; b=DTuMplg/qSpQbz2bJ1ocK3S24w
	XAiZ8sGu6lVSatTTeXDNBaLt6sl79+p+RLCsUN3pf55oSIDXbOrFEtU7gUhgmUp1fAmaF2dEFNg47
	ngcb8tlkLczAx3UeAr8QQgzIxyfKxKu1S/ymrLl4jZELuCaxHioT8Lt9vbDxMeuWW5MrIgp/PlvYP
	7kinJL/6qX6jt8eI1YNUwJ0rce4X+GdMCXx3SXNXO8Yg/NPb0T4TCpNIrYym2XrVw853HydlkgxfW
	mNX29BdFfPgZAjavYHVRVaiEXfZcpIxSeUEN9iZdwhELIhKQG/vMLpTzd55u9Ulo3UrrcL9Bp8csX
	RyBPfUqQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <max.merchel@ew.tq-group.com>)
	id 1w0hLc-000JBc-1m;
	Thu, 12 Mar 2026 15:49:12 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <max.merchel@ew.tq-group.com>)
	id 1w0hLb-0003qq-34;
	Thu, 12 Mar 2026 15:49:11 +0100
Message-ID: <82977bbb-6363-42bd-9739-20f57eb00c61@ew.tq-group.com>
Date: Thu, 12 Mar 2026 15:49:11 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] arm64: dts: imx8: Use undeprecated reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux@ew.tq-group.com
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)


On 3/11/26 17:08, Krzysztof Kozlowski wrote:
> Freescale i.MX6 PCIe host controller bindings through referenced

I think you mean i.MX8

> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 4 ++--
>   arch/arm64/boot/dts/freescale/imx8dxl-evk.dts       | 4 ++--
>   arch/arm64/boot/dts/freescale/tqma8xxs.dtsi         | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
> index 6fc82b5eb58c..6d8a57ff56c2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
> @@ -806,7 +806,7 @@ &pciea {
>   	pinctrl-0 = <&pinctrl_reset_moci>;
>   	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
>   	phy-names = "pcie-phy";
> -	reset-gpio = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
>   	vpcie-supply = <&reg_pcie_switch>;
>   };
>   
> @@ -816,7 +816,7 @@ &pcieb {
>   	pinctrl-0 = <&pinctrl_pcieb>, <&pinctrl_wifi>;
>   	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
>   	phy-names = "pcie-phy";
> -	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> index 5c68d33e19f2..bdd1dbc6b322 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> @@ -651,7 +651,7 @@ &pcie0 {
>   	phy-names = "pcie-phy";
>   	pinctrl-0 = <&pinctrl_pcieb>;
>   	pinctrl-names = "default";
> -	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>   	vpcie-supply = <&reg_pcieb>;
>   	vpcie3v3aux-supply = <&reg_pcieb>;
>   	status = "okay";
> @@ -662,7 +662,7 @@ &pcie0_ep {
>   	phy-names = "pcie-phy";
>   	pinctrl-0 = <&pinctrl_pcieb>;
>   	pinctrl-names = "default";
> -	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>   	vpcie-supply = <&reg_pcieb>;
>   	status = "disabled";
>   };
> diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> index bfc918f18d01..677a05b38391 100644
> --- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> +++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> @@ -407,7 +407,7 @@ &pcieb {
>   	phy-names = "pcie-phy";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_pcieb>;
> -	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>   };
>   
>   &sai1 {
>
-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


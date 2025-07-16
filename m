Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9E1D5CED
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 06:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752646877; cv=none; b=MGpUKVWDyyt9fxbt4nElcEgujmLvIIhsP/tfbU5B6IEN1UiWIKCTlMBsXk4Z6Lm53+6LsVuKflDBb4oNv/F7kSHd+1gDXVoDHsECqWjO7iHaEO7aELUTnUhJkGUCYxet5eUzQ9FZG5R4gea8EoxCIbl5bdYX7y71K3xrUP6FUB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752646877; c=relaxed/simple;
	bh=AwSGTpX43FxBW3QEbJaXzRq3ikYTNoZRw3/bc98cmn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9lEthkIyf7cT5PVAMLn9IFyREDpC+uksUErTJX6wrghyexXE+mdneqYjndiLUe94UH63zbXgF7eMrZpm2P7RlXhKXHwrsH2EaBkibQDFdzvrYOjNvkxIelN5Ktr3ki+miT5uZiClOCW0l3ipHvsjvCQuSN/co6o5WR5vytCZCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=YzPYSKVk; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="YzPYSKVk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nCTAka4Z34Vup8fOFjJvbq1l+srqLEDBoJV6NHCQMmI=; b=YzPYSKVk7NMvpPPeTgZYPk9D8E
	RZfTRT2hFezsdc8cAEpa1P4xxUqE/iAXCyoX6KityJo/9WtF76J2+Ybb7TKGz2LNXWqyJqcTK6mJq
	OnUn3yWf4sG8WfkB3x7T6nlHcpy0mn0EymSx1N0wIxD1AnfTF3+VhuiDOWZQPv3GFfL+xfWDhcxU3
	RkKN8kpa0yZs0HzF3nf4Ks/zdTDxVGmp9liFNcm83kWiFSoTbpqr0TLV6iGP+pWEbAn1ev4FpZ3IZ
	yXF5OllpjG8Ww2yju3AclUdkzZs1mhE8LpQz2XL7j0PU6IoJiRJC0IZVxhJTCsAVhrDzWsGe+sYov
	4DmOwKjA==;
Received: from [89.212.21.243] (port=41462 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1ubvVr-007q6F-0M;
	Wed, 16 Jul 2025 08:21:07 +0200
Message-ID: <b32ebf83-0c4f-4321-94b3-1efcbb811073@norik.com>
Date: Wed, 16 Jul 2025 08:21:05 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] arm64: dts: imx93-kontron: Add RTC interrupt signal
To: Frieder Schrempf <frieder@fris.de>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250714141852.116455-1-frieder@fris.de>
 <20250714141852.116455-11-frieder@fris.de>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20250714141852.116455-11-frieder@fris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Frieder,

On 14. 07. 25 16:17, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> The RTC EVI ouptut is connected to a GPIO. Add the interrupt
> so it can be used by the RTC driver.

AFAIK, RV3028's EVI is an input pin (EVent Input).

Please check.

BR,

Primoz

>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
> index 119a162070596..c79b1df339db1 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
> @@ -205,6 +205,9 @@ eeprom@50 {
>  	rv3028: rtc@52 {
>  		compatible = "microcrystal,rv3028";
>  		reg = <0x52>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
> +		interrupts-extended = <&gpio3 19 IRQ_TYPE_LEVEL_LOW>;
>  	};
>  };
>  
> @@ -468,6 +471,12 @@ MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e /* CARRIER_PWR_EN */
>  		>;
>  	};
>  
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_VSELECT__GPIO3_IO19		0x31e
> +		>;
> +	};
> +
>  	pinctrl_sai3: sai3grp {
>  		fsl,pins = <
>  			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00		0x31e /* I2S_A_DATA_IN */


-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com


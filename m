Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC8C63B9
	for <imx@lists.linux.dev>; Sat, 15 Nov 2025 00:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763166026; cv=none; b=WODuMbfgsHnwmfC62zB2vrq0Peo0tIibBMb7qb++S14l9neYNzacYEOoHpclq2dBqLsCPEkaqI2qh3K13+dp0nT2vI2riUP3/B9wwHuBJq0N22VVomYx7z6jcj1+w1zVIFLE3QVna+JHvcf5Q1MJvdnYvsVSOMM5teruazZda/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763166026; c=relaxed/simple;
	bh=GnY5W3eBSsTLkWB1SAWq/c5XiUGtQktCS4pe28VyhFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7TRuEGSl6Mu1FXv0itF2VAmd6rY+735loYtMQY2R9PusvsvO7h0+MEpC8akxuNJ/1nGPZKVP4prxyaUAIu09MUR8WisJ4Tsh9DTKYTlRlkIfURnFvElNICiSDDofvmG8ZyJMxTYU0LXmMeh0OfUU48KZKkggnZDV7d8KDW0Lgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=jfvANMVm; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=jfvANMVm; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="jfvANMVm";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="jfvANMVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763166023; bh=GnY5W3eBSsTLkWB1SAWq/c5XiUGtQktCS4pe28VyhFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jfvANMVm1W3hmXhUGr9bG0CN3hVWfNeSoSiuc6vjCaEnlbp0Aieg1A/CjlbVNsom4
	 5JLD2IQu0BaRlvUbg4/G8JUu5CLFASloMy4KW1SuBeYlbEXdtVFH+tmGKrgHzrpCnI
	 0/XseHZklgN0Ot1PfNQg2PSYTe7TWYuJPho/V/Ntl99NYxOrkBqkAx3IboNLOlwpZo
	 XuAVJR/PGeZdV5MrVTkLEerogKq4hl1/9wBWOz/QnlpYtAE/pNeBvBLS5BGKTK3kit
	 YwKLnq5WEgNX3whDsToHKa7jzkEl8YW1ExwOtgC+VI3gE3kbnpiFPZHlYZrNcT50sz
	 plahVHEy22yaA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 2DC6A3E16D7;
	Sat, 15 Nov 2025 00:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763166023; bh=GnY5W3eBSsTLkWB1SAWq/c5XiUGtQktCS4pe28VyhFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jfvANMVm1W3hmXhUGr9bG0CN3hVWfNeSoSiuc6vjCaEnlbp0Aieg1A/CjlbVNsom4
	 5JLD2IQu0BaRlvUbg4/G8JUu5CLFASloMy4KW1SuBeYlbEXdtVFH+tmGKrgHzrpCnI
	 0/XseHZklgN0Ot1PfNQg2PSYTe7TWYuJPho/V/Ntl99NYxOrkBqkAx3IboNLOlwpZo
	 XuAVJR/PGeZdV5MrVTkLEerogKq4hl1/9wBWOz/QnlpYtAE/pNeBvBLS5BGKTK3kit
	 YwKLnq5WEgNX3whDsToHKa7jzkEl8YW1ExwOtgC+VI3gE3kbnpiFPZHlYZrNcT50sz
	 plahVHEy22yaA==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 998FB3E101C;
	Sat, 15 Nov 2025 00:20:22 +0000 (UTC)
Message-ID: <e3ee8d61-d10e-4941-a577-dd6dc24e77a7@mleia.com>
Date: Sat, 15 Nov 2025 02:20:22 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] ARM: dts: lpc32xx: remove usb bus and elevate all
 children nodes
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251114174712.1206027-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251115_002023_206644_D32BDC99 
X-CRM114-Status: GOOD (  20.02  )

Hi Frank.

On 11/14/25 19:47, Frank Li wrote:
> Remove usb bus and elevate all children nodes because usb bus is not
> existed and only group usb devices logically.
> 
> Update register address and related full node name.
> 
> Fix below CHECK_DTBS warnings:
> arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>          from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - elevate usb children node
> - fab leave unchange now utils finish discussion.
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 77 ++++++++++++--------------
>   1 file changed, 35 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> index 4dff0d7694322..d6243adbc05bc 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> @@ -86,51 +86,44 @@ dma: dma-controller@31000000 {
>   			#dma-cells = <2>;
>   		};
>   
> -		usb {
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			compatible = "simple-bus";
> -			ranges = <0x0 0x31020000 0x00001000>;
> -
> -			/*
> -			 * Enable either ohci or usbd (gadget)!
> -			 */
> -			ohci: usb@0 {
> -				compatible = "nxp,ohci-nxp", "usb-ohci";
> -				reg = <0x0 0x300>;
> -				interrupt-parent = <&sic1>;
> -				interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&usbclk LPC32XX_USB_CLK_HOST>;
> -				status = "disabled";
> -			};
> +		/*
> +		 * Enable either ohci or usbd (gadget)!
> +		 */
> +		ohci: usb@31020000 {
> +			compatible = "nxp,ohci-nxp", "usb-ohci";
> +			reg = <0x31020000 0x300>;
> +			interrupt-parent = <&sic1>;
> +			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&usbclk LPC32XX_USB_CLK_HOST>;
> +			status = "disabled";
> +		};
>   
> -			usbd: usbd@0 {
> -				compatible = "nxp,lpc3220-udc";
> -				reg = <0x0 0x300>;
> -				interrupt-parent = <&sic1>;
> -				interrupts = <29 IRQ_TYPE_LEVEL_HIGH>,
> -					     <30 IRQ_TYPE_LEVEL_HIGH>,
> -					     <28 IRQ_TYPE_LEVEL_HIGH>,
> -					     <26 IRQ_TYPE_LEVEL_LOW>;
> -				clocks = <&usbclk LPC32XX_USB_CLK_DEVICE>;
> -				status = "disabled";
> -			};
> +		usbd: usbd@31020000 {
> +			compatible = "nxp,lpc3220-udc";
> +			reg = <0x31020000 0x300>;
> +			interrupt-parent = <&sic1>;
> +			interrupts = <29 IRQ_TYPE_LEVEL_HIGH>,
> +				     <30 IRQ_TYPE_LEVEL_HIGH>,
> +				     <28 IRQ_TYPE_LEVEL_HIGH>,
> +				     <26 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&usbclk LPC32XX_USB_CLK_DEVICE>;
> +			status = "disabled";
> +		};
>   
> -			i2cusb: i2c@300 {
> -				compatible = "nxp,pnx-i2c";
> -				reg = <0x300 0x100>;
> -				interrupt-parent = <&sic1>;
> -				interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&usbclk LPC32XX_USB_CLK_I2C>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -			};
> +		i2cusb: i2c@31020300 {
> +			compatible = "nxp,pnx-i2c";
> +			reg = <0x31020300 0x100>;
> +			interrupt-parent = <&sic1>;
> +			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&usbclk LPC32XX_USB_CLK_I2C>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
>   
> -			usbclk: clock-controller@f00 {
> -				compatible = "nxp,lpc3220-usb-clk";
> -				reg = <0xf00 0x100>;
> -				#clock-cells = <1>;
> -			};
> +		usbclk: clock-controller@31020f00 {
> +			compatible = "nxp,lpc3220-usb-clk";
> +			reg = <0x31020f00 0x100>;
> +			#clock-cells = <1>;
>   		};
>   
>   		clcd: clcd@31040000 {

As for me the change looks good, but I need some time to do
a regression testing, I'll do it over the weekend.

Thank you for the contribution!

-- 
Best wishes,
Vladimir

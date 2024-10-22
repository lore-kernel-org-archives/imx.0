Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BBA51C45
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 03:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729568120; cv=none; b=dkalH7X7+Avgn/YV4Oaxdy60Sesi2LlOeqFa+HggvCFlnUl79qCX40h5i9c5QuBKQvIhND4SHzWeSLPsmrKJ4URyfpG/l0ic0fy6heDh7aP2kZZmKVonZh8y1Xcv4TN7A2qJp1OWBHdzdIl57C9pf1bIBNdtvivbItgqOZSf4V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729568120; c=relaxed/simple;
	bh=Ji9RW5wBVkidiXquZNVk2PiwPs+kaPzx64z6/LAQZ3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8FvyhEDA3GGEcGKdFt6Xuq5S2cDQZbd6G4ZL0QYPjgZn92r4NdNxKgs0RH7+nJ/63NBcWvq8tuHxpFMim19xnY4rhJXtHjgckRgG7dda+2F0P2umrVXafdjzzpQ8xapUbXueTqVQBrwq1+G46D2VxOm86b5aVny56cSshJtZaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pNdwNPUQ; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pNdwNPUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rSoTtuHYsIo/Jxwdun60HpAfK7vei6fXzyYoF3sirpk=;
	b=pNdwNPUQzFuf+FGORSXgU4NJcngpB2Jeh0RujdhPrtnqgr4v6fx7uYPYn7vlLV
	x4Zp+JJm7Rb7dL+JchDcMsOJkjjhf9QvcI7pEtmJh5vzB3JcrAeP/3ZJsiOm2n+w
	rKstB/EUy/BFMuJN9rjhdEisnMcUC/KZBr3SyqMmSypEo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXH9diHRdn3dGUAA--.5380S3;
	Tue, 22 Oct 2024 11:35:00 +0800 (CST)
Date: Tue, 22 Oct 2024 11:34:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6sll: fix anatop thermal dtbs_check warnings
Message-ID: <ZxcdYudAHVSykFoW@dragon>
References: <20241021183244.303329-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021183244.303329-1-andreas@kemnade.info>
X-CM-TRANSID:Mc8vCgAXH9diHRdn3dGUAA--.5380S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jr1DWw1xAF1rKw43Kry5twb_yoW8Jryxpa
	yfCF4DKr4xCr1xKay5Zr4DKrWvv3ZIkF4F9r1qgay8ArZrXa42qr1ftFnakr98XF4Fqw4F
	qr4rWF1UJa1DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4nQUUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEg2AZWcXAR5oSwAAs2

On Mon, Oct 21, 2024 at 08:32:44PM +0200, Andreas Kemnade wrote:
> Fix anatop thermal related dtbs_check warnings about node name

Can we be clear what the warning about the node name is, too long?

Shawn

> and missing thermal-cells property.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> index ddeb5b37fb78b..85fe2a4ab97a0 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> @@ -525,7 +525,7 @@ reg_3p0: regulator-3p0@20c8120 {
>  					anatop-enable-bit = <0>;
>  				};
>  
> -				tempmon: temperature-sensor {
> +				tempmon: tempmon {
>  					compatible = "fsl,imx6sll-tempmon", "fsl,imx6sx-tempmon";
>  					interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>  					interrupt-parent = <&gpc>;
> @@ -533,6 +533,7 @@ tempmon: temperature-sensor {
>  					nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
>  					nvmem-cell-names = "calib", "temp_grade";
>  					clocks = <&clks IMX6SLL_CLK_PLL3_USB_OTG>;
> +					#thermal-sensor-cells = <0>;
>  				};
>  			};
>  
> -- 
> 2.39.5
> 


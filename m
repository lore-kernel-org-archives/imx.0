Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA33118C33C
	for <imx@lists.linux.dev>; Tue, 26 Nov 2024 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732603756; cv=none; b=myMWYns2N908lQNqhWNTqndTRJdlW3LH+MdcY2IuJQhodgFwlqyzv/u6KS8ZPNSYSkCVThBQPIflQR8vQdCsiZ+LN0/hhDay/9JJ9Oukp249lztwuZIXAD5PEMBXOSESVk1OaIo0ccxTiVHzyX742EOY2MVov/QmAm9yCkB3kn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732603756; c=relaxed/simple;
	bh=aPYtwxgZhw35UXv7IJQFDNx0YGXcgrG5lruABDTFbnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uawh6L7c83Y+3MoX7Bta/YkcmBC++Auc9uRRU2rvsUcy7s00AJMYzKpB9oc02cfsAygI9lHWfeaX4MoRJnOorIVJIvuKlin9nHdNV4rWuT7Fp2q1BrPYztwtnojwgmo0AsFOgmgcNHb31IBAgLnGZ5BE2R6uCD3vir5h+CavblY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tFpNh-0000ba-00; Tue, 26 Nov 2024 07:49:05 +0100
Message-ID: <f8d5e367-5648-4941-9d65-adfbe6d3c0dc@pengutronix.de>
Date: Tue, 26 Nov 2024 07:49:04 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: Add dsp rproc related mem regions
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 frank.li@nxp.com, aisheng.dong@nxp.com, daniel.baluta@gmail.com,
 laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, iuliana.prodan@nxp.com
References: <20241125152427.136883-1-daniel.baluta@nxp.com>
 <20241125152427.136883-7-daniel.baluta@nxp.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241125152427.136883-7-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25.11.24 16:24, Daniel Baluta wrote:
> With imx8mp-evk board we are now configuring 'dsp' node for rproc usage,
> so add rproc specific memory regions.
> 
> Also, enable dsp node because it is ready to be used.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index d26930f1a9e9..c732ee79772d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -291,6 +291,16 @@ &aud2htx {
>  	status = "okay";
>  };
>  
> +&dsp_reserved {
> +	status = "okay";
> +};
> +
> +&dsp {
> +	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> +			<&dsp_vdev0vring1>, <&dsp_reserved>;
> +	status = "okay";
> +};
> +
>  &eqos {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_eqos>;


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

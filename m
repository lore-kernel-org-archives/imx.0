Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5275732B985
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414316; cv=pass; b=RGHmWsYyC39FqCIX6AoMAOtoj0ueq3zu7L5dYtxxFz+TrMB7ExDP7hKHfUE/rBjqYRPfxWZEgR1ar172cc6OjYWJudP28I86MeJaOaYGv/iw1M1SZ3NqfWxht15cs6hhFcRlrxJ49BMSRRQpJ+cZrQP2ARdTjoqg7Bfg+FlXnY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414316; c=relaxed/simple;
	bh=ItaR7NR4AgDe3rSPiWtFPKFq1neRYIZXFOOcVjXrw/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXDIDQ+1GQFagDzTvnsqdidnz/d6D72ZqPOxcN5BPImC8J3ZFEl/yj/UAZfH3z6TxnIEVx4w/k/xC/ZicaReqKEJl+81PjKnZXAyVFUseo4RVSbLKY8LvHh29LXfK+L1/H7c3LMvRFgSTWrJ4t6yUJJn3eFWvQaldZvscbRlruM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=ByvH/w3F; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=UgMg9dg9; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="ByvH/w3F";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="UgMg9dg9"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-n57h.prod.antispam.mailspamprotection.com; s=arckey; t=1768414314;
	 b=GgsJQh7tjZ8WpwhYJ2UmN/IQNe1HT8N5/ynFnrB1KlaiyQpIbL+VOu4OBmS9Fnk1krdoJISe5H
	  Za3Ee/b/PF38sYh9Z9tVmhH3iS8ZjpSdkPNsPjvOlXY8U3UBKYb4NJhCbCH2u3czujs5ZpL7md
	  YzIlE9diSC8e3Lnzlb7RoSZy4gJWAWeE8gSgnXJolGi8+jLZqYqgaN20ydLmIvs+t0GRRpyhtP
	  d2Vl+Tny6jxzrRR3daqicvaxbjVvZnr7ub+XcI/Mct7f/p0vqOwBf2buSe8SGul2f/hGa0d5eW
	  bVvlKGTtsjddr7rnFpQGZ7sDJArUUz4BlcJXUgEtl4wXWA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-n57h.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-n57h.prod.antispam.mailspamprotection.com; s=arckey; t=1768414314;
	bh=ItaR7NR4AgDe3rSPiWtFPKFq1neRYIZXFOOcVjXrw/I=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=laV4q36tX4xFTI8caf+WlaGnJ6dCQ6lRyCCuYl90vz9XIAn3cLU5kEk2JatVdOs7rMvGrimj/G
	  6xDg8l8pzEGkqu6UjH8aVfL3LHvf5j8lw2fhj1gLH1od6tp8Ns5Pr7AznPotWoptVYm6LacOze
	  EbUjp9fWCNdvNmyQsiDXzy18iSuLygjqvnLtbdV1sT3kJ5TaXtOotz2/ZZgG4xrMmCSEe3gkcP
	  oXG1bz5elOWgLQOo7x6yhcfQLkkoYRNAbJ/FQTsBPlMvlDh8c37zHBBY+p0SgjuIRdySaFjlPT
	  dic4V5MpNSRUlZrLeY6jv6vYIcfCyhuLPDZZcn/lFg5yjA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=KeYcgQYeu8I7ysABYtWCJh1Wk1DZPlWME5u9+VeXyUM=; b=ByvH/w3F0fdhBcdYnbDCLEa/ho
	22/oX6l2kMDLYKR+gqKL1ml4zH0I+Yu+8RF+mb1xzakj0g4NmK8hbIW73GCO3OLuHO/6EVFLAB9DJ
	kbC19yBZb4Fgv8ZRv1/q596uSD4GYuCwJjYquSmuOmBZcjl1WstJwIk0spK8WIFa97a0=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-n57h.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vg5LN-00000008CB1-2X5X
	for imx@lists.linux.dev;
	Wed, 14 Jan 2026 18:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=KeYcgQYeu8I7ysABYtWCJh1Wk1DZPlWME5u9+VeXyUM=; b=UgMg9dg9phAh2zXYHLfgObTenB
	9K3Od55ULWamIYLZvLG/GlMOvjfW7tPVBLE+oDOKPwWq0bdJsE9Tk6j/HmDPCFa4R8ZeFX6rVze8J
	wJJx/nHWqLg3Wwg+QxXVuoZkyvIgorowCRfQCu52BD8vKm7dO5GRJSZnEKngEDvP6zUg=;
Received: from [95.248.141.113] (port=62575 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vg5Kz-00000000GgK-1k1W;
	Wed, 14 Jan 2026 18:11:21 +0000
Date: Wed, 14 Jan 2026 19:11:19 +0100
From: Francesco Valla <francesco@valla.it>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tom Zheng <haidong.zheng@nxp.com>
Subject: Re: [PATCH v3] arm64: dts: imx93-11x11-frdm: Add MQS audio support
Message-ID: <aWfcRxYBME4H0BQH@bywater>
References: <20260113075002.561453-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113075002.561453-1-daniel.baluta@nxp.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: c1b107ada6d20e7924658df0b31e340a
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vg5LN-00000008CB1-2X5X-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-n57h.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Tue, Jan 13, 2026 at 09:50:02AM +0200, Daniel Baluta wrote:
> Enable Medium Quality Sound (MQS) output on the i.MX93 FRDM 11x11 board
> by adding sound card description and enabling sai1 and mqs1 dts nodes,
> together with necessary clocks and pinmux.
> 
> This supports audio playback via SAI1 DAI which is connected to the MQS1
> block.
> 
> Co-developed-by: Tom Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Tom Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v2:
> * Remove  "fsl,imx6sx-sdb-mqs" compatible from sound-mqs as it doesn't
>   make much sense to use it as per Fabio suggestion
> * Link to v2: https://lore.kernel.org/imx/20260112135612.465325-1-daniel.baluta@nxp.com/
> 
>  .../boot/dts/freescale/imx93-11x11-frdm.dts   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> index 066c5139842b..5bb6ae0d154a 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -81,6 +81,13 @@ vdevbuffer: vdevbuffer@a4020000 {
>  			no-map;
>  		};
>  	};
> +
> +	sound-mqs {
> +		compatible = "fsl,imx-audio-mqs";
> +		model = "mqs-audio";
> +		audio-cpu = <&sai1>;
> +		audio-codec = <&mqs1>;
> +	};
>  };
>  
>  &adc1 {
> @@ -315,6 +322,27 @@ &lpuart1 { /* console */
>  	status = "okay";
>  };
>  
> +&mqs1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_mqs1>;
> +	clocks = <&clk IMX93_CLK_MQS1_GATE>;
> +	clock-names = "mclk";
> +	status = "okay";
> +};
> +
> +&sai1 {
> +	#sound-dai-cells = <0>;
> +	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
> +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
> +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <24576000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>  &usbotg1 {
>  	adp-disable;
>  	disable-over-current;
> @@ -479,6 +507,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
>  		>;
>  	};
>  
> +	pinctrl_mqs1: mqs1grp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_CLK__MQS1_LEFT		0x31e
> +			MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT	0x31e
> +		>;
> +	};
> +
>  	pinctrl_pcal6524: pcal6524grp {
>  		fsl,pins = <
>  			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> -- 
> 2.45.2
> 
>

Tested-by: Francesco Valla <francesco@valla.it>


Regards,
Francesco


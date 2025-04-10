Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C921D2F53
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271424; cv=none; b=SnvrV+b3l7BXPGAGTzDP3M1UV3FMpttQe29C8yK5c+yO3wWWQfBhwVOf8qe7/j9mGFbXufSLTL2NtIHz/lqPHGVR71IJskbChrfAPsSVwWyH3wqUIJ/uuQu/4waAQYyoNkZcxTO6KC+ViIu5zmTO7v9Qt/q7MUp0f6USMIFKr10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271424; c=relaxed/simple;
	bh=XJ8C56dpgh7I3PapWIvW5bS5auRCwUc0h+lB9fhDO6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+kocV7dCxOzgt/AZbfkBORACp5H3f/HxhVlijItuZE2O1ZROpD9F9AFfledfT0OOmXWwR2Mf3fS1JTxIjHSd5zbNL1j9PoQL3FBxMudHCqOnWy/+AFagkTFOgtXeoqvrXIeoP8lBoaSe6UPXS64bGbAK4nlR2P1M2V+xcDzb7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+KmT44R; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+KmT44R"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so93750966b.3
        for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744271421; x=1744876221; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mex8Z9dzfxz3hW33N8AMNQUPFzwP3mz+qG8H/RfxWWU=;
        b=b+KmT44RVMszx7VWeEMz/AQ+NXLzRBHAe3g2QF+4rn1H1V58NfhX9v2AEuddlu7WaR
         z+QOLKymirwzKDN6JAvwfG8ztsCgPAwyHpr9Z5Np2G78NHbBm0Bi6XHYcAC7EA9pxwKi
         OWjjn0bq1Qp6EkTylENY1f9bLl7K7ScxHIh6FrGKQfOZO7fQ0Xn6+3gVHvwaHnNORRqP
         dh5r3QIq0F7EpEf9ob0p1ikw/ITSskgIE2hjzmHjuTHWs/BgvmSXURPaGpz3v16Arm3r
         JoghkclkZaUqPXWTbgikGetuO+wQCeehe3muwGwFXsYTtdnGNl/hqJpg8kfTnr3qDtLH
         uBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744271421; x=1744876221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mex8Z9dzfxz3hW33N8AMNQUPFzwP3mz+qG8H/RfxWWU=;
        b=h9MwP0KKgXjVUrIYY0V4LIOD+qkoByMf5t03kJHVb7YcKzbPEOwInQcGP+xQr7V2Sb
         9/EBDI+7Oes7bCDrfYBSEoyo05mQDIC7+FzBAlpNtipJszVDK82IUruAP3zseJMDO/Gf
         OVHIAMuBMp/HXP5zqVG6RsAlnaRbHDMjHC5v2R4CUYoc7Xt1f3cKPBqNIIQF5fXtSNmZ
         Qfr0xWGkEL7AGiKlYGtQTB1v9Hh0cIW9Ic0tawA9MH2UyptWf5oPoy81VXnSWqyONw6U
         bLxfg+v1yXVARRQhMmh+XyUtzeWGOykOzbgM/RbMUayMjrhWGa7yiVLkmIcaSkdr6T7S
         WmNw==
X-Forwarded-Encrypted: i=1; AJvYcCUd4laC3FhdDhqkgZRNST+dr9ZfG5enH01bni+pGwiHf3fo4Jq6CwbyYGvz23GIYuJO9U8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzyTK1PgldsOd2PuL/tFlipWDL0PLSDq2G8THqP4sSTCazttjz
	xx/xQi4Z9874Tfuabbzm71+9/qO4oVTWzCzrSEcJdicvi9IXjIjO
X-Gm-Gg: ASbGncvZCGc5g3FFCh70GXcyHoZuDiBA4TtdFVDGH6EzwZr2dereiWlRrhLIKvoAeb1
	aXZkPOiNOBFyy3a7liayT4B566OlFU7/KJEeFOhwJglpdh1dbNPAibzD3bRRu/w5KpsULn0Up4E
	X4+8sWmVRcDZp/oAH6XacMlckiU71oIC8Gd1yyj031Ap30GRKkB+m0DhCDTTr7wcD1mshtqhCpG
	cglhM2cYXLhrQC7EE3j956PfdwSPfQ5m/muVV7bFHQqFlXD8P7NcXEbyPPW+PWf9e4MrdhukMIl
	kl9LMRFku6FVS1xGgA6zD2uw1PgHabG+UoTtob0LGR+IJ0Z+NpBS131AZrkWckoUTX+YYAAqEsJ
	rkPi+/MdbcIMNiWqEUKQDPyCbF1NPvneww35ntQE=
X-Google-Smtp-Source: AGHT+IEUKtIECQHfvCCQHEULrOOyIkJYLflU4RweKbQ5LyEXFJ2aLZNpy2NRTB84slWGKlTEWqpvyA==
X-Received: by 2002:a17:906:7310:b0:ac6:edd3:e466 with SMTP id a640c23a62f3a-acac008e44dmr102214566b.19.1744271421157;
        Thu, 10 Apr 2025 00:50:21 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-79-37-123-173.retail.telecomitalia.it. [79.37.123.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd195sm225096366b.130.2025.04.10.00.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:50:20 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:50:18 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Joy Zou <joy.zou@nxp.com>
Subject: Re: [PATCH v2 3/3] arm64: dtsi: imx93: add edma error interrupt
 support
Message-ID: <Z/d4OlTG6uDXtl49@alb3rt0-ThinkPad-P15-Gen-1>
References: <20250407-edma_err-v2-0-9d7e5b77fcc4@nxp.com>
 <20250407-edma_err-v2-3-9d7e5b77fcc4@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-edma_err-v2-3-9d7e5b77fcc4@nxp.com>

On Mon, Apr 07, 2025 at 12:46:37PM -0400, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
> 
> Add edma error irq for imx93.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 64cd0776b43d3..9f6ac3c8f9455 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -297,7 +297,8 @@ edma1: dma-controller@44000000 {
>  					     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>, // 27: TMP2 CH1/CH3
>  					     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, // 28: TMP2 Overflow
>  					     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>, // 29: PDM
> -					     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>; // 30: ADC1
> +					     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, // 30: ADC1
> +					     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;  // err
>  				clocks = <&clk IMX93_CLK_EDMA1_GATE>;
>  				clock-names = "dma";
>  			};
> @@ -667,7 +668,8 @@ edma2: dma-controller@42000000 {
>  					     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
> -					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> +					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clk IMX93_CLK_EDMA2_GATE>;
>  				clock-names = "dma";
>  			};
> 
> -- 
> 2.34.1
> 
> 
Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Tested-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>

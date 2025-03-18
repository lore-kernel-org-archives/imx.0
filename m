Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B033120D509
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306053; cv=none; b=unSmdpD5D9uvuVX5o7mvSStyEFsNgq2gZo+jjk9SZoLwkdKAZ64E23DDeQL2Kiz1AR2+9t7ou8Zuj8MDY95s1NvGVF+YY72TIzxrMndmSH4Zk5IYkrEdsHLmRC11+ExJzGZPat119ffF4UlODjHYQUOwy2T0moHVX84HqPrBU4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306053; c=relaxed/simple;
	bh=CxOI8mwu7JtKIevWK8uvc5MGY2JFwokUpAABhDp1EF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6dlzUail02Pm7vmRo+jMsY6QTnpsI+0clvbY+YSFaps7tSYXOTXvDFjWujBkiYIQzCja0fogpR+RSm6rrmGotP+Em/LdSpAH7ZXMC/NEyvdHrbBuCc/n3mGCupTf6tnQ8kt+KkBKzMDfHjjmbk8r0Ntab6949LHh7VbyHa07No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HY9czdVQ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY9czdVQ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso195167266b.0
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742306049; x=1742910849; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ioS2cZEy0ukzwLsu1UzbYL55bIz2RUYjyFsEjQ2qJY4=;
        b=HY9czdVQIUS0GVmMFpIy5cZGDwzSeY0V2Xyhptrw9r8O3zLjLH4JqbIUHto3SIeDHV
         ej8J7rkWuPnwHfes1QA7zjt/P2I+1B5yUF5ZofUrVlMMNWyE6s1N+CPH7TWjkdsqqP8L
         VA+EwtJp3y0ilYJXhy9SUQM0JIGp1+xhGRqhxV5A6zH4S6z0ico2g8zruoyuR39L3Gdd
         nQFTkDzrPRBW+jETQb8+P39z305L2FBXtO+OtKv7rVlvHAiP2azjpqIgmyxcTQnDrCnU
         aoLLRlZkt+etHpuB9h/Ie7pT/CwYn+Ln8vYKVQPykK0rwP086VTpRZ+Dg3BIwWu4A6kV
         /MZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306049; x=1742910849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioS2cZEy0ukzwLsu1UzbYL55bIz2RUYjyFsEjQ2qJY4=;
        b=Iuoh/qjoMixILL80b7XRNKQwmzsJGpmiUlryFdeXkCCqzTW+5r2JhrD4L731g67F7+
         /EAaiE/bZocYzTukQqRcUnPRSOSQAFdHq5XuLRzIC3BsjAck6oc4QHNaYlzeKAnClauo
         vkh6W2TszGYjZMO7ZpB8/y27CMSpVq/3a5t9psQ3PU/j6Fx7b/HWsc0krMwWOnWZg21J
         MyWEQioGLNkmou3YY48HTnEJk6v+lRVAkRQmtuQkqjR80wZsvCgIxsbUpmN/YhfYRBdy
         eYf9w39Yr0ETlEaiIySSCzL95PAP7b2ZNkjBRaBezcyLNwkz2QlIK1TJIsz6uEUwXSyh
         ThHw==
X-Forwarded-Encrypted: i=1; AJvYcCVVh3TTCcjiIqae84Jb8b69qzGFbfuPYFoXd13WUa4yfn3IMkiZ5txlUvfWkOzBFFTLvrA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJX8sbxSPl1vWByVchFm1Ly6zgoRwxek5QgwscIrzaXPvmfn5x
	dNVLzjl4hg/UTi14qjlRijYjJrWI7XHp2KRPQXXdpPS9/XVFRkKc
X-Gm-Gg: ASbGncsw9ygn3QsF0CrJXEfFJDSXOfSiu9C8cHlQzeT/R75r5MJOfHykyOU4YIHEakA
	xNAwaNg8a6Q+btQjl7+PVEFwLR8t+V25ah+Bbrbh2SeIrN6PqIaitKzxIzvTOuEF4IZMi9ZbQta
	eqebPGa+S8B6ASOY2B4N+LRAPlrJ+L+Ux1RMWVAJN84a26QKkzfB0M8EsmB1fUVobaTHIc5W8wL
	yHEX0qg1uF439bU1KuBkc2wl7rv2P5JTz5gK42s82g2CrpgLk6VJPmTdm8CRNXc9o3N05nRE9IS
	mimQwdBPxKmioVUx8LXglnEvpPNIN27aaT1vkB4Hw8MQ6xqeSxn+IdiNdgoYeJgor8TU4EYudZ4
	Ea7S0NmWM8a19rFzho4y5y2ZLFBTCGI1kpEvWQSwD3p0Bmg==
X-Google-Smtp-Source: AGHT+IHmjQU+EohyzzTayMACB/7/c62nd81pThtraC244l6FOU5kzeMBypubUIwPfYcCsaGXQp9bZw==
X-Received: by 2002:a17:907:6ea9:b0:abf:74d6:e2b0 with SMTP id a640c23a62f3a-ac3301db34fmr1803410066b.3.1742306048621;
        Tue, 18 Mar 2025 06:54:08 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-251-108-181.retail.telecomitalia.it. [95.251.108.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfb96sm840601766b.119.2025.03.18.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:54:08 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:54:05 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 3/5] arm64: dts: imx8ulp-evk: add nxp secure enclave
 firmware
Message-ID: <Z9l6/WKTmBvzjEfn@alb3rt0-ThinkPad-P15-Gen-1>
References: <20250311-imx-se-if-v13-0-9cc6d8fd6d1c@nxp.com>
 <20250311-imx-se-if-v13-3-9cc6d8fd6d1c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-imx-se-if-v13-3-9cc6d8fd6d1c@nxp.com>

On Tue, Mar 11, 2025 at 09:09:34PM +0530, Pankaj Gupta wrote:
> Add support for NXP secure enclave called EdgeLock Enclave
> firmware (se-fw) for imx8ulp-evk.
> 
> EdgeLock Enclave has a hardware limitation of restricted access to DDR
> address: 0x80000000 to 0xAFFFFFFF, so reserve 1MB of DDR memory region
> from 0x80000000.
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 17 ++++++++++++++++-
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 13 +++++++++++--
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> index 290a49bea2f7..a25d71bf2c26 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2021 NXP
> + * Copyright 2021, 2025 NXP
>   */
>  
>  /dts-v1/;
> @@ -24,6 +24,17 @@ memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0 0x80000000>;
>  	};
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		ele_reserved: ele-reserved@90000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x90000000 0 0x100000>;
> +			no-map;
> +		};
> +	};
>  
>  	reserved-memory {
>  		#address-cells = <2>;
> @@ -259,6 +270,10 @@ &usdhc0 {
>  	status = "okay";
>  };
>  
> +&hsm0 {
> +	memory-region = <&ele_reserved>;
> +};
> +
>  &fec {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&pinctrl_enet>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index 2562a35286c2..c79a5de227b3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2021 NXP
> + * Copyright 2021, 2025 NXP
>   */
>  
>  #include <dt-bindings/clock/imx8ulp-clock.h>
> @@ -154,7 +154,7 @@ sosc: clock-sosc {
>  		#clock-cells = <0>;
>  	};
>  
> -	sram@2201f000 {
> +	sram0: sram@2201f000 {
>  		compatible = "mmio-sram";
>  		reg = <0x0 0x2201f000 0x0 0x1000>;
>  
> @@ -169,6 +169,8 @@ scmi_buf: scmi-sram-section@0 {
>  	};
>  
>  	firmware {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  		scmi {
>  			compatible = "arm,scmi-smc";
>  			arm,smc-id = <0xc20000fe>;
> @@ -186,6 +188,13 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells = <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			 compatible = "fsl,imx8ulp-se-ele-hsm";
> +			 mbox-names = "tx", "rx";
> +			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
> +			 sram = <&sram0>;
> +		 };
>  	};
>  
>  	cm33: remoteproc-cm33 {
> 
> -- 
> 2.43.0
> 
> 
Hello,

I'm trying to test that solution with imx93-evk-11x11.

Driver is loaded fine:
[    2.098390] fsl-se firmware:ele-if@0: i.MX secure-enclave: hsm0 interface to firmware, configured.
and I was able to expose /dev/hsm0_ch0 to userland.

Can you share me tests that I can run against that device?

Thanks,
Alberto

Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4AD18E045
	for <imx@lists.linux.dev>; Thu,  1 Aug 2024 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513071; cv=none; b=a/eldwJ20FmLH1Lcn+iYjt8juM3lboTob0PKYh9qdaj076WfdhY7IKJQhdgvYGeONDTuTTxWkHKlxqf7br3FVNvlkGRh2mpA2z68LUQnWHkgFUhmPx20qzSZaCjNzDaD7cUa14jGHLe6VwW47OEA1+b2ovzBWg3fsGdbuqL13yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513071; c=relaxed/simple;
	bh=YeNBD14C3kwHi1DP0R7xBeAKHNR2XSujM9HljvW/uwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMBZt8S5188QvJYzn7/9TogiCa7OP31k6Ym0i60iXPQWJIKN2KcqPOoLHozug7ewlZI1uXxILREmrmVhIoUZxdGZ5L6J/ewvpuLYYLSROiVTlZRHwpNwWps7xQy3eG8fudMia1IQLX3HQ6GcsqtwhJsrQWSO73ktq5xAjL5hZ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UAxeL2VP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UAxeL2VP"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso10476535e87.2
        for <imx@lists.linux.dev>; Thu, 01 Aug 2024 04:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722513068; x=1723117868; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2uXxeexbnbDyJine/jy5b1tL6NFREtgJyBYIBURgb5k=;
        b=UAxeL2VPyz53bHb4FEDafvEV6TinD5aHy/DzQ3udtpEZl+Z5bpEDjaUjKqLFaEBxIP
         DsNYc/MvnC+jYvjxd4LhTNj1qZrbbH6USHlFuqmADGyz2sM9NeBVn94fCICqWALzz3FG
         a4/USnGe6zZ8evuNduU9S61rkWaBJ++yPMYqHrErbwAhRFCULRVuMYHaZ1ydoGCpeqoT
         prlrEMdAYUaIof209f+HADyK/ombJgl4bQgRACzbyi7YBKnWfzFHCtJZ/88sbf8DyoOI
         WkM3klHvaweJfj8jfUbjfrcRc05uPuBe01SZBRDbnM2GmRrtVJY99C5PiqzrCgJuRIaw
         Sdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722513068; x=1723117868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uXxeexbnbDyJine/jy5b1tL6NFREtgJyBYIBURgb5k=;
        b=iVjqrilLWtQtfmg0ih3U6KgVR/Lsl7oMp5J/b5e1wBiqxB+nj0/jSq5qoesD/ak+Z+
         0HAXRURtlq8NSYADSRX7p3kitwGePFy3OpXhkRwvit3O/OLCBlqxiyQOBRsS8Cxd4kwt
         LZo757QG1j8vbzbxI+ZfGLJTkIwsTYFId6PNTHmhw77V/34zRUltWCBZm+lFOMr7oJY3
         kSD6G/P6Q3IcQCUjRngoxgNrsuVN9mraJ07Q7BLo+2yblVS1jdMPQGjuL99wbP2J3iHO
         0wNuQbjGyPqj6GQlkF1lx99z/9EfODYwb/eydgcoPHnQuurRh5PD3QLulK9W3sSLsU8S
         hQkg==
X-Forwarded-Encrypted: i=1; AJvYcCUzy1tL6DUUBwkaiVgpRafoYUnjTy0+j3OLbeZXbriTrJyQRN2nCvwhVLF2SIidHu7Uk8kFsN9f8/2IGCJxGDEiy5Cw
X-Gm-Message-State: AOJu0YxMTd2pbpK3qn3qITWdnLpfpgTTii3VIpuuCnj2oDl3RoRa1m3R
	SByvtqIbLslcCpPIB1GjFLXwNeKaXZdJej+uKHw7xbICMCIkSJ7o7u4yvj3Udzc=
X-Google-Smtp-Source: AGHT+IGJGjlx9/PKhDj+PJ1AwCgR417PmZxBQW0jkbaFa4QxIlt3UdC8J0GtKy6GtFr21lnA33oGIQ==
X-Received: by 2002:ac2:568b:0:b0:530:aa82:a50a with SMTP id 2adb3069b0e04-530b61ece1fmr1735537e87.45.1722513067914;
        Thu, 01 Aug 2024 04:51:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc4262sm2601897e87.58.2024.08.01.04.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:51:07 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:51:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mp-evk: add typec node
Message-ID: <lzbqvgpla2souin67crolhwyun4rxy5r6ax424xnd7ypuottjf@hyvhzywqu4u6>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <20240801064907.3818939-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801064907.3818939-2-xu.yang_2@nxp.com>

On Thu, Aug 01, 2024 at 02:49:06PM GMT, Xu Yang wrote:
> The first port of USB with type-C connector, which has dual data
> role and dual power role.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - modify endpoint label
>  - fix usb phy tunning property dtbinding warning
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 104 +++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 938347704136..ef9b821a0ae2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/phy/phy-imx8-pcie.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "imx8mp.dtsi"
>  
>  / {
> @@ -26,6 +27,20 @@ backlight_lvds: backlight-lvds {
>  		status = "disabled";
>  	};
>  
> +	cbdtu02043: typec-mux {
> +		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec_mux>;
> +		select-gpios =<&gpio4 20 GPIO_ACTIVE_HIGH>;
> +		orientation-switch;
> +
> +		port {
> +			usb3_data_ss: endpoint {
> +				remote-endpoint = <&typec_con_ss>;

Where do SS lines go after the cbdtu02043?
Also could you please point out the datasheet for the chip.

> +			};
> +		};
> +	};
> +
>  	hdmi-connector {
>  		compatible = "hdmi-connector";
>  		label = "hdmi";
> @@ -535,6 +550,49 @@ adv7535_out: endpoint {
>  
>  		};
>  	};
> +
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			op-sink-microwatt = <15000000>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec_con_hs: endpoint {
> +						remote-endpoint = <&usb3_data_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};

SBU lines are not connected?

> +			};
> +		};
> +	};
>  };
>  
>  &i2c3 {
> @@ -704,7 +762,41 @@ &uart2 {
>  	status = "okay";
>  };
>  

-- 
With best wishes
Dmitry

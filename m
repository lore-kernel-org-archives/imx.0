Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A493C0C
	for <imx@lists.linux.dev>; Sat, 27 Jul 2024 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722078916; cv=none; b=WsqW2l8CCaTtCrTZzEAz4UlBhEQMdA1X6KR/f1/+NMoEAAZ23NXNOS17Z/QLH6d0LLxEADCSw5MErxcKTyHzqhFMTjA5VWHXQmQRgT5KPKYqLRHxqiX2uctZxY7S1ebwnMVM+i5HoWMiJdnDt/+flhWlrMonFrp1KDtSwfGgVu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722078916; c=relaxed/simple;
	bh=XW+Sl05nPKtK0oJETkXKZKjWld845FHy7XWyvct8PHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6VmqJZyAOGCzZNv8PkB1NJfYCxbFccdqhY9T5QTMzx9P1mUKMVicqjS8NHUQV9oLU0XPmPYaqnvQJ3TU+BBioT3k2NfZO67rjCL7EZMC87RDx+EC8xZ7010FCmzpohwaVMHZSn24dY9nOb634a2/JxoJlhtY4kmN2eAXg2eaW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ng5/2gLL; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ng5/2gLL"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef2d582e31so24204681fa.2
        for <imx@lists.linux.dev>; Sat, 27 Jul 2024 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722078913; x=1722683713; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6IkcugCt219ovB+QT/C8OnX7+9cAi+LnPtWh9ZzNwI=;
        b=Ng5/2gLLV8hGTmZw7Px8dft1Zc8zhtlbkw7niDzYl6bI1uRLKQoxYx79A85cxM4bm2
         RfeWjl4pdcV4D2tNFEmEf4Co5uM3/U2IRKMLcj1+3KPrHrVfNRtEtR3S7Hkyj+fqni+Q
         uxNpOFJdzmYkWx+Pq3Q0BwibWZ15jX4Kq81KAAY9FII3XHs+nfgRQH1JHNiet2cPI49A
         3bckNwAfyUrQDsSCze0zyewT85krsOdHSAeC6+ugN5UD8+FIswMZfR/lcuYEKg++Jnq2
         ExuzaWt2gdekhuxpHaMqY610JUF+Pt4P2sMnBusiF6r1DfT14DcyXnLx6d9fP1wA5WG8
         MScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722078913; x=1722683713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6IkcugCt219ovB+QT/C8OnX7+9cAi+LnPtWh9ZzNwI=;
        b=RhEkK5QYKYIjruVSSW71bei7izFf8raU+8LOWu1kDxi6SyzRkUmg6yE59ax62rveuV
         ZQG+b/Iq4WBIVx9cA6T51rsN/6UWWBV+/n0puWpOvhMWMazqgP2l3vwYqaZbDqV4vn6P
         bIOyO55Dj5TjhOGy+2+tZQi2tc8ge/VD7LAD53pd3z8dkRsxz7nGEfoATUVrVYMy9xFG
         3TT23UbA/hSUbuGyQuBI06tNSCwG5WIvTbzNu5KwGbnwSzPnhkFEP8iet2Qt22loQpFy
         MTWBqyBAFMlQbzUrd/Ho1xzvNNY0gfv8hf46MelWvApMqhNUULRnWJES0gI9hbdvrb3z
         9K4g==
X-Forwarded-Encrypted: i=1; AJvYcCVR2/Fh5q8Pp9dzBd2a8e+nPjyFJhyT9a4/VNFoT28I2QvgvevfBoy8qFKDOv8Fr3yY5TCCu4LXsfoAJD1m5m4kA0Z4
X-Gm-Message-State: AOJu0YxMzx+eig9QRjxGe+vfemt2JRSmVEFLxU0ksDF6d/U7eIMfpzb3
	lkgwa1egDYA1erMUqOFCcZePUiYpY9nLIuZtERbhicxWzy0pmVBq6PCd8vQnvsU=
X-Google-Smtp-Source: AGHT+IFVXUmMe+3AT1Z/H4tmBdr6d67ABfA5prOEZcm0+0GcEzV9I7RRCuZCY8eehOOL6sI8HfvrCg==
X-Received: by 2002:a2e:9d99:0:b0:2ef:24dd:8d86 with SMTP id 38308e7fff4ca-2f12ee634a8mr12638391fa.49.1722078912885;
        Sat, 27 Jul 2024 04:15:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf0f9bfsm6943141fa.16.2024.07.27.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 04:15:12 -0700 (PDT)
Date: Sat, 27 Jul 2024 14:15:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, saravanak@google.com
Subject: Re: [RFC PATCH] ARM: dts: imx53-qsb: Add MCIMX-LVDS1 display module
 support
Message-ID: <xoj4sypxndql62k64ztmco5ufddeysp26fyc46prwr4ezik223@sssy5zmefwtg>
References: <20240726065012.618606-1-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726065012.618606-1-victor.liu@nxp.com>

On Fri, Jul 26, 2024 at 02:50:12PM GMT, Liu Ying wrote:
> MCIMX-LVDS1[1] display module integrates a HannStar HSD100PXN1 LVDS
> display panel and a touch IC.  Add an overlay to support the LVDS
> panel on i.MX53 QSB / QSRB platforms.
> 
> [1] https://www.nxp.com/part/MCIMX-LVDS1
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> I mark RFC in patch subject prefix because if the DT overlay is used, both ldb
> and panel devices end up as devices deferred.  However, if the DT overlay is
> not used and the devices are defined in imx53-qsb-common.dtsi, then they can be
> probed ok.
> 
> With a dev_err_probe() added to imx_ldb_probe() in imx-ldb.c, devices_deferred
> indicates 53fa8008.ldb and panel-lvds kind of depend on each other.
> 
> root@imx53qsb:~# cat /sys/kernel/debug/devices_deferred
> 53fa8008.ldb    imx-ldb: failed to find panel or bridge for channel0
> panel-lvds      platform: wait for supplier /soc/bus@50000000/ldb@53fa8008/lvds-channel@0
> 
> It looks like the issue is related to fw_devlink, because if "fw_devlink=off"
> is added to kernel bootup command line, then the issue doesn't happen.

Could you please fdtdump /sys/firmware/fdt (or just generated DTB files)
in both cases and compare the dumps for sensible differences?

> 
> Saravana, DT folks, any ideas?
> 
> Thanks.
> 
>  arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
>  .../boot/dts/nxp/imx/imx53-qsb-common.dtsi    |  4 +-
>  .../dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso    | 43 +++++++++++++++++++
>  3 files changed, 49 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 92e291603ea1..7116889e1515 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -46,8 +46,10 @@ dtb-$(CONFIG_SOC_IMX53) += \
>  	imx53-ppd.dtb \
>  	imx53-qsb.dtb \
>  	imx53-qsb-hdmi.dtb \
> +	imx53-qsb-mcimx-lvds1.dtb \
>  	imx53-qsrb.dtb \
>  	imx53-qsrb-hdmi.dtb \
> +	imx53-qsrb-mcimx-lvds1.dtb \
>  	imx53-sk-imx53.dtb \
>  	imx53-sk-imx53-atm0700d4-lvds.dtb \
>  	imx53-sk-imx53-atm0700d4-rgb.dtb \
> @@ -57,7 +59,9 @@ dtb-$(CONFIG_SOC_IMX53) += \
>  	imx53-usbarmory.dtb \
>  	imx53-voipac-bsb.dtb
>  imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
> +imx53-qsb-mcimx-lvds1-dtbs := imx53-qsb.dtb imx53-qsb-mcimx-lvds1.dtbo
>  imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
> +imx53-qsrb-mcimx-lvds1-dtbs := imx53-qsrb.dtb imx53-qsb-mcimx-lvds1.dtbo
>  dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6dl-alti6p.dtb \
>  	imx6dl-apf6dev.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
> index 05d7a462ea25..430792a91ccf 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
> @@ -16,7 +16,7 @@ memory@70000000 {
>  		      <0xb0000000 0x20000000>;
>  	};
>  
> -	backlight_parallel: backlight-parallel {
> +	backlight: backlight {

Nit: this seems unrelated to the LVDS support

>  		compatible = "pwm-backlight";
>  		pwms = <&pwm2 0 5000000 0>;
>  		brightness-levels = <0 4 8 16 32 64 128 255>;
> @@ -89,7 +89,7 @@ panel_dpi: panel {
>  		compatible = "sii,43wvf1g";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_display_power>;
> -		backlight = <&backlight_parallel>;
> +		backlight = <&backlight>;
>  		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
>  
>  		port {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
> new file mode 100644
> index 000000000000..27f6bedf3d39
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	panel-lvds {

Nit: Just 'panel' should be enough.

> +		compatible = "hannstar,hsd100pxn1";
> +		backlight = <&backlight>;
> +		power-supply = <&reg_3p2v>;
> +
> +		port {
> +			panel_lvds_in: endpoint {
> +				remote-endpoint = <&lvds0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&ldb {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	lvds-channel@0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		fsl,data-mapping = "spwg";
> +		fsl,data-width = <18>;
> +		status = "okay";
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			lvds0_out: endpoint {
> +				remote-endpoint = <&panel_lvds_in>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

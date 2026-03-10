Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CBA36C58B
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137174; cv=none; b=sH8aM9r8vcANXHbQKZdWEq7gcE6BjjH8pbfojus2lM/lnfMSO20F4KMi8E0K3o8vGmRvom49niPmxRcfzWwrF/zbz+EqIazPDJRVH6xX+A53auVpmXo2m1ziYOzd2zLY5jB9Rmy92WpbfKiBmynHLaY4VKapRlrrtUQS0jKfaH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137174; c=relaxed/simple;
	bh=QjE4cEvdFi0owbDr/a7XfWDQ+/pUxniveETxohTqu7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GE7Zzj/0gYJafOMd+hrEbbLOUhNgdK6TBzAFlP9ysxD4xuZWL2G1vd97EB3O6JCuQySNZosTCkSdNGmGjAz8gs18UK0aKCFxbccg4Lmor+ADvOCpb5R2vHBomzqJn0LTcPuyNsxZ0Z4h3U3EFP4QpFhH3OJbyHLDRocR+LS8z1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIZdyh38; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIZdyh38"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439ac15f35fso9173545f8f.0
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773137170; x=1773741970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmUw5A97wrpfIT56ALDmCYbj15syxnOOqGuMSPR08nE=;
        b=gIZdyh38nW/vCpSOWqPxJgK7WQya0U66NRQD6vzg4woFsSEubCIXKUjhTLhKRDnXzY
         N6DY12IJp/6hHD8jk1xGW3H6yYS0MOuvVgoDEyZctRIEUOxCHNwtpMDSxlxzsIdwrOCm
         /jLEjQ1621wITtsZoiB1Hr6hX3bayFgLNxQizCoVER5T54dVyNpyqEmPuJoH5d7v1h/C
         ptJw05O5zQH85XPQor0Faa7UjH1iza79sBfQU5hrJmWaZfonDr3shVGy1yHhlresEqkr
         X02B0xSY+//qhucafoIjw/cPYwi9d0Yrqk138l1omL4gnBeek0WXJojLWTE6S/xjFMGi
         dwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137170; x=1773741970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmUw5A97wrpfIT56ALDmCYbj15syxnOOqGuMSPR08nE=;
        b=dky1a8hIz36MH+y95fmwW9b4w6B7f5Jl8vl3/lb8dc8j41EJp08XgUijpHNXKtb4k5
         zxzDSU/qHZYHB4gKi9AOZVhb0RiFr4KvUXzPKowt5Kq+OqSpnJBl6pIWGtpumotbho1H
         gyWMmPsYgyeXyinMIMcTXd+oQx6pl3AZwYZ6WGgPt817iWEcLXU2QOPXeYSIMpluCgXX
         0l2oDZefyTK602IThw+LazvHYRpxXcp4yXaT4CrHFcq75pMarB5JoS06f77oUPMjW4HI
         +t1jT9+k1rsEtnXmcGl6eUa0t4r9KcaeVGlkvVry3gBQtftIhkZAjoJxvLQadIN7qw4L
         p+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUPmX6OZir+47Q3mLKsZzNFvdOnY96WDAWRPQktyEaLQcK3nJzYvaKA1/WdFUQ5qzvNHu4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZkx04EXtD+GuotR6hBhwhxy+1pu6k0h/BlxhQbget/353cOs1
	+SIDu+ze6IMPccK0+x7arXT13MEGksPkQNn/jckeauijA41KT1n+sF8T
X-Gm-Gg: ATEYQzwOVY3TKPBKqN3ZLT8SEZ4f0fB7+Wa2ZdyXrTVq4oPzEizlIJztJGenIkIEBeB
	AZR+Pqu3iUQH/n0FlDDtk9w2/oQecZPIxcl1z0Ix75rPp05B/K3sKgznoeMwb68evgR8yFmal0z
	IeZFJtlpwr+syX9CBNJ86YTn4RwMMNrXYQcIj+5Jz6yM95Mm9CVj/RCtXItpxzxm4egxpe0DA77
	DfnatBdigx7LCc8k3JvxxkUl79kuLtqy3TaCocPup7DrxtzCvPgt+ddvX/Zweq8R++OSv/8JNto
	Nqs57Il+tnTth5+arJszXlf+gVimifseIHluj1DRZZLFPNTasW+NkLNQsvW0FGv3iUi9Hox1B3K
	tetOhm6Vvj8i+0xt83rHpOMwNWLzV38ZN7O87+a5+Q+y83wMHMPu9iv3K4CS5MHJDcQTGMfHdDK
	tinYcg7ONMw9txEP7sGtp9oO/Qdoo9YyFoIyK1LK1Bt4YmqeBLqSeEj1Mm8kKMr8JgorJmzGzb1
	nuB9ZYzo9GM8vjGipPuR3KjaUE=
X-Received: by 2002:a05:6000:2010:b0:439:b203:7711 with SMTP id ffacd0b85a97d-439da31de13mr25766004f8f.3.1773137170198;
        Tue, 10 Mar 2026 03:06:10 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb29fdsm34564056f8f.16.2026.03.10.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:06:09 -0700 (PDT)
Date: Tue, 10 Mar 2026 11:06:08 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] arm64: dts: freescale: imx95-verdin: Add Ivy carrier
 board
Message-ID: <xghf5wajmzkz3vhi565q5fmclrelczobbvywg7z2tj3gj2rzlq@idn3vyhxxsde>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
 <20260305-verdin-imx95-upstream-frank-li-base-v1-4-823fad02def9@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-4-823fad02def9@toradex.com>

On Thu, Mar 05, 2026 at 06:24:32PM +0100, Ernest Van Hoecke wrote:
> +/ {
> +	aliases {
> +		eeprom1 = &carrier_eeprom;
> +	};
> +
> +	/* AIN1 Voltage w/o AIN1_MODE gpio control */
> +	ain1_voltage_unmanaged: voltage-divider-ain1 {
> +		compatible = "voltage-divider";
> +		#io-channel-cells = <1>;
> +		io-channels = <&ivy_adc1 0>;
> +		full-ohms = <19>;
> +		output-ohms = <1>;
> +	};
> +
> +	/* AIN1 Current w/o AIN1_MODE gpio control */
> +	ain1_current_unmanaged: current-sense-shunt-ain1 {
> +		compatible = "current-sense-shunt";
> +		#io-channel-cells = <0>;
> +		io-channels = <&ivy_adc1 1>;
> +		shunt-resistor-micro-ohms = <100000000>;
> +	};
> +
> +	/* AIN1_MODE - SODIMM 216 */
> +	ain1_mode_mux_ctrl: mux-controller-0 {
> +		compatible = "gpio-mux";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio5>;
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	ain1-voltage {
> +		compatible = "io-channel-mux";
> +		channels = "ain1_voltage", "";
> +		io-channels = <&ain1_voltage_unmanaged 0>;
> +		io-channel-names = "parent";
> +		mux-controls = <&ain1_mode_mux_ctrl>;
> +		settle-time-us = <1000>;
> +	};
> +
> +	ain1-current {
> +		compatible = "io-channel-mux";
> +		channels = "", "ain1_current";
> +		io-channels = <&ain1_current_unmanaged>;
> +		io-channel-names = "parent";
> +		mux-controls = <&ain1_mode_mux_ctrl>;
> +		settle-time-us = <1000>;
> +	};
> +
> +	/* AIN2 Voltage w/o AIN2_MODE gpio control */
> +	ain2_voltage_unmanaged: voltage-divider-ain2 {
> +		compatible = "voltage-divider";
> +		#io-channel-cells = <1>;
> +		io-channels = <&ivy_adc2 0>;
> +		full-ohms = <19>;
> +		output-ohms = <1>;
> +	};
> +
> +	/* AIN2 Current w/o AIN2_MODE gpio control */
> +	ain2_current_unmanaged: current-sense-shunt-ain2 {
> +		compatible = "current-sense-shunt";
> +		#io-channel-cells = <0>;
> +		io-channels = <&ivy_adc2 1>;
> +		shunt-resistor-micro-ohms = <100000000>;
> +	};
> +
> +	/* AIN2_MODE - SODIMM 218 */
> +	ain2_mode_mux_ctrl: mux-controller-1 {
> +		compatible = "gpio-mux";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio6>;
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	ain2-voltage {
> +		compatible = "io-channel-mux";
> +		channels = "ain2_voltage", "";
> +		io-channels = <&ain2_voltage_unmanaged 0>;
> +		io-channel-names = "parent";
> +		mux-controls = <&ain2_mode_mux_ctrl>;
> +		settle-time-us = <1000>;
> +	};
> +
> +	ain2-current {
> +		compatible = "io-channel-mux";
> +		channels = "", "ain2_current";
> +		io-channels = <&ain2_current_unmanaged>;
> +		io-channel-names = "parent";
> +		mux-controls = <&ain2_mode_mux_ctrl>;
> +		settle-time-us = <1000>;
> +	};

Hello Krzysztof,
Hello Frank,

Thanks for your review so far. I noticed that the node order here is
also wrong and not alphanumeric on node name. I will fix some of them,
but for some it could mean that for example, 'ain2_voltage_unmanaged:
voltage-divider-ain2' is far from 'ain2-voltage', which is unfortunate
since they are related. Together with the the current-sense and
mux-controller nodes they form something of a logical group and it seems
undesirable to have them be separated by a long 'leds' node and the
regulator nodes.

Would it be acceptable to keep the "group" together and sort
alphanumerically within it, or is it preferred to sort all nodes
alphanumerically?

Kind regards,
Ernest

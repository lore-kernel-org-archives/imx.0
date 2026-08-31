Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EC03AEF50
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182308; cv=none; b=h8P2VbMkJxGaJxBPQmgA/4ZbiNQ1As2rCTSegXvrm3eKmWCWCFwmiuDhdW2jaL/9tsXebNZ3H4EBQXe834wtzN2sDcPdXVQ5xBg/p8mtBrcIysewn6An26DSk2GwTipz/0H9qu6jmCqxJXsJlID543AGMv7/03Rrm9FNNZ/UK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182308; c=relaxed/simple;
	bh=aDdv3xhJZMkROZKvGOWJmTDkhFVW+RBY74bEI/EmxLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXnXddD5UCzcEYbRbfSZYglfKyNbgkH3v7mS0gDfh+IQ7WaMMuyxPXSXa+EYSNIkOd2S7ox/RbYKU8+eAZPs/1viB7Pz24udIzFIZFwuw+eUt9NtOGdcBKQykCTZcmv/LX+i6O4yTtV/mQGtlxL9emfHupI/9IZLd/nbAMu75OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U26H0vv5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U26H0vv5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4815bce4652so2427194f8f.1
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788182305; x=1788787105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kfqgaWwv9QiwaG4KIBmNHHV67bw4d3U03iBTZ72Dr1k=;
        b=U26H0vv5yUBLnTgvALKIQ2iBVrqmZgSs8X6USQ/F6FPWww3tdXo5zsFIL6mCw5/L4/
         jbO+iBlSCMVTZAzmLldZ0t3Rmyp7sR+vtmikNlBMwd69wW516OtPQNcyEUi6c43o0f2M
         pW5k1YXw0QOL34k4RtYFmHunA1zuF5YhyhOiRgoLiasWTWKTVGxti4EV18xZp1z2QMj6
         QZb5KB95TseQ7PtGt/i8zVNVdnLe7+t8bkn+yz4tm8KDgJPHJ1mwhFnSv+WSU96wuxZd
         p5aWZMD+Ve7jSMy3SXihI1Sr11Q5Vdq1kTP62t12vbOqegwl8fsIMM5f2A4IWUK8J5qY
         3Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788182305; x=1788787105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfqgaWwv9QiwaG4KIBmNHHV67bw4d3U03iBTZ72Dr1k=;
        b=hYsb+8nRiSsGpe0hDKJKbgiq17FIhiQb7IVllbDpLkCs+8ybCO9FyyXanlXbVhkS3r
         skihpBlJBY9XgRTFTQd7leNkXrVScmLYURNjp11AMczOMlXCtzinxzw37pjk8nrVv6+l
         PmjMQPKXSnUdbi8e6dURejCJMYyJmWUuuKV9N/1wqG9PCzjRsOyOXEG6zcz7hTq3CbBv
         lFTBeOMIYgV+W4dvfhPYVkdjTq/+72uDMjcuIQ4HFhNSrn9nWQQHh6YbCwY6s0E8eCY5
         TU0S0p5EOsh49G7Yr2ze456FXrYeIbRxzXugoArlA36MzrWSCGJhcAbC2lykzmblwapI
         qSlQ==
X-Forwarded-Encrypted: i=1; AKwUvByGQOzbL5Vqrww3OG8fQJ1/B89l2unHEd0xtnmLQGaW1sOXyiwWzKY5KBBALqtrCNFL9eo=@lists.linux.dev
X-Gm-Message-State: AFuF++k63cEksf2m3MdHsCS9XXclsN5zJ3j1e1MK30AKQ2pscFPQh3r9
	jo3N9zjxpftvaAEdjwsoIYaz5gGacaNv+CsKx3G+LigjChycexfx8qASNIKnaC69MYA=
X-Gm-Gg: AYBFou03U8f22lzmxLXRmv6zu7Uc7MtfHrky4GP8Wye7cT66mr/VI8nmS9wAn1Nb22D
	PliVb+e1RsUSjIZgP116Q5gOVqRLlvzBwFm2EPzHo4xpQ7r6G1Nq8Xv+02ummKy69QHaFAARAyp
	1fUqxpZcW6qQQUPKocp06XDWTJPc7AdHCgzFIiFw35WNJR8FabRDVc/ZxKbafD4Obk0+aD2uWt8
	5i40wrjNeONB67RHS1RYJo3jjTQSx/zqPyE9Jm0Dc9RkPOlJ19ktvpvOBQzi3ddW5ArTbFcp9ov
	fkkhURLAJNtEXNBXmsLeu0aM1lmKD4YKgwWX8yGkaHvZlCf5s1rBd4g+37IPh14oK1NUn5JA6nM
	PqYxnIrNfxVmF1poIeoEeJu4bpfA30jsRE1SItt1bQVMFDWE7sP7r3aaa52jzGRMiACTk8mtNWl
	nqLXjRRlSyTK7e7tQ3HOIgZOzjnCoF9y7rEChKHy8cz66BnRO2CdASNi9Oi//5we+mKSkJyxAbZ
	ut3ryPS0NmaKVNqNZlzgmnBm0nxLFsE
X-Received: by 2002:a05:6000:454a:b0:482:fb60:2f0 with SMTP id ffacd0b85a97d-482fb60045amr31993922f8f.8.1788182305045;
        Mon, 31 Aug 2026 06:18:25 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab730fsm23770454f8f.8.2026.08.31.06.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:18:24 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:18:19 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
	imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v7 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <apV_G_t1swul34ZB@GLaDOS.station>
References: <cover.1788180142.git.stefano.r@variscite.com>
 <c12693ab258171be75afa6cee783e5c3de21c1fb.1788180142.git.stefano.r@variscite.com>
 <20260831130506.94DB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831130506.94DB41F000E9@smtp.kernel.org>

On Mon, Aug 31, 2026 at 01:05:06PM +0000, sashiko-bot@kernel.org wrote:
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> > new file mode 100644
> > index 0000000000000..ab05de43cc53a
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> 
> [ ... ]
> 
> > +&i2c2 {
> > +	wm8731: audio-codec@1a {
> > +		compatible = "wlf,wm8731";
> > +		reg = <0x1a>;
> > +		#sound-dai-cells = <0>;
> > +		AVDD-supply = <&vgen6_reg>;
> > +		DBVDD-supply = <&vgen6_reg>;
> > +		DCVDD-supply = <&vgen6_reg>;
> > +		HPVDD-supply = <&vgen6_reg>;
> > +		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> 
> [Severity: High]
> Does the codec driver incorrectly bind to IMX7D_AUDIO_MCLK_ROOT_DIV instead of
> the physical SAI1 root clock driving the pin, causing the ASoC driver to read
> an incorrect frequency?

IMX7D_AUDIO_MCLK_ROOT_DIV is intentional here.
The codec MCLK is provided by the dedicated audio MCLK root,
while the SAI1 root clock is configured separately for the SAI interface.
This configuration has also been validated on the hardware.

> 
> > +		clock-names = "mclk";
> > +		assigned-clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
> > +				  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> > +		assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> > +		assigned-clock-rates = <0>, <12288000>;
> > +	};
> > +};
> > +
> > +&sai1 {
> > +	pinctrl-names = "default", "sleep";
> > +	pinctrl-0 = <&pinctrl_sai1>, <&pinctrl_sai1_mclk>;
> > +	pinctrl-1 = <&pinctrl_sai1_sleep>, <&pinctrl_sai1_mclk_sleep>;
> > +	assigned-clocks = <&clks IMX7D_SAI1_ROOT_SRC>,
> > +			  <&clks IMX7D_SAI1_ROOT_CLK>;
> > +	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> > +	assigned-clock-rates = <0>, <36864000>;
> > +	status = "okay";
> > +};
> 
> [Severity: High]
> Is the sai1 node missing the fsl,sai-mclk-direction-output property, leaving
> the codec's MCLK pin undriven?
> 

This is intentional. fsl,sai-mclk-direction-output is optional and
is not required for this hardware configuration.
The SAI1 MCLK pinmux and current clock setup have been validated
on the board without this property.

> 
> > +&i2c1 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default", "gpio";
> > +	pinctrl-0 = <&pinctrl_i2c1>;
> > +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> > +	scl-gpios = <&gpio4 8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	sda-gpios = <&gpio4 9 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	status = "okay";
> > +
> > +	pfuze300: pmic@8 {
> > +		compatible = "fsl,pfuze3000";
> > +		reg = <0x08>;
> > +
> > +		regulators {
> > +			sw1a_reg: sw1a {
> > +				regulator-min-microvolt = <700000>;
> > +				regulator-max-microvolt = <3300000>;
> 
> [Severity: High]
> Is it safe to set regulator-max-microvolt to 3.3V for the VDD_ARM regulator?
> Since this could allow the PMIC to supply up to 3.3V to the core, does this
> exceed the i.MX7Dual hardware absolute maximum tolerances (around 1.3V)?

This is intentional and matches the existing validated board
configuration. The regulator constraints are not used to drive VDD_ARM
to 3.3 V during normal operation.

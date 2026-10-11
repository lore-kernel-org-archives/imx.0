Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9139CCF9
	for <imx@lists.linux.dev>; Sun, 11 Oct 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791754937; cv=none; b=dycPm/03hudP1rYExqD8M6sqjT16m8V3bgYEghIT60e+O9vaSxhWL+sCbaPM0ffpDHZhuEqCWLmc7tmuRFMv4dR73OVq3U07Avsi+sq2ph6qE09+sE8Frj+MteqkItSVwF0g1oMR/v/acw+NAIJ0VAWc5dCOufgUjc73NX6mJTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791754937; c=relaxed/simple;
	bh=k43IbaF6TdU+8O/x/tfa/3tzN+/gA6OynfUGsXVIY2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPN8HcnJ8evK0SZ715TaDdH8oiRdOC8tftzTqEPeKcdy1OToPjzeDq2cp0LGJ1uhsno65wwxwU1rLueysT7xew7N9/fbfd/Nm/6APr4QIDCRcuatQA2jdEuDTjfcVbgWy6XAvM0MLQgQiX66h2ay4KF2VzWoJSFLcIkR82mVW74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyIKFx3a; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyIKFx3a"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so10000175e9.3
        for <imx@lists.linux.dev>; Sun, 11 Oct 2026 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791754933; x=1792359733; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5CIZCQrM8vHqdGBQkpWsSJmLyDFs444j3c0Qt3YBk8=;
        b=EyIKFx3aFfREhkHi7yfaoAPG4v4UbgNiTKl8NrKH+vHdxk3OgmP+xNllNNmrmukUsB
         HoL/FWgVKVcexXRSAHzeROYxQGB+Tb0R7ia77pwb256MqOwT1kJSNHzaLWakh9oKFd3E
         KWr0BFKjRkeIy2LcNHmb7M02tYPgfvfC15yqNo5xhAmRYmgg22sLJGrl/UjT98+Vrlw+
         sCNqMK6MXAs3UipL+USsH2lHHMr4AXijnHa4eUL2VDXVO+s+HBWIjY0hgnu2UNQNGaRH
         SDWOZwVfVxg8k7JbvzewUq9lND8JnmSldHBJLMJGURjhumguGkhCsnBg0Cete9mnbTEm
         SFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791754933; x=1792359733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5CIZCQrM8vHqdGBQkpWsSJmLyDFs444j3c0Qt3YBk8=;
        b=JklI03DZn8l9/kahwk2ANOlKzyK57OxWPquBt2xwq76+z8cSNhWvx0ADPzbeAaUZ0c
         o/zqHz2zR5KsPm2TXds1zzJui1QpdXTIX+keIoQcJX8m4ve+V+XmN5g9rUWXKY83imUx
         aO9Wu4fUzbfJOiPxcEOdYqrSbWglofJt5Vo1m+RQwYIXCHh4lL8BB1RdPi0IcNafYFaH
         BwCScSz3Ip2b4W18TbBDk7SCEeK4cqlPuQaLeii6mvquVBueVQmLPUg6P2tr+VMgI9xS
         Qnct1fQHn/fPD5yUm7C5i5SmHCfLko5ioc7TyAAeOasdS4Vex7DCiZPpWYKPoydWL9J3
         Hnug==
X-Forwarded-Encrypted: i=1; AKwUvBwon+JkLLKNhr8iJAH80FaVYW0r+g72bQelPlNuyPhXuGRiMsNKHswnnsjffg3GmmTQhWU=@lists.linux.dev
X-Gm-Message-State: AFq9FYL4p1rLznphH2VRUJ3O0J8//xHD89D8gMuoVwiK5PCrFHmyeAha
	RdrPIRZ7LO5YZyou/24jd9YdhjuS7j3lYo3rSKXD3wj/gfAmMVMXluSG
X-Gm-Gg: AYBFou33Hpf3RcFn9tEjszO9BN1ba6Sin80TcwvY8iHTl+lwlgT0rCmM/2DH3LB3mUn
	44lro7v3/6NjEpZxjl+AY5mI3IMkAOD2Nvsx22GGzUUGjxEkwXREegvAtkV5HBXO2Nh0d9kVyOR
	9A8I1sXIc321HJQahtoWwV/z2fpzdzeCtCCaY2j+RBb46eCnvFdxI4WogEoOD9HT7nnWdTbC6tq
	uSULI7Dz9BU0sJ2RxZmw+nCqOu6iWJPmDVY8f88wQ0UBgaBDkwxH4inYr8mLkaLmmqd+oJS8eXX
	7OqLsq+EyHfhQVZR6i1zQsf87IQ3E3eWm3tQwMCtLV1QB3pe7qqAJ7cPafhvjwEG3gCPdxOA9BT
	Hd99ud0wPcHCkYDKg5DThF4s3pq/0eYU73kjTpJKYYMAkp1NA+rwGpca0buZGqqrjx/fTXJ8Wp+
	beVzLM7w0nW50r7Q0U0bXOqX/eO+qsjkKIt/R1vxy18MhnHHo8EB2wndNjkpRrqsHQEN9Xp94sW
	F7y22g9F9ZjmNkCz2IZKiNvlplBN60BF9+TK3YiAdprGRMTstPXqCdTW356nLdsA5FOuWR9F8Jx
	bhOF3kvY2qoKvepXgpIjo4zI1e7+
X-Received: by 2002:a05:600c:8184:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a18e4d854cmr109941355e9.31.1791754932570;
        Sun, 11 Oct 2026 14:42:12 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm451871005e9.9.2026.10.11.14.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 14:42:09 -0700 (PDT)
Date: Sun, 11 Oct 2026 23:42:06 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v5 06/13] ARM: dts: imx6ul: Extend VAR-SOM-6UL and add
 DART-6UL files
Message-ID: <aswCrsVs4Z7n864c@Lord-Beerus.station>
References: <cover.1791487179.git.stefano.r@variscite.com>
 <e11cdc950e41b502e5449830d5f6a82568fc043a.1791487179.git.stefano.r@variscite.com>
 <sashiko-outbox-166012@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-166012@kernel.org>

On Fri, Oct 09, 2026 at 07:49:24PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: net: micrel: boolean property assigned integer value <1>
> --
> 
> commit 7e70ac71fa47849af4ee0ecb85b6da2be68dfac5
> Author: Stefano Radaelli <stefano.r@variscite.com>
> 
> ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL files
> 
> Add the DART-6UL module description and wrappers for i.MX6UL,
> i.MX6ULL and i.MX6ULZ, plus an i.MX6ULZ wrapper for VAR-SOM-6UL.
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
> > new file mode 100644
> > index 0000000000000..f7190f6d50b59
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
> 
> [ ... ]
> 
> > +&fec1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
> > +	phy-mode = "rmii";
> > +	phy-handle = <&ethphy0>;
> > +	status = "okay";
> > +
> > +	mdio {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethphy0: ethernet-phy@1 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <1>;
> > +			clocks = <&rmii_ref_clk>;
> > +			clock-names = "rmii-ref";
> > +			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <10000>;
> > +			reset-deassert-us = <100000>;
> > +			micrel,rmii-reference-clock-select-25-mhz = <1>;
> 
> [Severity: Low]
> Does this assignment cause a dtbs_check schema violation?
> 
> The micrel,rmii-reference-clock-select-25-mhz property is defined as a boolean
> in the dt-binding schema. Assigning it an integer value like <1> will trigger
> a warning during Device Tree compile validation.
> 
> Could this be specified simply by its presence without an assigned value,
> such as: micrel,rmii-reference-clock-select-25-mhz; ?

This is addressed by the preceding patches in this series.
Patch 05/13 changes this property from a boolean to enum: [1]
to satisfy the dt-schema unit checks for the -mhz suffix.
Patch 04/13 updates the driver to use of_property_present(),
accepting both the existing empty form and the numeric form
without changing the clock selection.

The <1> assignment here is intentional and matches the updated
binding.

Stefano

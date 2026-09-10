Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B583A4F4A
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058378; cv=none; b=dwXp+4DZ3jVNzoAjlYboVuFUlpbxexvthaN9X9oBvt0DGfqLZiuomBl0N6IyvA11PKTUG4eAoyqtCChk3uOX3+Y3gYuNS+waFYp4Cs+g4HI9p11eyqSDRiCJOgZUKZFmA0dnQXa7TC3TFnRwArDp05a9K1LahITTfORwSgmQlUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058378; c=relaxed/simple;
	bh=6eFXZYIyBvltXsSnzrJaFa99BMULASGYR60Dhesc568=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+AdZM0ECLgIazF55Y2mfJWxyCRUwXme/d2LMKbB9DP+rNsil5DYkAHh5T/gDcDl3cjLecZk0RnSTM8Gp9zA2hjKA06mi1VV7RpyCdjQNmrKP3YjOVjh998EWNGhftJqFOK1MLWKWrgs3/bTfFn6b4T9nKEknI2rkAgWrRknQaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=reFRaDr2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="reFRaDr2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so440715e9.2
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789058374; x=1789663174; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGCi7JGudYz4ih1yv+RTXMGqMbQdRYeEJWnczslWMzw=;
        b=reFRaDr2GNC/KC5QxH+0bzm17ByrhxGeBammFo4faRp2m4cz8znC68q39TEYP42VUk
         jt+pTO3AAVnUYji9NvWhGBgSA9v/3OojnzfHZnjvqCM7iLDWj+T0x4AO3sn9lZ2YzyXk
         LVPSvZK4zs727nRKGFLubPYakjz6FV8aILtmhi+p6UzGwPqTHJmjZ9JgiZQ2aopwIb7B
         CdkY5358LQcCdFQ5ujHaKxr9Oyv4doIsG852CoOljoqGeEb2l02Ya9cYSWipFES/Bu5m
         RWN44ks4qfMtEheWwEV38/1EXBb8EzDt9dngQiYj/QlQ8XJZRklV6efN8nXRp8jhFMVv
         ok8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058374; x=1789663174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGCi7JGudYz4ih1yv+RTXMGqMbQdRYeEJWnczslWMzw=;
        b=iCH8E87VRLq8SYNHTCwWH5rdehLvWxUa3kFlKr1Pobpji8hLn/akTYBXz7+Qn4YoXd
         AkVMCZYipzZd2apIfMmStFJHO+WcDEXMwm0BaLoFKE1m3Km7WDFWw7UUOM1CA6d6KPyq
         yw/0q4VzMTAJlnS1acqsNLaVHmT5cTWRbv5lwUE0FEWphrWSn6DHd1/NTSDzqBRvqgOn
         rOxrPAkcCNrIEpShQTuu1L8yVI140w9eH4A0A0jQvF+EflGThoOvvjYsdtSnPnFQ4Fw9
         NH25Yp+m28dYmm7tT/hrf4bvxcy04ipQlfl2MugQLjaXkY8VrK2NQSM2jqIQ9l/i1gLI
         YdMg==
X-Forwarded-Encrypted: i=1; AKwUvBwr+qx/etz9FkskJvl4XudmtirREXnmw6k4J8jRa0c0iPp07qeJva3a/yqsYziW0+3UeN4=@lists.linux.dev
X-Gm-Message-State: AFuF++lndMBRbW6mWOl1L+m/GpjnqIu7Hlc1RLc+pReeDtAATBAyjIMy
	jaJnBwUrdcv9/5va4cr1lGFvj4diTQ99l16qFNgOP6rYOsoUpMV+pvgp
X-Gm-Gg: AYBFou1Q/wsAGUQ7kzVzw8qABeQl+rCPpSaPj0Py8Ntm6YwopO3jzwRYZpk1yhTClyU
	okmYVfwvTYhEIGI6I4D3Pim4/GpK1Y0fE0on9lP7n5mx8943luBBYUWGblcMJDGIdRlWYDRG4dI
	TDEg0s4+zVetQubTWphcKl9NCM+XwqwoZtlrUb4l/nlm7p03MYBFaEYn3AUhlOlSzoKwW1z9Hd4
	SBsyGJrzOv8m94we/7h+TJ60jRUPdmrCeualsXSkWFiX/eqeAasp7GlzYxbHHk6QJL4xAGH14Ns
	tljptMMaAyvtwo2GuN2rsmlwLM5jUSi+1A3/LbHVA2GHk1U/AdgXA2EbVOH953f9W8ibT18aS7c
	GjPrai4rJ5tB9pLncuT/stqd0p1vC74JWyzyRCfr7cagAiA15U6EWvVzakc0wH3g2hSg+0gXNU+
	7P2ev9WfjoSJyZsNRR/Sv05BtQA30pMyior9AGL23bGLew5wTpmaDwXuSbDw0D8nB2gkQjzjsUv
	Ixohi2M/wHpVD3GwyFtnvVrsiUylgZsjWWZMo17eAVFJdxRMtpUblA4cf5QsxssEliwsH+uqg==
X-Received: by 2002:a05:600c:6383:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49cf820507cmr379154095e9.5.1789058373630;
        Thu, 10 Sep 2026 09:39:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm155013825e9.3.2026.09.10.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:39:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 18:39:30 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqLaLmz7n31P6igy@SMW015318>

Hi Frank,

Thanks for reviewing this so quickly.

On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Toradex boards route the sideband signals of their 24-pin camera
> > connectors to different GPIO controllers. Camera overlays which name
> > those controllers directly must therefore be duplicated for each host
> > board.
> >
> > Describe reset, power-down, detection and power-control as
> > connector-local GPIO functions. This lets an accessory overlay remain
> > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > remain described separately because the GPIO nexus does not abstract
> > them.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > new file mode 100644
> > index 000000000000..06e6836e1aa6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > +
> > +title: Toradex camera connector GPIO nexus
> > +
> > +maintainers:
> > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > +
> > +description: |
> > +  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
> > +  clock, power, and sideband GPIO signals. This binding describes the sideband
> > +  signals as a GPIO nexus. The other connector resources remain described by
> > +  the surrounding board device tree.
> > +
> > +  The nexus exposes connector-local GPIO function numbers to camera overlays
> > +  and maps the functions wired by a carrier board to their GPIO controllers.
> > +  GPIO specifiers contain a function number followed by standard GPIO flags.
> > +  A board may omit functions which it does not wire.
> > +
> > +  The function numbers are:
> > +    - 0: Camera reset, connector pin 11
> > +    - 1: Camera power-down, connector pin 22
> > +    - 2: Camera identification, connector pin 23
> > +    - 3: Camera power control, connector pin 24
> > +
> > +properties:
> > +  compatible:
> > +    const: toradex,camera-connector
> 
> Name is too generally, suggest use board name, we got similar comments at
> 
> https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.nxp.com/

I saw that and it made me reconsider this name.

However, I believe that in our case it is specific enough. It is really
the same on all our carrier boards, and Toradex specific. It's also only
for cameras, which is more defined than just "io". Curious to see if
others agree or if we should come up with a name for this.
 
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-map:
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  gpio-map-mask:
> > +    items:
> > +      - const: 0xffffffff
> 
> are you sure need full 32bit, only 4 pin, maybe 0xf should enough?
> 

Indeed we could reduce the size of the mask, but I don't really see the
value in it. Isn't it good that a user can pass through the full GPIO?

> > +      - const: 0
> > +
> > +  gpio-map-pass-thru:
> > +    items:
> > +      - const: 0
> > +      - const: 0xffffffff
> > +
> 
> missed
> 	gpio-controller: true
> 

This is one thing I didn't fully understand about the GPIO nexus
concept, why would we need this gpio-controller flag? Isn't the gpio
controller behind the nexus? The nexus just maps onto it. The actual
controller would be on the SoC or an expander.

> > +required:
> > +  - compatible
> > +  - "#gpio-cells"
> > +  - gpio-map
> > +  - gpio-map-mask
> > +  - gpio-map-pass-thru
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    camera-connector {
> > +        compatible = "toradex,camera-connector";
> > +        #gpio-cells = <2>;
> > +        /*
> > +         * 0: Camera reset, connector pin 11
> > +         * 1: Camera power-down, connector pin 22
> > +         * 2: Camera identification, connector pin 23
> > +         * 3: Camera power control, connector pin 24
> > +         */
> > +        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> > +                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
> > +                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
> > +                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
> > +        gpio-map-mask = <0xffffffff 0x0>;
> > +        gpio-map-pass-thru = <0x0 0xffffffff>;
> > +    };
> > +
> > +    gpio1: gpio-controller {
> > +        #gpio-cells = <2>;
> > +        gpio-controller;
> > +    };
> 
> Need't gpio-controller.
> 
> Frank
> 

This ties in to my same confusion above, could you explain why or point
me to a relevant example/docs?

Thanks and kind regards,
Ernest

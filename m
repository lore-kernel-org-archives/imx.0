Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18899153BF0
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 12:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973740; cv=none; b=O4tZSG+P5zNX75CuleQHQl9gfPCWnenZTbzjOGvA+rlyYwwTS3IHXLgM1hhgDHI5lckW54RXxLq7JLvGBToLK0mUeCdaLp7I+R8MBQWGrA0sLJy0ZqMVLUi6LNAPQXvLerLWwtDzY66WIhiTcViTn3e3uQqUg1A6ySrc/1Uq7ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973740; c=relaxed/simple;
	bh=o0Zz1fevuySLS+ArAprXIPomY4FCfyicPzisqwGrjU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8J4VvjANreRDdhjXbG7snPCMR/O62+QOUGIDCI1cg2Tz47PPUd+aJZ+DwXIXh3af8uqoW7Cr+448oYn0XnM7mEd46wO/Cpc2/BoBYu/80AfG5mPAYiLaLBYz9TYz78xlSIMS1MGr+yED27vBXmc/jCh/mB56bNAV1OUfo+38us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m09POQtH; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m09POQtH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so132242a12.1
        for <imx@lists.linux.dev>; Fri, 21 Jun 2024 05:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718973735; x=1719578535; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oi0LcVAmr1WeeM46g7NJXJsrRLdwaPetNc18z6AYroU=;
        b=m09POQtHctVkCbd7zgfw5NoWlp99vSWlHX8bGnC3SElAuNzptdLHrtI/bASeoZ6zhm
         gHVA2dwIF28pInhwze4/PgPxDy37AcRIEIawHcWRBc4F6P8wYdqkgCH9JAcOFmrWiYLC
         NPFUMJMXu1fKguKfgB8FxZu+Ju2hFBvyV0Q9K6TftxJhv6cc+zf963uHCxL5wyHSxYqi
         x+/tQ426koMsjdE5YE3CooXXgGHAFVAG1KM0tibUI587VqsfA5wyv2MpLwu80bg20dtx
         xNauckf1GHrRcWlckCx4LOxHnPTjQUeQM7eynfO/aWmuwrLyggAUj3mpZtWI2LtRBIMt
         iTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718973735; x=1719578535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi0LcVAmr1WeeM46g7NJXJsrRLdwaPetNc18z6AYroU=;
        b=IfVTHGiV+G9smuNbwaLYfgdxn5etfcoDApcEgfUI43kKGhTQEYObM+aPJub4hRMjsF
         Dej/2b0vLqwBmgxuNndOSv0eUCOb3DSzGXMrzFio15bx2NeIbjO4U6GaXu7MLGPrttCQ
         6t1ld0m6h4E7aMra/NIUN/A/N0RNHs2VGEEuafZKNgsxV0PDfqR04mZ3J/YiTg6IHpjp
         m0TvNQWVx28+7kg3TfEGt5esBO7WIXbn0hzRNgz+3zQCKfFl0hYR7BZLu9wqZ0K06YUR
         dR9vjMGV4csvo4czbjXRy9zJ0VgtCxlwi4jkPoAeq7kmFhlvzDMVcOy6n+iuOmeJhr+F
         u2Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWf2TUg/d2EX/1X6pYXB29gNA5iG57RLeBAiVLkLP3k0+lMfaTGaBvLol3WgX0yWamMFYZ0CkT1NEb8yDR+hd4smONj
X-Gm-Message-State: AOJu0Ywpx2af3p6W6YFgH/FzV7RKq80MjxSnPUjLj+TChcQs53EVrki3
	SGUkomqhggisQKaF0WRwb/Igf1YHEW+pg/XOWsx/M+i7TzNWHsLg
X-Google-Smtp-Source: AGHT+IHREP6VjuCYeod3fdem5l5ceB2HMxw0B8mnfswHnwlQuq+6rPxhUfpLpntKlXu1IPn/nuphXA==
X-Received: by 2002:a50:aa9b:0:b0:57c:c171:2fb6 with SMTP id 4fb4d7f45d1cf-57d069c3a10mr6199253a12.1.1718973734850;
        Fri, 21 Jun 2024 05:42:14 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3048ba0dsm920306a12.54.2024.06.21.05.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 05:42:14 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:42:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: fsl-dspi: Convert to yaml format
Message-ID: <20240621124211.pueymngpq5luokvj@skbuf>
References: <20240620-ls_qspi-v3-0-1a2afcf417e4@nxp.com>
 <20240620-ls_qspi-v3-2-1a2afcf417e4@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620-ls_qspi-v3-2-1a2afcf417e4@nxp.com>

On Thu, Jun 20, 2024 at 12:58:28PM -0400, Frank Li wrote:
> Convert dt-binding spi-fsl-dspi.txt to yaml format.
> 
> Addtional changes during convert:
> - compatible string "fsl,ls1028a-dspi" can be followed by
> fsl,ls1021a-v1.0-dspi.
> - Change "dspi0@4002c000" to "spi@4002c000" in example.
> - Reorder properties in example.
> - Use GIC include in example.
> - Remove fsl,spi-cs-sck-delay and fsl,spi-sck-cs-delay by use common SPI
> property.
> - Use compatible string 'jedec,spi-nor' in example.
> - Split peripheral part to fsl,spi-dspi-peripheral-props.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> ---
> Use part of Vladimir Oltean's work at
> https://lore.kernel.org/linux-spi/20221111224651.577729-1-vladimir.oltean@nxp.com/

Hm, you took part of that but gave no attribution? The portion below ---
is also discarded when the patch is applied, so even the link is lost,
FYI.

> ---
>  .../devicetree/bindings/spi/fsl,dspi.yaml          | 115 +++++++++++++++++++++
>  .../spi/fsl,spi-dspi-peripheral-props.yaml         |  28 +++++

For consistency, could you name this fsl,dspi-peripheral-props.yaml?

>  .../devicetree/bindings/spi/spi-fsl-dspi.txt       |  65 ------------
>  .../bindings/spi/spi-peripheral-props.yaml         |   1 +

No MAINTAINERS change for the schema path? There was a discussion with
Krzysztof in the old thread.

>  4 files changed, 144 insertions(+), 65 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
> new file mode 100644
> index 0000000000000..924ba19aea017
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Freescale DSPI controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,vf610-dspi
> +          - fsl,ls1021a-v1.0-dspi
> +          - fsl,ls1012a-dspi
> +          - fsl,ls1028a-dspi
> +          - fsl,ls1043a-dspi
> +          - fsl,ls1046a-dspi
> +          - fsl,ls1088a-dspi
> +          - fsl,ls2080a-dspi
> +          - fsl,ls2085a-dspi
> +          - fsl,lx2160a-dspi
> +      - items:
> +          - enum:
> +              - fsl,ls1012a-dspi
> +              - fsl,ls1028a-dspi
> +              - fsl,ls1043a-dspi
> +              - fsl,ls1046a-dspi
> +              - fsl,ls1088a-dspi
> +          - const: fsl,ls1021a-v1.0-dspi
> +      - items:
> +          - const: fsl,ls2080a-dspi
> +          - const: fsl,ls2085a-dspi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: dspi
> +
> +  pinctrl-0: true
> +
> +  pinctrl-names:
> +    items:
> +      - const: default

I don't think that pinctrl properties need to be specified in the
schema. Somehow, I think dt-schema applies
dtschema/schemas/pinctrl/pinctrl-consumer.yaml by default every time.

> +
> +  spi-num-chipselects:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: the number of the chipselect signals.

Worth mentioning that this is about _native_ chip select signals.
cs-gpios don't count against this number.

> +
> +  big-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If present the dspi device's registers are implemented
> +      in big endian mode.

I'm not sure that this needs an explanation, it is an absolutely generic
property with a universal meaning.

> +
> +  bus-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: the slave chip chipselect signal number.

In fact, no, this is not a chip select number, the old documentation is
wrong. It just gets assigned to the struct spi_controller :: bus_num.
In my last submitted version I wrote "SoC-specific identifier for the
SPI controller", that seems perfectly adequate.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - pinctrl-0
> +  - pinctrl-names

interrupts and pinctrl are not required.

> +  - spi-num-chipselects
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/vf610-clock.h>
> +
> +    spi@4002c000 {
> +        compatible = "fsl,vf610-dspi";
> +        reg = <0x4002c000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks VF610_CLK_DSPI0>;
> +        clock-names = "dspi";
> +        spi-num-chipselects = <5>;
> +        bus-num = <0>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_dspi0_1>;
> +        big-endian;
> +
> +        flash@0 {
> +                compatible = "jedec,spi-nor";
> +                reg = <0>;
> +                spi-max-frequency = <16000000>;
> +                spi-cpol;
> +                spi-cpha;
> +                spi-cs-setup-delay-ns = <100>;
> +                spi-cs-hold-delay-ns = <50>;
> +        };
> +    };
> +

Please remove newline at end of file.

Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B728417BB35
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734949593; cv=none; b=klNM4wDlE0ckIvmP+R12fO7xgF/sAY36xLqwddSyOjYbyusije3mK+LQ/+PsRqIMIch/gc9WMS4F/PKAomhT0KOldFyOZbuiqvFu8Zx5chKy5fpFFIyfAdFJZqenrQuUquuCjAs70ZEO0N3PLSjWfKlDFc+m04JJAKGm8aAfu6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734949593; c=relaxed/simple;
	bh=yy9vwofEHwzeRUUbWkxcR9Ir6bzF7Swdhos4k+sO4ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEtBWzHl9unELc8ZaSlCD/HiMEHjDeAwnRSA+bvNE1Tj4j/S2yR/tqGaEdbSgnVLuuJrx2MnYW+DqG3NEk5fwUrK/2jZ/iEkl68Z0DuhlTJ+2NJTujXCkObVau+NZ/M6xn2QGAQr5teQrdIlYdnuVwrkp8i0vSy1mE16GQ1f4fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMINMziy; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMINMziy"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso4475332e87.2
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 02:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734949590; x=1735554390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpcAPRrti2Mspwvvh0HkUfdkgM+x6sKmtKugtmBINFQ=;
        b=sMINMziyBdG3BVMlL237vkDokJk3xqu4gCs6dgInWxI/+2nvsKgqQ0+6Z9+F1zGw46
         YPuohq9yJeFqcK1i7Y3uUcDH7I1uxsS8kq+Tzxuar8/DSyDq92uX50gxCDRBGTwYC5BX
         ZCM90J3JWPLliWT3JHZNHb6MF+VVpoTJlCOi9/6fvSuRVAG2riBWUC91CgEWge3qYqog
         qaaVCcB2LbN59rEXQ/pwcgzpkiIUkcd/OU1CU5Rc8r8Du902oAQ5015YdstjjxaxmaPM
         IP9VRPeF1LLGyL6SFj1wRPvqdvYr8DMnuTFPy9gbBxh696b0lZolHOqPL3Kos+w2/MX3
         S9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734949590; x=1735554390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpcAPRrti2Mspwvvh0HkUfdkgM+x6sKmtKugtmBINFQ=;
        b=bPpQyQ8euHdCUfe7o/+49Lj6ozf61Z7imRWz1YoTwpzobmmhU3cSK2pkFoiIscrff0
         d3Z+0uypfav0H61SJWaDJ5/MpbYRTm+HzckDb3qwUX7diOOty/Q+RKuFJ5vGa3V72iUX
         u0kluLqeznnTuX6oZkF4+Ym66K3q2FGJpYnM7XoEjhXBo4VDQ/VpdcwpgHFgZs1EKlnu
         J7Aruw3tD9EkXOjMdKQiqcpV2Ka4tvMJyio2Sj+zljnmST8Fjg/UVWY1UL6iymoVY2Gc
         xFlqHVZF9oAAJdzGQYrtd7OmDL8rb3DrP/mB9t8RTNHuQ7MqUbg79hfR2ql+ymxaPuRB
         5S4w==
X-Forwarded-Encrypted: i=1; AJvYcCWPc88NvqSJiow+DWZ3Pb8IpQPDO+Emv74FISA17Ab19qgSXwk7zyFc0ju5OEwcroOL+nI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBh1Z9o8di8q9IgxvXwYqjRltzEoYV+nGxOQTeK9+UElP+i84D
	EB/uGzKT46hHdOi5ynCXJohTuNG/UyFVFpSlAQnbRq+E5GN1eox9GAJVEBAt1tE=
X-Gm-Gg: ASbGncv7hJUeFu0aamdxSuRSgx9TTAgFA3Hat8FU6aHl5U/v8DctTJAQltoWK6U8kvn
	DJ3kZF1bOd2sHcZaI40oKOHFAMrKsOELex7pNg0QPgXB20JCUNEpN+lWa4HXvumOLoT41u7RSMJ
	OKd0csXoI1OsjucHmemKsffXFuDG/A45xzqvejCCklKcpTYwPYnu6+M0uxNy1h2q0yaEujjOEwX
	stnJ1hbL8z3qFfGFEGIaI86xhrVBirkJdaEglT+fHQrmxr5JnR7u8UePQ4l64/zXei1erX/c18/
	hhstqddCpHVwIhUYg09LIRGRZnlhFneuHy0s
X-Google-Smtp-Source: AGHT+IFbBpruzFpAgIIU0n0/jwU07GmTaDXBwkrAj3El2zSPjw4bqzUyTtJuARVLHLA0cBnGaJX8lw==
X-Received: by 2002:a05:6512:1044:b0:542:218a:71a with SMTP id 2adb3069b0e04-5422953ac6bmr3140370e87.26.1734949589912;
        Mon, 23 Dec 2024 02:26:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5efbsm1241435e87.39.2024.12.23.02.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:26:29 -0800 (PST)
Date: Mon, 23 Dec 2024 12:26:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
	u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Message-ID: <kpem2w4wu7ywc5pvbk3ls5hsyttrwcylomzfh567ejlxkymeqd@cujrbfxgrntc>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-4-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-4-victor.liu@nxp.com>

On Mon, Dec 23, 2024 at 02:41:31PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing units
> that operate in a display clock domain.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Drop DT alias documentations and add instance numbers to compatible strings.
>   (Rob)
> 
> v6:
> * No change.
> 
> v5:
> * Document aliases.  Drop Rob's previous R-b tag. (Maxime)
> 
> v4:
> * Collect Rob's R-b tag.
> 
> v3:
> * No change.
> 
> v2:
> * Drop fsl,dc-*-id DT properties. (Krzysztof)
> * Drop port property. (Krzysztof)
> * Fix register range sizes in example.
> 
>  .../imx/fsl,imx8qxp-dc-display-engine0.yaml   | 235 ++++++++++++++++++
>  1 file changed, 235 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> new file mode 100644
> index 000000000000..60d1e0a4a5dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> @@ -0,0 +1,235 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qxp Display Controller Display Engine
> +
> +description:
> +  All Processing Units that operate in a display clock domain. Pixel pipeline
> +  is driven by a video timing and cannot be stalled. Implements all display
> +  specific processing.
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qxp-dc-display-engine0
> +      - fsl,imx8qxp-dc-display-engine1

Is there actual difference between engines 0 and 1? If there is none,
why are you artificially adding one here?

> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: cfg
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: shdload
> +      - const: framecomplete
> +      - const: seqcomplete
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^dither@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-dither0
> +          - fsl,imx8qxp-dc-dither1
> +
> +  "^framegen@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-framegen0
> +          - fsl,imx8qxp-dc-framegen1
> +
> +  "^gammacor@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-gammacor0
> +          - fsl,imx8qxp-dc-gammacor1
> +
> +  "^matrix@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-matrix0
> +          - fsl,imx8qxp-dc-matrix1
> +
> +  "^signature@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-signature0
> +          - fsl,imx8qxp-dc-signature1
> +
> +  "^tcon@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - fsl,imx8qxp-dc-tcon0
> +          - fsl,imx8qxp-dc-tcon1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qxp-dc-display-engine0
> +    then:
> +      patternProperties:
> +        "^dither@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-dither0
> +
> +        "^framegen@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-framegen0
> +
> +        "^gammacor@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-gammacor0
> +
> +        "^matrix@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-matrix0
> +
> +        "^signature@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-signature0
> +
> +        "^tcon@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-tcon0
> +    else:
> +      patternProperties:
> +        "^dither@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-dither1
> +
> +        "^framegen@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-framegen1
> +
> +        "^gammacor@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-gammacor1
> +
> +        "^matrix@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-matrix1
> +
> +        "^signature@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-signature1
> +
> +        "^tcon@[0-9a-f]+$":
> +          properties:
> +            compatible:
> +              const: fsl,imx8qxp-dc-tcon1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    display-engine@5618b400 {
> +        compatible = "fsl,imx8qxp-dc-display-engine0";
> +        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
> +        reg-names = "top", "cfg";
> +        interrupt-parent = <&dc0_intc>;
> +        interrupts = <15>, <16>, <17>;
> +        interrupt-names = "shdload", "framecomplete", "seqcomplete";
> +        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        framegen@5618b800 {
> +            compatible = "fsl,imx8qxp-dc-framegen0";
> +            reg = <0x5618b800 0x98>;
> +            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
> +            interrupt-parent = <&dc0_intc>;
> +            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
> +            interrupt-names = "int0", "int1", "int2", "int3",
> +                              "primsync_on", "primsync_off",
> +                              "secsync_on", "secsync_off";
> +        };
> +
> +        tcon@5618c800 {
> +            compatible = "fsl,imx8qxp-dc-tcon0";
> +            reg = <0x5618c800 0x588>;
> +
> +            port {
> +                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

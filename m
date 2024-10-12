Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0209F1482E9
	for <imx@lists.linux.dev>; Sat, 12 Oct 2024 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728721808; cv=none; b=T2xoqEIdg92a6MLdIsRfTQvLF7PDfnI9rV+1et2bIsEMe1qooP3sP7bONLndSAkTtjNpBwOLvUrgNMEsTi4klQSyVHJITk4xarLe+S0jrdf3oGBnflKbtRFED/qbhETdFdTKzQ1jIQ/iXVAsAOSO95NidhQZIsLdP8wHjj7mFfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728721808; c=relaxed/simple;
	bh=ECKjD322h2x/x1D0PQXhbiPVfusYChI9stDd+/nkoOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4zGCzpPLPQ+JjKNOeyg3djynCtoIppAHLQlso5ssOAn7gywNTEV4JN2tqgbbmD2FE/EEHnVIvGHG9Thvbb5U161QJKRNpvvJyT00TwzHo3eNofquAOg3OTIAbkYXZyEIF5eFiSzbjibQMHn5j6v+SJ8rVSaOBejrADBdfcpQJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nN1FaF9p; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nN1FaF9p"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398939d29eso3502011e87.0
        for <imx@lists.linux.dev>; Sat, 12 Oct 2024 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728721804; x=1729326604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MP4KFkmYV5Eq1PrBTBYXNpEp1k4YLWjyfkpnHuTd1Lc=;
        b=nN1FaF9pWZ5lVXls+lgjUKKQsUiIQu4Sua8ZMv/sbrTj0yZVYuvyb52h2S5gTYjzMU
         SgFLVHDldBgONMl7RAdeTaVC1OtIwsnda84eK5b5NIOHqf9Bywis1HDG8ew9euVCYHPy
         ZCT+NVkykTZvPfrs1eWKbmu9lvH/+ssTMWX/FcFClQym9yq9HTEc3sANSJEUpkD0nYiu
         krtY6xC8/gpM10SOwIEmFccCWqlmsr8aJe5xFo+rTK94R8F/AJFB7o7TDORIUFCK2bJ3
         y2Y0fcj7tbmHnjPbDTgs6r6sF3mE26VOdBLCC8GfbfWAGmX8vaI6ZKDfZsieB6JN+UkX
         mklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728721804; x=1729326604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MP4KFkmYV5Eq1PrBTBYXNpEp1k4YLWjyfkpnHuTd1Lc=;
        b=u1hUEpVpci/CbP7oXYonc/w4m5pIyDCUbW+6r8HV4r0Y6o5gubs6f8nBw4lmX2lYIY
         1wsUsvWifbvugXRfM6dhpHOUbURfbpGCQi7CxkCzb7FI2TIME5wwnD0ZaZhHF3Dj20mf
         e06hRhG/PI+MLIPMQqhPFaWu0/4b9VhpW2J7Wbzuqwus+ZGHTfe5ypBgkmWmI0wvwLKj
         h2LMYtcqSNgRzkeBQAmenwPDJnUSmCskUMueluZcH8epmM3Yui8OY2sOGuAwvK6TUs6E
         xy9PfnEHdituaQVlv5XgPOm2+AhM/IibRBUXf/Dgl0y7C7Wd2iLsm8vx3AFUMFGEIUSf
         9ahw==
X-Forwarded-Encrypted: i=1; AJvYcCUPXlwVf53YkHVGUbMVTeizjqQ90JCvY8I/2nAITlA56U8qfzQic9vrItOjbDsEyHumtUU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyOkSfU4MNisxXpghOm9mfGk21e9U6BOn5Hbe0lytVR+NHCiAO
	WD/PNAtr6TkQVOioRCCyoeIMF3W6dFmB77Wyy3pZ12VEgNmi3wGP4sGDBDbgycY=
X-Google-Smtp-Source: AGHT+IHLv5GDCadGxROtRejetHoIpCiA0KJzpQKNcKouYrzzeD7NOgvOAieIJcz/jmNDgwbTZoWugA==
X-Received: by 2002:a05:6512:630d:b0:539:da76:4832 with SMTP id 2adb3069b0e04-539da764c75mr2047352e87.37.1728721803976;
        Sat, 12 Oct 2024 01:30:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ea075c47sm25695e87.209.2024.10.12.01.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 01:30:03 -0700 (PDT)
Date: Sat, 12 Oct 2024 11:30:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de, isaac.scott@ideasonboard.com, 
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
Message-ID: <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012073543.1388069-6-victor.liu@nxp.com>

On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
> Document ITE IT6263 LVDS to HDMI converter.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * Document number of LVDS link data lanes.  (Biju)
> * Simplify ports property by dropping "oneOf".  (Rob)
> 
>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
>  1 file changed, 276 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> new file mode 100644
> index 000000000000..bc2bbec07623
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> @@ -0,0 +1,276 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT6263 LVDS to HDMI converter
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
> +  1.2 and backward compatible with DVI 1.0 specification.
> +
> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
> +
> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
> +  is supported at up to 768KHz.
> +
> +properties:

No LVDS data-mapping support?

> +  compatible:
> +    const: ite,it6263
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: audio master clock
> +
> +  clock-names:
> +    const: mclk
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  ivdd-supply:
> +    description: 1.8V digital logic power
> +
> +  ovdd-supply:
> +    description: 3.3V I/O pin power
> +
> +  txavcc18-supply:
> +    description: 1.8V HDMI analog frontend power
> +
> +  txavcc33-supply:
> +    description: 3.3V HDMI analog frontend power
> +
> +  pvcc1-supply:
> +    description: 1.8V HDMI frontend core PLL power
> +
> +  pvcc2-supply:
> +    description: 1.8V HDMI frontend filter PLL power
> +
> +  avcc-supply:
> +    description: 3.3V LVDS frontend power
> +
> +  anvdd-supply:
> +    description: 1.8V LVDS frontend analog power
> +
> +  apvdd-supply:
> +    description: 1.8V LVDS frontend PLL power
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  ite,lvds-link-num-data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [3, 4, 5]
> +    description: number of data lanes per LVDS link

Please use data-lanes property inside the OF graph.

> +
> +  ite,i2s-audio-fifo-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      enum: [0, 1, 2, 3]
> +    description:
> +      Each array element indicates the pin number of an I2S serial data input
> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.

What does that mean from the board point of view? Routed audio links for
the multichannel audio?

> +
> +  ite,rl-channel-swap-audio-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    uniqueItems: true
> +    items:
> +      enum: [0, 1, 2, 3]
> +    description:
> +      Each array element indicates an audio source whose right channel and left
> +      channel are swapped by this converter. For I2S, the element is the pin
> +      number of an I2S serial data input line. For S/PDIF, the element is always
> +      0.

Why?

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          The first LVDS input link.
> +          In dual-link LVDS mode, this link works together with the second LVDS
> +          input link, and one link receives odd pixels while the other receives
> +          even pixels. Specify the pixels with one of the dual-lvds-odd-pixels
> +          and dual-lvds-even-pixels properties when and only when dual-link LVDS
> +          mode is used.
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +            description: the first sink port for odd pixels
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +            description: the first sink port for even pixels
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: the second LVDS input link
> +
> +        properties:
> +          dual-lvds-even-pixels:
> +            type: boolean
> +            description: the second sink port for even pixels
> +
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +            description: the second sink port for odd pixels
> +
> +        oneOf:
> +          - required: [dual-lvds-even-pixels]
> +          - required: [dual-lvds-odd-pixels]

This still allows one to specify that both ports provide odd pixels. Is
that expected? Also why do you need two properties which specify the
same option.

My suggestion would be to add a single root-level property which
specifies which port provides even pixel data.

> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: video port for the HDMI output
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: sound input port
> +
> +    required:
> +      - port@0
> +      - port@2
> +
> +required:
> +  - compatible
> +  - reg
> +  - ivdd-supply
> +  - ovdd-supply
> +  - txavcc18-supply
> +  - txavcc33-supply
> +  - pvcc1-supply
> +  - pvcc2-supply
> +  - avcc-supply
> +  - anvdd-supply
> +  - apvdd-supply
> +  - ite,lvds-link-num-data-lanes
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* single-link LVDS input */
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hdmi@4c {
> +            compatible = "ite,it6263";
> +            reg = <0x4c>;
> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +            ivdd-supply = <&reg_buck5>;
> +            ovdd-supply = <&reg_vext_3v3>;
> +            txavcc18-supply = <&reg_buck5>;
> +            txavcc33-supply = <&reg_vext_3v3>;
> +            pvcc1-supply = <&reg_buck5>;
> +            pvcc2-supply = <&reg_buck5>;
> +            avcc-supply = <&reg_vext_3v3>;
> +            anvdd-supply = <&reg_buck5>;
> +            apvdd-supply = <&reg_buck5>;
> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    it6263_lvds_link1: endpoint {
> +                        remote-endpoint = <&ldb_lvds_ch0>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +
> +                    it6263_out: endpoint {
> +                        remote-endpoint = <&hdmi_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    /* dual-link LVDS input */
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hdmi@4c {
> +            compatible = "ite,it6263";
> +            reg = <0x4c>;
> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +            ivdd-supply = <&reg_buck5>;
> +            ovdd-supply = <&reg_vext_3v3>;
> +            txavcc18-supply = <&reg_buck5>;
> +            txavcc33-supply = <&reg_vext_3v3>;
> +            pvcc1-supply = <&reg_buck5>;
> +            pvcc2-supply = <&reg_buck5>;
> +            avcc-supply = <&reg_vext_3v3>;
> +            anvdd-supply = <&reg_buck5>;
> +            apvdd-supply = <&reg_buck5>;
> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dual-lvds-odd-pixels;
> +
> +                    it6263_lvds_link1_dual: endpoint {
> +                        remote-endpoint = <&ldb_lvds_ch0>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dual-lvds-even-pixels;
> +
> +                    it6263_lvds_link2_dual: endpoint {
> +                        remote-endpoint = <&ldb_lvds_ch1>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +
> +                    it6263_out_dual: endpoint {
> +                        remote-endpoint = <&hdmi_in>;
> +                    };
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

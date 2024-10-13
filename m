Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A732584037
	for <imx@lists.linux.dev>; Sun, 13 Oct 2024 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728863135; cv=none; b=Ls92uBuBVIBNWul57m34DR9BjEWkfg434L4nSsfsMvl3M3HNCthnDwaSHEUAWNplHjlYbTB4JeQbY35ZMYxRz9gAKoOAct0ZloGObNX5EtXvpvcM0peikB+UFQdZY9kAPdUj4ZHkqlBdlEWvYUwK2MDS9DiCzaLKpTjs5XXBg74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728863135; c=relaxed/simple;
	bh=lYMMnvZ8Bu0JQEN0cvB482Pi2ve2jhQIk6Bmiv932GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAvLb8+t6ePwFNGpbKgfunN9zWe9+EumCGJl9X9/XQwO9EdNVxprKocZw2X0SbFzpVbq5dXVBXnr8KidlyN0dEj9fHD5EjDlEYOoMIUFVu7RihCkSUtI0AU/HW40RO26fzsN2irDkGSgz+P9lNh+BpGw9+6mmtVHk30IVIXF1S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FowLFrlk; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FowLFrlk"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f72c913aso308173e87.1
        for <imx@lists.linux.dev>; Sun, 13 Oct 2024 16:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728863132; x=1729467932; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0uEQbg6yGo7+kPjI/AdYM4NyY7+EeyFP5E+4Yp9UH10=;
        b=FowLFrlkVZLlu7MIAHxGaIS/0Fd7b4YuRr1YMg1gwe7s3sFTto5YwYD6OhLY5fDiC0
         lpP6rCuSPH+GRwoOldEZaiYK/qCo9Jg/fpVkLDimf/zHOm5NEgmK4/6UVlQTZ4udWRpo
         wjuGkGWoZjAxya1Xhr4PF9cNZP+wlcvfGhuX3y0dlEWa33GUsAQZ3ySSrq45DD0GOUv2
         PEm/owWv+AQP7J4vASks8nsDdBOdxVYz9+BuuXfWyF7D7LXlGjreJGUmXz3fNlnr++mx
         M7ROtk0rYiwsKs0Rg9FjWVFXAYh8pvTpDPKEFIB1lcmVUQW2iX/v87e/LZa6gpj4fYRw
         X7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728863132; x=1729467932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uEQbg6yGo7+kPjI/AdYM4NyY7+EeyFP5E+4Yp9UH10=;
        b=L5ZxbsZSLmI+X5zlxkjUFS4RpZDr8Sh7kKSu95J+3JG8kCGzuNPW13idzuzemK8mUJ
         Kf8wuANIM6uX5BNz/OAU8Sj7bbqf+eahv2X1QtTGkXgKX4oxu0c3ZeI0v/nYwy7hJVGI
         FSYnGCjltPAcYlaOZi2aKSawCjCCcclmoktjB2EO0ifkX4t867YE6jVxym15+w+gPBz6
         nLXhEDRSjOeB07e+OELUuKdSQIF+wOS0XIJpCQ4dlQGJULildIJ7QOq1lM74+hsrcADj
         66Zz0O0j4vUI1DfG9NztN2g/RqPiQ7PvSPmKypbv4ENEPuSulT+Ax/+61xCsEW5W9NON
         1x/g==
X-Forwarded-Encrypted: i=1; AJvYcCURkbgG9s8BfeeL8OnGzH23G5gmHigAnUxbtvCnGvJU73H8mQzj/VcMagRwBnQafsHM9pw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUCqsOzNM+/KpRLe7p3ES9CAfUkQIv/FtRzKVFky7LaAXNq56L
	ZWp6azzO21/NuZZW6n2RN/FhKqDwkuZytS+WtP+Akp/LHELcgApb1nM6QvaWqj0=
X-Google-Smtp-Source: AGHT+IESqE0I/sDwnILUU2DWttswhXbLlmOrt3rxN308RsYsmuQyzOQl5d/g1Z8X0i1b89/Qyn9MEw==
X-Received: by 2002:a05:6512:398a:b0:539:e9b4:7ff6 with SMTP id 2adb3069b0e04-539e9b481a7mr1672832e87.45.1728863131680;
        Sun, 13 Oct 2024 16:45:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e2d5adc2sm924421e87.302.2024.10.13.16.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 16:45:31 -0700 (PDT)
Date: Mon, 14 Oct 2024 02:45:29 +0300
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
Message-ID: <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>

On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
> On 10/12/2024, Dmitry Baryshkov wrote:
> > On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
> >> Document ITE IT6263 LVDS to HDMI converter.
> >>
> >> Product link:
> >> https://www.ite.com.tw/en/product/cate1/IT6263
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v2:
> >> * Document number of LVDS link data lanes.  (Biju)
> >> * Simplify ports property by dropping "oneOf".  (Rob)
> >>
> >>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
> >>  1 file changed, 276 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >> new file mode 100644
> >> index 000000000000..bc2bbec07623
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >> @@ -0,0 +1,276 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: ITE IT6263 LVDS to HDMI converter
> >> +
> >> +maintainers:
> >> +  - Liu Ying <victor.liu@nxp.com>
> >> +
> >> +description: |
> >> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
> >> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
> >> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
> >> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
> >> +  1.2 and backward compatible with DVI 1.0 specification.
> >> +
> >> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
> >> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
> >> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
> >> +
> >> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
> >> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
> >> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
> >> +  is supported at up to 768KHz.
> >> +
> >> +properties:
> > 
> > No LVDS data-mapping support?
> 
> It is enough to document number of LVDS link data lanes
> because OS should be able to determine the data-mapping
> by looking at the number and the data-mapping capability
> of the other side of the LVDS link. 

From what I can see, data-mapping is specified on the consumer sink side
of the LVDS link. This means it should go to the bridge's device node.

> 
> > 
> >> +  compatible:
> >> +    const: ite,it6263
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +    description: audio master clock
> >> +
> >> +  clock-names:
> >> +    const: mclk
> >> +
> >> +  reset-gpios:
> >> +    maxItems: 1
> >> +
> >> +  ivdd-supply:
> >> +    description: 1.8V digital logic power
> >> +
> >> +  ovdd-supply:
> >> +    description: 3.3V I/O pin power
> >> +
> >> +  txavcc18-supply:
> >> +    description: 1.8V HDMI analog frontend power
> >> +
> >> +  txavcc33-supply:
> >> +    description: 3.3V HDMI analog frontend power
> >> +
> >> +  pvcc1-supply:
> >> +    description: 1.8V HDMI frontend core PLL power
> >> +
> >> +  pvcc2-supply:
> >> +    description: 1.8V HDMI frontend filter PLL power
> >> +
> >> +  avcc-supply:
> >> +    description: 3.3V LVDS frontend power
> >> +
> >> +  anvdd-supply:
> >> +    description: 1.8V LVDS frontend analog power
> >> +
> >> +  apvdd-supply:
> >> +    description: 1.8V LVDS frontend PLL power
> >> +
> >> +  "#sound-dai-cells":
> >> +    const: 0
> >> +
> >> +  ite,lvds-link-num-data-lanes:
> >> +    $ref: /schemas/types.yaml#/definitions/uint8
> >> +    enum: [3, 4, 5]
> >> +    description: number of data lanes per LVDS link
> > 
> > Please use data-lanes property inside the OF graph.
> 
> In both port@0 and port@1?

Yes

> 
> > 
> >> +
> >> +  ite,i2s-audio-fifo-sources:
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >> +    minItems: 1
> >> +    maxItems: 4
> >> +    items:
> >> +      enum: [0, 1, 2, 3]
> >> +    description:
> >> +      Each array element indicates the pin number of an I2S serial data input
> >> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
> > 
> > What does that mean from the board point of view? Routed audio links for
> > the multichannel audio?
> 
> Yes, also for single channel audio.
> 
> > 
> >> +
> >> +  ite,rl-channel-swap-audio-sources:
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >> +    minItems: 1
> >> +    maxItems: 4
> >> +    uniqueItems: true
> >> +    items:
> >> +      enum: [0, 1, 2, 3]
> >> +    description:
> >> +      Each array element indicates an audio source whose right channel and left
> >> +      channel are swapped by this converter. For I2S, the element is the pin
> >> +      number of an I2S serial data input line. For S/PDIF, the element is always
> >> +      0.
> > 
> > Why?
> 
> Because this converter has the capability to swap right channel
> and left channel and S/PDIF always uses audio source0. 
> 
> > 
> >> +
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port@0:
> >> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >> +        unevaluatedProperties: false
> >> +        description:
> >> +          The first LVDS input link.
> >> +          In dual-link LVDS mode, this link works together with the second LVDS
> >> +          input link, and one link receives odd pixels while the other receives
> >> +          even pixels. Specify the pixels with one of the dual-lvds-odd-pixels
> >> +          and dual-lvds-even-pixels properties when and only when dual-link LVDS
> >> +          mode is used.
> >> +
> >> +        properties:
> >> +          dual-lvds-odd-pixels:
> >> +            type: boolean
> >> +            description: the first sink port for odd pixels
> >> +
> >> +          dual-lvds-even-pixels:
> >> +            type: boolean
> >> +            description: the first sink port for even pixels
> >> +
> >> +      port@1:
> >> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >> +        unevaluatedProperties: false
> >> +        description: the second LVDS input link
> >> +
> >> +        properties:
> >> +          dual-lvds-even-pixels:
> >> +            type: boolean
> >> +            description: the second sink port for even pixels
> >> +
> >> +          dual-lvds-odd-pixels:
> >> +            type: boolean
> >> +            description: the second sink port for odd pixels
> >> +
> >> +        oneOf:
> >> +          - required: [dual-lvds-even-pixels]
> >> +          - required: [dual-lvds-odd-pixels]
> > 
> > This still allows one to specify that both ports provide odd pixels. Is
> > that expected? Also why do you need two properties which specify the
> > same option.
> 
> No, that is not expected. Description for port@0 already mentions
> one link receives odd pixels while the other receives even pixels.

That's not expected, but permitted by the bindings.

> 
> Two options are supported for dual-link LVDS, not the same option:
> 1) LVDS link1(port@0) gets odd pixels
>    and
>    LVDS link2(port@1) gets even pixels.
> 
> 2) LVDS link1(port@0) gets even pixels
>    and
>    LVDS link2(port@1) gets odd pixels.
> That's the reason why each port needs two properties to define
> odd/even pixels.
> 
> > 
> > My suggestion would be to add a single root-level property which
> > specifies which port provides even pixel data.
> 
> That won't work.  The LVDS source side expects the ports of
> the sink side specify dual-lvds-{odd,even}-pixels properties.

I didn't notice that these properties are already defined.

As these properties are common between several schema files, please
extract them to a common schema file (like lvds.yaml).

> 
> > 
> >> +
> >> +      port@2:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: video port for the HDMI output
> >> +
> >> +      port@3:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: sound input port
> >> +
> >> +    required:
> >> +      - port@0
> >> +      - port@2
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - ivdd-supply
> >> +  - ovdd-supply
> >> +  - txavcc18-supply
> >> +  - txavcc33-supply
> >> +  - pvcc1-supply
> >> +  - pvcc2-supply
> >> +  - avcc-supply
> >> +  - anvdd-supply
> >> +  - apvdd-supply
> >> +  - ite,lvds-link-num-data-lanes
> >> +  - ports
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    /* single-link LVDS input */
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +
> >> +    i2c {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +
> >> +        hdmi@4c {
> >> +            compatible = "ite,it6263";
> >> +            reg = <0x4c>;
> >> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> >> +            ivdd-supply = <&reg_buck5>;
> >> +            ovdd-supply = <&reg_vext_3v3>;
> >> +            txavcc18-supply = <&reg_buck5>;
> >> +            txavcc33-supply = <&reg_vext_3v3>;
> >> +            pvcc1-supply = <&reg_buck5>;
> >> +            pvcc2-supply = <&reg_buck5>;
> >> +            avcc-supply = <&reg_vext_3v3>;
> >> +            anvdd-supply = <&reg_buck5>;
> >> +            apvdd-supply = <&reg_buck5>;
> >> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
> >> +
> >> +            ports {
> >> +                #address-cells = <1>;
> >> +                #size-cells = <0>;
> >> +
> >> +                port@0 {
> >> +                    reg = <0>;
> >> +
> >> +                    it6263_lvds_link1: endpoint {
> >> +                        remote-endpoint = <&ldb_lvds_ch0>;
> >> +                    };
> >> +                };
> >> +
> >> +                port@2 {
> >> +                    reg = <2>;
> >> +
> >> +                    it6263_out: endpoint {
> >> +                        remote-endpoint = <&hdmi_in>;
> >> +                    };
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> >> +
> >> +  - |
> >> +    /* dual-link LVDS input */
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +
> >> +    i2c {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +
> >> +        hdmi@4c {
> >> +            compatible = "ite,it6263";
> >> +            reg = <0x4c>;
> >> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> >> +            ivdd-supply = <&reg_buck5>;
> >> +            ovdd-supply = <&reg_vext_3v3>;
> >> +            txavcc18-supply = <&reg_buck5>;
> >> +            txavcc33-supply = <&reg_vext_3v3>;
> >> +            pvcc1-supply = <&reg_buck5>;
> >> +            pvcc2-supply = <&reg_buck5>;
> >> +            avcc-supply = <&reg_vext_3v3>;
> >> +            anvdd-supply = <&reg_buck5>;
> >> +            apvdd-supply = <&reg_buck5>;
> >> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
> >> +
> >> +            ports {
> >> +                #address-cells = <1>;
> >> +                #size-cells = <0>;
> >> +
> >> +                port@0 {
> >> +                    reg = <0>;
> >> +                    dual-lvds-odd-pixels;
> >> +
> >> +                    it6263_lvds_link1_dual: endpoint {
> >> +                        remote-endpoint = <&ldb_lvds_ch0>;
> >> +                    };
> >> +                };
> >> +
> >> +                port@1 {
> >> +                    reg = <1>;
> >> +                    dual-lvds-even-pixels;
> >> +
> >> +                    it6263_lvds_link2_dual: endpoint {
> >> +                        remote-endpoint = <&ldb_lvds_ch1>;
> >> +                    };
> >> +                };
> >> +
> >> +                port@2 {
> >> +                    reg = <2>;
> >> +
> >> +                    it6263_out_dual: endpoint {
> >> +                        remote-endpoint = <&hdmi_in>;
> >> +                    };
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
With best wishes
Dmitry

Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892E1459F6
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 07:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728889666; cv=none; b=jQmPQaOvLqwrJCbkzGZBMAv9NwSoD2umlNq94FRuhSrqC/ZySCrrewf5JxQbYpzeh87iVuogQgDm2oOripaK6qi8OZdX5X5LFFVzxZwevVbLxSvZDSrgNeRfFpXOyjjHfDMfcpNjUdcS7kEiiIC7LXms0i85oU4SMTVSmp9ClkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728889666; c=relaxed/simple;
	bh=2Fs2CA8oHvU+wLhWGF77hWI58n+S+33t2Don9Gy2VJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9bqUMVWiJyjcHKWkhdpWci5OffhfaY9WeISIxs9ygPSUgsVzrUYzVzREvkXG+rYb7zGGXWpHrjX9TkJdupZmvoKTvxup/o6/vLgqjg/1/xL52obrytbkhUH6Ue4C67vj6FQg/3T57sHe8AOtpdYscJeoNbHasKiVYup94b+wLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zFMihkoB; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zFMihkoB"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1335233e87.3
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728889662; x=1729494462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ARxFYsp7/+mIT7I9xZ45qotb71sWnmMERryPlBI39w=;
        b=zFMihkoBRd1LvXSsqD7rhoodvwaJ7n4NrJEs2PeR2BkfGNrhyj3Yq+zZ5eFYZopFbr
         qpWCQnE4lwm8933vM8yrCK+ydqZDixdXeQRY4ZMP674k0VgC0we98WubUHM2iH9zJLk0
         eourU7VoT9LJEXz2EiWDjKsGRDMEdG290+MvAdbmnFGGOiJxBeHBzTL41hpQDEHeoZw8
         qfZtyZqHXVD5vnMopeLqonPWbvQtE3ah0jL6ir84QW3md+M572ZqCtwMCn8LZnEFr1rv
         kghUja2IYtEzNVR7XF5PbDGehLSH/Ocsu2QV7JcPWeVKF8y/5nH3G6MiWjG+T6siUn/m
         Buow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728889662; x=1729494462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ARxFYsp7/+mIT7I9xZ45qotb71sWnmMERryPlBI39w=;
        b=cSDL7VBJYvjOyahCgO5/i1mJ/QEGVOt88wgh/8VJzet+YstITqmN34+mAUgVHCs8/H
         8a77cn3xQ2uFEsvNP+htuSAiuthOnV6EHZEzJkssU3SOO+XDWP1b2kCrdGnaeikS8Fzy
         x/LfAk13i/+aU3MclmoabzlCCq3KNwnzm+fD90itNU1rT0FliaUNxZD5zCavaPw1GIue
         m6B9KbhxmUSrBkmewJxHoKZK96EW26qobME9TT5tiWStlsS1mXpb1IG4x0w3ROttTMIe
         jp19GXKxt69Z3ZTCoQ9hh4NYSpbhAwwP4q6vj0Wr+9h7xrnATYXOq6g+ZEIJyB7xx0w3
         f7fA==
X-Forwarded-Encrypted: i=1; AJvYcCXhC+oUlnv1vEjWeVdRTuIJ0JUtW2cSxUtsgaTk3dTZ7J3j2q3rfXVpIP3VrIITR/cbMr8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHq5wqG+LTRI+TH50HW8JoXawXUysP+c1k9VyVB2ystBeXc+Ng
	6fBme+PqF3ThPPFZ4bZ8Hv5rS4msTvr/McEhvsTolkXC+5U5Vz5nWbeuHre3e7E=
X-Google-Smtp-Source: AGHT+IHg5VdHWDTDKmBccxvYSyWf447rZLJNrbiqpaN2aAdz+0hfweYHkTDkw1x/+cGFA4dpsrO50A==
X-Received: by 2002:a05:6512:3046:b0:539:8d9b:b61e with SMTP id 2adb3069b0e04-539da552da0mr4604290e87.44.1728889661678;
        Mon, 14 Oct 2024 00:07:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e32f8825sm1007521e87.121.2024.10.14.00.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:07:41 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:07:38 +0300
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
Message-ID: <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>

On Mon, Oct 14, 2024 at 01:33:44PM +0800, Liu Ying wrote:
> On 10/14/2024, Dmitry Baryshkov wrote:
> > On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
> >> On 10/12/2024, Dmitry Baryshkov wrote:
> >>> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
> >>>> Document ITE IT6263 LVDS to HDMI converter.
> >>>>
> >>>> Product link:
> >>>> https://www.ite.com.tw/en/product/cate1/IT6263
> >>>>
> >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>> ---
> >>>> v2:
> >>>> * Document number of LVDS link data lanes.  (Biju)
> >>>> * Simplify ports property by dropping "oneOf".  (Rob)
> >>>>
> >>>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
> >>>>  1 file changed, 276 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..bc2bbec07623
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>> @@ -0,0 +1,276 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: ITE IT6263 LVDS to HDMI converter
> >>>> +
> >>>> +maintainers:
> >>>> +  - Liu Ying <victor.liu@nxp.com>
> >>>> +
> >>>> +description: |
> >>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
> >>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
> >>>> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
> >>>> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
> >>>> +  1.2 and backward compatible with DVI 1.0 specification.
> >>>> +
> >>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
> >>>> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
> >>>> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
> >>>> +
> >>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
> >>>> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
> >>>> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
> >>>> +  is supported at up to 768KHz.
> >>>> +
> >>>> +properties:
> >>>
> >>> No LVDS data-mapping support?
> >>
> >> It is enough to document number of LVDS link data lanes
> >> because OS should be able to determine the data-mapping
> >> by looking at the number and the data-mapping capability
> >> of the other side of the LVDS link. 
> > 
> > From what I can see, data-mapping is specified on the consumer sink side
> > of the LVDS link. This means it should go to the bridge's device node.
> 
> Then, I won't define data-lanes, because data-mapping implies it,
> e.g., jeida-24 implies data lanes 0/1/2/3, see lvds-data-mapping.yaml.
> 
> Please let me know which one you prefer.

I'd prefer data-mapping.

> 
> > 
> >>
> >>>
> >>>> +  compatible:
> >>>> +    const: ite,it6263
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  clocks:
> >>>> +    maxItems: 1
> >>>> +    description: audio master clock
> >>>> +
> >>>> +  clock-names:
> >>>> +    const: mclk
> >>>> +
> >>>> +  reset-gpios:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  ivdd-supply:
> >>>> +    description: 1.8V digital logic power
> >>>> +
> >>>> +  ovdd-supply:
> >>>> +    description: 3.3V I/O pin power
> >>>> +
> >>>> +  txavcc18-supply:
> >>>> +    description: 1.8V HDMI analog frontend power
> >>>> +
> >>>> +  txavcc33-supply:
> >>>> +    description: 3.3V HDMI analog frontend power
> >>>> +
> >>>> +  pvcc1-supply:
> >>>> +    description: 1.8V HDMI frontend core PLL power
> >>>> +
> >>>> +  pvcc2-supply:
> >>>> +    description: 1.8V HDMI frontend filter PLL power
> >>>> +
> >>>> +  avcc-supply:
> >>>> +    description: 3.3V LVDS frontend power
> >>>> +
> >>>> +  anvdd-supply:
> >>>> +    description: 1.8V LVDS frontend analog power
> >>>> +
> >>>> +  apvdd-supply:
> >>>> +    description: 1.8V LVDS frontend PLL power
> >>>> +
> >>>> +  "#sound-dai-cells":
> >>>> +    const: 0
> >>>> +
> >>>> +  ite,lvds-link-num-data-lanes:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint8
> >>>> +    enum: [3, 4, 5]
> >>>> +    description: number of data lanes per LVDS link
> >>>
> >>> Please use data-lanes property inside the OF graph.
> >>
> >> In both port@0 and port@1?
> > 
> > Yes
> 
> I'm assuming if data-mapping is defined, then no need to
> define data-lanes.

Yes

> 
> > 
> >>
> >>>
> >>>> +
> >>>> +  ite,i2s-audio-fifo-sources:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>>> +    minItems: 1
> >>>> +    maxItems: 4
> >>>> +    items:
> >>>> +      enum: [0, 1, 2, 3]
> >>>> +    description:
> >>>> +      Each array element indicates the pin number of an I2S serial data input
> >>>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
> >>>
> >>> What does that mean from the board point of view? Routed audio links for
> >>> the multichannel audio?
> >>
> >> Yes, also for single channel audio.
> >>
> >>>
> >>>> +
> >>>> +  ite,rl-channel-swap-audio-sources:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>>> +    minItems: 1
> >>>> +    maxItems: 4
> >>>> +    uniqueItems: true
> >>>> +    items:
> >>>> +      enum: [0, 1, 2, 3]
> >>>> +    description:
> >>>> +      Each array element indicates an audio source whose right channel and left
> >>>> +      channel are swapped by this converter. For I2S, the element is the pin
> >>>> +      number of an I2S serial data input line. For S/PDIF, the element is always
> >>>> +      0.
> >>>
> >>> Why?
> >>
> >> Because this converter has the capability to swap right channel
> >> and left channel and S/PDIF always uses audio source0. 
> >>
> >>>
> >>>> +
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description:
> >>>> +          The first LVDS input link.
> >>>> +          In dual-link LVDS mode, this link works together with the second LVDS
> >>>> +          input link, and one link receives odd pixels while the other receives
> >>>> +          even pixels. Specify the pixels with one of the dual-lvds-odd-pixels
> >>>> +          and dual-lvds-even-pixels properties when and only when dual-link LVDS
> >>>> +          mode is used.
> >>>> +
> >>>> +        properties:
> >>>> +          dual-lvds-odd-pixels:
> >>>> +            type: boolean
> >>>> +            description: the first sink port for odd pixels
> >>>> +
> >>>> +          dual-lvds-even-pixels:
> >>>> +            type: boolean
> >>>> +            description: the first sink port for even pixels
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description: the second LVDS input link
> >>>> +
> >>>> +        properties:
> >>>> +          dual-lvds-even-pixels:
> >>>> +            type: boolean
> >>>> +            description: the second sink port for even pixels
> >>>> +
> >>>> +          dual-lvds-odd-pixels:
> >>>> +            type: boolean
> >>>> +            description: the second sink port for odd pixels
> >>>> +
> >>>> +        oneOf:
> >>>> +          - required: [dual-lvds-even-pixels]
> >>>> +          - required: [dual-lvds-odd-pixels]
> >>>
> >>> This still allows one to specify that both ports provide odd pixels. Is
> >>> that expected? Also why do you need two properties which specify the
> >>> same option.
> >>
> >> No, that is not expected. Description for port@0 already mentions
> >> one link receives odd pixels while the other receives even pixels.
> > 
> > That's not expected, but permitted by the bindings.
> 
> It is not permitted by port@1. If "dual-lvds-odd-pixels;" is added
> to port@1 in the dual-link LVDS example, the below warning will be
> generated by dt_binding_check.

It is permitted for both ports to have the same value (e.g. mark both
ports as odd or even).

> 
> Documentation/devicetree/bindings/display/bridge/ite,it6263.example.dtb: hdmi@4c: ports:port@1: {'reg': [[1]], 'dual-lvds-even-pixels': True, 'dual-lvds-odd-pixels': True, 'endpoint': {'remote-endpoint': [[4294967295]]}} is valid under each of {'required': ['dual-lvds-odd-pixels']}, {'required': ['dual-lvds-even-pixels']}
> 	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> 
> However, the binding for port@0 does allow DT writers to specify
> both even and odd pixels. I raised similar concerns in v1 discussion.
> According to Rob's comment in #devicetree IRC, the ports property
> is simplified to this form and more description for port@0 is added
> to tell when to specify the even/odd pixels.  If you know any better
> way to indicate the constraints, please shout.

I don't think we can express that in schema. I don't like the bindings
(and would have preferred a single property instead), but as the
bindings are already defined, let's use them.

> 
> > 
> >>
> >> Two options are supported for dual-link LVDS, not the same option:
> >> 1) LVDS link1(port@0) gets odd pixels
> >>    and
> >>    LVDS link2(port@1) gets even pixels.
> >>
> >> 2) LVDS link1(port@0) gets even pixels
> >>    and
> >>    LVDS link2(port@1) gets odd pixels.
> >> That's the reason why each port needs two properties to define
> >> odd/even pixels.
> >>
> >>>
> >>> My suggestion would be to add a single root-level property which
> >>> specifies which port provides even pixel data.
> >>
> >> That won't work.  The LVDS source side expects the ports of
> >> the sink side specify dual-lvds-{odd,even}-pixels properties.
> > 
> > I didn't notice that these properties are already defined.
> > 
> > As these properties are common between several schema files, please
> > extract them to a common schema file (like lvds.yaml).
> 
> I'm not sure how to do that. Is it obvious?
> Please shed some light. 
> 
> Only two panel schema files are defining even/odd pixels now -
> advantech,idk-2121wr.yaml and panel-simple-lvds-dual-ports.yaml.
> Maybe, extract them later when more schema files(especially for
> bridges) try to define the same?  I'd like to keep a low profile
> for now.

I'd say, please extract those now. Adding third is more than enough and
should be avoided. Extracting is pretty simple. One patch to move the
definition and descriptions from panel-simple-lvds-dual-ports to a
common location (e.g. lvds-dual-ports.yaml). Leave the required
constrains in place. Second patch is to add oneOf constraints to the
ports. port@0 might get the same oneOf + the
dual-lvds-{odd,even}-pixels:false case, allowing a single-port
definition.

> 
> > 
> >>
> >>>
> >>>> +
> >>>> +      port@2:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: video port for the HDMI output
> >>>> +
> >>>> +      port@3:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: sound input port
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@2
> >>>> +
> >>>> +required:
> >>>> +  - compatible
> >>>> +  - reg
> >>>> +  - ivdd-supply
> >>>> +  - ovdd-supply
> >>>> +  - txavcc18-supply
> >>>> +  - txavcc33-supply
> >>>> +  - pvcc1-supply
> >>>> +  - pvcc2-supply
> >>>> +  - avcc-supply
> >>>> +  - anvdd-supply
> >>>> +  - apvdd-supply
> >>>> +  - ite,lvds-link-num-data-lanes
> >>>> +  - ports
> >>>> +
> >>>> +additionalProperties: false
> >>>> +
> >>>> +examples:
> >>>> +  - |
> >>>> +    /* single-link LVDS input */
> >>>> +    #include <dt-bindings/gpio/gpio.h>
> >>>> +
> >>>> +    i2c {
> >>>> +        #address-cells = <1>;
> >>>> +        #size-cells = <0>;
> >>>> +
> >>>> +        hdmi@4c {
> >>>> +            compatible = "ite,it6263";
> >>>> +            reg = <0x4c>;
> >>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> >>>> +            ivdd-supply = <&reg_buck5>;
> >>>> +            ovdd-supply = <&reg_vext_3v3>;
> >>>> +            txavcc18-supply = <&reg_buck5>;
> >>>> +            txavcc33-supply = <&reg_vext_3v3>;
> >>>> +            pvcc1-supply = <&reg_buck5>;
> >>>> +            pvcc2-supply = <&reg_buck5>;
> >>>> +            avcc-supply = <&reg_vext_3v3>;
> >>>> +            anvdd-supply = <&reg_buck5>;
> >>>> +            apvdd-supply = <&reg_buck5>;
> >>>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
> >>>> +
> >>>> +            ports {
> >>>> +                #address-cells = <1>;
> >>>> +                #size-cells = <0>;
> >>>> +
> >>>> +                port@0 {
> >>>> +                    reg = <0>;
> >>>> +
> >>>> +                    it6263_lvds_link1: endpoint {
> >>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
> >>>> +                    };
> >>>> +                };
> >>>> +
> >>>> +                port@2 {
> >>>> +                    reg = <2>;
> >>>> +
> >>>> +                    it6263_out: endpoint {
> >>>> +                        remote-endpoint = <&hdmi_in>;
> >>>> +                    };
> >>>> +                };
> >>>> +            };
> >>>> +        };
> >>>> +    };
> >>>> +
> >>>> +  - |
> >>>> +    /* dual-link LVDS input */
> >>>> +    #include <dt-bindings/gpio/gpio.h>
> >>>> +
> >>>> +    i2c {
> >>>> +        #address-cells = <1>;
> >>>> +        #size-cells = <0>;
> >>>> +
> >>>> +        hdmi@4c {
> >>>> +            compatible = "ite,it6263";
> >>>> +            reg = <0x4c>;
> >>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> >>>> +            ivdd-supply = <&reg_buck5>;
> >>>> +            ovdd-supply = <&reg_vext_3v3>;
> >>>> +            txavcc18-supply = <&reg_buck5>;
> >>>> +            txavcc33-supply = <&reg_vext_3v3>;
> >>>> +            pvcc1-supply = <&reg_buck5>;
> >>>> +            pvcc2-supply = <&reg_buck5>;
> >>>> +            avcc-supply = <&reg_vext_3v3>;
> >>>> +            anvdd-supply = <&reg_buck5>;
> >>>> +            apvdd-supply = <&reg_buck5>;
> >>>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
> >>>> +
> >>>> +            ports {
> >>>> +                #address-cells = <1>;
> >>>> +                #size-cells = <0>;
> >>>> +
> >>>> +                port@0 {
> >>>> +                    reg = <0>;
> >>>> +                    dual-lvds-odd-pixels;
> >>>> +
> >>>> +                    it6263_lvds_link1_dual: endpoint {
> >>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
> >>>> +                    };
> >>>> +                };
> >>>> +
> >>>> +                port@1 {
> >>>> +                    reg = <1>;
> >>>> +                    dual-lvds-even-pixels;
> >>>> +
> >>>> +                    it6263_lvds_link2_dual: endpoint {
> >>>> +                        remote-endpoint = <&ldb_lvds_ch1>;
> >>>> +                    };
> >>>> +                };
> >>>> +
> >>>> +                port@2 {
> >>>> +                    reg = <2>;
> >>>> +
> >>>> +                    it6263_out_dual: endpoint {
> >>>> +                        remote-endpoint = <&hdmi_in>;
> >>>> +                    };
> >>>> +                };
> >>>> +            };
> >>>> +        };
> >>>> +    };
> >>>> -- 
> >>>> 2.34.1
> >>>>
> >>>
> >>
> >> -- 
> >> Regards,
> >> Liu Ying
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

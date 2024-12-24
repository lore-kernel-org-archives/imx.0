Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D7B13B5A9
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735022276; cv=none; b=ADUreJ+OvX2drM0JRfH3Tifzvdl9CmtEfYQwHYVfOoloQA7+bnwLR6t/eFx1ZnLf6XFk/r27iqkMx++TVZMFQdqlRqAPh18oQZ93hFHz7IPTXfl7vfsF0nFASDQfT85pZo5094mNOS1YuS+5oyvJ4SrN88jbSKn5Wr3doX2xVQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735022276; c=relaxed/simple;
	bh=mt3EqcyL8/UMGoGI1GrqjkkrWqp9NorsX25jSpwFOW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUf+U2Odz5wxejG1IB+i9xNQ1ioFEFXvazWgCvzboefvngKC3Sey6HVvVgnpxR9rdullL/qZm/GxtvjLa/DeFZJKcRGT6HSnTlmWrco5aW+tNiQaSJYTFsqELoBfpEbDPvqpyjJTg+W8KsApL14H/jX0rrWo/Ob+I11GCypI+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZtFy/X7r; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZtFy/X7r"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e399e904940so3990741276.2
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 22:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735022272; x=1735627072; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o1XvnZFs6gULC9u+/TF7lOR4yZnTuNv7QjOSNUS7iok=;
        b=ZtFy/X7rDzTs2AU/xxO7eS2Y/6pX83dV5tLzugF0N4dY/S+fOQrb4qlEZBG2FqkNpD
         RmSbkLXEkrFu8n8ZUEuSDVaSek6B1Dt9VABC/AOHL2YyXY2wC0rrp0qhF6lZP1gZBW1X
         omALYmJ8s/XYZyZwCSWFA86H3t3uSzp+nJT+jv6bUtJ3VVUXk7vnpwll6uMMd1Egk7Nw
         hDyu2nyXqJZRfmECD6suRscCp2WTV8JRg/dAXZEd7AylpNhiqylGayircYehAU2QEBN7
         n0L4rUOkgwjLiWJbay9HuIvgEKTMgzwxBS++GBQ3RjNHQYYV7DSsH21EBTlz6gFmCXPh
         pJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735022272; x=1735627072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1XvnZFs6gULC9u+/TF7lOR4yZnTuNv7QjOSNUS7iok=;
        b=E16BZB0TWLv7BumKz8Hw6uYr18Fxy8asQirFvINYcdKicNeYGy7bYMFNMxp25R/iFS
         5q2ie6DbNeEUM+ZmgRBmy8oHsxpA5fHER0cJUChkSIU3Vh4BDQz9WL8aGjzwvYY8LIqS
         WEsZkIgcAyc9kZR+OAcroNEg0xji2PEubyuH33WygDwAcIc3IVsxyxXBaeJtChKzA1nh
         U93+lSXFPE2NPTvZdx//mv4TSvc8I5iS05qH6i7PkhuCn1e5dyXcfoSOOWFubPv37NKr
         7WSWa6UE9BwNgND+D2SE/oJ19GHqcYm1a09JVwi4vahgQvMtSOsao76hCh9qLPnt++ol
         aasA==
X-Forwarded-Encrypted: i=1; AJvYcCXAKM3/V/5d7HtW0nr6HnO99duLP6uLH/TxEEsLcXOGVXdT2y1LMRmMTqv5k5qU1r1iv2s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhMYJd6EdyMXjMuLuD+Drbw/t5iBbUJe7y0w6F/AJLjuILSHRQ
	5eQJ9/UiHdHD9g3FfFf6voW91i+lgskjBToSI970YofqdhKrVy16dndNPQs2xqK18HtYi2DnZyv
	e10BBtfygSO+YHQh7B2bYBnW1am51af3f+BMt7g==
X-Gm-Gg: ASbGnct9sZwj/NzxhhmxFrW93rb7w4u7j8gDbXb40okAe+8f45+xVJtI4O7F7N545fw
	MjYijZ8yf35eOma1jCJpbN0Lcg7rcZ2rzZxdU+VnFLBxjRDX28dwI
X-Google-Smtp-Source: AGHT+IFZ8ke7ALCJ3nOuLTQKsekeJoRs3cJKquLJ733BfXm3xrOprg1bOLqkxV6UJrbJ7rSuBs35FEWCK/hX2TFMd+E=
X-Received: by 2002:a05:690c:7402:b0:6ef:7370:96ee with SMTP id
 00721157ae682-6f3f812055fmr116458157b3.12.1735022271919; Mon, 23 Dec 2024
 22:37:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241223064147.3961652-1-victor.liu@nxp.com> <20241223064147.3961652-4-victor.liu@nxp.com>
 <kpem2w4wu7ywc5pvbk3ls5hsyttrwcylomzfh567ejlxkymeqd@cujrbfxgrntc> <73c80079-582a-40cb-b9e1-e20fc96fe603@nxp.com>
In-Reply-To: <73c80079-582a-40cb-b9e1-e20fc96fe603@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 08:37:41 +0200
Message-ID: <CAA8EJpqJiiR15Xxw3j+vGPUBYYLgvxuXKeigMGBb4F3w178cfA@mail.gmail.com>
Subject: Re: [PATCH v7 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com, 
	agx@sigxcpu.org, u.kleine-koenig@baylibre.com, francesco@dolcini.it, 
	frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Dec 2024 at 07:56, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 12/23/2024, Dmitry Baryshkov wrote:
> > On Mon, Dec 23, 2024 at 02:41:31PM +0800, Liu Ying wrote:
> >> i.MX8qxp Display Controller display engine consists of all processing units
> >> that operate in a display clock domain.
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v7:
> >> * Drop DT alias documentations and add instance numbers to compatible strings.
> >>   (Rob)
> >>
> >> v6:
> >> * No change.
> >>
> >> v5:
> >> * Document aliases.  Drop Rob's previous R-b tag. (Maxime)
> >>
> >> v4:
> >> * Collect Rob's R-b tag.
> >>
> >> v3:
> >> * No change.
> >>
> >> v2:
> >> * Drop fsl,dc-*-id DT properties. (Krzysztof)
> >> * Drop port property. (Krzysztof)
> >> * Fix register range sizes in example.
> >>
> >>  .../imx/fsl,imx8qxp-dc-display-engine0.yaml   | 235 ++++++++++++++++++
> >>  1 file changed, 235 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> >> new file mode 100644
> >> index 000000000000..60d1e0a4a5dd
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
> >> @@ -0,0 +1,235 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine0.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Freescale i.MX8qxp Display Controller Display Engine
> >> +
> >> +description:
> >> +  All Processing Units that operate in a display clock domain. Pixel pipeline
> >> +  is driven by a video timing and cannot be stalled. Implements all display
> >> +  specific processing.
> >> +
> >> +maintainers:
> >> +  - Liu Ying <victor.liu@nxp.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - fsl,imx8qxp-dc-display-engine0
> >> +      - fsl,imx8qxp-dc-display-engine1
> >
> > Is there actual difference between engines 0 and 1? If there is none,
> > why are you artificially adding one here?
>
> I think engine 0 and 1 have the same HW implementation, but they connect
> to different ExtDsts through FrameGens.  The two compatible strings make
> it possible for an operating system to figure out which engine is which
> by getting the instance numbers from them.

This is about HW description, no OS in place.

>
> If the two engines use a same compatible string, then either 1) use
> DT aliases to get the instance number(as v5/v6 do) or 2) use OF graph to
> describe the connections between FrameGens and ExtDsts.  However, in v6,
> Rob doesn't like 1) because it abuses the aliases which contain the display
> controller instance number, like "dc0-display-engine0"(i.MX8QM SoC has
> two display controllers), and 2) is too complex because all connections
> between internal devices need to be documented with OF graph.  So, I choose
> to use the two compatible strings, like brcm,bcm2835-pixelvalve0.yaml does.
> Thinking about 2) more, maybe the connections between pixel engine and
> display engines need to be documented too, which seems to be more or less
> duplicating the connections between FrameGens and ExtDsts.

3) use IO addresses to determine the block ID. I think this has been
pointed out by somebody else too, not only by me.

>
>                                            CF0/1/4/5
>                            PE               | | | |
>                                             V V V V  primary layer cross bar
>                           +------------------------------------------+
>                           |                                          |
> 4 FUs + (VS4/5 + HS4/5) =>|               LB0/1/2/3                  |
>    secondary layer        |                                          |
>    cross bar              +------------------------------------------+
>                              |          |              |          |
>                              V          V              V          V
>                           +-----+    +-----+        +-----+    +-----+
>                           | ED0 |    | ED4 |        | ED5 |    | ED1 |
>                           +-----+    +-----+        +-----+    +-----+
> -----------------------------|----------|--------------|----------|-------------
>                           content     safety        safety     content
>                           stream0    stream0        stream1    stream1
>                              |          |              |          |
>                              |  DE0     V              V    DE1   |
>                              |       +-----+        +-----+       |
>                               ------>| FG0 |        | FG1 |<------
>                                      +-----+        +-----+
>                                         |              |
>                                         V              V
>                                        ...            ...
>
> >
> >> +
> >> +  reg:
> >> +    maxItems: 2
> >> +
> >> +  reg-names:
> >> +    items:
> >> +      - const: top
> >> +      - const: cfg
> >> +
> >> +  resets:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 3
> >> +
> >> +  interrupt-names:
> >> +    items:
> >> +      - const: shdload
> >> +      - const: framecomplete
> >> +      - const: seqcomplete
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  "#address-cells":
> >> +    const: 1
> >> +
> >> +  "#size-cells":
> >> +    const: 1
> >> +
> >> +  ranges: true
> >> +
> >> +patternProperties:
> >> +  "^dither@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-dither0
> >> +          - fsl,imx8qxp-dc-dither1
> >> +
> >> +  "^framegen@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-framegen0
> >> +          - fsl,imx8qxp-dc-framegen1
> >> +
> >> +  "^gammacor@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-gammacor0
> >> +          - fsl,imx8qxp-dc-gammacor1
> >> +
> >> +  "^matrix@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-matrix0
> >> +          - fsl,imx8qxp-dc-matrix1
> >> +
> >> +  "^signature@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-signature0
> >> +          - fsl,imx8qxp-dc-signature1
> >> +
> >> +  "^tcon@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - fsl,imx8qxp-dc-tcon0
> >> +          - fsl,imx8qxp-dc-tcon1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - reg-names
> >> +  - interrupts
> >> +  - interrupt-names
> >> +  - power-domains
> >> +  - "#address-cells"
> >> +  - "#size-cells"
> >> +  - ranges
> >> +
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: fsl,imx8qxp-dc-display-engine0
> >> +    then:
> >> +      patternProperties:
> >> +        "^dither@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-dither0
> >> +
> >> +        "^framegen@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-framegen0
> >> +
> >> +        "^gammacor@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-gammacor0
> >> +
> >> +        "^matrix@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-matrix0
> >> +
> >> +        "^signature@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-signature0
> >> +
> >> +        "^tcon@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-tcon0
> >> +    else:
> >> +      patternProperties:
> >> +        "^dither@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-dither1
> >> +
> >> +        "^framegen@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-framegen1
> >> +
> >> +        "^gammacor@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-gammacor1
> >> +
> >> +        "^matrix@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-matrix1
> >> +
> >> +        "^signature@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-signature1
> >> +
> >> +        "^tcon@[0-9a-f]+$":
> >> +          properties:
> >> +            compatible:
> >> +              const: fsl,imx8qxp-dc-tcon1
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/imx8-lpcg.h>
> >> +    #include <dt-bindings/firmware/imx/rsrc.h>
> >> +
> >> +    display-engine@5618b400 {
> >> +        compatible = "fsl,imx8qxp-dc-display-engine0";
> >> +        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
> >> +        reg-names = "top", "cfg";
> >> +        interrupt-parent = <&dc0_intc>;
> >> +        interrupts = <15>, <16>, <17>;
> >> +        interrupt-names = "shdload", "framecomplete", "seqcomplete";
> >> +        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
> >> +        #address-cells = <1>;
> >> +        #size-cells = <1>;
> >> +        ranges;
> >> +
> >> +        framegen@5618b800 {
> >> +            compatible = "fsl,imx8qxp-dc-framegen0";
> >> +            reg = <0x5618b800 0x98>;
> >> +            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
> >> +            interrupt-parent = <&dc0_intc>;
> >> +            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
> >> +            interrupt-names = "int0", "int1", "int2", "int3",
> >> +                              "primsync_on", "primsync_off",
> >> +                              "secsync_on", "secsync_off";
> >> +        };
> >> +
> >> +        tcon@5618c800 {
> >> +            compatible = "fsl,imx8qxp-dc-tcon0";
> >> +            reg = <0x5618c800 0x588>;
> >> +
> >> +            port {
> >> +                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
> >> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
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



-- 
With best wishes
Dmitry

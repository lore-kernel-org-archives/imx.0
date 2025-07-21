Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09C1DFD96
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 03:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753068435; cv=none; b=M0Fq6SBog8UU8GEEObFP4GmJaQGPH5xy1JOSoBcyv+XhFfAueUg/TY0QNWF9PSw2daXkn4WRXuUt5bLZjikTCwdVIjWgtHJ9ztb01sueHcvMQGtupugBIceYsN18fWu5NiFtHPhUy9e32lV9/eenF0PS5KuZ7FyCn5XgDua4LMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753068435; c=relaxed/simple;
	bh=OgN9dZKAVvXJmFroQccrEWHmRE9qiT/R0uEuicJgwfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYkoLm8lJF8o7BuXszO+uvriJ7VIqiXYR/8zDQDs0Gpw1DdxC64B9NQsAPW0aif6Pwvm6OcMuSCNKyofJhOCTTnfximGPAWEitnbcQN1wb8YYg1Q8I6sV7yqEFYU73I2MzkwlMjAvmu4R18IuDyeq2NbJMEZiga51ahUi3JWNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpHEYafC; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpHEYafC"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-87c26c9e8d5so124713539f.0
        for <imx@lists.linux.dev>; Sun, 20 Jul 2025 20:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753068432; x=1753673232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GJULZkEl8j6az+Nmf6Q9IdIMazJkldN2OlkYV3zqRI=;
        b=BpHEYafCn6/RIXCn1VYVyzsEhgoOjo8ca/c3U4lPbKC9EhzvAyLCzO6IAq4aO6JqDJ
         ACv38JKVqzVsAo/LNPAhPC44q1D+IVdJ8VO1oeZmBSlUWJ80J1SjFra2wtMSqCv/75fK
         OIAibAEORu/96qge/9eptUP8mIK67F0QZ0GPg/2kw93MScrC+AQFVdvmx1EYxMqmdLwR
         GD02F5ZLbxxpYUflqNlpNAhOB8xUydX5eGkwKziSxT97WWTL5cR0XMKLVO5XxTNNj3Gp
         sTZ3q3y/NVDDX/k9RK/fUtWIFNet6rT0Quozid62J9PkPx3rqY2CbO7UFG1METg40UjY
         4AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753068432; x=1753673232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GJULZkEl8j6az+Nmf6Q9IdIMazJkldN2OlkYV3zqRI=;
        b=P5B60oTJ4RSMsNuTPmZfe4vu8jjGJnqSYX0DvwxX84s35pIWpy3HzNzXwAnto+yK4U
         aqx9wUkuBvBLVcSMaY3bGR3i66kY4fS/LzrvGJQ96yNEMg/r84m8ssfQZ9r1gcwV8V3d
         Ppm9xXHrWnLuBHjmOPlupeLVqU1s+F4lPw2wRXGjRcGEDARnRGaUtllR75jKGTWtPcj9
         I7Qs7HGyMPTwszi35SYjmXPLFu1w0qTXj4zEJrU3uXBIbl3c7X/QbNBHjyH22fkx7iZq
         z1UzG9F7BkUZz5hOND4h6xaMJuI1r3GJu5ycb4YUqZVwmWHve987NygmBElsUvXxefpA
         q29g==
X-Forwarded-Encrypted: i=1; AJvYcCV+mvhjXPTeMFZvh4kkHd7/17PIRxRyYRUKU4wdna+s4fn/LTUPqikBIO3kIT0St1X2PrE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUtfxC73aAtXrSv7jiGfuT4iOGYVe2yv+4dBPmVadHUCYFj1X8
	hQgC3vWPU7ySyuHIlLKaQnkOCEgJH/UguQcmv8JJhmsdOmRVFuxxD7lFdM2C8nn9f7t/kWiCoH5
	5X11gdd18uuKI687pNd9R2IdVXfDyUJ8=
X-Gm-Gg: ASbGnctAVtVJFb2Nelt/7AlEgSxPkoKnKk9ZUt2Vhn+P/YEirWUr7I6n4cUlaKR4XT7
	m2tEcHo5V6yBEHU9RH5J1inR36r39XJKNBxpTzjLP8LILBMOZxdyhHvkSw8ShsPVKi5kSao7Ylx
	n3YK6+j+tO0sPInf4Q5laZVub+GyLeP/Vx2dYKQZ9f75vS0RISddxe6Udoq6mdk2abYnM/gDYSJ
	cqOTiMW19XX0Vmxfw==
X-Google-Smtp-Source: AGHT+IG8vUHFP70UXed9iRLKIptriKCIABWtAWB4NI0eKfx64HKik6dvxbUYvCeLTR40uVNuIWcVYOwlyUyYpDWTz70=
X-Received: by 2002:a05:6e02:2587:b0:3e2:9f78:3783 with SMTP id
 e9e14a558f8ab-3e29f783956mr91962715ab.21.1753068432378; Sun, 20 Jul 2025
 20:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-4-shengjiu.wang@nxp.com> <aHp1be6omEO8qB8o@lizhi-Precision-Tower-5810>
In-Reply-To: <aHp1be6omEO8qB8o@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 11:26:56 +0800
X-Gm-Features: Ac12FXxLXoN3PdgILVQcoB0Vod44PqH8KIxOUI90ky-y_nERjNH_OhhfrJs7NGk
Message-ID: <CAA+D8AMz4MAn7M40ipTefXapQ0-KZnUT3H6iVzBscO4UmrK6cw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PAI
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 12:25=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 06:11:49PM +0800, Shengjiu Wang wrote:
>
> Subject needn't said binding again.
>
> dt-bindings: display: imx: add HDMI PAI for i.MX8MP
>
> > Add binding for the i.MX8MP HDMI parallel Audio interface block.
>
> Need empty line between two paragraph

Ok.
>
> > As this port is linked to imx8mp-hdmi-tx, add port@2 in
> > fsl,imx8mp-hdmi-tx.yaml document.
>
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to imx8mp-hdmi-tx (
> look like pai_to_hdmi_tx?)

yes, linked to pai_to_hdmi_tx.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
> >  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pai.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml
> > index 05442d437755..cf810b277557 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > @@ -49,9 +49,14 @@ properties:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description: HDMI output port
> >
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel audio input port
> > +
> >      required:
> >        - port@0
> >        - port@1
> > +      - port@2
>
> Are you sure it is required?  It may cause may dtb check warning.

yes, it is required.
>
> >
> >  required:
> >    - compatible
> > @@ -98,5 +103,13 @@ examples:
> >                      remote-endpoint =3D <&hdmi0_con>;
> >                  };
> >              };
> > +
> > +            port@2 {
> > +                reg =3D <2>;
> > +
> > +                endpoint {
> > +                    remote-endpoint =3D <&pai_to_hdmi_tx>;
> > +                };
> > +            };
> >          };
> >      };
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-h=
dmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdm=
i-pai.yaml
> > new file mode 100644
> > index 000000000000..d2d723935032
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai=
.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +description:
> > +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module t=
hat acts as the
> > +  bridge between the Audio Subsystem to the HDMI TX Controller.
>
> remove "a digital module that acts as the"

Ok, will update it in the next version.

best regards
Shengjiu Wang

>
> Frank
>
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8mp-hdmi-pai
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Output to the HDMI TX controller.
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - power-domains
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/imx8mp-power.h>
> > +
> > +    hdmi@32fc4800 {
> > +        compatible =3D "fsl,imx8mp-hdmi-pai";
> > +        reg =3D <0x32fc4800 0x800>;
> > +        interrupt-parent =3D <&irqsteer_hdmi>;
> > +        interrupts =3D <14>;
> > +        power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> > +
> > +        port {
> > +
> > +            pai_to_hdmi_tx: endpoint {
> > +                remote-endpoint =3D <&hdmi_tx_from_pai>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.34.1
> >

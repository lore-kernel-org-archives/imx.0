Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87725F7A7
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351825; cv=none; b=DCyIuooRvpDQHGv4dFSe1bA4Gf14aseuBeQjGkOo1ZcyLpxQsHNo5+kPF78ZkbmsRghq1tKq5XoquZNwmzEWuBlHgc6QvImyte+v++G5usrCxrVpWZW9oLI9bviraeJpF8DCzcXWw9TVqw9ROj0D1zcHB6C0yQD66MEmpIWAkCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351825; c=relaxed/simple;
	bh=c7QMAmpVaB48eq1HG5t3StXl8CnTj69VjPU/BHyPuSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d02s9uGEBHSAR9MLASN0nf6L+SEQecnTarLFaeC10z1rGm7WO5MPF/CuE7xHibPQU3ruzgvEujaVSvM1R/OG6lvu9LGagE/0oSvcqvvJIrjNYc2cp87Rz4iuLOx9VfF/hl5oq7eNAgx9KozlyPfWQp6dV/bTdOYZrOtP3CKOsz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkZQPCRj; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkZQPCRj"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e281f82060so5903235ab.2
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 03:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753351823; x=1753956623; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+meAXBdOYjti/xHVnSu9+/vlo6BxGcgq1eAbTOjxvs=;
        b=XkZQPCRj3m5xo2tU0IIXknQ4r4gLsyoBTVJMcRxQzo7DLqRcVgN1wzICiSLNK8oyaX
         CsNtu95rR+5MbXqNHl5jkzL0Y9p74F1FZoRU5BbO74gq6VmaEyTIDlS5rOcmYazw305o
         A/V6X66ATDVYOpzyJZNc9S1S+/2h06og3TSNeUHyIqECxwnhnE0Up/WwuSJOxPfPynxb
         ykXmZua4iTY34SlLPr+DJt/zZavWnci3EteuEf7uvUKF3s7D8OeSXQLKgKEdcLVst/wa
         cyx2EC4xnITGvnZj+HV2xoIsL2nAHXeJL70H1Iu0zRKd6WcOv2oXVpBJuITwXziMNaPd
         3wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351823; x=1753956623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+meAXBdOYjti/xHVnSu9+/vlo6BxGcgq1eAbTOjxvs=;
        b=vuWaXSsPBDwRYSib37qnuLaP3FcfFyB/6W5sw+Gh3pZgHIEDFVA7O11qNcC0j6nxfq
         8IiW2Lt9+5/L9Tn5Ix9lv1ZB513gnUrz9rgifmmcb1e7TUqOZO370UQm1k0GZqlFOttw
         dVrfgTxGIZK9Gz9GDRZTa9wl9WmlDLU0hIWHObzA9S/4LBs/E5XrtFzsL8wspnrRCyPe
         P5pNgSkydsKHj/AwkClbjB9/GLtzIfADnXWK5r3Dr5HVg6ALOgaQ6tklkFxTSwm6KK0J
         hJ3YAFW83c1RwA6Gs6rzch0VHPWkI1AHy0Yozcv6h5MhsjCQCBb2hrlji8yhMKG944u2
         /rHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTZAZ9R8rGYfkG6wsbc5khEC5EZPDHzxgEcXv/Hh6XsqAroKLXhkM7tUYWGCR4hCKKajs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLDmCxSZyPk6RUQxMam30gllTJ8ztwF/n4SgxWty1xI6zIo6pc
	zr03vhJQpMTakb9wTsR/51cRmv5TkE9eNa/4QgG2GoUuO9A6RDdeyaiqxH3NWN8UIVsGBIdwXFZ
	fP7ZK/QifWDCGh9uX2oXZyBF3GCI5yuM=
X-Gm-Gg: ASbGncumzNtvUyClCdAmDWVaZZoKGI+4as+0ACtO1d/mDjJPMn+0YzMlhLWszQKDK1e
	S5bVnkVV8U1kntqLMhIqjq5bYSVxUbVFc0NJrBL7UjMJSRb7gha3yFgGO+Mv8MPKCWcnbn9TfCj
	RNtObdQxZmhs/DtbMIAFumgzojRaANVkYHeu+a5fmveKKhmapDyBrIOBTrYhmVnO64QsCI+rIHS
	ixQ2ZY=
X-Google-Smtp-Source: AGHT+IF7M0baFlK3062K6BXEoa8kOdw9KDdHsQbjFyV5neQ+2sKDdzPXmbuSGlkwEtGraleUJvxc24KLjX8I3/Jqb8w=
X-Received: by 2002:a92:cd8d:0:b0:3dd:d321:79ab with SMTP id
 e9e14a558f8ab-3e335535dc5mr117038895ab.18.1753351822074; Thu, 24 Jul 2025
 03:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-2-shengjiu.wang@nxp.com> <20250724-straight-lorikeet-of-novelty-9124f8@kuoka>
In-Reply-To: <20250724-straight-lorikeet-of-novelty-9124f8@kuoka>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 24 Jul 2025 18:10:10 +0800
X-Gm-Features: Ac12FXwoUiu0ZopeKo51pKtd4fVW0e5JyUbFY0Gq7Yw0jp0bxpzJja68FGRxr2Q
Message-ID: <CAA+D8ANV74k1=_m7HfCO2n7nCU7mH=QMrd0CS5eMqGqDHn9HEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:52=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Jul 24, 2025 at 03:22:43PM +0800, Shengjiu Wang wrote:
> > Add binding for the i.MX8MP HDMI parallel Audio interface block.
> >
> > In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to pai_to_hdmi_tx.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
> >  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
> >  2 files changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pai.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml
> > index 05442d437755..6211ab8bbb0e 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > @@ -49,6 +49,10 @@ properties:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description: HDMI output port
> >
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel audio input port
>
> Which data path this represents? Feels like you are duplicating ASoC
> dai-links/cells...

Here it means from HDMI PAI to HDMI TX controller. not the ASoC dai link.

On i.MX8MP, for HDMI audio, it is separated into several hardware modules:
1. Aud2HTX
   driver:  sound/soc/fsl/fsl_aud2htx.c
2. HDMI PAI
   driver:  this patch set
3. HDMI TX controller audio part
    driver: drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c

Aud2HTX is in the Audio subsystem,  HDMI PAI and HDMI TX are in the
HDMI subsystem. The full data path is
Aud2htx -> HDMI PAI -> HDMI TX controller.

>
>
> > +
> >      required:
> >        - port@0
> >        - port@1
> > @@ -98,5 +102,13 @@ examples:
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
> > index 000000000000..4f99682a308d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai=
.yaml
> > @@ -0,0 +1,69 @@
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
> > +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between t=
he
> > +  Audio Subsystem to the HDMI TX Controller.
>
> What is Audio Subsystem? Like Linux Audio or some name matching actual
> hardware?

Audio subsystem is the name for hardware.

>
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
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: apb
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Output to the HDMI TX controller.
>
> And how do you plug it into sound card? Where are any DAI links?

The hardware data path is Aud2htx -> HDMI PAI -> HDMI TX controller.

From a software point of view. the path is
Aud2htx -> hdmi_codec  (ALSA sound card)
hdmi_codec -> dw-hdmi-gp-audio -> hdmi_pai

hdmi_codec is registered by dw-hdmi-gp-audio.c,  hdmi_codec will call
the function in dw-hdmi-gp-audio.c, dw-hdmi-gp-audio.c will call the
function in hdmi pai driver.

Aud2htx is cpu dai in ALSA
hdmi-codec.c is the codec dai in ALSA
Above is the dai link for ALSA, they already exist in the kernel.

The HDMI PAI is the bridge, which is covered by this patch set.

Best regards
Shengjiu Wang
>
> Best regards,
> Krzysztof
>

Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473F0191493
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753256412; cv=none; b=h2SIuvbojSkfDtpp8OPRvaJhH+nwjymIaWwkTy0RL57iOSGv9Nyg6sayy7j+bg0rBfl1arGhoeNf1HxtHytp0vAZF/FXDgPy8pRYcG7Gf8akLILJ5f7aAzNyyHhsaUYStARpYbVmBNKiRC56aBSFWe+4Dwie5JsuYbOXVSjbWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753256412; c=relaxed/simple;
	bh=YsVapOu3EE9tFDs0Jdu77Bx59dIcgo7GphpDAmjUC1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxw2FjtwVu4wrO82L7fvrl9esOLZVVDs9hlotH6InhzD981iZIJIIpjYYdNp1opBdBiZVpGkaTYwR+7Ic6yV78VZlLe+kJh1XeNPFZN1bnG1YGXE+ZFbpCqzhQR2T65GodS15KGd4MG2dGBAqK3z1+yWDzX+MdU37rk7y9DHzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OndzDpwX; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OndzDpwX"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ddb4a7ac19so26239285ab.3
        for <imx@lists.linux.dev>; Wed, 23 Jul 2025 00:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753256410; x=1753861210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbcyqc764F2sEfaCBH+UYC7rWjF6m5+2vt4yx/ptU5M=;
        b=OndzDpwX5AsAObQ8plJU1UPPaba+f25f6Dzz02QUzOy6aSU0SmNRSzjGHnlB99DkoL
         9z4F5VVE00CcmPgZR6dBJAxSSUsJsv7lCqI4JHxtK8ROPcS+58wbfD+IDxt+D74U4/UU
         Hto6MKJATgUV48shfcTEZ84jWOAkjLGJ3S0Uh268exzSYOABG9XqYSuPy/9cVpk3Fai2
         RhzWgFZKT3NlKWVvclZavvv4TByTp5HERYAQ8x7CVH6dpYBLXKK7+375DAMpVcIpVu4Q
         OXKZIUHcWxUBKZs2BwOxJXio8Ys7ilsXOhh1JR6YOhMM8d+fWc8QVFKC9U8IMCcnSPQj
         vxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753256410; x=1753861210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbcyqc764F2sEfaCBH+UYC7rWjF6m5+2vt4yx/ptU5M=;
        b=c05x+y/Vi+nzQBul+NVucDCsVnB/hxkGUSBGzJEtZE2DwheBYw9YGog46Kf553aXTD
         R7qiDeqa9Vb9yu6TJTCP0Md+1YrUwCt7rSch7hrNZTqtoyghYKJDUXw5CWtcdypOw5oj
         vUNUNWtM29PwFJhD+Zo3nhC1LVbmD4pV84aGysUoiDL6uSb0srleA9AUfiwObcpf4dyt
         bLDG+LUOJ5kKRn/e+8gSs8FxmWjy9SVP+XwwkT1Jeza4N42ZalIdvwimdcn2PiN1NK2W
         tmiNgQMds1gfoVoVH1K1ENlzZfUyL70kusV6TSaTdSG+xdXgbcfaVDpSasyiiT6nwl+G
         kjig==
X-Forwarded-Encrypted: i=1; AJvYcCWvOl/PTyezijPtUjB9jcyvZgiy/3cS2nkX80R42lB4mzuiRgyJ1iqP57tt1MmsBue/mos=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy97pUTHLRI5l9VGKNU8L0ttLooR3AWGRzLToWxBquv1l878GgW
	JMojbWK29XALadAHXWn18mAePbyJOn5Ti2ixHImzD9MyujGTKTfHbTBTYThYVLd5/A2KacaYt84
	Kn2BIV9qpleRblffdxoRZXqCH8WRpDwc=
X-Gm-Gg: ASbGncuMI8AWwmoaGFewQY8hvTJ0eFfNuCtlA0Qz7un1mus4L/AoTtMcu+jm9VpPeYw
	rRt+dIzg3TfA9NOMLCXvY5xSfLoZsi+9t8QiB354IwZlS1oYnkk6YbCllu1QlDO5N9l4H/jmpAs
	Pj+F2G+w6Hq9BNOepCevkgZEBtmneBjumQ0CNr9+Ikhww2EwH52UAEYlOHwW38bIttkXWtg7d/P
	wwbRcg=
X-Google-Smtp-Source: AGHT+IHOQzFpAKaWouHfVtjkvOSjGIpAMkfJ0fzLv3wWAksIErfPgEwi7A4hu+IQvIt5kc5elxr2GeZinpnDwDpuoiI=
X-Received: by 2002:a05:6e02:2483:b0:3e2:99f3:9c5f with SMTP id
 e9e14a558f8ab-3e32fc0705bmr33701305ab.9.1753256410269; Wed, 23 Jul 2025
 00:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-4-shengjiu.wang@nxp.com> <a5621775-5032-4422-80bb-5f8f60351dbe@nxp.com>
In-Reply-To: <a5621775-5032-4422-80bb-5f8f60351dbe@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:39:56 +0800
X-Gm-Features: Ac12FXzRGVFmJEyGYLyQXwRt2VBDjuGoJJq-BPWCprf56oset2phf0Q2wkTdTTc
Message-ID: <CAA+D8ANb7kZETxO_CQazoz6-DiNCOGivLhJVwhw9p78ynP1ntQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PAI
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 3:16=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/18/2025, Shengjiu Wang wrote:
> > Add binding for the i.MX8MP HDMI parallel Audio interface block.
> > As this port is linked to imx8mp-hdmi-tx, add port@2 in
> > fsl,imx8mp-hdmi-tx.yaml document.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
> >  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pai.yaml
>
> Usually, to add a new driver, a DT binding patch comes first.

ok, will move it to first patch

>
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
> Can port@2 be optional?
> Note that video output can work with only port@0 and port@1.

yes, it can be optional

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
> > +
> > +properties:
>
> In i.MX8MP TRM, HTX_PAI block diagram mentions an APB interface.
> Does it mean a clock is needed?

The APB clock is bound with the power domain, so no need to add it here.

>
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
>
> Why do you need this line?

per my understanding, this line can be added or removed.

>
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
>
> Unused. Drop.

Ok.
>
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
>
> Drop this blank line.

Ok.

Best regards
Shengjiu Wang
>
> > +            pai_to_hdmi_tx: endpoint {
> > +                remote-endpoint =3D <&hdmi_tx_from_pai>;
> > +            };
> > +        };
> > +    };
>
> --
> Regards,
> Liu Ying

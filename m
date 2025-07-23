Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9956248F4F
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 06:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753251269; cv=none; b=SyYTRwnw9GLbIHkjHCZTUs7xxLwGb3livtPtT3Af5P9ESrrW3dcQX/jCvml331MOcSV1YlTZOd5QNylKRwObmqgOtnU3mO1Ga7TRzUN0WxB3tg3t8DAmjMQrrrVVk4UjRE4csc733R4sD0tPq/9c70ZwHxeYkJ+kJy69jANtxsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753251269; c=relaxed/simple;
	bh=YxujTbwbI2eJLNA8ZAh79ndTt0XBy+IQ4GuCHo7fhlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8XLJjv74MuoT0/uIpGIe/M2mtMPLxhzAcSsSodTpFa/7PuRZuqcHxWWBiuO4rURPK4ML8RVhTS2Qqky7ogeKpDMVhjHuBmB5H7jPhsE5s/nI9KG/e2c7il7yTz3pbgqGPXzSeojOFNfqVu1eKSDOA30pG8YwC7f/1Rcq6X23p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LgB31714; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LgB31714"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8d7ad77e4cso4539983276.1
        for <imx@lists.linux.dev>; Tue, 22 Jul 2025 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753251267; x=1753856067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L2T2WbrDBkOj5NgHEVZycr71r0FjGHDnI1AHP29ZlA=;
        b=LgB31714T3fUPkBERhHpMc/5EkxMp6IgPtg6jj/y2PL9s6uLADIHL68Z56XhKZMipP
         yupXEFUFldxbYLOmJO4TrFr8TBUNezVy+0bCU0z5pcHz9fgQRZpivNhVoza6umxzmye2
         uHzUkG3itDO/gkQuhsPdZ14XALpPFDYtYUJgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251267; x=1753856067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L2T2WbrDBkOj5NgHEVZycr71r0FjGHDnI1AHP29ZlA=;
        b=i2gzjn+UjHNg14xqt8NkwB0V6ZDoJMJ1lsTFIFR1uryN/ChCFmoWC8OQh5tC/ay32t
         JgxioTeyrbcBkc9SCBbZYFH65+cyV7t4f+EpwtiWD7ojhcaSPtHOsmz5H3Ue3iJstajK
         nfPkaVpMew1GuQYZd6CDPOtNrx8524HGOQWYvJ94X6Kq8jm4bM1EcbYnjSyIwVA1RwyG
         thO1y6zkrgnthIFVrRZiLlCKVSKVhio/5UhZKx6D7BJbaiTcJdJUN/mXSkmQ6hmHu+ls
         WREe1JpE/CrjKbVi05NfcE+k33+Fw8DVFSU4Y8q43vwv/WiWsMErzi0dKHVRfeUqHoL6
         ta6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjdiH+QMVrnDiJ734hm19KXrMdvHcFkmJscxJDnZ0J+Iz4lp+cGazR6IH8nBGvMS6AcmE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxM3NgjDOEfK08mMsVh/CAiwPPQzuTndGV9+G160ltoTLLCirNL
	goYzhHM3KT1uVBxOLnLwRHaDFGhYsygDQGQ9B1RKj4nJlcQ7OcztvmnNDBhgizDnTPuXtnfifmR
	/DPsYy9t5ef3kDxaNomioNPhlqKLQDogoh7iYBJjf1g==
X-Gm-Gg: ASbGnctGwToUuFoseyFZ61y2jrcYfaZF8G1Exv4waRGhUHYcAZv085bei0RdLKnJ76b
	hVMNYv2PfPc1ippKPredgZeMLYVVxVQLgUDMxAHTFJw6L6xnltAJiPoCEnpzIa8wZuyH+dBAKKU
	WkBKf8fhzjcQvXWGqdCY13BT17E99fCNDPffIjsUiygQkDZ5U8CLWlXXAzKfZfQMWlFdh9vL1Kg
	CPjZA==
X-Google-Smtp-Source: AGHT+IGU0x3OvvND31qkZ6iwUV66X3FjLoR9rEUgX0VQD3a1aWSZZ/aNnjUtca65XDKxhVdatJlHhz31Mn+Kuu8/LA0=
X-Received: by 2002:a05:6902:460a:b0:e8d:718f:cffa with SMTP id
 3f1490d57ef6-e8dc57ce7c6mr2095334276.6.1753251266610; Tue, 22 Jul 2025
 23:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com> <DU0PR04MB94966B1D445966C0E7C1BDF2905FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94966B1D445966C0E7C1BDF2905FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 23 Jul 2025 08:14:15 +0200
X-Gm-Features: Ac12FXz0WI4bR7Hq_kkcybVAzkogiCFRyLtm4ogxkiM3lU26r-r_CiasJXOihmg
Message-ID: <CABGWkvpDY99-0FKi2VO+Pa4hSoEfFCAt7ZAgaVfeqqCqcOYWrA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
To: Bough Chen <haibo.chen@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bough,

On Wed, Jul 23, 2025 at 4:45=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wro=
te:
>
> > -----Original Message-----
> > From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Sent: 2025=E5=B9=B47=E6=9C=8822=E6=97=A5 18:36
> > To: linux-kernel@vger.kernel.org
> > Cc: linux-amarula@amarulasolutions.com; Dario Binacchi
> > <dario.binacchi@amarulasolutions.com>; Conor Dooley
> > <conor+dt@kernel.org>; Dmitry Torokhov <dmitry.torokhov@gmail.com>;
> > Fabio Estevam <festevam@gmail.com>; Bough Chen <haibo.chen@nxp.com>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Rob Herring <robh@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>;
> > devicetree@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-input@vger.kernel.org
> > Subject: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: a=
dd
> > fsl,glitch-threshold
> >
> > Add support for glitch threshold configuration. A detected signal is va=
lid only if it
> > lasts longer than the set threshold; otherwise, it is regarded as a gli=
tch.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.ya=
ml
> > b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.ya=
ml
> > index 678756ad0f92..2fee2940213f 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c
> > +++ .yaml
> > @@ -62,6 +62,23 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  fsl,glitch-threshold:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0
>
> Here the default should be 2 according to your third patch.

I considered the default value of the register, not the driver's.
If I'm not mistaken, the dt-bindings should be a description of the
hardware, not of the associated driver implementation.

>
> I'm okay for this patch set, let's waiting for comments about this yaml c=
hange.
>
> By the way, any real case which need to use other glitch threshod?

We recently submitted
https://lore.kernel.org/all/aGUDza5XRGDqfz5n@dragon/#t, and in this
initial contribution we removed all the custom parts that are not
supported upstream. This is
one such case. For our board, we need a de_glitch value of 1.

Thanks and regards,
Dario

>
> Regards
> Haibo Chen
>
> > +    enum: [ 0, 1, 2, 3 ]
> > +    description: |
> > +      Indicates the glitch threshold. The threshold is defined by numb=
er
> > +      of clock cycles. A detect signal is only valid if it is exist lo=
nger
> > +      than threshold; otherwise, it is regarded as a glitch.
> > +      0: Normal function: 8191 clock cycles
> > +         Low power mode: 9 clock cycles
> > +      1: Normal function: 4095 clock cycles
> > +         Low power mode: 7 clock cycles
> > +      2: Normal function: 2047 clock cycles
> > +         Low power mode: 5 clock cycles
> > +      3: Normal function: 1023 clock cycles
> > +         Low power mode: 3 clock cycles
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -94,4 +111,5 @@ examples:
> >          measure-delay-time =3D <0xfff>;
> >          pre-charge-time =3D <0xffff>;
> >          touchscreen-average-samples =3D <32>;
> > +        fsl,glitch-threshold =3D <2>;
> >      };
> > --
> > 2.43.0
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

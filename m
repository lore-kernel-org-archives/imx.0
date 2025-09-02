Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B80A20766E
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 06:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794298; cv=none; b=DvWE4XRuBboJUUovjBkrevMAVPYSyKveD8ebmjRCwGF/ZVuwRsKFG0amve+uAqq5Rr1awL4uGRiI+C1TqzbcUUvjBlvg18MUUhcUBve8GOCBhokcrjVI3blGIk0s+HCQBDBoXkNpAiCZ1ALLFKWMvjFBuQxadOFDhFvThS1L7XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794298; c=relaxed/simple;
	bh=/X5tvcuJAxWn3JDYkNwSrjpsesfg6FURaUkJpV2ccGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kgnmct3yXYMPll7SJ7yul6TWGuuKgknuqmpuhKzh7HJMdeA/ZF1m6zEuqb9De5Ez1Eb8ufny9l4BY0ENbuaCJg4m8ehFp2S3xIyT5CznYsbiWslC0t/O1g79oyIKM0LLK4Wdo64QnRd1jZzEMqCr3oMQWQNhn4ytx/qzV+6ZP9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KWHR2cD3; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KWHR2cD3"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e931c71a1baso6862494276.0
        for <imx@lists.linux.dev>; Mon, 01 Sep 2025 23:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1756794295; x=1757399095; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7vWWxNzseg54QZAjivUxxK0pnJ4DlOhxfw0ykDICyI=;
        b=KWHR2cD35yx4U/e8vlpzEcLlDlucJ81qnxZe2Ce0WV/3bEL+IJLdWi/5HgUO5lJq7J
         cVCVW2NI9fbj2yxIwOOWY2WLmHxhIjmssz7UhNExz0WiCNB/RXFl9X6lCb1NxWNHvDE6
         nvbhNxEchj3z2SdPxxaM2GTN4roozbtmYAPnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794295; x=1757399095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7vWWxNzseg54QZAjivUxxK0pnJ4DlOhxfw0ykDICyI=;
        b=KWozLQ4xwIi1PH99zpQoKDL7XONNlWI6G/Fe4o97VnTo8Awx+T0oa69wXWeHQhnniU
         T7zITq2IQVP4SxMrjU9wk+CQju+yyU9p9qSbpNyZ3i0B7SkWy0z5+rbJTB9I/Nk4gTwN
         wE9NYLEM3hx7AYsZSsqdsUI+A7ogLBdzRdbM0L47LNt3fj+/pByPdMJEmCtrmfM0gQbs
         +A5s76pJS9LsItTOzc5GVtuJJV1lANrRjSikAcm1U9EIeoE/4MHU2gPOSUsqET1gkr8z
         QAq7BlKeQNF8z6r0OeGC6GZm7Z0nkvjj6uZIFn7upPhWdpMjYBM4uvMWeAbXMCJxI2b/
         S0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWF4S0faP39lg+01ZKt/znjz3aDTjBsWlesBkOIcBHNaMEHQfGWXUxKOrQHS4pxazAh4F4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxvEJ9KBGEv66iUVFN6CVMAuQXiQtYOcdgEy/JMPWBxWQZNFxg
	XGHP6j9SQ+PGvdXnu5DFRkOpJm0hgklgvdG9s/Tvuf1M/9ciVfkEh+Cs5FDQgBa7TisgqiWTOnd
	O5831g79XEAXruJWEBsE4Srm3ofiSdVh80YUvaAQxFA==
X-Gm-Gg: ASbGnctT8lOWPKYggAp/gHboCxrbBtNADi2tpYWzFXh1ZqH4SyT+LDfh0ci6kw59Ctd
	AIkwLq8qgo98pacPdsT937S67ceHYCSXkxh77na7SS3hj1PtbJLEwInN9vwd+/PG2eYXLPzJz7u
	45zZdQk/oi2s5ZhI1RwHEZFcASBHBVdZYVhduxRso0s0SnOVWVj2aqIfgGaodq0xxFbtfTZmQ44
	kgv5/gMQsBHn4Zb
X-Google-Smtp-Source: AGHT+IEC+bhwfIsYKYd4OXHEYbsF24ESl19VnrU0Lm+wzyoJZpbOTOeMhCWWexm/yC9IvNQdZvyYLuGaB9Amv1jSkRs=
X-Received: by 2002:a05:6902:e03:b0:e96:ec6a:26c7 with SMTP id
 3f1490d57ef6-e98a567eea7mr11493602276.0.1756794295489; Mon, 01 Sep 2025
 23:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
 <20250723050319.GA1239529-robh@kernel.org> <CABGWkvpWPXz8bFPC3OgqY+C6cgu6hHGh6muCQkoCOEVK048fSA@mail.gmail.com>
In-Reply-To: <CABGWkvpWPXz8bFPC3OgqY+C6cgu6hHGh6muCQkoCOEVK048fSA@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 2 Sep 2025 08:24:44 +0200
X-Gm-Features: Ac12FXxEccgAI8M5f9oOb9ii1ya7raF_SCejPp9-Hl3t92BIFWLzJIdX2D6ZhXo
Message-ID: <CABGWkvqazpyra=n5Jswon576pGG7yEOQg=_qdpTM+X6WmHP43g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rob,

just a gentle ping =E2=80=94 I=E2=80=99ve replied to your comments on this =
patch, but
I haven=E2=80=99t seen any further feedback.

Thanks and regards,
Dario

On Wed, Jul 23, 2025 at 8:25=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> On Wed, Jul 23, 2025 at 7:03=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Tue, Jul 22, 2025 at 12:36:16PM +0200, Dario Binacchi wrote:
> > > Add support for glitch threshold configuration. A detected signal is =
valid
> > > only if it lasts longer than the set threshold; otherwise, it is rega=
rded
> > > as a glitch.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > ---
> > >
> > >  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++=
++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,=
imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,i=
mx6ul-tsc.yaml
> > > index 678756ad0f92..2fee2940213f 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-=
tsc.yaml
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-=
tsc.yaml
> > > @@ -62,6 +62,23 @@ properties:
> > >      description: Number of data samples which are averaged for each =
read.
> > >      enum: [ 1, 4, 8, 16, 32 ]
> > >
> > > +  fsl,glitch-threshold:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    default: 0
> > > +    enum: [ 0, 1, 2, 3 ]
> > > +    description: |
> > > +      Indicates the glitch threshold. The threshold is defined by nu=
mber
> > > +      of clock cycles. A detect signal is only valid if it is exist =
longer
> > > +      than threshold; otherwise, it is regarded as a glitch.
> > > +      0: Normal function: 8191 clock cycles
> > > +         Low power mode: 9 clock cycles
> > > +      1: Normal function: 4095 clock cycles
> > > +         Low power mode: 7 clock cycles
> > > +      2: Normal function: 2047 clock cycles
> > > +         Low power mode: 5 clock cycles
> > > +      3: Normal function: 1023 clock cycles
> > > +         Low power mode: 3 clock cycles
> >
> > Don't we have common properties for this expressed in time? Debounce
> > time IIRC.
>
> I tried checking in
> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> but I didn't find anything about it.
>
> It exists in some specific touchscreen bindings:
> - azoteq,iqs7211.yaml
> - brcm,iproc-touchscreen.txt
> - fsl-mx25-tcq.txt,
> - ti,ads7843.yaml.
>
> Only fsl-mx25-tcq.txt expresses it in terms of time (ns).
>
> Thanks and regards,
> Dario
>
> >
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -94,4 +111,5 @@ examples:
> > >          measure-delay-time =3D <0xfff>;
> > >          pre-charge-time =3D <0xffff>;
> > >          touchscreen-average-samples =3D <32>;
> > > +        fsl,glitch-threshold =3D <2>;
> > >      };
> > > --
> > > 2.43.0
> > >
>
>
>
> --
>
> Dario Binacchi
>
> Senior Embedded Linux Developer
>
> dario.binacchi@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions SRL
>
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 042 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com



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

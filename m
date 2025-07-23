Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FCD25DAE7
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753251956; cv=none; b=B7DnZY84UTo/8n2yQhbf6BiD+nzg8J5jK7pTU9yDZZuqOsq8nCpXmNw9euqx1ZIPbw/c1QFO7G5q4l7Jt9uSKyku3jgDPJIgki82Py55KIgpD8uwJuzg6mWQWfuTTkFZNpBSnfCl0W7lSH7yYatK/2JgIH9zU6sCQoQyKuTnEAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753251956; c=relaxed/simple;
	bh=rjVLg+Kx2yGpOGWAmrHV1jRFLlfqEIuxLIrSCY7YtLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IER0rhUQHkLKGb/IoJ3lw+dVZu2POkOrg7r7u/DcoJCK1c6/7b70FOJ5D326Kvk1DnEwo7MbDTRkDz/KNiFQaBtNIjTATCPF1tgMTijMTP8dxiWFWAGm6nSkdsSott0m7AJBYuzozuitZryZrmQr5pmwsbjCPO8hM1qB6UEGh1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TH14NFnt; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TH14NFnt"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-719a4206caeso15899717b3.1
        for <imx@lists.linux.dev>; Tue, 22 Jul 2025 23:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753251954; x=1753856754; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGZYO2e54F3r+OK1iTp4D/RkgP/MYmQ/jepAEaRz8qU=;
        b=TH14NFnt8k/CPvU8CyTMMCgEN4yvU1EMJHYXv87xAP8oJYQbRfkcJ2nsuWPVO5o146
         iDckGDsWL/HvyCDGXoGqueZIRzw//NdCXjK/ge4G33ay9VVf0D/2kxJzrFZb7UIrTQDh
         swNfK3M2rK9wlOD3Htcu95P4h0joDntEKnKSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251954; x=1753856754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGZYO2e54F3r+OK1iTp4D/RkgP/MYmQ/jepAEaRz8qU=;
        b=bhBsPh2UkPn2zJIe+nUwa9dacuhesj8pPyiSH5WzKOG3Ad7dJteCcmiauaMDTMFsQX
         WHsX+3Kcw/lL6bzLBznWrUNyR0x0vfqQfdaiC8ipMiOuERSDQ0NzkCsDXNPnJlacsj4e
         K+2l7p2UvyOmf9Ylo0t56G30ntd/bB4x4JFUyC8CSm9QzbbSNvK/S0XIlBU7Rxcdr/aB
         uv1u8ek1igGHsnwwCzZBc0dK6ytr9VhgOvp0Ky4tMen6/32vlW9IBcsY40aSqIME1JrO
         PMaFw9ggRTXg80pWKCwaslwzHCdNS3Dmg9RsWwwg79o5cbM7i5JUWsKRFC/WwUYVjzKS
         Iz3A==
X-Forwarded-Encrypted: i=1; AJvYcCWYC8wgLd93qeh0JDwOK5gLTYRkueQB5Crsk4cVUCV+RCmhbWazMXBPQecA2VXgRnR3MVM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz66Vy6GRs/M6mN6cS5gSYBd0F1OtYfAGjEEfLC7BJwYTXkHYmY
	LnunP+9qu8ZjvXnfPxR2sjQvQTP9MHldLWJANvLokBL8kl0WYW4jIepHQqG+1QXRWTZp9MG5LEh
	UFNSwfzfOB2zuKFMUZak+Ho3tWV7XgQPJ2+dlXJB8pQ==
X-Gm-Gg: ASbGncs/pRnTlmq4q+PyNSlKfmVhJEyo9pddqdwuPYCkvfLSqAypCb2cJU0BQT/qoqo
	PZoO9UCoiQ2BI3WG+dzNcSjC+HM8FFCR7AnQjya6pyD1/DFewShiRUXUS4Sj4M3DpjK537S2x9a
	J2648iLQwgqTEAW/Iar6Q5DIXZOEmwhdqijYd2spBGD+d8sum5zNQKvCKJf02tOBPMsGNoHgr3Y
	LnQ1Q==
X-Google-Smtp-Source: AGHT+IHv5nL6qViIs6gJAMz6sbFRUndksqf/qf03+nefju0bAxUOnsbQF6PtkZC5WvhFVsjvSryN5UHwWNkVm2efPGw=
X-Received: by 2002:a05:690c:3347:b0:70e:1874:b914 with SMTP id
 00721157ae682-719b4133d40mr24952697b3.9.1753251954012; Tue, 22 Jul 2025
 23:25:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com> <20250723050319.GA1239529-robh@kernel.org>
In-Reply-To: <20250723050319.GA1239529-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 23 Jul 2025 08:25:43 +0200
X-Gm-Features: Ac12FXyzezWWf_pUFGOcPk-V-mRbQEUXptOJkigIidJmFt9VjBBdYB7tr8ictgw
Message-ID: <CABGWkvpWPXz8bFPC3OgqY+C6cgu6hHGh6muCQkoCOEVK048fSA@mail.gmail.com>
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

On Wed, Jul 23, 2025 at 7:03=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jul 22, 2025 at 12:36:16PM +0200, Dario Binacchi wrote:
> > Add support for glitch threshold configuration. A detected signal is va=
lid
> > only if it lasts longer than the set threshold; otherwise, it is regard=
ed
> > as a glitch.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,im=
x6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx=
6ul-tsc.yaml
> > index 678756ad0f92..2fee2940213f 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-ts=
c.yaml
> > @@ -62,6 +62,23 @@ properties:
> >      description: Number of data samples which are averaged for each re=
ad.
> >      enum: [ 1, 4, 8, 16, 32 ]
> >
> > +  fsl,glitch-threshold:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0
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
>
> Don't we have common properties for this expressed in time? Debounce
> time IIRC.

I tried checking in
Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
but I didn't find anything about it.

It exists in some specific touchscreen bindings:
- azoteq,iqs7211.yaml
- brcm,iproc-touchscreen.txt
- fsl-mx25-tcq.txt,
- ti,ads7843.yaml.

Only fsl-mx25-tcq.txt expresses it in terms of time (ns).

Thanks and regards,
Dario

>
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
> >



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

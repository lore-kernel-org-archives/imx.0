Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB34149DF8
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720182268; cv=none; b=R4pODk9KKogSCVq2ZsgzgHoBs/xE8p9NDP2PLt0oeo+/bN1TQCwl1msnsXVCPgx3vlIJv06Q5cHbBMs7iGnWxPif/eBJKY4tLssnqmT7RluyP0t40XCIppHsSMr04n0JDf/4C88SA4PRmVk2vYEdz2AXrLazLz4gA0svzmCvsvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720182268; c=relaxed/simple;
	bh=qyZ4pgN9ODC0BjiNwh5o1P10S3yVrnbu2zdf6ekHKXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjbVmjGUCvhpBXwzHnGYfilsOZ+d0D9fNPoVXKgmKLTN5RqAtGTwHxBfeepqrJiBzZ5/xe+irbkmAkvIh+89cEn6jaO0hwf/iwh4Wjw1rAtDjAe0cXyStUD2LtNzwACPLCZ2ZZk4gt+chDkbxxcuzy86YStOUodbA+/VbhMRMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kurRehxz; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kurRehxz"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a77cc73d35fso97324866b.0
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720182264; x=1720787064; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iabrIAMUEOTL61vdHDoYq/UZjIRy45Aj4kyep8lAuoI=;
        b=kurRehxzv5quBufzeuwUWHGINmkdox2EqhUE6Inn79890XHhkoRIhhrLngQw1Zhx6I
         yiRvpYFfMctv1VglhJ14gipMzxkW81sT2UxqRwYu0qZPkKprhxnWP3QyGCExdTVhwkA5
         MHhswwA06dMXHI6b7Tg+DGUKRKwwx04EwnFg65GxTxeNbtsMC1Aw3g6zn1go2H0+Py+Y
         +2iCHXThxstGlxFzGkB37LC60UYttMhM/UGFm+Ginp7ZFhQJOc/9F15p8JsNh6FxBwxb
         OS7KrhzffEEOoma+fui73QgnDf5RxnPTgeB6DqOw0VAGnF/6uIUk18DZ9Z6lVGXjvHRK
         bUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720182264; x=1720787064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iabrIAMUEOTL61vdHDoYq/UZjIRy45Aj4kyep8lAuoI=;
        b=sRzdlvY4pJGUgV7jaKFcuK23+gfWhtJ1kc1RmYFxfEcfGhiSLcCZJ1lebDfkgftyTN
         Hn8UNEUzEO7S8rgng3LGhSu0ILXBJTCoTOBXF0SrLDJRE8gqdCj0PiwTeKYd1DSViEo5
         gZsDMt9tydz87rZ0j6jCcl+lSAt72kFalsjxmyex7wyO0CbK9xK1y/M0XtWlQap5GKKa
         VJx4cPeMaZIMvpm9mzLrYVjVGowxoXKurxCGt7Fa7FPRGGabwBDp7OXStda+V3ge6+sw
         87WYBUr3nYXGQlRWVk4lOHQ+d5GvDGd9h8YXhueLCmKIjSeCGk/Fl/och3m2v0+VbmeL
         uWzA==
X-Forwarded-Encrypted: i=1; AJvYcCUdOsj5wu9HVptsVm2wk3mzXAAI9GeydP3I7NjFhRayGJfu1JMPPwbYvNDnBrO1ks4pwDwGeSEBZLwmTZieuh+tQBwu
X-Gm-Message-State: AOJu0YwQ1NXGZclg8xbgTL25kSpNQFZvPrXPToHEjdEE+5L4sVmZ7OuB
	ZNb2fuJXMU06Qnau4fYhW4JAB1zB9BfvcPniGYAVIk7ssNGGSfJQTL43baZF1nf1QLBFa2tK6yD
	OHYIhBmYs5goycl35+Zh3Dp0wmNY=
X-Google-Smtp-Source: AGHT+IEkwLYq9DV+FyUhDlmnP1mMXhabJ2ZHkHkFRFF3nDAXxGnMPurbx/i4zDvRg7nKq8uR0YUrjTeOGYI9xZwgGlU=
X-Received: by 2002:a17:906:b751:b0:a6f:4287:f196 with SMTP id
 a640c23a62f3a-a77bd99ec1bmr292931566b.2.1720182263880; Fri, 05 Jul 2024
 05:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240622182200.245339-1-animeshagarwal28@gmail.com> <268a722a-c2e8-42fe-9cae-104e3f082a0a@kernel.org>
In-Reply-To: <268a722a-c2e8-42fe-9cae-104e3f082a0a@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 5 Jul 2024 15:24:10 +0300
Message-ID: <CAEnQRZBXTkQCwAyy6i1k_hb5ts99p4Cd8bihLu7bz+4TfJm9wA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,imx-audio-sgtl5000: Convert to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 10:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 22/06/2024 20:21, Animesh Agarwal wrote:
> > Convert the imx-audio-sgtl bindings to DT schema. Make bindings complet=
e
> > by adding audio-cpu property.
>
> On what basis? Who needs or uses audio-cpu? Driver? DTS? Both? If only
> DTS, then is it needed? Maybe not?
>
> >
> > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  .../sound/fsl,imx-audio-sgtl5000.yaml         | 108 ++++++++++++++++++
> >  .../bindings/sound/imx-audio-sgtl5000.txt     |  56 ---------
> >  2 files changed, 108 insertions(+), 56 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-aud=
io-sgtl5000.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/sound/imx-audio-s=
gtl5000.txt
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-audio-sgtl=
5000.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-audio-sgtl5000.=
yaml
> > new file mode 100644
> > index 000000000000..906dcecb73b7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx-audio-sgtl5000.ya=
ml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,imx-audio-sgtl5000.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX audio complex with SGTL5000 codec
> > +
> > +maintainers:
> > +  - Animesh Agarwal <animeshagarwal28@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,imx25-pdk-sgtl5000
> > +              - fsl,imx51-babbage-sgtl5000
> > +              - fsl,imx53-m53evk-sgtl5000
> > +              - tq,imx53-mba53-sgtl5000
> > +              - fsl,imx53-cpuvo-sgtl5000
> > +              - fsl,imx53-qsb-sgtl5000
> > +              - karo,tx53-audio-sgtl5000
>
> Keep list ordered alphabetically.
>
> > +              - fsl,imx53-voipac-sgtl5000
> > +              - fsl,imx6q-ba16-sgtl5000
> > +              - fsl,imx6q-ventana-sgtl5000
> > +              - fsl,imx-sgtl5000
> > +              - fsl,imx6-armadeus-sgtl5000
> > +              - fsl,imx6dl-nit6xlite-sgtl5000
> > +              - fsl,imx6q-nitrogen6_max-sgtl5000
> > +              - fsl,imx6q-nitrogen6_som2-sgtl5000
> > +              - fsl,imx6q-nitrogen6x-sgtl5000
> > +              - fsl,imx6-rex-sgtl5000
> > +              - fsl,imx6q-sabrelite-sgtl5000
> > +              - fsl,imx6-wandboard-sgtl5000
>
> None of these were in the old binding and commit msg mentions only
> audio-cpu. From where do you get these?
>
>
> > +          - const: fsl,imx-audio-sgtl5000
> > +      - const: fsl,imx-audio-sgtl5000
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: The user-visible name of this sound complex.
> > +
> > +  audio-cpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of an CPU DAI controller
> > +
> > +  ssi-controller:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of the i.MX SSI controller.
> > +
> > +  audio-codec:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of the SGTL5000 audio codec.
> > +
> > +  audio-routing:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description: |
> > +      A list of the connections between audio components. Each entry i=
s a pair
> > +      of strings, the first being the connection's sink, the second be=
ing the
> > +      connection's source. Valid names could be:
> > +
> > +      Power supplies:
> > +        * Mic Bias
> > +
> > +      SGTL5000 pins:
> > +        * MIC_IN
> > +        * LINE_IN
> > +        * HP_OUT
> > +        * LINE_OUT
> > +
> > +      Board connectors:
> > +        * Mic Jack
> > +        * Line In Jack
> > +        * Headphone Jack
> > +        * Line Out Jack
> > +        * Ext Spk
> > +
> > +  mux-int-port:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The internal port of the i.MX audio muxer (AUDMUX).
> > +    enum: [1, 2]
>
> default:
>
> > +
> > +  mux-ext-port:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The external port of the i.MX audio muxer.
> > +    enum: [3, 4, 5, 6]
>
> defaukt:
>
> > +
> > +required:
> > +  - compatible
> > +  - model
>
> Several other properties were required. Why changing this? Please
> explain in commit msg all changes done to the binding comparing to pure
> conversion.

I wonder how should we handle the case where 1 compatible string is
found in 2 drivers.

e.g

soc/fsl/fsl-asoc-card.c:        { .compatible =3D "fsl,imx-audio-sgtl5000",=
 },
soc/fsl/imx-sgtl5000.c: { .compatible =3D "fsl,imx-audio-sgtl5000", },


Take for example audio-cpu propertyssi-controller which was only added
in the newer soc/fsl/fsl-asoc-card.c driver. So this is required in
the new driver unless
the old binding "ssi-controller" is not present.

Given the fact that there are already 10 years since this commit:

commit 708b4351f08c08ea93f773fb9197bdd3f3b08273
Author: Nicolin Chen <nicoleotsuka@gmail.com>
Date:   Wed Jul 30 19:27:38 2014 +0800

    ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support

The driver is also compatible with the old Device Tree bindings of WM8962 a=
nd
    SGTL5000. So we may consider to remove those two drivers after
this driver is
    totally enabled. (It needs to be added into defconfig)

I think we should send a patch to remove soc/fsl/imx-sgtl5000.c
because I assume that by this point it's functionality
was fully implemented in soc/fsl/fsl-asoc-card.c

Thanks,
Daniel.

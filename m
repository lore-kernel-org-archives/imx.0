Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724014F9F4
	for <imx@lists.linux.dev>; Fri, 31 May 2024 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717144554; cv=none; b=o1BHtVv79lNrSB2BWKqPUC16F+8gHU84U8P09ek+hnZkgvQUh5O19LBfA3N1VVrjXhPvvjnIquWYD9AqnYWi9cSHyUZrjpsD+jfzXcY7GsgqUIkgqQCCxHf1MDpt+QTm3KGUhHAbusKdSHxda6i/bUileM4kcRLuGIsQxGou5Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717144554; c=relaxed/simple;
	bh=xMKqd7o5RmFHMTyNinBae/NjtHab99yOKmQxPflfAoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjeeIEIO+Zu3LNIRHKkwDOtbmtMXxJ7um75vMevwBG5JPYJYy90ieoJ8d++x8Wm5RMPfQlrulhr692nYR4VKSTFxpOlTTLyp5ntrZ6M1ZNme4bTSgGkaAKIpe7lJ7nHj/KwbLozxMgHU03XRi3VrRKHDj1G1KdwEQEGSQ/G4pIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frjDpwOp; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frjDpwOp"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c9d70d93dbso1117999b6e.3
        for <imx@lists.linux.dev>; Fri, 31 May 2024 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717144551; x=1717749351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2juPgxcdbd1hz+pbic7lEAk0l0NWh5iJd6OWt1Xe84=;
        b=frjDpwOpe1MVXgkAFp3Z9fY76lijfK4o7r6mo+oCoo4Nr4l4mjholne429C3xXYDXc
         7t/vHF6njv+MiSo+A/psn9XsKScA3f23HarmtY/IMYkoHluLiZhvffS9VUbq70azBqdK
         G7RPnzC7eUkSKAufX7+j65exBPCrkGGURAFKXgV14eiwESzvRZWYicVeGUy7XITORVbc
         9jNzHN7Be03QGUDm0Ww4+Qgeyo4HuzKFmgHZxXVC9JhnRGmy3LF6eKDRuH0CLfiSpEgn
         J6QlREikYHhYSVJroP3nWAlZCU6oU2BXZGZr8gn2uHjbDpv0sVQALi9AjeWl0Y4ysPH0
         uRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717144551; x=1717749351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2juPgxcdbd1hz+pbic7lEAk0l0NWh5iJd6OWt1Xe84=;
        b=e+Wal7NQPSysFBXD+iiwuTVQX/OOJGPHt7KGCr++/XkqJvnG3LdAFz1ZW5xcXng89H
         VtD5wwkYItYZDFUmHSKdHUvT61Av1NHuoRhAGuFvY4SZ/bX4MUHNcZpS69t8wex19kd1
         FRDb6VGOPXUzHTdABW/4uylau1sCWAQkKbbchcz3k43oOScEgUdSnVez/Huq0/IeBoNY
         sZznNje1Yyc4F7X4nK5vGVVxHAjgm5ovVxO6B12Cx6k1mab2Mjo+l7VhsofqzpsEtfdz
         w0D13Bzbtb6jtcFB6WiL4f58GgaQhk1EJ+kRMya657iBeJZtwCKgSL4XYS8XSFGK82Rs
         62Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUkfXc09WbuWdApgDdS0pl30oCkBQcYSsRWQuyM6E7p5HVTOWzq8452h0sZgBCyS0Wh/J8jK3VNTSlDuOsDGxlns6jJ
X-Gm-Message-State: AOJu0YxSg0YmR/mgnVVp/iMa2CL/EfWH7eeVx+yGJm6Dhr8NOr5CACrY
	FEAn7rzLDw7yk2Brr2OlElcHg50RVzMebcPNM0Kt1GB0sqbWJF0GATS2KY+3oyqlzCnEBj1oUO7
	v2cv0QoLHorAGda0QVNsxAQ5VynR0tR89Yl6zog==
X-Google-Smtp-Source: AGHT+IGguiBY/fCegTOROpXSzFRFn41ShgTSJDBrr1ysGdomDhTlH0t/hjN+d285Y3ME7qfLnxr4IPqeGG9eolTrr4M=
X-Received: by 2002:a05:6870:9a14:b0:250:7a43:af02 with SMTP id
 586e51a60fabf-2508be17114mr1195911fac.11.1717144550575; Fri, 31 May 2024
 01:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240530072113.30410-1-animeshagarwal28@gmail.com> <Zlij+FgY4ul7ZwbA@lizhi-Precision-Tower-5810>
In-Reply-To: <Zlij+FgY4ul7ZwbA@lizhi-Precision-Tower-5810>
From: Animesh Agarwal <animeshagarwal28@gmail.com>
Date: Fri, 31 May 2024 14:05:39 +0530
Message-ID: <CAE3Oz80GUu_aojCqz3DAZEJx=Yo-4mYL-xtdtuN+F_BBeJ3smg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: dma: fsl,imx-dma: Convert to dtschema
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 9:36=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, May 30, 2024 at 12:51:07PM +0530, Animesh Agarwal wrote:
> > Convert the fsl i.MX DMA controller bindings to DT schema
>
> nit: need "." after sentence.

Sorry for the typo here.

> >
> > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > ---
> >  .../devicetree/bindings/dma/fsl,imx-dma.yaml  | 58 +++++++++++++++++++
> >  .../devicetree/bindings/dma/fsl-imx-dma.txt   | 50 ----------------
> >  2 files changed, 58 insertions(+), 50 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/dma/fsl,imx-dma.y=
aml
> >  delete mode 100644 Documentation/devicetree/bindings/dma/fsl-imx-dma.t=
xt
> >
> > diff --git a/Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml b/D=
ocumentation/devicetree/bindings/dma/fsl,imx-dma.yaml
> > new file mode 100644
> > index 000000000000..f36ab5425bdb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/fsl,imx-dma.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale Direct Memory Access (DMA) Controller for i.MX
> > +
> > +maintainers:
> > +  - Animesh Agarwal <animeshagarwal28@gmail.com>
> > +
> > +allOf:
> > +  - $ref: dma-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx1-dma
> > +      - fsl,imx21-dma
> > +      - fsl,imx27-dma
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: |
> > +      First item should be DMA interrupt, second one is optional and
> > +      should contain DMA Error interrupt.
>
> items:
>   - description: DMA complete interrupt
>   - description: DMA Error interrupt

I'll add this in v2.
>
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  "#dma-cells":
> > +    const: 1
> > +
> > +  dma-channels:
> > +    const: 16
>
> I think it should be maximum: 16

Agreed! Changing it for v2.

>
> > +
> > +  dma-requests:
> > +    description: |
> > +      Number of DMA requests supported.
>
> No "|" need here.

Removing this.

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - "#dma-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dma: dma-controller@10001000 {
>
> needn't label "dma".

Removing this.

>
> > +      compatible =3D "fsl,imx27-dma";
> > +      reg =3D <0x10001000 0x1000>;
> > +      interrupts =3D <32 33>;
> > +      #dma-cells =3D <1>;
> > +      dma-channels =3D <16>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-dma.txt b/Do=
cumentation/devicetree/bindings/dma/fsl-imx-dma.txt
> > deleted file mode 100644
> > index 1c9929d53727..000000000000
> > --- a/Documentation/devicetree/bindings/dma/fsl-imx-dma.txt
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -* Freescale Direct Memory Access (DMA) Controller for i.MX
> > -
> > -This document will only describe differences to the generic DMA Contro=
ller and
> > -DMA request bindings as described in dma/dma.txt .
> > -
> > -* DMA controller
> > -
> > -Required properties:
> > -- compatible : Should be "fsl,<chip>-dma". chip can be imx1, imx21 or =
imx27
> > -- reg : Should contain DMA registers location and length
> > -- interrupts : First item should be DMA interrupt, second one is optio=
nal and
> > -    should contain DMA Error interrupt
> > -- #dma-cells : Has to be 1. imx-dma does not support anything else.
> > -
> > -Optional properties:
> > -- dma-channels : Number of DMA channels supported. Should be 16.
> > -- #dma-channels : deprecated
> > -- dma-requests : Number of DMA requests supported.
> > -- #dma-requests : deprecated
> > -
> > -Example:
> > -
> > -     dma: dma@10001000 {
> > -             compatible =3D "fsl,imx27-dma";
> > -             reg =3D <0x10001000 0x1000>;
> > -             interrupts =3D <32 33>;
> > -             #dma-cells =3D <1>;
> > -             dma-channels =3D <16>;
> > -     };
> > -
> > -
> > -* DMA client
> > -
> > -Clients have to specify the DMA requests with phandles in a list.
> > -
> > -Required properties:
> > -- dmas: List of one or more DMA request specifiers. One DMA request sp=
ecifier
> > -    consists of a phandle to the DMA controller followed by the intege=
r
> > -    specifying the request line.
> > -- dma-names: List of string identifiers for the DMA requests. For the =
correct
> > -    names, have a look at the specific client driver.
> > -
> > -Example:
> > -
> > -     sdhci1: sdhci@10013000 {
> > -             ...
> > -             dmas =3D <&dma 7>;
> > -             dma-names =3D "rx-tx";
> > -             ...
> > -     };
> > --
> > 2.45.1
> >

Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6EA145B04
	for <imx@lists.linux.dev>; Tue,  4 Jun 2024 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505417; cv=none; b=LHmHwE5FSt1+leyzd83VpCHmbWPSmMqaGfts20I5vgolEIMfWUVZ/c5wUzcakVQakWvynEcd3MaC+kexkcA3+Lr4kUoejTPTrYCkAPla4KT7xaKBXA9xNBXMTptikCBnhV8zDTHOxjCA7PBLS6QX3bZpBXkPmyx4hePIjwbS+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505417; c=relaxed/simple;
	bh=uL/t7pm9AK4sEcDXmw3Mra5gJjxVZIFJK9MXRYF5SCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzgkMzeTR8poymTuyMufW0IH/Da9rELUi1eaFZvSlg+YLiFKKHqtyKJWsoI6diWl30qEpqgCIc61kXrocVuDD39H5QMPrIGDuksKj6kaS0Ht5TqENmLZF9xRO0YmBiCPf+yCP3Y0WNGV2CWZwkoXLuSQwlVsmLZ9Voj6d2SoPss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9iUkYrM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9iUkYrM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57a677d3d79so3342260a12.1
        for <imx@lists.linux.dev>; Tue, 04 Jun 2024 05:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717505414; x=1718110214; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5A5/CwMQp+giK6dA3QbmX6y5Z0nir0CTmgUL04kHgE=;
        b=e9iUkYrMH4TJ3xq+mP1D3Viooric9H+5ignVPlKaFUvHcuCWZTUaWOpEe5yu5NVbMo
         Dc0LLjSFzBN5rDxuE/KgWo4j8D2chiP3PUIUJX6lF3i5PTBJE/fa2xX50dO0UAEsRwoS
         uHnEX0agtLYas8vIwIlMY6020zwmOc/Ja5EvBcio4Zr2hwFr0d9K7W0PTHmJfyHdX1R4
         0J/yqylEoSKExEQA5aaxiXKzs/rpfYydT08qvGkg/NbwEKPZ2/o5cPcTpzwvcNqsNaB3
         gjqUFu++mFvTcU0ho6BUy46varVUkRtlbCfzkBeuKQRf8/VNRnbzGOXH2JMz7i0JvBcR
         /juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505414; x=1718110214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5A5/CwMQp+giK6dA3QbmX6y5Z0nir0CTmgUL04kHgE=;
        b=NLRbYYEqzeIqJp/pM0swVVbb1SgQkpMLm2nX6Nd5Hy8evpLOSYsWTw2mVU8tSFNka/
         TOr9hV1nGCJziBBkolsS3RBclC3/oGmMkj0yTO4vLXS8MAUWRLuNXUzALMTmesofrlko
         Hxkhu4mZ8KpfLCtd910vNOy9pg2zwsFBy0jvSv5VuBCzE9v0N0X/tZkbxKr+eN5qvjvq
         xZnv6+Jm8z5JXyJvjnYdZqq8xawuoqlZ7VgYMfVlNxrNW+poqp+yH3gsNHhROoZLSBov
         rVAXsgVp8xpghaAEAdfcBIaGUciOwIwDyPIFNbNJXzPJAKo/QliozbBi4D7r17vhhmBc
         vDEA==
X-Forwarded-Encrypted: i=1; AJvYcCV/RMFgeRBvfOfZMSWMsznPWVmorwiNX05N1CCXGRWOvfyf+y4rVn5pvui2QEl0TlnAr6UVdVieuX5JBs94aKWIJDWA
X-Gm-Message-State: AOJu0YxuVWX+vUk5+BOA2PlXTTdaw9sim64x269SHL7B/Qe3B450O/wc
	EEXC2VyIi08xrcM3tsqRsKmdiNPQexcuP0iXfWy08SE037Qn5AiXeTOsi7DrRgenblWg3CLkZ7p
	Z8FfXLCmq6bPuFjs5V3snXlTANyU=
X-Google-Smtp-Source: AGHT+IF2c7GJir+XPdRoLTFlUuzDsKkGSNria5acCbGeioFwEyDr0OUN028acb+qeCgAnoaY523IZwylbZbhdOiDrCo=
X-Received: by 2002:a50:9ea5:0:b0:578:6484:24ff with SMTP id
 4fb4d7f45d1cf-57a7a6a29a2mr2227617a12.6.1717505413457; Tue, 04 Jun 2024
 05:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240530072113.30410-1-animeshagarwal28@gmail.com> <Zlij+FgY4ul7ZwbA@lizhi-Precision-Tower-5810>
In-Reply-To: <Zlij+FgY4ul7ZwbA@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 4 Jun 2024 15:50:01 +0300
Message-ID: <CAEnQRZBsBOAHiwZDNKyPRinXdEOhdu2dBdGpMrq-e9kWasukSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: dma: fsl,imx-dma: Convert to dtschema
To: Frank Li <Frank.li@nxp.com>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 7:06=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, May 30, 2024 at 12:51:07PM +0530, Animesh Agarwal wrote:
> > Convert the fsl i.MX DMA controller bindings to DT schema
>
> nit: need "." after sentence.
>
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

As Krzysztof pointed out and looking at datasheet and driver implementation=
, we
always use 16 channels. Nothing less or variable.

So const: 16 I think it is correct!

Another, thing. Should we keep both

dma-channels
and
#dma-channels?

I wonder what is the correct way to put #dma-channels

Like this:

#dma-channels:
     deprecated

or

'#dma-channels':
    deprecated


The rest looks good to me.

Thanks for doing this Animesh!

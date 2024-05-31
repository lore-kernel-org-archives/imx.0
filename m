Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D1157487
	for <imx@lists.linux.dev>; Fri, 31 May 2024 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717154045; cv=none; b=LwmTDM+k9gh77V0nGL9p/99+5wkdDV1/N0Wbyf98UeC/eTuoVUPcRbd0SDrX7f4CT1lGrso/NwVlLRJd3sSsl41ygiUDHThqjLMgjhBnQR33qP1Ki17TaxsGnhHfZ4lU0V4I4VdAY+UQmgpcoNoe07AxHwijzQfm9YHqQ9BwvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717154045; c=relaxed/simple;
	bh=5JDD33qRorywNmQKPBbyh44Bl11dNVa+Lm3wUWF09Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZd+MB6AtS2EaA96VDKn+vbaVum8S4cqrc83ZvY38fDWxMjP01IoZnJWzTLM0Cl4DFRWcuvYZjesELSU+g+VC/SC1yqH8/5aW+olHRAuG0w4P0elUd2C0G4t7m3C6PRvXFWUavmADsZ1ToKQncwlcqcD/Rjq09LM0xea36F5ebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Etg32dFr; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Etg32dFr"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-24c9f892aeaso1004104fac.2
        for <imx@lists.linux.dev>; Fri, 31 May 2024 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717154043; x=1717758843; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXBg1IIKOFylKo+rkqsg8yzt/arKbmHAdUcO7p0ZR7c=;
        b=Etg32dFr1Mcmf0WHO7aDlA50OSukIA5QZBoJgLTJVw05urTriMFpP9IY30QXrC2fua
         J9pPOr2Hr/WN4B2K7PrjmscveyiPuvfFegIPl2e8bDSO7EF6HipoXw4YczEZWu/jPP/e
         Y0fpS4W9cja1gZrERgocK7DIMGQkfViCOKhGe8LFXUdbKaCVCxwoFiW7uVQxadB12bSz
         pugpGoIPjR+YjhSPh0afDSTRoW/ModPBnXrtBLBeZGoSMFUt+f9jxcLH6vCEP+v21Cpj
         mGrXkieAYPPgGUKHlUWNYWfelnx8lu1CuaaGhLkPb+1ZKfec3V5vD6KXDvapjKW0Kv8e
         7tLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717154043; x=1717758843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXBg1IIKOFylKo+rkqsg8yzt/arKbmHAdUcO7p0ZR7c=;
        b=YKGswYR6GlX3TX6l1A0t1dASSl9y8UO3qheyjBknot5Yi/z2hyCRE+HXadnhAb6QLA
         MsZ6oe+XpnJDMOHb4xFUPcLspPBG8A4EAjXn2BoE+NgYXgZtzuoulL9kHVtkRCDJQ67f
         SQfji23cXUF6dGO8h3zi0U9JunO63bwNKDVyxPfsfqVWBoBUy11/82xkYhtumDz9MNtA
         YaZbcc84n/whz6AS+3yoCySjI992HJ8rTnU1NPb8UeXenYuA2tYaVoR/4qgohRXbPzKA
         ZhPxtfhxosraHYKtRIPr+nzln2tseiBHHN3YPLU+M0sRHOLUgSdsqF/DmRkYIiK36A4L
         o6zw==
X-Forwarded-Encrypted: i=1; AJvYcCU+YMgDk+g5N/CnAGcz03erVVXxKxR21Gz+QsteEUDoQNRtTGVg2iILuhY5WXnlrhSRVhf3EePkpQL7dwlSI0nxS2M3
X-Gm-Message-State: AOJu0YzLqeYxsElzIfNB5U60ZhZETAo4gvxIDlAc5MT0ItBlS7Kpc3vt
	NqWebMpu3Zv1TDkMfdcx5qriBLPzDSVulMTQcLFSdD09/pyf+Mx7XfjLiHI/DTOTe4eLTYkcTrE
	7inah51qgSRPeFv/rRtrtf7KkxS0=
X-Google-Smtp-Source: AGHT+IHxpK+grLpjn8RaNCKVuk2asXOqwaFS7gBD9s5FbqdCZLTtq7o51KMuQ/gD9ZSt6PBAA87mn9OqOkvS9K3F1PY=
X-Received: by 2002:a05:6870:969e:b0:250:8141:9219 with SMTP id
 586e51a60fabf-2508b7f15f2mr1716934fac.18.1717154043442; Fri, 31 May 2024
 04:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240531090458.99744-1-animeshagarwal28@gmail.com> <a472e8ba-bf54-4a62-9b05-ea265a83ef1b@kernel.org>
In-Reply-To: <a472e8ba-bf54-4a62-9b05-ea265a83ef1b@kernel.org>
From: Animesh Agarwal <animeshagarwal28@gmail.com>
Date: Fri, 31 May 2024 16:43:52 +0530
Message-ID: <CAE3Oz825RQg25PxEbnb=ui7+MtH0ssS=i2HAQK-yOJo+v8JMMw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: dma: fsl,imx-dma: Convert to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 3:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 31/05/2024 11:04, Animesh Agarwal wrote:
> > +  "#dma-cells":
> > +    const: 1
> > +
> > +  dma-channels:
> > +    maximum: 16
>
> maximum or const?

The txt binding says it should always be 16. Datasheet says this
device has 16 channels of DMA services. I thought specifying just the
maximum implies maximum=3Dminimum=3D16. Sorry for missing the changelog in
this version it was cost in the v1 of this patch.

>
> deprecated: true
>

Shall it not be
"#dma-channels ":
  deprecated: true
?

> > +
> > +  dma-requests:
> > +    description: Number of DMA requests supported.
>
> deprecated: true
>

Shall it not be
"#dma-requests ":
  deprecated: true
?

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
> > +    dma-controller@10001000 {
> > +      compatible =3D "fsl,imx27-dma";
> > +      reg =3D <0x10001000 0x1000>;
> > +      interrupts =3D <32 33>;
> > +      #dma-cells =3D <1>;
> > +      dma-channels =3D <16>;
>
> and drop it from here

Is this really a deprecated property?

Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C43BBCB
	for <imx@lists.linux.dev>; Sun, 29 Sep 2024 20:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727640040; cv=none; b=GE1Z6IlhbmcQmjpzkk33bPXGk38l/ieBUMxMkKmYRRLJIAXOIt/XuXlnrPKTFb3ZgiDTvjP165zrmQxaKdwbWPZ2Ac+RVk1GKKQnNnCqd8ElqZ3c/6DBj/ePJMvIS/sYFloM7OlepBa2WPyp9MKvTOhNDVsc1x1WEi9Yjp7+MdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727640040; c=relaxed/simple;
	bh=C+HE48UOVNh3S8JegzOeS1KV251zvl3uafKiq4ay2XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+Lx1MY226DRM8zmDBrECpoXKh4An/6qLVx1Z59ggd+4ajFYjBD7nJk90Yk8VtycC45JlTbUC8u7DB+2VC9NL6G+Nnr6z1Dn/mYhJusVCilG83NZGnBke4fwvdq+0UVotEyQpc1bsmyAUPo5FarLozqaK6XPYyV6o4K2lXjZ8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=c9TqVrmj; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="c9TqVrmj"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e20a8141c7so34308177b3.0
        for <imx@lists.linux.dev>; Sun, 29 Sep 2024 13:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727640038; x=1728244838; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THVSoogwNns4Otfo36VQb2ocrUo2155C0xuop1kKVhc=;
        b=c9TqVrmjSqp+tLxspFNFSYiep8YvRC0NdVZoE2n5b3K71l/iC74YptseySZZ1CPJxM
         sYQxaOgmiAiGq2OQpayZRgF5weaCkxMwzadO77HaF6CTBPcQiTDcM9yoHkzrk+xzY3x7
         FvFrwteB4WS/hxy0Q0gzdu9JyDjeoTAr/U1nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727640038; x=1728244838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THVSoogwNns4Otfo36VQb2ocrUo2155C0xuop1kKVhc=;
        b=C5hnXTMzkpKtGDXfXO8DjF2oxl3J6nMx+ZImpxOsYZTEjeouiksNL7zLYzCZYh/X3g
         0pNDGq5p4BNCJ2kbthO/BbA78Ea9OQul2BbUJ2Mybiou0z0jcJe+zpXJE2tu0DWki4SP
         pCkpLZHnjDfprdNp49W75iOuWGaYW7CVTWXYf3bUXW90kBM6OOwAVdxrXqjIfF4xU1z6
         4ZaD+hJ9b3GrzcmfZ///Z5/pKUCZKe9xK2ALL425HroEjTjmjOEqP3ewZYuYqXL9IyDr
         qIWDu38C7+WRhIFB9r5xMPQ9hw8w75tmTiphcFyQuHmAGDyIayGR5/vG1J41fFpQMrHr
         VI0w==
X-Forwarded-Encrypted: i=1; AJvYcCUE5rjh4gcmxobPyleeWz6alCRi7YQ1yZ5OPATymmLWKgshbpeNbeJR0NhmJL1QVz+h2uM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj1cSwSpIZxvyqmD8bIKfVJC+SlcpYOcu9Lcf9jR/iwLvdfwVJ
	bpcLKW/kXb5DXAH+XiUCIzOzsqMxcYa7oyLq88LBnfXMO8h6EHOhy4fm4NAPUXXsva+vHJO+fQy
	qCdWgRWnDd8tQIl468Cr8J1tTiunrRBAE1nQRVQ==
X-Google-Smtp-Source: AGHT+IHIOE3+c2mX/UsbrIe1XO7FQZ+whU+SXEoKWNXBu9Vk5hhOQ7qtm4cjBU4dpR9jmUzCwLswFX+y7Pi2oOlEcv8=
X-Received: by 2002:a05:690c:4488:b0:6db:2604:ea6b with SMTP id
 00721157ae682-6e24759414bmr55679827b3.25.1727640038489; Sun, 29 Sep 2024
 13:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
 <20240928083804.1073942-2-dario.binacchi@amarulasolutions.com> <566859c1-a397-4465-987e-0682b07a703e@kernel.org>
In-Reply-To: <566859c1-a397-4465-987e-0682b07a703e@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 29 Sep 2024 22:00:27 +0200
Message-ID: <CABGWkvqqg-PGAZTCz=MMLRx5F93jaN_=z8zJt1sDd3PHXd80PQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m-anatop: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 28, 2024 at 2:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/09/2024 10:37, Dario Binacchi wrote:
> > The patch adds the DT bindings for enabling and tuning spread spectrum
> > clocking generation.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../bindings/clock/fsl,imx8m-anatop.yaml      | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.y=
aml b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> > index bbd22e95b319..c91eb4229ed3 100644
> > --- a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> > +++ b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> > @@ -32,6 +32,47 @@ properties:
> >
> >    '#clock-cells':
> >      const: 1
> > +if:
>
> This should be allOf: and placed after required: block, like in example
> schema.
>
>
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - fsl,imx8mm-anatop
> > +
> > +then:
> > +  properties:
> > +    fsl,ssc-clocks:
>
> Nope. Properties must be defined in top-level.
>
> > +      $ref: /schemas/types.yaml#/definitions/phandle-array
> > +      description:
> > +        The phandles to the PLLs with spread spectrum clock generation
> > +        hardware capability.
>
> These should be clocks.

Sorry, but I can't understand what you're asking me.
Could you kindly explain it to me in more detail?

>
> > +      maxItems: 4
> > +
> > +    fsl,ssc-modfreq-hz:
> > +      $ref: /schemas/types.yaml#/definitions/uint32-array
>
> This should fail. I don't think you tested this patch.

I executed the command

make dt_binding_check DT_SCHEMA_FILES=3Dfsl,imx8m-anatop.yaml

and it did not raise any errors.

Thanks and regards,
Dario

>
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pr=
operty-units.yaml
>
> > +      description:
> > +        The values of modulation frequency (Hz unit) of spread spectru=
m
> > +        clocking for each PLL.
> > +      maxItems: 4
> > +
> > +    fsl,ssc-modrate-percent:
>
> Same problems
>
>
>
> Best regards,
> Krzysztof
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

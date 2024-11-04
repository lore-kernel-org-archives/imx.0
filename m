Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA651C07D3
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737936; cv=none; b=nPik6pOyciqkcvFMeAeYpemKuJhinsrge92Wsj0WOxyaE3PMPcTHqtzT3CV/Y3zDAabuI3pip3Ajh2LRqdtRj4ELMdpbPY5Su8ROxz3v69Gz1ViLoIM4cY7M/WNhWvgqdtrCeGfwhFIMVgzDCRumHQv0sawrGTh/Lliy0g+Ps3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737936; c=relaxed/simple;
	bh=sGi3fK0LjnVxIOV1LLmeuJSH/YuBzL60e0cJVML6LeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3giPPD2DpUjClpGAmM35V6IDnMv1bDXmWymdfmDY+yz4LbdspTSUvuw9bBb+PUe9SWVRqMgu4cLhlO/iRw5W83nr15Ao6s1SREZw8zcmrAvautAy/KNlVR0Hb1gBB1J5ggN0y+hINVaVw6EsmBvTI3zDHRUpRTMO48hG80nLfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=E9VTtnGQ; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="E9VTtnGQ"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e2bdbdee559so4041829276.1
        for <imx@lists.linux.dev>; Mon, 04 Nov 2024 08:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730737934; x=1731342734; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NvqcwznYJEbOfJTrxk1An08MpWkBKh12Fm23xyda6E=;
        b=E9VTtnGQc7gMIgvhncso1mDR9vsnobpnVxeZnyOMaL5+oMQQKTbSYgdwJGVDFqsAdp
         tyJNvo8lzSBNB5SmAX0eRLeNVrsw6pNDh7bIt4AXj7UDfdEhL1erJtGh4gQ1yq2ucGxr
         pWDwl7G+8S7Tp0iPWs+1YMKdqX8xO0Zj+wMVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730737934; x=1731342734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NvqcwznYJEbOfJTrxk1An08MpWkBKh12Fm23xyda6E=;
        b=lv0ZySBJZ/P2xouu0XZtSV174HDpFZvzDTYHQg4cVeblwTxxv6IMuJuJQTVvwZ3GgC
         +Mxh2RalOHpaMem1POeXllUe7gIY6vl/DkCeZOV1uTDeNxp0bISVIUjaM/5GbZCKM3Bz
         FJ8pKwctWjKb2gG+aVCIuCNdY2AJxZz6xV8nXWI46WWjJsEYntknfoOd7SYNXcHKYat+
         mvUnyodZACEMTm1eW/1UAZ3dUrICqi6LYayyql3giNYvCkFYmB/OUvHnjHUcxz3LCvnS
         Mp9RPf51pQ9DaW/6ITeNZPPW96YQzLdSlfkriZo76HfRSTrL5/g9Aw2K9b5fW18zXBEi
         Zwww==
X-Forwarded-Encrypted: i=1; AJvYcCUFQ5Q/ohW0kqcr8sowvcT4qKVv/uEeLULYrFnRE5JRxUncfOeoWkDtr24TuXIFdG/ov7c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyT4V3EIc9cvomaFgzdtG/u3wdFuNbcwJMKDzEi4YkEbJtFbrjS
	fcOfV8CVNdovLSZWEUtnzK/ttLOtpW8anFBZDC+JQykE6fmmPqInUjn62DPl7NUnq131MfhnwkC
	3hCiriHC0W89s6TNXscRSnuarv8BOAMP/socHEw==
X-Google-Smtp-Source: AGHT+IELYvUmczkoinr/h7h4D5wovUbn46OmYDOIs9EuWMuur0hSgIUPkzT189bHxP5gqhspJGZhWZ+bvDCtj3+rRX0=
X-Received: by 2002:a05:6902:10c3:b0:e2b:d610:9d67 with SMTP id
 3f1490d57ef6-e330254f5ebmr11392789276.9.1730737933890; Mon, 04 Nov 2024
 08:32:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
 <20241028102559.1451383-2-dario.binacchi@amarulasolutions.com> <20241101173914.GA3786619-robh@kernel.org>
In-Reply-To: <20241101173914.GA3786619-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 4 Nov 2024 17:32:03 +0100
Message-ID: <CABGWkvrC6N4ujWfJSVyktyyAODUM5TTucFneqsX1H4PQK+nbvg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] dt-bindings: soc: imx-blk-ctrl: add
 'fsl,power-domains-boot-on' property
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Fri, Nov 1, 2024 at 6:39=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 28, 2024 at 11:25:24AM +0100, Dario Binacchi wrote:
> > This property lists the state of the power domains, indicating whether
> > they have been left on or off by the bootloader/firmware.
> > This information becomes relevant, for example, in the case of supporti=
ng
> > the simple framebuffer.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml       | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-=
blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-b=
lk-ctrl.yaml
> > index eeec9965b091..00aa0b8d8ea9 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctr=
l.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctr=
l.yaml
> > @@ -56,6 +56,15 @@ properties:
> >        - const: csi-aclk
> >        - const: csi-pclk
> >
> > +  fsl,power-domains-boot-on:
> > +    description: |
> > +      Provide the on/off (1/0) status of the power domains. It allows
> > +      specifying whether one or more power domains have already been
> > +      initialized and left powered on by the bootloader.
>
> Sounds like a common problem *if* we wanted to fix it in DT.
>
> Why can't you just read the h/w registers to see which domains are
> powered on? Perhaps because some are on, but you want to turn them off.

I checked, but there is no register on this platform that indicates
the on/off status
of the power domain. So, I cannot readout the power domain state.

>
> Also, for simple-framebuffer, I think you can list the power-domains to
> keep on.

I did it; I added the power domains in the simple-framebuffer node, but thi=
s
doesn=E2=80=99t prevent the genpd.power_on() callback from being called. An=
d when
this callback is called, the power domain is re-initialized, which does not
maintain the persistence of the image on the display. Adding this DTS prope=
rty
prevents re-initialization that has already been performed by the bootloade=
r.

Thanks and regards,
Dario

>
> Rob
>
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

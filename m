Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672C1CA83
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709766074; cv=none; b=LhBPJbftAtB0uWdQCajRB2htzXrht++IMWxl12IbittmJfOna/Cb0pGpkAKaSoNG20dGDQdQM0yJlHoCtVZ4Qu7pO2fmR6A1zMrdxsALRAkRM/N5rdm3Qc1pSMJNhKNqKJ3iTZCO5lX94p3G9h8Tp8YKiAqudszk+KiRmklxC1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709766074; c=relaxed/simple;
	bh=1foeIlAL02HQ/9fWETjo+VPeQRpGEBkjUsRFchJX7d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJd2x4W3HQsDvXjLG0imVAVjYziAn/LzFslHWTEfzTdmZIBtmVr/LsFoTu6EJV6wU07pp00jAHSPyuqMO8NXvxWxgG1sZPCzohCTPh17iQBOwEWEv53rRHHWzESS03lKq+wl3WvlH2v0GNro6Rxdp9CmWNPLi5dczxNAI/okEf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzGykI5t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzGykI5t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5656EC43390
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 23:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709766073;
	bh=1foeIlAL02HQ/9fWETjo+VPeQRpGEBkjUsRFchJX7d4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FzGykI5t1KZcrcNh3uIkXsI4mhxdAVRhHvFVRqEEeCR8jYOZBf7sIsQYsEmuoj7Cp
	 VJ6XN/kVz/j7ISNU6iJKQDCYUJmit3KyAdc//QwJiR2o5MN2ihF+ss0bY2FRwXOw8Y
	 16xCLbhfe6SOMgclhR+g9ttqkRAacHzIx+G26l4lFwWlcxDagL7vq1NClMiqfMZrLF
	 V3aL0pc75FJc0Fhi9frO5zcqRZAwskdM87VYHPQH+CUDT3xk8JSontUBbFSweZ3oS8
	 JNJxUi6okj8ACN6TKTIWyhVqSRg7/4sSKO41qB7DO6R3zCyv4rLzMKCu0wHoRzla0L
	 09TQtdiq5BF3Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51331634948so1430962e87.0
        for <imx@lists.linux.dev>; Wed, 06 Mar 2024 15:01:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDENm2qkmYz+UkOPUTLHvjVy0I+gzCarD/MF8Zrp8wN5hjnAQYEDV/B5EhP++BPc4+WpQ665fXAOPvC3N/AanwwyZ0
X-Gm-Message-State: AOJu0YxyTr/AwXfTrL7mbaRYxzb5vRqtZ9DWu4I9cmFId3zhDskIBAnt
	fs52gCBy/i/DuO4sqscZu7pKeRqhi5Dlh/xMpi7KcLKqy3RJqY2oHltaWIFc2xGviDaU+Jgxkua
	xZhg3DOHux6bDaGdGLQjz9Jy14g==
X-Google-Smtp-Source: AGHT+IEe7ONAG3lrAgIWy+05ru/C7vwOPDlzVeORdLHPWUfWrnU47WOhZwb4SSMXu5BC5lZaDn1RllTR5GSnhrsxEUU=
X-Received: by 2002:ac2:5a0b:0:b0:513:3b3e:c361 with SMTP id
 q11-20020ac25a0b000000b005133b3ec361mr70664lfn.2.1709766071504; Wed, 06 Mar
 2024 15:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240305-asrc_8qxp-v4-0-c61b98046591@nxp.com> <20240305-asrc_8qxp-v4-2-c61b98046591@nxp.com>
 <20240306202537.GA587561-robh@kernel.org> <ZejX0/FA/z4wa7cY@lizhi-Precision-Tower-5810>
In-Reply-To: <ZejX0/FA/z4wa7cY@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Mar 2024 17:00:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ6U2-EGeJgTuxBooEy=OEJ08wDNshWnfKooryAr6=QNg@mail.gmail.com>
Message-ID: <CAL_JsqJ6U2-EGeJgTuxBooEy=OEJ08wDNshWnfKooryAr6=QNg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ASoC: dt-bindings: fsl,imx-asrc: update max
 interrupt numbers
To: Frank Li <Frank.li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 2:53=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Mar 06, 2024 at 02:25:37PM -0600, Rob Herring wrote:
> > On Tue, Mar 05, 2024 at 12:33:03PM -0500, Frank Li wrote:
> > > fsl,imx8qxp-spdif and fsl,imx8qm-spdif have 2 interrupts. Other platf=
orms
> > > have 1 interrupt.
> > >
> > > Increase max interrupt number to 2 and add restriction for platforms =
except
> > > i.MX8QXP and i.MX8QM.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/fsl,spdif.yaml | 18 ++++++++=
+++++++++-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml b=
/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
> > > index 56f8c0c8afdea..7f6590708e1ec 100644
> > > --- a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
> > > @@ -31,7 +31,8 @@ properties:
> > >      maxItems: 1
> > >
> > >    interrupts:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > >
> > >    dmas:
> > >      items:
> > > @@ -101,6 +102,21 @@ required:
> > >  additionalProperties: false
> > >
> > >  allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          enum:
> > > +            - fsl,imx8qm-spdif
> > > +            - fsl,imx8qxp-spdif
> > > +    then:
> > > +      properties:
> > > +        interrupts:
> > > +          minItems: 2
> >
> > Nowhere is it explained what the 2 interrupts are or what the order of
> > them is. Is the first interrupt the same as before, and there is a new
> > interrupt for something else? Or it's the same interrupts, but they've
> > just split up into 2?
>
> It is same one and split to tx and rx. Order doesn't matter.

Make that clear in the schema. Order does matter and you have to
define the order in the schema.

> They uses one
> irq handle.

What does that mean?

Rob

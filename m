Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2045381AA
	for <imx@lists.linux.dev>; Wed, 15 May 2024 02:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715741291; cv=none; b=kQJg1og2x4VwUC+IUHIk8TQuZ+rK8yKS0/vV2S/KN2d4U6T29PCawx4Mv+9ZP6OIPHZKxXA6Z7mSl2LgI2j1VOXDxy6+kEmFJB746FcrBgNV8WvhY0FT2oQP5RFAOOyhXygnZax6l8atuwOeTIW0eW4WzDjYs5ApUOpqrNaoLBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715741291; c=relaxed/simple;
	bh=Zm/aWD0cPpxYKvZkG11YI0/Q+FB2yEFE0LiK+B1PVHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1QqlTjmbscY5KbQbohv6y1MpCiSpnf0kMJCQi5ETlSnjHnDGwxe+HAipXstBKP0AiNpymvVeUja8T0Jm/M0NYKt8pCMK8OuPqJJX8MqTun83GXucz8Czh++mBaEycVgt2F2OtbRDJ/ffihh35vm6OyaS+gTwa1crPz1Qj5gSzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePHGA9Fb; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePHGA9Fb"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36c7004daecso24226875ab.0
        for <imx@lists.linux.dev>; Tue, 14 May 2024 19:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715741289; x=1716346089; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIDhweI0h5UXcyTSp+TP3eWf/lMbo5o/HSpNa1VAcs0=;
        b=ePHGA9Fb4wcDATOh6JDh+i2CAbSDHTBBPtAyN7BTXNqki+XzbTpEr3+OmyOQmbuPk8
         az2gidrFlEP60+zc/1HW5kCdzYMmnNrYm109+046sgMgEPzIn7CGXOaK+kdxtkH/5IMw
         UFMbMf+o+3wuHkSD8Zw86uMrYwlB9tGf5CzqsWowaRpw6DrYB/G6n801qGKXowmyn6C2
         tT8Bvw4o1UTKWyr806VvyxpzygrOLaCd3JVjLe9oGRqDTz6IBIvTYHye4VepDwTAO7C3
         IlptrsfU+O/3bjW3o3V8KOnfsvCqfAmXU+y98YGu68qO1KdpGq4xru/v+K2Ghw59Tpe+
         6aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715741289; x=1716346089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIDhweI0h5UXcyTSp+TP3eWf/lMbo5o/HSpNa1VAcs0=;
        b=cp9zeK00SmkN3Mhz9Q1CMVdUIP3E7mctlOEMIASrgtBV56le1DZaSTwsN/ZBrP0mU7
         rNaG7IczzM4AyL4dDAqQXFTI8bAwCFl9KcD+sfHccX+NjIP1b3vaAtdjs6kRF/6JjEXQ
         SQmNt8cTha+EGBj1wg6WOuDoyuQcNVwfgS3z8ocQwMvXSbX9HjODhl/xcvZdZA9R0J/R
         aSgj4HXgkdzmxfIla+QzBr0tjcvX7GDoArY8mVtv5Lupcodu2LBOM0lgZzNhtF3tEvvr
         xUrsUzs7/SnIu7sq+gPMadP1uRjOKTfcKwB1hxqzhJf2Rs2FeKA1nbmKvk/D8SfKOBme
         lHaA==
X-Forwarded-Encrypted: i=1; AJvYcCVbvaaZfxctpNG7LIf7ZEqyoDX/FJycBLhy7mGgi4Ybk6GPRbqNsEXecJZPhiOmOeSoBRnt8aMk4GKxPYThZiaErj2F
X-Gm-Message-State: AOJu0YwIrlhXMp16sE6cTAJHKo/XhofPh178dngH6GlGSi0giNcxAtUc
	2pRDKGCMkfXhOR0i3zFXEvwPcZz6jkfXWixOvp9Sm1zPpc1RjcyXMS8SXjldzXe3sB4ZDiXpN8n
	dI/+TRVqzq7qmtcTxAMr3MGIKbsw=
X-Google-Smtp-Source: AGHT+IHzVUc9KZPaSMitplhr5eOK7tggKIv03qnC7VHPuAL+ASkz3/IadH5Ux+z2PF/krzlmkYV1zomwI11/ywZHr4g=
X-Received: by 2002:a05:6e02:17c5:b0:368:920b:e211 with SMTP id
 e9e14a558f8ab-36cc12a36a3mr120484205ab.5.1715741288898; Tue, 14 May 2024
 19:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715679210-9588-1-git-send-email-shengjiu.wang@nxp.com>
 <1715679210-9588-4-git-send-email-shengjiu.wang@nxp.com> <20240514-campus-sibling-21cdf4c78366@spud>
 <b86c83a520f0c45a60249468fa92b1de.sboyd@kernel.org>
In-Reply-To: <b86c83a520f0c45a60249468fa92b1de.sboyd@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 15 May 2024 10:47:57 +0800
Message-ID: <CAA+D8ANTdvQJVtniyMtqjnJdT4qX+LDGjVuFO6H0RSO+GDw+ng@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: clock: imx8mp: Add reset-controller sub-node
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, 
	peng.fan@nxp.com, mturquette@baylibre.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	marex@denx.de, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 5:09=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Conor Dooley (2024-05-14 11:06:14)
> > On Tue, May 14, 2024 at 05:33:27PM +0800, Shengjiu Wang wrote:
> > > diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.=
yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> > > index 0a6dc1a6e122..a403ace4d11f 100644
> > > --- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> > > @@ -15,7 +15,10 @@ description: |
> > >
> > >  properties:
> > >    compatible:
> > > -    const: fsl,imx8mp-audio-blk-ctrl
> > > +    items:
> > > +      - const: fsl,imx8mp-audio-blk-ctrl
> > > +      - const: syscon
> > > +      - const: simple-mfd
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -44,6 +47,11 @@ properties:
> > >        ID in its "clocks" phandle cell. See include/dt-bindings/clock=
/imx8mp-clock.h
> > >        for the full list of i.MX8MP IMX8MP_CLK_AUDIOMIX_ clock IDs.
> > >
> > > +  reset-controller:
> > > +    type: object
> > > +    $ref: /schemas/reset/fsl,imx8mp-audiomix-reset.yaml#
> > > +    description: The child reset devices of AudioMIX Block Control.
> >
> > Why not just set #reset-cells =3D <1> in the existing node? IIRC it was
> > already suggested to you to do that and use auxdev to set up the reset
> > driver.
>
> Yes, do that.

Can I know why sub nodes can't be used? the relationship of parent and
child devices looks better with sub nodes.

A further question is can I use the reset-ti-syscon? which is a generic res=
et
device for SoCs.  with it I don't even need to write a new reset device dri=
ver.
it is more simple.

Best regards
Shengjiu Wang

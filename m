Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1816BE27
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724073471; cv=none; b=SVEtgnvGAvSMOZvGayCttwZ0bGmR+GhrZP6G/zyVOLS06B7qviTZLEY7SOiEmbmTTGmNuvj3bEChjj6752a3Abk6CBHH6rNp3LMEmrQ5e4lr2XJ3QpmNIKlLS1KEBnUexipAEWMiqLp2iZyibQsY7LmaljodGClTnNEQ/K7Ntus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724073471; c=relaxed/simple;
	bh=UQAYwkqw+ZSscmiH0qVHI872RkVEDdU6mkFaQXZDXkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pq2/V4wZM375F+3GPd1m3hLW0bPmKeuLYSt4NfkEvq/8rFuWhBuSaBu5L2lgTMhzZ2od+ahZxLfDnm/bL2yAHhiKLIS4h3KtHGyvRaAzNWrCRMgOlGbag040Qk5Ky4IIRnCLzCi6IeWmB2l+mCVDL1/lLrxW7HhE6d/exbVxSyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9tMgXwJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9tMgXwJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E3CC4AF14
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 13:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724073470;
	bh=UQAYwkqw+ZSscmiH0qVHI872RkVEDdU6mkFaQXZDXkA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U9tMgXwJecbZ3kE/S5t4FUlJPz7GoswWFkpiHctvR5uXMRGv5d3h5F7ccbmxrL2d3
	 JkL/FGCAgsvl1eYUOZLdGq+pdlGYJnxBokYd/bBmFLjUdVr5EpqCRzaaA66eTRPDHs
	 k5HLddX6+v8VivMAE+jEwMmSYWSFMF7FrD98bYHZN6ObKH6HPmzp6aSCBVAx1Xaakx
	 kO2+cBFY96aElsVAFNQE4WlIY9S1pMXdC8gLp/vuEwoNXXkpkh9F/19ayFgGcPu3PT
	 0htkbP+lSML0ny6v+eVInt/e4ofcV/tSX1BJl3gwSCz3K5jxzJ4XCZPffmHsq3CGeL
	 JXbRYrJBP6XJQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3e2f5163dso3648141fa.2
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 06:17:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeKHEqh7aFI4Dqi5yAsh10ASqdubqUlzYOaT3UW6+1Y8ce79Sb8tqK6EXouROXEO3M4SsnRKB1+RAyhwdp2MJhzoKN
X-Gm-Message-State: AOJu0YzveT+43MnXxaHb/TWXoiKHir4Dq32xlrTtgV6WuUR+4DbXqEX0
	S+lLnyDnmLGOHn7ewWWLwk5F9rbjyNga5ygAQm1La9pIlfglAIDdMTcUaUC9nY+Lo6v7jrc+Fa6
	YweEqJ9VuJ/iUmXnIPVdobLWfJQ==
X-Google-Smtp-Source: AGHT+IHuIFkL9XOaIB8bCeAFn6MvxFkX+S3qQcSPxtnMNhMyho9IAi27eupSQYFXdkwCgC2TGR/yMUIEvZwdU822D2I=
X-Received: by 2002:a05:6512:1594:b0:530:bbe7:4db3 with SMTP id
 2adb3069b0e04-5332e074eb7mr4285456e87.39.1724073468957; Mon, 19 Aug 2024
 06:17:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240522215043.3747651-1-tharvey@gateworks.com>
 <CAL_JsqKtc_65tDMFWT0WroNPmW2R0Dd-4Jw101PnyJcPb=7tJA@mail.gmail.com>
 <CAJ+vNU0LBEET=y40BT4OE0zWsu6DxT-SYOrx7qD-h=HH2zENzA@mail.gmail.com>
 <4faa6881-8828-44de-92fd-6e55495cefb2@linaro.org> <CAJ+vNU1ff0c=wJoVTENGSV5Y3Yh_w5mTU-xoA9XgOX-x744=EQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU1ff0c=wJoVTENGSV5Y3Yh_w5mTU-xoA9XgOX-x744=EQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Aug 2024 07:17:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLAjNp5p7oiN4X-NjP5C3H7z06g=w4t7jrp4Tb6yyuvTw@mail.gmail.com>
Message-ID: <CAL_JsqLAjNp5p7oiN4X-NjP5C3H7z06g=w4t7jrp4Tb6yyuvTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
To: Tim Harvey <tharvey@gateworks.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 11:10=E2=80=AFAM Tim Harvey <tharvey@gateworks.com>=
 wrote:
>
> On Tue, Aug 13, 2024 at 9:34=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 13/08/2024 18:22, Tim Harvey wrote:
> > > On Fri, May 31, 2024 at 7:13=E2=80=AFAM Rob Herring <robh@kernel.org>=
 wrote:
> > >>
> > >> On Wed, May 22, 2024 at 4:50=E2=80=AFPM Tim Harvey <tharvey@gatework=
s.com> wrote:
> > >>>
> > >>> The GW7905 was renamed to GW7500 before production release.
> > >>
> > >> Maybe some summary of the discussion and how this changed from one-o=
ff
> > >> to wider availability.
> > >>
> > >>>
> > >>> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > >>> ---
> > >>>  Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++--
> > >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> Reviewed-by: Rob Herring <robh@kernel.org>
> > >
> > > Hi Rob,
> > >
> > > What is the status of this patch? I'm not clear what tree the
> > > Documentation/devicetree/bindings go through.
> >
> > Always via given subsystem. Which subsystem is here? Maintainers should
> > tell you - ARM Freescale/NXP.
> >
> > See also:
> > https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/devicet=
ree/bindings/submitting-patches.rst#L79
> >
> > Best regards,
> > Krzysztof
> >
>
> Krzysztof, thanks - that makes sense.
>
> Shawn, what is the status of this series [1]

No maintainer is going to look at 3 month old patches and may or may
not see some reply on it. Generally, if there's any discussion on a
patch, I assume a new version will be the result and move on. So
resend your patch.

Rob

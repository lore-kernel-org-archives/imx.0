Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E91C280
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 22:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709765918; cv=none; b=jKHjwIwVgX1ub/mRVyTjUlAya+ptALkP+Dex3ymgUtwynn5PxXzpSVgzZ77vVIXl0PssJeIw1FbUzwywlGOqxyIgupmf6zsVBeCt8ykHzabsXR2/6qzvJajMlFbuyS4sW21aHO6zNRR/Jl18/GEYBe4jlluX9sLMq2wXUuFk0HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709765918; c=relaxed/simple;
	bh=zmqQrFwoEDSQz2SwnjEGFE81FIyebYKtaD+xjmng/wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cutSPDm8JAoYpng9I/4opdt17jK4n207zLgQ9/45lwOB7LcWHaP8cwvtPylxJzrX8tmEVXahxacVrCnmuY7ADX0NKEviZFPdWiI/XbMRAAqE7Uls3NNc1K1vO2XIg9sOIl6R6oehf6kL3LBCUyl9LwahNKzd5Ox9xEyAMVb3uV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1cIKGlO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1cIKGlO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15865C43142
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 22:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709765918;
	bh=zmqQrFwoEDSQz2SwnjEGFE81FIyebYKtaD+xjmng/wg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h1cIKGlO4ISsx49R/HjszbjkUuwHYfMwq5ZWRUjEcLCUgF1rz1asG2lCCSBfAnOQL
	 9LvfHdCt1nnFoWHobs0rPoxjihVQzHz1EyLtWU4Y1+d0iHxinlapeKQ9e/5fajtPhl
	 FJK57fvoqgrezIc1+TBQpzd53chplBoN3PaQZGM0Ykckrr0/JHrzJKKsh/tH7Ou5fo
	 ndLtqoChgyvY64Otmt5pGMmfamyu6Acik+mSzaGN7i5EEHx9W8hn71VszlNIy9ewBh
	 4Wx7Wo7ZZK5Ej8RhC63r9I6XZ+s84owdwK8UUpE/9W3dfhgc8fBoCM/igfkBiotliS
	 5cylcgR1xkkoA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5131c48055cso280657e87.1
        for <imx@lists.linux.dev>; Wed, 06 Mar 2024 14:58:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiAiF3GY1wdbWp9RnzpSrjjhVNwav8SrSPI1l+NPTLcVj1MFDX1EfKrKuHP7ZSUqqOhYtXFf7B1pjqlPKlesDDRraY
X-Gm-Message-State: AOJu0Yw1SMuRK+KN7wEcOQsVURMxZYqNC2tmwUH+bxxXW5eW4ImqkaMI
	lYwJJwN22R0A+UeOeuyN6kmR4PD/Lf5gvG0ure9CzpCETV4AkBppYwX4eT0VO2oR9o+8JuMwKHP
	sR/sQN2yHI+N49kmq6daR0KyzEw==
X-Google-Smtp-Source: AGHT+IGzBx6mSFthVJlSrV24EBZpfXDKIuIdnv6rYK52jj9+48g85h39FbbcvGD42fLRIuZkJRPSBhKn31q6q7gzoDc=
X-Received: by 2002:a19:2d4f:0:b0:513:2b35:2520 with SMTP id
 t15-20020a192d4f000000b005132b352520mr274982lft.58.1709765915961; Wed, 06 Mar
 2024 14:58:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240305-asrc_8qxp-v4-0-c61b98046591@nxp.com> <20240305-asrc_8qxp-v4-3-c61b98046591@nxp.com>
 <20240306-pebble-grope-88fdaa95a87c@spud> <ZejDQddMp17RD6Yk@lizhi-Precision-Tower-5810>
 <20240306205524.GB587561-robh@kernel.org> <Zejdz0BKwSlsio9S@lizhi-Precision-Tower-5810>
In-Reply-To: <Zejdz0BKwSlsio9S@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Mar 2024 16:58:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJw5W7a9Pz9gRPuP717onHdSwRvwGJ=v+QDSe+4ORvTaA@mail.gmail.com>
Message-ID: <CAL_JsqJw5W7a9Pz9gRPuP717onHdSwRvwGJ=v+QDSe+4ORvTaA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ASoC: dt-bindings: fsl-sai: allow only one dma-names
To: Frank Li <Frank.li@nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 3:19=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Mar 06, 2024 at 02:55:24PM -0600, Rob Herring wrote:
> > On Wed, Mar 06, 2024 at 02:25:53PM -0500, Frank Li wrote:
> > > On Wed, Mar 06, 2024 at 06:45:13PM +0000, Conor Dooley wrote:
> > > > On Tue, Mar 05, 2024 at 12:33:04PM -0500, Frank Li wrote:
> > > > > Some sai only connect one direction dma (rx/tx) in SOC. For examp=
le:
> > > > > imx8qxp sai5 only connect tx dma channel. So allow only one "rx" =
or "tx"
> > > > > for dma-names.
> > > > >
> > > > > Remove description under dmas because no user use index to get dm=
a channel.
> > > > > All user use 'dma-names' to get correct dma channel. dma-names al=
ready in
> > > > > 'required' list.
> > > >
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/sound/fsl,sai.yaml | 13 ++++++=
-------
> > > > >  1 file changed, 6 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml=
 b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > > > > index 2456d958adeef..6f551c68d33db 100644
> > > > > --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > > > > +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > > > > @@ -81,15 +81,14 @@ properties:
> > > > >
> > > > >    dmas:
> > > > >      minItems: 1
> > > > > -    items:
> > > > > -      - description: DMA controller phandle and request line for=
 RX
> > > > > -      - description: DMA controller phandle and request line for=
 TX
> > > > > +    maxItems: 2
> > > > >
> > > > >    dma-names:
> > > > > -    minItems: 1
> > > > > -    items:
> > > > > -      - const: rx
> > > > > -      - const: tx
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - const: rx
> > > > > +          - const: tx
> > > > > +      - enum: [ rx, tx ]
> > > >
> > > > I'm not entirely sure if this was Rob's suggestion, I got the impre=
ssion
> > > > he was suggesting that in the two items case we'd not care about th=
e
> > > > order. But while I think this is different to that suggestion it's =
also
> > > > not wrong.
> > >
> > > I log this at cover-letter. b4 can't support write change log at ever=
y
> > > patch yet.
> >
> > It never will (probably). That's because it doesn't need to. You can
> > just do it with git. When you edit the commit message, then after the
> > tags, Add '---' and put whatever you want after. That works as long as
> > the commit is applied from a patch as 'git am' will drop it.
>
> The key problem is that I don't want to lost notes when respin patches. I=
t
> is easy to make mistake when I copy old serise change logs.

You don't. It is all saved in the commit. When you rebase for the next
version, you just add to the changes history.

> Previously I use git notes + git-rebase, it work fine. Notes can be kept
> when I do rebase and git commit --amend. But one thing is not good.
> git send-email --to-cmd=3D./script/get_maintainer.sh *.patch. It can't
> combine all patches's maitainer to a list. It looks like difference patch
> will be difference --to list.
>
> b4 can help some case. But can't keep git-notes information when rebase.
> It should be git bugs or feature missed.

git-notes always seemed clunky and to be extra work to me. Just having
the changelog in the commit msg is a lot easier.

> > > Rob's suggest was not work. dt-binding check complain too long
> > > if there are two dma-names =3D "rx", "tx".
> >
> > So I'm wrong or you didn't have it correct? No way to tell with your
> > explanation. Let me give you the exact schema:
> >
> > dma-names:
> >   minItems: 1
> >   items:
> >     - enum: [ rx, tx ]
> >     - const: tx
> >
> > This says we can have 1 or 2 entries. The first entry can be either rx
> > or tx. The 2nd entry must be tx. That's what you want. However, '"tx",
> > "tx"' is allowed with the above, but we enforce items to be unique
> > elsewhere. Or I thought we did, but we relaxed '.*-names$' at some
> > point. I'm going to fix that now.
>
> Conor find out my problem. The below code works. I missed maxItems.
>
>   dma-names:
>      minItems: 1
>      maxItems: 2
>      items

Missing ':'

>        enum: [ rx, tx ]

That is not my suggestion. This would be my 3rd choice after what I
proposed or what you had already. Please plug in exactly what I told
you and report back what doesn't work.

Rob

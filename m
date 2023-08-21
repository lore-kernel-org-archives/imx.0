Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0892F4FC
	for <imx@lists.linux.dev>; Mon, 21 Aug 2023 18:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89136C433C7
	for <imx@lists.linux.dev>; Mon, 21 Aug 2023 18:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692643789;
	bh=CVbQN8aFbF/lszSWAiZHC0MM1azE5zB/xw5F4oGVpFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P6xmYqq/jGkG0G7Fwnpj9dOhOdbTEfxxHpdxsyxsk3eiNX6gz72IPdyIid+V5exRv
	 lcF24D1KybKREWXF2WCa26boXOejOUw7X7Gnk0nT+KgTCyKWAwgwVo2cD7HYhMOTC0
	 u+AUvDDr72Si0s0q2S6frMLkZzyhzxNVKLImaZrBpAG6GtndoMMvLqe71/OY7rOEb+
	 G5l8iEEQ4LmjPspaQy3Bvr6n/3rsTAijAdIvxEObOiijGkpMM0rg9gzZ7w7zjI1VP+
	 +rj+BPnslr/cX4HIfPfWj1Lw/cRGm1+d5LjYdaNFRkmZhGm2v91Mv1vFicZwFVGDg0
	 is31kIWxedN3A==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9cdba1228so58999551fa.2
        for <imx@lists.linux.dev>; Mon, 21 Aug 2023 11:49:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YyMVPE+ufG6nKZx/5UjqRgdF/L9Op6ORm4fD14rDSbgwhZ99qoF
	FpgkwV9SafaPDkYXQRu55k8CCWt/Pwek/BV3uQ==
X-Google-Smtp-Source: AGHT+IEFpz1/S+p70gRjtooul/NDbXoG4wUZlvVmeCGNcP59Ogss0GXZ8bGAiYdy0vXPV0+2E3FQkWfRLH+nQyYEPFI=
X-Received: by 2002:a2e:b0f0:0:b0:2bb:be03:4599 with SMTP id
 h16-20020a2eb0f0000000b002bbbe034599mr5079859ljl.11.1692643787551; Mon, 21
 Aug 2023 11:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <CAL_Jsq+XA_P-aRK9_WuGPmJ0_xJgsSr9smZy4BRbKZbmVsMQBQ@mail.gmail.com>
 <PAXPR04MB918539A19B8F817F623BBD1F891BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <9927403d-6dd9-3e5e-8f9d-f38e6640f95f@linaro.org> <PAXPR04MB91850D8807CE374BD7C30CC5891EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91850D8807CE374BD7C30CC5891EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 21 Aug 2023 13:49:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ3dr7gxq+D5DYG8oQ=igzjARz=beQoYL7rrydV4SwDTw@mail.gmail.com>
Message-ID: <CAL_JsqJ3dr7gxq+D5DYG8oQ=igzjARz=beQoYL7rrydV4SwDTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 8:22=E2=80=AFAM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
>
>
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Sent: Saturday, August 19, 2023 3:04 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>; Rob Herring
> > <robh+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>; Ulf Hansson <ulf.hansson@linaro.org>; Liam Girdw=
ood
> > <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
> > imx@lists.linux.dev; devicetree@vger.kernel.org; linux-kernel@vger.kern=
el.org;
> > dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yam=
l file
> >
> > Caution: This is an external email. Please take care when clicking link=
s or
> > opening attachments. When in doubt, report the message using the 'Repor=
t this
> > email' button
> >
> >
> > >>
> > >> This needs to answer why we need this.
> > >>
> > >> It looks like just an abstraction layer to make regulators look like
> > >> a power domain.
> > >>
> > >
> > > Yes, it is a wrapper that allows using regulators as a power domain.
> > > This removes the need to add regulator operating code in each consume=
r
> > > device driver. As a power domain, the regulator will be managed
> > > automatically by the device driver framework and PM subsystem.
> > >
> > > This is very useful when a device's power is controlled by a GPIO pin=
,
> > > which currently requires using the fixed-regulator to achieve the sam=
e
> > > purpose. However, the fixed-regulator approach may have to add code i=
n the
> > driver in order to use it.
> >
> > Why do you start discussion from zero ignoring all previous history of =
this
> > patchset?
> >
>
> Thank you for providing the link. After reviewing the entire thread, I st=
ill don't understand how
> to proceed. What is the conclusion regarding this commonly used use case =
but overlooked feature
> in the upstream kernel?

Overlooked implies we missed and ignored it, but the same concept has
been submitted twice and rejected twice. What use case cannot be
supported?

The detail that power-domains get handled automatically is an
implementation detail in the kernel (currently). That could easily
change and you'd be in the same position as with regulator supplies.
We could just as easily decide to make the driver core turn on all
supplies in a node. That would give you the same "feature". Why would
you design your DT around implementation decisions of the OS?

Rob

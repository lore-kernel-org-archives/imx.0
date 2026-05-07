Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6143E4A3
	for <imx@lists.linux.dev>; Thu,  7 May 2026 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167554; cv=none; b=RHOBTApb5VE5nRzvpaDSF6YflC8kyNZLKdxzkbDc6jbj98clsDYr8Hq1WoAhzp/6cy/6YEXNtKLuxeaUe7dHcBzRvjfHISTFJoNxMqKWmmhpRd6vrpVkMIKxW3BZsG0uczxp6w46BtUfBm1Bqoi0oHc2gM1ydEA+WZshBFXsQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167554; c=relaxed/simple;
	bh=wWbaNgLjvgEK60SoLK00HREVJw2pjszb4CF+qYI0K7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APhvYsQcY5yHR/ObRcz7UPpL5EcjeNb3C1BIPZfT99s3+Bf2p92eBQ4+9rO2fXm3KX/8Kj9//VDI1RPTW/8/JHX46imsr5MAiW5PZCZNiMs6CSg/GucLJ+5DGJTjUkBsibQyB0RW5dYl/fJ44Eq7ALvJNNZeFk5rHoeshX3+m9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiYPc+6m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiYPc+6m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D17AC2BCFC
	for <imx@lists.linux.dev>; Thu,  7 May 2026 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778167554;
	bh=wWbaNgLjvgEK60SoLK00HREVJw2pjszb4CF+qYI0K7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IiYPc+6mLChtKGBenijU6gMwDozISCBsh5s0UVIU39zm0Ba+5cMfNhtyej2cT3POg
	 8ooc59U+xSIwocabHngDh5KPtmqO78vRzCmxy/h2YsjWFtL/0rBmWevWbRcUsMtE+A
	 rP5EIo5kx3kWPBEis8SbD9jWDTpmkV4Ni4me8YzqYRLDqJE6Nn8ZF/1sl7DWf3+KGn
	 Sna6brPjZFimyNKAHYWhvMq8rpo5jCfK8anLeBC3AZiThqFAhu/wcRuXjhUufDxUTZ
	 4zhI6VvgWLOKHK4JBtHrX2sSY3eRmi2w+/fnhYQKfne/Y1Wl+DLGzr+aH0vJwXIkiW
	 dWDE+K/b0JHlg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so1460134a12.1
        for <imx@lists.linux.dev>; Thu, 07 May 2026 08:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Jr435Vnbr2/ohe8Y8H9Lrf+eqwyykoggLAvdJGGuWSXvHp9XpC+18mvyFyoNrHzFIBl4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2dz7buNpIIlwiSHznJoynwrfJ++oYjD2I3l3oa8bxJEfo8SkK
	g+bRtLIFZAhFSry4ppDFf4OfTqEj1Jkfmc5USLaZcrqci901z7n4AlQ8+EC1yA71n6XUIGeIkgR
	0p8u8/6i4kBQlgs0PhjIrf+Q/tdVeWw==
X-Received: by 2002:a05:6402:5344:20b0:67d:98bd:e44e with SMTP id
 4fb4d7f45d1cf-67e0efb390emr1326327a12.17.1778167552504; Thu, 07 May 2026
 08:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
 <20260505141538.GA2547282-robh@kernel.org> <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
 <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com> <zbbez4lpme7szgnsd7fqufbuhmvcftw4sqrmwwwzyxu64i2ppb@fh2fgdkc6tat>
In-Reply-To: <zbbez4lpme7szgnsd7fqufbuhmvcftw4sqrmwwwzyxu64i2ppb@fh2fgdkc6tat>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 May 2026 10:25:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJWyRPh_hmJW8p7+VvtcqpS0a_azjMO-PyQgkqQUfLAGA@mail.gmail.com>
X-Gm-Features: AVHnY4K59HFC-Lj0a6_OWOrJwlVTiPxlkDo7ivtKaVL4QyHlHtRcFSTM5LnBqeE
Message-ID: <CAL_JsqJWyRPh_hmJW8p7+VvtcqpS0a_azjMO-PyQgkqQUfLAGA@mail.gmail.com>
Subject: Re: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in
 reg property"
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
	victor.liu@nxp.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 6:55=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> On 26-05-06, Rob Herring wrote:
> > On Tue, May 5, 2026 at 10:46=E2=80=AFAM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > On 26-05-05, Rob Herring wrote:
> > > > On Mon, May 04, 2026 at 10:21:42PM +0200, Marco Felsch wrote:
> > > > > This reverts commit 16c8d76abe83d75b578d72ee22d25a52c764e14a.
> > > > >
> > > > > Remove the 'reg' and 'reg-names' property from the LDB.
> > > > >
> > > > > The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
> > > > > (i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
> > > > > register ranges with loose register definitions. E.g.
> > > > >
> > > > >   - On the i.MX8MP there is one register which controls the AXI
> > > > >     threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) =
- IP2).
> > > > >   - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 setting=
s, PXP
> > > > >     handshake, ...
> > > > >
> > > > > In conclusion: it can't be ensured that one register belongs to o=
ne
> > > > > dedicated IP and the LDB is rather an exception than the rule.
> > > >
> > > > It is fine if there's a child node for LDB if the LDB registers are
> > > > consistent, but the other misc things are represented by the parent
> > > > node. It is certainly not a requirement that either everything be i=
n
> > > > child nodes or nothing be in child nodes.
> > > >
> > > > What I don't see in this series is what problem does this fix? If y=
ou
> > > > are going to break compatibility, then there had better be a good
> > > > reason.
> > >
> > > Hi Rob,
> > >
> > > with the upcoming i.MX9x SoCs the parent syscon (BLKCTRL) controlls
> > > multiple other IPs, e.g. a DPI mux added by commit 3feaa4342637
> > > ("dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema =
and
> > > example").
> > >
> > > During the discussion of the above commit we agreed that the sub-devi=
ces
> > > of the syscon shall not use the reg property due to the fact that one
> > > register serves multiple purposes. In the above case the same registe=
r
> > > controlling the dpi-mux also controlls MIPI-DSI bits. The MIPI-DSI bi=
ts
> > > can be abstracted as drm-bridge as well. Two sub-devs using the same
> > > 'reg' property below the same parent seems odd and I don't know if th=
is
> > > allowed either.
> >
> > It's not generally. There are some exceptions to define things at the
> > bit-offset level rather than byte level.
>
> Thanks for the clarification.
>
> > > Now the LDB is also part of this BLKCTRL syscon device but requires t=
he
> > > reg property. TBH, I don't know why the reg property was added in the
> > > first place, due to the above fact (multiple sub-devs - same register=
).
> >
> > Probably because we asked for it, but we don't always get a complete
> > picture of all the h/w functions (though we ask for that too).
>
> I get your point completely and I don't blame anyone.
>
> > But nowhere have you said the LDB registers are mixed with other
> > functions. If they aren't, then there is absolutely nothing to change
> > in the binding. If they are, then yes, we shouldn't have 'reg'.
>
> No they aren't mixed with other functions (for now).

For now? Is the h/w going to change or is the binding *still* incomplete.

> Can you please
> confirm that mixing 'reg' based sub-device nodes with non 'reg' based
> sub-device nodes  is allowed? E.g. if the below example is allowed?
>
>         system-controller@4ac10000 {
>                 compatible =3D "fsl,imx93-media-blk-ctrl", "syscon";
>                 reg =3D <0x4ac10000 0x10000>;
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
>
>                 ...
>
>                 bridge@5c {
>                         compatible =3D "fsl,imx8mp-ldb";
>                         reg =3D <0x5c 0x4>, <0x128 0x4>;
>                         reg-names =3D "ldb", "lvds";
>
>                         ...
>                 };
>
>                 dpi-bridge {
>                         compatible =3D "nxp,imx93-pdfc";
>
>                         ...

Depends what is in "...". If only a compatible, then no. If there are
actual resources defined, then yes.

>                 };
>         };
>
> Furthermore I thought that for the MMIO bridge@5c device, the 'reg'
> porperty would either require the full register address, e.g. 0x4ac1005c
> or there needs to be a ranges property.

There should be a ranges property no matter what.

Rob

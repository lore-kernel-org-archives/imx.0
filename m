Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D891A3BC3
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724861519; cv=none; b=lkmVnnfp8+ogTzx0gzNIwO4tUp7Wnu2CqDQ95OemqsAnRQo9WRL82c5xjnqFDA7it/sbNXRxOZbiE8v7/dkSjgYDEXqM58nMH4gYe1QfkAmjG1CfCrYl6R18MMvN5u89JbbmXmOqpNbLchhDmFZUNbQctwI3jiw3tSvfLErQTl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724861519; c=relaxed/simple;
	bh=diZD2GWbBKESSetbD2TM0fA8pWIvhxDQ8Hfp1eGP4Ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moKbBvVdv7H0LmLEZdn0xwJNzZNX+Yw5EGQRVqg2qopmm8V/2VNbMswF/cptbolnL8NcDzRcAEcM0Bx7YkIKvvDr+CL9ulzwdrJ7gyy2FLm8AunmmEbKOIakWFWmOiv3cyFhuVQ0O5FowNTaMe8s16Y9iswnWbtP2OHTTeLjRGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYrKY2mq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYrKY2mq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66E4C4DE06
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 16:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724861518;
	bh=diZD2GWbBKESSetbD2TM0fA8pWIvhxDQ8Hfp1eGP4Ws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RYrKY2mqqGpMmaXk4vg4l+5MHlujuCTohPUPMgR6oQqzR5d/L71Du8jhXoyScRa0p
	 An1A3QJUg6hkCEiIDEVVL59Zs+TcnVoXwsof3tE7w3fL9+1Em6imUvTxTPBq1mkWOY
	 hdOUF+Bobxr+VKxo17m9hRH4tiaYIbXY+fcrf9yDmQFoIZMTu1eVJxXEe/pFj3euEa
	 O+ZjcHXJFeBXCp35mmSlSSKs8hAC8aGj+F0kEilw2TiU8Nv5N7IWMWULkMocnBneG7
	 SLxzOloj0VZLd/BuyhXfxLDDGzTbl2j3N1vCY9k22U2bTXUixOaJpO87AW8H8cHcKT
	 b3BC0qT5IeZ+Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-533488ffaebso8416831e87.0
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 09:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0LOCIXcSNj2KTAJZwstLj+0WxPXhFN8VpkBjzBNu2jjQX73iK89XrjWKMe96Ybzw5J4U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/9YRHoilxT5bdccqDGbZuDhMsxDntRqorhYpArd0izLt/HuqG
	9OEoqEtKUv3SWWydCixJ6EhIr+qJ20RLiWG2m7xXBaya/ratKfMbRasZVoWW38u81L+tIlKq3YR
	iBdMa7qGZUkWGGycrZZVpHDiRVg==
X-Google-Smtp-Source: AGHT+IGz4YxtRtAMkux7jozATIO5b1zf3zLkQWdu6nc1eiZcWtvHWH+xq0dm9Fxvf9Ays6zepA/PrCTmUfQYxLVfxWw=
X-Received: by 2002:a05:6512:308c:b0:530:b76c:65df with SMTP id
 2adb3069b0e04-5343878430bmr12959840e87.35.1724861516055; Wed, 28 Aug 2024
 09:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828112139.2665814-1-lukma@denx.de> <172484936571.3462707.10762753590627002293.robh@kernel.org>
 <20240828160553.53e164c3@wsk>
In-Reply-To: <20240828160553.53e164c3@wsk>
From: Rob Herring <robh@kernel.org>
Date: Wed, 28 Aug 2024 11:11:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ4+=L4hOYWKUBRTHpSMfMNaNvEy0xcjX=fZ4r4KP8x3Q@mail.gmail.com>
Message-ID: <CAL_JsqJ4+=L4hOYWKUBRTHpSMfMNaNvEy0xcjX=fZ4r4KP8x3Q@mail.gmail.com>
Subject: Re: [PATCH] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 9:12=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:
>
> Hi Rob,
>
> > On Wed, 28 Aug 2024 13:21:39 +0200, Lukasz Majewski wrote:
> > > The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
> > > some extend similar to already upstreamed XEA devices, hence are
> > > using common imx28-lwe.dtsi file.
> > >
> > > New, btt3.dtsi has been added to embrace common DTS properties for
> > > different HW revisions for this device.
> > >
> > > As a result - changes introduced in btt3-[012].dts are minimal.
> > >
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > ---
> > >  arch/arm/boot/dts/nxp/mxs/Makefile   |   3 +
> > >  arch/arm/boot/dts/nxp/mxs/btt3-0.dts |  12 +
> > >  arch/arm/boot/dts/nxp/mxs/btt3-1.dts |   8 +
> > >  arch/arm/boot/dts/nxp/mxs/btt3-2.dts |  12 +
> > >  arch/arm/boot/dts/nxp/mxs/btt3.dtsi  | 320
> > > +++++++++++++++++++++++++++ 5 files changed, 355 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/nxp/mxs/btt3-0.dts
> > >  create mode 100644 arch/arm/boot/dts/nxp/mxs/btt3-1.dts
> > >  create mode 100644 arch/arm/boot/dts/nxp/mxs/btt3-2.dts
> > >  create mode 100644 arch/arm/boot/dts/nxp/mxs/btt3.dtsi
> > >
> >
> >
> > My bot found new DTB warnings on the .dts files added or changed in
> > this series.
> >
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the
> > warnings are fixed by another series. Ultimately, it is up to the
> > platform maintainer whether these warnings are acceptable or not. No
> > need to reply unless the platform maintainer has comments.
> >
>
> There a few things to clarify after:
> CROSS_COMPILE=3D"arm-none-linux-gnueabihf-"
> ARCH=3Darm make -j4 CHECK_DTBS=3Dy nxp/mxs/btt3-0.dtb
>
> 1. mxs-spi.yaml vs mxs-mmc.yaml -> both refer to the same set of HW - as
> those IP blocks can work as both mmc and SPI.

Sounds like there should be 1 binding then.

>
> 2. For the sound codec:
>  codec@1a: compatible: ['wlf,wm8940', 'wlf,wm8974'] is too long
>
> This is a bit problematic as well - as WM8974 doesn't have ANY ID
> register, so it needs to be probed manually and decided which module
> with sound codec needs to be inserted. The WM8940 is the pin compatible
> replacement.

So if the OS has 2 drivers for these 2 devices, which one does it
pick? The answer for Linux is it is undefined. The expectation is if
there are multiple options, the firmware figures out which one is
present and adjusts the DT.

> 3. The simple-bus.yaml seems to be missing in the Linux kernel tree -
> problem is that imx28 has 'apbx' bus.

simple-bus.yaml lives in dtschema repo.

Node names should be generic, not named for the implementation/type.
The binding is fairly flexible in allowing ".*-bus".

> 4. The fsl,lcdif.yaml doesn't allow the situation when one specify by
> hand (in DTS) display parameters (as different ones can be used by the
> manufacturing site).

Shrug. At the end of the day, the binding and dts have to match. One
(or both) has to be adjusted.

Rob

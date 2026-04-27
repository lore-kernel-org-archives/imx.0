Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA1394499
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777323039; cv=none; b=PKV51eO34hzmz+90L2lE10zxAlR4XsTctRCwh6klm2SK/QUkTyWMsFdiKPw931amMBU+Y9n9O2vCulqktPtwJYVsfKYIkiBVqDzSlnJ/OZIdlv+4n7gFUzz1FQInR84MaadzaUYuf/1Y33hDdt3CjNZwqKdC1OHBIKICrkr01KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777323039; c=relaxed/simple;
	bh=LS7UeFCYENZ9Xd/KmF8dbXXziMoWhhO1+Zz/OyxlBBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRGw/OZyfc9l5akUvvgSMC1lEMTldAWNck59jTSg3E40aqRyZ7hQOrS3P16eq3mdQYGaHQljHpyz0VPWINDPFhFo7a2ynnRQXu4IxIDUjByT4hbjBTAdy40KNquxxfI53s9EdaTGeW/TIdAJNaOxMvTepTXNr3r8Q4bgkaHgcVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3MSBf3p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3MSBf3p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5C1C2BCFB
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777323036;
	bh=LS7UeFCYENZ9Xd/KmF8dbXXziMoWhhO1+Zz/OyxlBBk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E3MSBf3pk3wwnNPFMzp1z1nVz6t1Xj7EayjcLrC5JOyu74LCaGcgIhk0FdcVjsEga
	 vUvKo3y3SZXXrbn7TdUYgOXjWAKiiCgs2NKcJfYubTZd8Md6D3EN7AD4zi1BfVwbpS
	 WNvzyVPxXyfScZmpQgR8Zyc3NSpWLQlR2J0t7TVmbg5JjWcgUmCNVP4aFOfawR5JGa
	 0r0qbprcow33GerK0DWcBcB7tJMI9CPlCCfvBgGuwH4wVroFcEE494JnsHUKVnZmzC
	 QF8r9X+GBu7HVM7w09KCK08ONFrRfwr1SvlYHqndehJwWIKPoVfohZ2q7FxsiZ0WYL
	 VT805+Yi2VThw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e7d984096so117523661fa.2
        for <imx@lists.linux.dev>; Mon, 27 Apr 2026 13:50:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LaOqlYI/50o7LZvfzhXESzDTd2eiOzP9EAlg2RJr4tCk/kv0qF3yxbhCM62WIVH54xyg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzupy7KBSBOO/5GbA0i9a3nVBjIjMcwJv9aWhwhZKswUcedLkba
	V1C5alwvrSLT4UxrTfYD9VFgXXUJ8LATG/wpeNpvdQZ+BUoBs7A1+vA8P6rEIibv53+T/echKdc
	qO5BpfSvKryE8jXUXaEtK63aboneG7MA=
X-Received: by 2002:a05:6512:3f18:b0:5a3:fe5e:3d49 with SMTP id
 2adb3069b0e04-5a746626a7dmr115073e87.23.1777323035055; Mon, 27 Apr 2026
 13:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
 <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com> <CAD++jLmi1Q4sGeY6vK7fxw8AdCmiiW-8kdEi4OFkV1xep=Od_A@mail.gmail.com>
 <AS8PR04MB9080113A71D87E952561FC53FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB9080113A71D87E952561FC53FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:50:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLkuDWPd5KsKTpQ=htyupaXEwkPt_jV+RNngs+TTVkYSkw@mail.gmail.com>
X-Gm-Features: AVHnY4LMs19qECeHOCX1rdutVu9oADk-D7aG7FAXma_lqqC3H1U5IuEltiXqiKY
Message-ID: <CAD++jLkuDWPd5KsKTpQ=htyupaXEwkPt_jV+RNngs+TTVkYSkw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 11:13=E2=80=AFAM G.N. Zhou (OSS)
<guoniu.zhou@oss.nxp.com> wrote:
> [Me]

> > I understand that the driver needs to deal with this in a per-gpio-line=
 basis
> > though, have you considered:
> >
> > 1. Just hard-coding this into the driver based on the .compatible
> >   string, if the remote GPIOs are always the same for this TI thing?
> >
> > 2. If it is just for one particular system, you *could* actually have
> >   a table/mask inside the driver for this:
> >   if (of_machine_is_compatible("my-funky-system")) which will
> >   kick in only on that very machine,
> >
> > 3. If you really want to store the information in the media i2c
> >   device node, add some custom property like this:
> >   ti,remote-sources =3D <0x0000001f>;
> >   where a bit is set to 1 for each GPIO which is remote.
> >
> > Putting flags on the GPIO lines themselves seems too complex and system=
-
> > specific.
>
> Thank you for the detailed feedback.
>
> After considering your suggestions, I think option 3 (custom device prope=
rty)
> is the most appropriate approach for this case.

Why is that the most appropriate?

I think (1) is most appropriate, if the hardware with this compatible
always looks like this. You need to answer the question if this
is a per-system flag for the GPIO lines or something that is *always*
applicable for a device with compatible ti,ds90ub9NN-q1?

If it for example always applies to ti,ds90ub971-q1, then make that
compatible decide how to handle indvidual line, just write
code for it. That is case (1).

If this setting depends on how the serializer is integrated and the
remote setting may apply to some systems with this device and not others,
you have options (2) and (3).

> However, I initially implemented this using a custom device property
> (ti,gpio-data) in v1 [1], and Vladimir rejected that approach.

Vladimir is saying that the driver code should handle this
without any extra DT properties. That can be done with approach
(1) and (2). But I don't know about that.

I think the basic problem with the patch is that no-one (myself included)
apart from you understand what a remote serializer is, why it is
remote and what that means, how the mechanism between the
components making up this essentially works etc. I.e. a much
longer and more detailed commit message and binding explaining
very cleary what this is and how it works and why the special
property is needed on some lines, and how it is a property
of some specific way of integrating this GPIO controller.

If a custom property should be used ti,gpio-data is too generic,
come up with a property name that actually says what it is all
about and which anyone would understand. "gpio-data" is a
bit "the thing that does the thing" and overly generic term.

Yours,
Linus Walleij

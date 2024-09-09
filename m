Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C158F1891C0
	for <imx@lists.linux.dev>; Mon,  9 Sep 2024 21:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725918383; cv=none; b=VqS25UMi2gt2RI+f2cnPoKJZKwBrB1N/+KLsRI16S3adtPuxjhQ+HcQ8tQUEw/79xFnFQXwbH7pn5ULGZZjm9mplgGIiHcbuHXH1F/D3xvbnHQHaM80T6EpAA6EbKqz08F+YC+WwZvAUWxS69bkJTmcAs7HypZttdlmiX/yBrI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725918383; c=relaxed/simple;
	bh=nM6fWCoX1di+0MQViZg543ykFf2oNkQIUsf5k3wnNXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpH2h7mxytZ+TDBpnFJfxt1DJyTWtQ3vZ5dEnf6BV9AqhlWvVuyTQ9h+sA7RDn3nsbqJNzO5i8V9BU+CeX1SEdvgB9CtqTVmzddBcJN7DMqhchvo9nelgUMG+d7MK1w87awTQN4nV/b8qGlQrnXQit/gJM0uMs6wNaGQbxjJEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=atgEs8o5; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="atgEs8o5"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f74e613a10so36430941fa.1
        for <imx@lists.linux.dev>; Mon, 09 Sep 2024 14:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1725918380; x=1726523180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h58eAOOyutx8X4vwncmQ+slvyq67BTtOg7qW508aZBY=;
        b=atgEs8o5RsrQuSY2ASPZirmFnTQW8guNk4HKcNqLuZv85caQni4AKNPcdUuKLzjlZQ
         7w1JZ0KXzopRmyHQ8p4hzGEu+7LDgGIZIhJdLcn+EI+9o2gsRL1NKdqWtRHdU+j77p8L
         /08fvj7SqzxSbEihtP+2N9UflY8agiqYLLEM76CFvzUQDHRujm8jKW2jgauATXZMM1Q9
         CUnGf7k1GYPq7CGWoeC7Kb5oLkI70JUWBK0xEdK7ad7sQM0vrhNxxflO3rOGZQOEMJLl
         +DLmLpMjNmYzQJpelCrvgyEPWmh8JMpJnbdbEVPsmTMKPt4AiJqoEF6TjCitvmQe2aE7
         EUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725918380; x=1726523180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h58eAOOyutx8X4vwncmQ+slvyq67BTtOg7qW508aZBY=;
        b=Xoowa/BtqAOv0tuUYIRM/eXBEmsTMUBnmrpMs3KJUbSvY+z2fPEuEhz0fYA/CWh7ck
         gzXzaWDG75aF2MbbhSaGn7SYV6hc7CfhUEzHZlRBJ0MaPK+vYMTSYZtCis2b0vWE8CZE
         vW2hL+uNbuML4evX7nT9rXZO1GpzVIdPfWcikFy0Tzf9NIUuwWRfWQIMIDcTHsHtPdpV
         dytemulFF7XAOm4KfsLjxPk5wfqjG3x/l8X1DRaHJBO354xWy3oPWAsepPwhoX2hByHw
         jh/xU8bHMIcbRGMhtiKyTLtynZNERJnPlSEX992RVP3Bk5V7atnzNuMDTn7wgkDpwoIh
         EGvg==
X-Forwarded-Encrypted: i=1; AJvYcCXN3Ne2nMrpmP1nnoyeOd/mpQ3+NhZgGJrDzWU9S/SMa9v9TRPDqnc/k5UfEgg1C0MxhUE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8zJc1kPWeoma166lDWlKmifq+zk0ZnuqYraO+lQevRu31wVKH
	bCCQFhKzrgyBLgU5BaYmO0+KVMNXvpjK6t10MleH3VSUpOovljSRul5SuboSShrsBYY59QT5B03
	FA4pmhZYA1lwOwec34Fahic8MvXCNBF6xDuwZFQ==
X-Google-Smtp-Source: AGHT+IEjH3/u/TXEjoWXe2Q1DAHyvUARMeL74z3Q9298y4A1ALPxZ2Iw4jLoIipvASJ4nbuMM/siJdKogiXxoONctHU=
X-Received: by 2002:a2e:be9e:0:b0:2f3:c384:71ee with SMTP id
 38308e7fff4ca-2f75aa07bd2mr89494941fa.33.1725918378875; Mon, 09 Sep 2024
 14:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905183107.517244-1-tharvey@gateworks.com> <PAXPR04MB8459CD40E8A0925EE3396F2D889E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459CD40E8A0925EE3396F2D889E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 9 Sep 2024 14:46:07 -0700
Message-ID: <CAJ+vNU1UH5UNb3rEGtJ_HpsJvCAsgtqAwSfvTS9s1yM6JVad-g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8m*-venice-gw75xx: add Accelerometer device
To: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 1:14=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH] arm64: dts: imx8m*-venice-gw75xx: add
> > Accelerometer device
> >
> > The GW79xx has a LIS2DE12TR 3-axis accelerometer on the I2C bus
> > with an interrupt pin. Add it to the device-tree.
> >
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > ---
> >  .../boot/dts/freescale/imx8mm-venice-gw75xx.dtsi | 16
> > ++++++++++++++++  .../boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
> > | 16 ++++++++++++++++
> >  2 files changed, 32 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> > index 5eb92005195c..417c19774b17 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> > @@ -116,6 +116,16 @@ &i2c2 {
> >       pinctrl-0 =3D <&pinctrl_i2c2>;
> >       status =3D "okay";
> >
> > +     accelerometer@19 {
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&pinctrl_accel>;
> > +             compatible =3D "st,lis2de12";
> > +             reg =3D <0x19>;
>
> Nitpick:
> compatible, reg should be top.
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Hi Peng,

Thanks, I will submit a v2

Tim

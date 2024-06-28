Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F37B37B
	for <imx@lists.linux.dev>; Fri, 28 Jun 2024 02:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719540345; cv=none; b=rUZ1KFV211k/L4uXuVU/LZdaVEW+M7ITopx/KPXK6XYxSXnWBcwdMqL+MAfGTSDYv88wlKVcxbIaxyQCXglGMrOxUvLjqZK2DLywSo1nbb1qSv9yce/5KYkz0PW1TZDwAvD4MVvMAgIEPPcYWAH/YdkGhlVCLDF4w+hNRvOHxxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719540345; c=relaxed/simple;
	bh=gD9XgmxVJC+Q1OtnxS2UeubjQf6UO530r3oJ7FxTCt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AK4B28w8NbkitaVyYcGa4HConlqm/dn1rpHIj07W7lLPfbfzvoNi+sodCab8xA1KKnn5REzoSX4AXjbN45umJWzlYUNNtcP82eetjs3dhms0AmMBH6xEln9lSZfJIgPm/0yJx8+3naMf6+k550SfLAz2vlxV61XVlHKvseJOqq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9L1GtSy; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9L1GtSy"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-376517b9408so602295ab.0
        for <imx@lists.linux.dev>; Thu, 27 Jun 2024 19:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719540343; x=1720145143; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeCg9T/nzBxod3Q7D14/fDxiz4AiEAfftwtSHln+1t0=;
        b=J9L1GtSynhWUGqRtJ0Beo+rr3toMSU1omUFEwHqhCrPahXTDk2TUzBepqokAQPAtoN
         JOc5tgVio+vScObcv3Hj+S04Q6+LJ5hu9q9J3Q8A4/8qNyAq5zhBTcmy+DvXmox4fIkx
         cG0WXPfT5B4mQkk9DIPO9dVv8ZCMkCm7Q6oy8OqDVSCdnq4H/rrcUNfJNHNNNO7uh0Ks
         R6oMHZ38rmXXdeUtZ1IvJ3yaVaQsG8Ra8CJfmyFavH/31Wuet6VKh7kitpFW4QVJNVFL
         bT/cNF/I57mEEvUH6QCE56pGbthYBgjDUpP06VaaYr5h5LCK8tMji6RjJMq6XgPTxZUD
         1VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719540343; x=1720145143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZeCg9T/nzBxod3Q7D14/fDxiz4AiEAfftwtSHln+1t0=;
        b=JVoO2aH21GPCmWJxynVFFMXX4uOvOnjDNQHswgPmmhViOQBUDGPLsyV5Ri53z/p45X
         oJdyTKhEQfSuhWQS9v831oLQeYhcrMLavdc8SESnov+hnEYG5AshmQzmWnSmqRMXHBh/
         9RqeaLKMN/vYohBa8XOguREoD4B/yBWeffnGm4LEkGgXfKno7TJx8LR6LYxXRjULxjGi
         cWvxJLVvA+hmSI7T2u9qmTX128j55V50iaQ3qPdHXIUfNLQBOhvtT5fqJ2d9aT0vHRiM
         Omr/T2sZVels4UI1Hz1cszfmi0T6xRqIjt0gUuVcadUjptUl0Hbtis9q0jgwwOw1MOQm
         ABuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0+b19ftR7ZuQh8EkatGlETzF5P/z05O7o1NNGFoKT/QU5qjDWoSKld+geyqkg/4Nu+356uJxdIiup94UC44f9YnuW
X-Gm-Message-State: AOJu0Yx/bNEPc0ggSL0IKjDXWB3Gd2L9eb66AN/LRV8i6bTaGfoXY9oH
	9HK2xKQlZ0lvYit7bDCqTk4iLy01qDI98xx2BqLUMAmnELn1OuLCqeppho6aV3mDciKU+Ca+9F/
	9ZPqdvbd1+katCQTbWlLd6pMjFlk=
X-Google-Smtp-Source: AGHT+IHfKp78K3bD76VSico8rt/g/p5hRvCSD+wH/YsY732oo7TT8J6D6HQLx4J9LS02OkF8+lr9iOA5Ok1CXzD6kes=
X-Received: by 2002:a05:6e02:1c86:b0:375:a8c0:eecb with SMTP id
 e9e14a558f8ab-3763b0b4905mr221135135ab.6.1719540343296; Thu, 27 Jun 2024
 19:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1719481981-4069-1-git-send-email-shengjiu.wang@nxp.com>
 <1719481981-4069-4-git-send-email-shengjiu.wang@nxp.com> <AM6PR04MB59411A2B4E63B0562BB652A288D02@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB59411A2B4E63B0562BB652A288D02@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Jun 2024 10:05:32 +0800
Message-ID: <CAA+D8ANqk=gmsEO=cd7k2P4A_Sv6Cp0KWLq-aG_BXVnN5=iFFA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp-evk: Add audio XCVR sound card
To: Peng Fan <peng.fan@nxp.com>
Cc: "S.J. Wang" <shengjiu.wang@nxp.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, 
	"broonie@kernel.org" <broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 9:13=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH v2 3/3] arm64: dts: imx8mp-evk: Add audio XCVR
> > sound card
> >
> > Add audio XCVR sound card, which supports SPDIF TX & RX, eARC RX,
> > ARC RX functions.
> >
> > HDMI_HPD is shared with the HDMI module so use pinctrl_hog.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 27
> > ++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > index c2c708c492c0..a64e8a6c830d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -209,6 +209,19 @@ cpu {
> >               };
> >       };
> >
> > +     sound-xcvr {
> > +             compatible =3D "fsl,imx-audio-card";
> > +             model =3D "imx-audio-xcvr";
> > +
> > +             pri-dai-link {
> > +                     link-name =3D "XCVR PCM";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&xcvr>;
> > +                     };
> > +             };
> > +     };
> > +
> >       reserved-memory {
> >               #address-cells =3D <2>;
> >               #size-cells =3D <2>;
> > @@ -748,7 +761,15 @@ &wdog1 {
> >       status =3D "okay";
> >  };
> >
> > +&xcvr {
> > +     #sound-dai-cells =3D <0>;
> > +     status =3D "okay";
> > +};
> > +
> >  &iomuxc {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_hog>;
>
> Could this be put under xcvr node?

The issue is that this pin is shared with HDMI video function.
So I think it is better to put it in iomuxc.

Best regards
Shengjiu Wang
>
> Regards,
> Peng.
> > +
> >       pinctrl_audio_pwr_reg: audiopwrreggrp {
> >               fsl,pins =3D <
> >                       MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29
> >               0xd6
> > @@ -838,6 +859,12 @@
> > MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16 0x140
> >               >;
> >       };
> >
> > +     pinctrl_hog: hoggrp {
> > +             fsl,pins =3D <
> > +
> >       MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD
> >       0x40000010
> > +             >;
> > +     };
> > +
> >       pinctrl_i2c1: i2c1grp {
> >               fsl,pins =3D <
> >                       MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL
> >       0x400001c2
> > --
> > 2.34.1
> >
>

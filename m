Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EDD8836
	for <imx@lists.linux.dev>; Sat,  9 Nov 2024 00:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731113830; cv=none; b=ckYlsmOWbnkjFCndp/C1MC93FfWDLUyp88PDBwNHBkFcAfNVN0Z0i5N9GWQYK3eKkEY+XcrS8EQ5DGQCRTqZvf6kpoGxYwFQV3bTmgF224G7N7fr7EYGS9lIlFi8kAA9IKX/pKeoX8O0XRn91YY5tN2PjBtoIoJ3GD+fLyRtnJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731113830; c=relaxed/simple;
	bh=AAgh7H7XwsgjOcj3IfUCIIRu75IjtNvx9dP2aHyYSfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvALFZYzPgY3Pyt/QKoe31yL1yj9d919FI6IWGtm9aGqYY/CT7oa85cvGTJfuAEzkFkQYrU2iBwU+DwBrZOTuHOVOscrdG7Xl9MwiR2LL15OG7QjTDcYlsx+4xLsSipLuOzQtnCxUP2Rk5B6nGCL1p3Y82Fgpyppuwl1eMtC/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icNLSvzY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icNLSvzY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7240fa50694so1804542b3a.1
        for <imx@lists.linux.dev>; Fri, 08 Nov 2024 16:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731113828; x=1731718628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giiL/kmBTCVF3U8QV+/xjUjiPzMAGE0/2NFlz+o4GC8=;
        b=icNLSvzYaumooKT6wrb4WR2eXMimnfDxKwVqqoKu5QUFL7dF9IgVWuWFywchpSk2+g
         0FfkHDSQPSvNqFISfa6jWv41jSfTNUGVHPUHDwRc0q6utLmV7dSzEQyXmWtGuYZK0siS
         yYo3cJsLGIwRR6QAJ0sSmGebir3qx+g/ID6C9A6VmnZ2SBeC8wl0amdSZqtxvF8/WkJ/
         BbiWcdsORxIIYlFI22tdfsS04kIuJqG3UMOcfC9LIAcqzvy5AimRRZkUHfdfSq4+ZMdr
         M8YjnWv3km3eZw5t8pfaeJxoKyoVX6eqaV23EQgMl5EWNZWmVG2YXFCaTPnCMYgzjPAH
         6vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731113828; x=1731718628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giiL/kmBTCVF3U8QV+/xjUjiPzMAGE0/2NFlz+o4GC8=;
        b=lXtJyGe2pmHhpKJLo3cRXnCjuM8OI+n0o4BouOno6M4pTXI2KI5ltR3xXkoW79tBan
         ZTv60T42E8GlYwDyaGN/tgTlF36FS8QTVxVt1b4ZITqMjKfKvb+jOrnaxTxBK36vjJXN
         Ucyx7AQDf/DRKWmF2gmVovHJNxN394Qp3d8DnH2mf3jXPPM8BUZJuanBS34z6/G4QcXD
         7lYbScmq8LiAksJHF74cXBjAjcX7Ps1PsRPGeSX6a6eKtVbvwa8Xa3f96C3AA+dJI1bG
         14NqOCIZ/Nk9sXiVQjnzXVYLw82eIkhUUEdVkFq6D5H6UpaLkbtt0lYn+3YiWyivS/7n
         oxcA==
X-Forwarded-Encrypted: i=1; AJvYcCWRxZucldIHDW6Qg3c5HMniEeLUFCujS+cBI4Aat6XuojxWOm3hDNFmM599gCoDtCMSCQ4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Q6FTGcMLYz8nfEjyCp07nIlSdPMKe9lITFF1ZfkCy7uAIOqy
	0Wo5S/B6foXqo5a+5kZWdJqn/AWhtuwQdOxnO/sS5qdxcliWAl0nJlhewpiz3+ATDxbFpBj5OcV
	koi/yalSX3ilcnt9ZM4VGCPCOV9U=
X-Google-Smtp-Source: AGHT+IFCBsAPm88J58jQ3X5q6NhHTLb+ZI6Xoq5Upa8IQqpPBawMNUt3VLvT52CoHD2XFc2ek2esFaO+L1peVd03Wc8=
X-Received: by 2002:aa7:888c:0:b0:71e:634e:fe0d with SMTP id
 d2e1a72fcca58-724132c4b0dmr6649906b3a.12.1731113828160; Fri, 08 Nov 2024
 16:57:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
 <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
 <4bix7me5vaoyhcuffyp4btajmhy7no6ltczoesopaz2fqupyaw@fensx4nn472u>
 <b7c1499b-8337-421c-9734-6e518d678ff8@kernel.org> <CABGWkvrYJL9=zrPSFuEAgKO+9gDHD6RmCJM6Br6Le_eh578ETQ@mail.gmail.com>
 <54dd6ae6-b992-451e-b1c6-8a1968955f4a@kernel.org> <PAXPR04MB8459BE3474EFD4FCC28E0E82885D2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <8c310eca-d695-418c-82cb-a89351d83887@kernel.org> <PAXPR04MB8459B6F8D5C623D19CCF6B39885E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459B6F8D5C623D19CCF6B39885E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 8 Nov 2024 18:56:56 -0600
Message-ID: <CAHCN7xLSw7sBywVJ0ZcoOy4ao8x8GxpVwg8=4h-HoOxEsz565w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
To: Peng Fan <peng.fan@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 6:37=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support
> > spread spectrum clocking
> >
> > On 08/11/2024 13:50, Peng Fan wrote:
> > >> Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock:
> > support
> > >> spread spectrum clocking
> > >>
> > >> On 07/11/2024 15:57, Dario Binacchi wrote:
> > >>>     clocks =3D <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
> > >>>                   <&clk_ext3>, <&clk_ext4>;
> > >>>     clock-names =3D "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
> > >>>                              "clk_ext3", "clk_ext4";
> > >>>     assigned-clocks =3D <&clk IMX8MN_CLK_A53_SRC>,
> > >>>                                   <&clk IMX8MN_CLK_A53_CORE>,
> > >>>                                   <&clk IMX8MN_CLK_NOC>,
> > >>>                                   <&clk IMX8MN_CLK_AUDIO_AHB>,
> > >>>                                   <&clk IMX8MN_CLK_IPG_AUDIO_ROOT>,
> > >>>                                   <&clk IMX8MN_SYS_PLL3>,
> > >>>                                   <&clk IMX8MN_AUDIO_PLL1>,
> > >>>                                   <&clk IMX8MN_AUDIO_PLL2>;
> > >>>     assigned-clock-parents =3D <&clk IMX8MN_SYS_PLL1_800M>,
> > >>>                                              <&clk IMX8MN_ARM_PLL_O=
UT>,
> > >>>                                              <&clk IMX8MN_SYS_PLL3_=
OUT>,
> > >>>                                              <&clk IMX8MN_SYS_PLL1_=
800M>;
> > >>>     assigned-clock-rates =3D <0>, <0>, <0>,
> > >>>                                          <400000000>,
> > >>>                                          <400000000>,
> > >>>                                          <600000000>,
> > >>>                                          <393216000>,
> > >>>                                          <361267200>; };
> > >>>
> > >>> The spread spectrum is not configurable on these clocks or, more
> > >>> generally, may not be configurable (only 4 PLLs have this
> > capability).
> > >>> Therefore, I need the "fsl,ssc-clocks"
> > >>
> > >> No. That's not true. You do not need it.
> > >>
> > >
> > > i.MX8M clock hardware is similar as:
> > >
> > > OSC->ANATOP->CCM
> > >
> > > ANATOP will produce PLLs.
> > > CCM use PLLs as input source.
> > >
> > > Currently there is no dedicated ANATOP driver in linux.
> > > The CCM linux driver will parse the ANATOP node and register clk_hw
> > > for the PLLs.
> >
> > I do not know what is CCM and how does it fit here. What's more, I
> > don't get driver context here. We talk about bindings.
>
>
> CCM: Clock Control Module, it accepts PLL from anatop as inputs,
> and outputs clocks to various modules, I2C, CAN, NET, SAI and ...
>
> >
> >
> > >
> > >
> > >> First, the clock inputs for this device are listed in clocks *only*.
> > >> What is no there, is not an input to the device. Including also Linu=
x
> > >> aspect (missing devlinks etc). Therefore how can you configure
> > spread
> > >> spectrum on clocks which are not connected to this device?
> > >
> > > I not understand this well, you mean
> > > add clocks =3D <xx CLK_IMX8MM_VIDEO_PLL> in the ccm dtb node?
> >
> > Yes. Let me re-iterate and please respond to this exactly comment
> > instead of ignoring it.
> >
> > How a device can care about spread spectrum of a clock which is not
> > supplied to this device?
>
> I hope we are on same page of what spread spectrum means.
> spread spectrum of a clock is the clock could produce freq in a range,
> saying [500MHz - 100KHz, 500MHz + 100KHz]. software only need
> to configure the middle frequency and choose the up/down border
> range(100KHz here) and enable spread spectrum.
>
> device: I suppose you mean the Clock Control Module(CCM) here.
> CCM does not care, it just accepts the PLL as input, and output
> divided clock to various IPs(Video here). The video IPs care about
> the spread spectrum of the clock.
>
> The clock hardware path is as below:
>
> OSC(24M) --> Anatop(produce PLL with spread spectrum) ->
> Clock Control Module(output clock to modules) -> Video IP
>
> From hardware perspective, Clock Control Module does not
> care spread spectrum. Video IP cares spread spectrum.
>
>
> >
> > Why would you care about spread spectrum of some clock which is not
> > coming to this device?
>
> device, I suppose you mean clock control module(CCM).
>
> There is no 'clocks =3D <&ccm CLK_IMX8M_VIDEO_PLL>' under ccm node.
> Because in current design, ccm is taken as producer of
> CLK_IMX8M_VIDEO_PLL, not consumer.
>
> >
> > Please address these precisely because we talk about this for weeks in
> > multiple places.
>
> Sorry for coming into this feature in late stage.
>
> Dario, thanks for working on such feature, good to see. Spread Spectrum
> is indeed good feature what makes clock quality high.

I am also excited to see the spread-spectum clocks enabled.  We've
struggled with EMC testing in the past, and I want to reevaluate at
least one board with the spread-spectrum enabled to see how it
compares.
Thank you for working on this.

adam
>
> Thanks,
> Peng.
>
> I finish with this patchset if you do not provide such
> > context.
> >
> > Best regards,
> > Krzysztof
>

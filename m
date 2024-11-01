Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEE51D0B8B
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490773; cv=none; b=Fr0VjYzCZNXtItHmKnKLx1r9cxeAxNoUyIOWeweRm9mYq59/XBbtutKN91Go1EnAWeFHFWBfc4nK2PXgfm2b0t82T5pYS5zYrTIGBY9zm1+UVT0zFyEEXUHb2I3HGTC4OhBdk6mFTS9Bo106lhu7LVJJr5FTrx2+Co2vA0Fr1nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490773; c=relaxed/simple;
	bh=75TsGrCzuU9kiP8H4uqt/9mF+gJdxD3Q4ZiswdgLKf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehM3NClgmkgSw34ZNBSJHCC/ptP3A/iaFYdG8SQ4Lm1Bozy7eslHGMBY6C/u+vYmvwa224sNOIIK2mSkR6JWHQ39i/GgZTbZAOlC2D63lPcW8YoUy2RWNeHIDVS0Xfjms7L+ZPukbi3JCVZ7OgYA79vR7QHBDZBLfnRxs5QlK7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYtV3qYS; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYtV3qYS"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ee6edc47abso187060a12.3
        for <imx@lists.linux.dev>; Fri, 01 Nov 2024 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730490771; x=1731095571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xhsok5lUSaLeX0jB80qqmTm3/8Vx9ryb4EE5XRrW0T8=;
        b=LYtV3qYStFpk0nugzyBNxDn4Ijp4NNFe+UYRPgVoEZowozRBH1Jz/t4eS99rbdNpMd
         ffXThySmmIQSzIuxt9cQN5yXI+Ff/itZFnmIRdUMnqJPyrqp0Hu5edN9vgOrj4AdOy51
         Kt/dkHIQP8Yl8zuTIkwwZfN4+73tq+OR0SPdRrk51TC9uMC5UazVbKY7asBiRU3m/SRC
         KG8JqpqoAldBfs5dYJa3zVgsQ2a4CysAp/H31EK1RtbXhBoknUOPGJ/vB2mAu8BZipyu
         LrxS17W2XabOPLfU8qqWZaHiZzlbtA+xtCkodM3ecJvsGbLTF+QlvfsBfiwbFHH3Fo23
         /jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490771; x=1731095571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xhsok5lUSaLeX0jB80qqmTm3/8Vx9ryb4EE5XRrW0T8=;
        b=sMKCckqO1LpzD7s3Om5JOep+HDeXAVd3UKRKYX3u8PqIYzZ5+IFrapGcHlYtZUJE7P
         wPjbi1FEwLqfQFgzwNIVfoE3cXC8zpbmUF+Vhb1gYHqeFPg5h74ySyq0vBNuYNyg3AMP
         Cv4N2ashVwIoD0MgAmlFskcsO5XDrYNqQhoW9SsI87QelulLAwCVU3jX2B1Ct5oPt9nP
         8IvgYy5y4fMmi3v0hBwZWm17K5U6Knvp2tKJAYCoRUk6cRfZlvOwiGBqkYtv9UH3BEWX
         xprQm6DtRKHaRF4s5+BMruJh0Nh1mcURg7F5nQyGdo2UxAHAs2rWSzYsFHC1FkgANczH
         toxw==
X-Forwarded-Encrypted: i=1; AJvYcCXtO2aewsNbLTJy2nxI8Mixk5ssSI0XQ+/yYKJhs3tfB0Ej7F1QM6Nvr/tfiTuiaJ+wYNM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMZ2Lx+HFI/M4N/ILuMZsMcEynrV7sIOFkfC3JwXP85eve1DEi
	v4CUQ3xaVzBo++TBC7W2e9Z/kC0KBmxagj00pHloKYuNiH8b6Cs9IndD4qeWdriQNXhxkDKzkuq
	HDLdEnyvMJHBsnswOvYgqu5vLZrI=
X-Google-Smtp-Source: AGHT+IHZKMW6nZzgZWjfjRWzIvWK1iTYBaT4YLGi4D6U/W2A5SxqJ4IVJebquI4t7FLTpZHyma5G5RNi+tkyXX6nGq4=
X-Received: by 2002:a17:90b:1c85:b0:2e2:e597:6cd3 with SMTP id
 98e67ed59e1d1-2e94c2d6a20mr6009738a91.17.1730490770981; Fri, 01 Nov 2024
 12:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241021155241.943665-1-Frank.Li@nxp.com> <DU2PR04MB86770FFB0CAEEBE95B91F5FC8C4C2@DU2PR04MB8677.eurprd04.prod.outlook.com>
In-Reply-To: <DU2PR04MB86770FFB0CAEEBE95B91F5FC8C4C2@DU2PR04MB8677.eurprd04.prod.outlook.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 1 Nov 2024 14:52:39 -0500
Message-ID: <CAHCN7xJya+XjAP+kn5MePdrqNxaLnkYag23UaNatoh09ize+AA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] phy: freescale: imx8m-pcie: Do CMN_RST just before
 PHY PLL lock check
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "kishon@kernel.org" <kishon@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 11:06=E2=80=AFPM Hongxing Zhu <hongxing.zhu@nxp.com=
> wrote:
>
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: 2024=E5=B9=B410=E6=9C=8821=E6=97=A5 23:53
> > To: vkoul@kernel.org
> > Cc: Frank Li <frank.li@nxp.com>; festevam@gmail.com; Hongxing Zhu
> > <hongxing.zhu@nxp.com>; imx@lists.linux.dev; kernel@pengutronix.de;
> > kishon@kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org; Marcel Zis=
wiler
> > <marcel.ziswiler@toradex.com>; s.hauer@pengutronix.de;
> > shawnguo@kernel.org; stable@vger.kernel.org
> > Subject: [PATCH v2 1/1] phy: freescale: imx8m-pcie: Do CMN_RST just bef=
ore
> > PHY PLL lock check
> >
> > From: Richard Zhu <hongxing.zhu@nxp.com>
> >
> > When enable initcall_debug together with higher debug level below.
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D9
> > CONFIG_CONSOLE_LOGLEVEL_QUIET=3D9
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D7
> >
> > The initialization of i.MX8MP PCIe PHY might be timeout failed randomly=
.
> > To fix this issue, adjust the sequence of the resets refer to the power=
 up
> > sequence listed below.
> >
> > i.MX8MP PCIe PHY power up sequence:
> >                           /--------------------------------------------=
-
> > 1.8v supply     ---------/
> >                     /--------------------------------------------------=
-
> > 0.8v supply     ---/
> >
> >                 ---\ /-------------------------------------------------=
-
> >                     X        REFCLK Valid
> > Reference Clock ---/ \-------------------------------------------------=
-
> >                              ------------------------------------------=
-
> >                              |
> > i_init_restn    --------------
> >                                     -----------------------------------=
-
> >                                     |
> > i_cmn_rstn      ---------------------
> >                                          ------------------------------=
-
> >                                          | o_pll_lock_done
> > --------------------------
> >
> > Logs:
> > imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:
> > imx6q-pcie 33800000.pcie:       IO 0x001ff80000..0x001ff8ffff ->
> > 0x0000000000
> > imx6q-pcie 33800000.pcie:      MEM 0x0018000000..0x001fefffff ->
> > 0x0018000000
> > probe of clk_imx8mp_audiomix.reset.0 returned 0 after 1052 usecs probe =
of
> > 30e20000.clock-controller returned 0 after 32971 usecs phy
> > phy-32f00000.pcie-phy.4: phy poweron failed --> -110 probe of
> > 30e10000.dma-controller returned 0 after 10235 usecs imx6q-pcie
> > 33800000.pcie: waiting for PHY ready timeout!
> > dwhdmi-imx 32fd8000.hdmi: Detected HDMI TX controller v2.13a with HDCP
> > (samsung_dw_hdmi_phy2) imx6q-pcie 33800000.pcie: probe with driver
> > imx6q-pcie failed with error -110
> >
> > Fixes: dce9edff16ee ("phy: freescale: imx8m-pcie: Add i.MX8MP PCIe PHY
> > support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > v2 changes:
> > - Rebase to latest fixes branch of linux-phy git repo.
> > - Richard's environment have problem and can't sent out patch. So I hel=
p post
> > this fix patch.

Even with this patch, I am still seeing an occasional timeout on 8MP.
I looked at some logs on a similarly functioning 8MM and I can't get
this error to appear on Mini that I see on Plus.

The TRM doesn't document the timing of the startup sequence, like this
e-mail patch did nor does it state how long a reasonable timeout
should take. So, I started looking through the code and I noticed that
the Mini asserts the reset at the beginning, then makes all the
changes, and de-asserts the resets toward the end.  Is there any
reason we should not assert one or both of the resets on 8MP before
setting up the reset of the registers like the way Mini does it?

adam

> > ---
> Hi Frank:
> Thanks a lot for your kindly help.
> Since my server is down, I can't send out this v2 in the past days.
>
> Hi Vinod:
> Sorry for the late reply, and bring you inconvenience.
>
> Best Regards
> Richard Zhu
>
> >  drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > index 11fcb1867118c..e98361dcdeadf 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > @@ -141,11 +141,6 @@ static int imx8_pcie_phy_power_on(struct phy
> > *phy)
> >                          IMX8MM_GPR_PCIE_REF_CLK_PLL);
> >       usleep_range(100, 200);
> >
> > -     /* Do the PHY common block reset */
> > -     regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
> > -                        IMX8MM_GPR_PCIE_CMN_RST,
> > -                        IMX8MM_GPR_PCIE_CMN_RST);
> > -
> >       switch (imx8_phy->drvdata->variant) {
> >       case IMX8MP:
> >               reset_control_deassert(imx8_phy->perst);
> > @@ -156,6 +151,11 @@ static int imx8_pcie_phy_power_on(struct phy
> > *phy)
> >               break;
> >       }
> >
> > +     /* Do the PHY common block reset */
> > +     regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
> > +                        IMX8MM_GPR_PCIE_CMN_RST,
> > +                        IMX8MM_GPR_PCIE_CMN_RST);
> > +
> >       /* Polling to check the phy is ready or not. */
> >       ret =3D readl_poll_timeout(imx8_phy->base +
> > IMX8MM_PCIE_PHY_CMN_REG075,
> >                                val, val =3D=3D ANA_PLL_DONE, 10, 20000)=
;
> > --
> > 2.34.1
>
> --
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

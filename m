Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A5F2A1BF
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 00:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515059; cv=none; b=sUB7JGWZQrTYK4H0rassy8ZTAW0AuGe4/DYURsQzqa9Z2QmtKY0GdL9U+ZfKQLYeKNMPJ0/kGKs5NxnQGdrcXZQP/yp7N7R34g68j31vQGBR4kxU3MMnaK3FTYvGHpry3gr7mBTafM7ZcGOAyfAl9meB9eKEtiZe89wmHblZvQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515059; c=relaxed/simple;
	bh=7jmPTNP5wXkOM5VKAK8B4cmHLCsgMV0sC67D2Tc8tnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXhUPg/EIqYAh27K5UA76uPG8yPwkA9EF94owCK4cqWFrlaASwJU+KNj3V3yxQBtwANbJuXJz8PlJPX2MoL+ms00yq0pxtpkN4aOeENq/FjvHEj3SdNU74LZa8WSvsAITXNLG/rcWNfmhyJkDJ3Vi056OHjVapEMp58oYw+UaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=TUETExIF; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="TUETExIF"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e81ec95d944so727594276.1
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 17:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1749515055; x=1750119855; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4p6WWlOvtLKrokUmhKFbxMIWiiDCNI86TAtn3rEDUQM=;
        b=TUETExIFiCa2Dus17zneZa7c0RcbRVjxuEed7CWN9VLjPL0hyEUPi+vArNad33Vp0X
         eODFNgeYpqJTCUVT+Qb0yr/xgDp51CRrLrVjBTtp6mInQrJl6R9rM4Hg39kCuQTD/DQS
         leVMitaR2GBg2Sm3SMrmIjKtZYfU7WcVKXmHCwNFfYy1bFTpfesRxB0DK015xZg5snfp
         452R/JvT4BrByTlT1XHmwdNLYGG8OL51IwoGQ3gdM6gh8Hih51HxKoN7gQGViW3Au7x+
         xvxyUgtPr9JG/J0YkZ7mAe6LCFnnKqpAo7o3acpM1ne1pnmrQKx8e35uk5Fm2FZZHxXx
         O6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749515055; x=1750119855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p6WWlOvtLKrokUmhKFbxMIWiiDCNI86TAtn3rEDUQM=;
        b=WNGYZSK8eY1NJz6ouSEc51m99JSMee0UhXj9h71jVvW6xneLzHjVjET1jAWKbd4RHF
         AE/vJlyYBhj9QJqCMBST+KuIkHoQveh8wahC4FtdJW1vkdtpfg6wTwptFF3dw/iBZ2db
         cR9sfwP5FOfP5NKD39xpKLwjtevjeyz7ATUFPQFf+pc0Epa1ifBbNWI0gHolC06ZUsjG
         fPScu9xyw+KusrYqFSth7+mYbVILrePo4QlqPKEkwYMBOf37iysAXKaq9NjitYrZzwXY
         2mWdqRX6moaScISArCyPHTl/Uj8QC/SsnmglDV+tXlnjdB7N/aEP5MqEyoRiPtKGX/Lu
         G2hA==
X-Forwarded-Encrypted: i=1; AJvYcCUDxV6Uc+vhX+CXx2p+j7e7sdCTi8m9YysLyx6nmz6zz8nKKaG4qL/VHzxPBGAjUqeqPy8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNFuvPri+3lxKrLCS7fCLRkmBgUV+CXTVS8FLcspE9WigP0qyb
	54troniE0DR3NSUCLFIr1xSHlKrUh8McNBrcnMGygDXT2wmIbcIO9CZdeZHxzLw+fyO8Y7fCMT2
	QaMFEGN3/lqdD/ByMNmfkcdUsf2WgRCdJx3tqYUlMMw==
X-Gm-Gg: ASbGncsQ45Is7l+Rz6yqKp0PEzn+xFWO5LOcXA3x4UgVlKeVnSbTVkmnW4peNzdc/j5
	D4L+A5zatkAXAvG5zm8PwHsiDUYwa31zXAwLqusjO3wc3o15LspUYfrxDWmJc0UuErDjUpJHJGY
	3E+W6LCXezQF+zZbaYp/2ytxS7Owv7f2vuQC15urose4X6TnBYTSy0GA==
X-Google-Smtp-Source: AGHT+IEIwckNC6Mk3FUMcw8lzb7oJYprV7CNZkimjX4sCr2WuaRjl9EYST/x4A5RYQYDa8DuCIr4jskjKGm1oKna1b0=
X-Received: by 2002:a05:690c:7204:b0:70e:76eb:8fb0 with SMTP id
 00721157ae682-71133929d3dmr23571387b3.13.1749515055615; Mon, 09 Jun 2025
 17:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20241126075702.4099164-6-hongxing.zhu@nxp.com> <CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com>
 <AS8PR04MB8676C1206066A3215DB5F3B78C6BA@AS8PR04MB8676.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB8676C1206066A3215DB5F3B78C6BA@AS8PR04MB8676.eurprd04.prod.outlook.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 9 Jun 2025 17:24:04 -0700
X-Gm-Features: AX0GCFvJVHqxJw3QT2Hj1OmwNvuRPr_efH3vouQUS0tjvRGC0_axQFmE3cNvLZA
Message-ID: <CAJ+vNU0rO0tJyon6HGYTZHu5oii5vH-dPpnSH7RQj43+nE1KDQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] PCI: imx6: Deassert apps_reset in imx_pcie_deassert_core_reset()
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com" <kw@linux.com>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 1:03=E2=80=AFAM Hongxing Zhu <hongxing.zhu@nxp.com> =
wrote:
>
> > -----Original Message-----
> > From: Tim Harvey <tharvey@gateworks.com>
> > Sent: 2025=E5=B9=B46=E6=9C=887=E6=97=A5 5:04
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; manivannan.sadhasivam@linaro.org; robh@kernel.org;
> > krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org; Frank Li
> > <frank.li@nxp.com>; s.hauer@pengutronix.de; festevam@gmail.com;
> > imx@lists.linux.dev; kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v7 05/10] PCI: imx6: Deassert apps_reset in
> > imx_pcie_deassert_core_reset()
> >
> > On Tue, Nov 26, 2024 at 12:03=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.=
com>
> > wrote:
> > >
> > > Since the apps_reset is asserted in imx_pcie_assert_core_reset(), it
> > > should be deasserted in imx_pcie_deassert_core_reset().
> > >
> > > Fixes: 9b3fe6796d7c ("PCI: imx6: Add code to support i.MX7D")
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 3538440601a7..413db182ce9f 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -776,6 +776,7 @@ static void imx_pcie_assert_core_reset(struct
> > > imx_pcie *imx_pcie)  static int imx_pcie_deassert_core_reset(struct
> > > imx_pcie *imx_pcie)  {
> > >         reset_control_deassert(imx_pcie->pciephy_reset);
> > > +       reset_control_deassert(imx_pcie->apps_reset);
> > >
> > >         if (imx_pcie->drvdata->core_reset)
> > >                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> > > --
> > > 2.37.1
> > >
> > >
> >
> > Hi Richard,
> >
> > I've found that this patch causes a regression on i.MX8MM and i.MX8MP
> > boards with hotplug capable bridges:
> > i.MX8MM+PI7C9X2G404EV (this switch does not support hotplug) - no issue=
s
> > i.MX8MM+PI7C9X2G608GP (hotplug) - fails to reliably enumerate
> > downstream devices about 80% of the time ^^^ when this occurs
> > PCI_PRIMARY_BUS (0x18) for the root complex
> > 0000:00:00.0 reads 0x00000000 instead of 0x00ff0100
> > (PCI_SECONDARY_BUS is 0 instead of 1 and PCI_SUBBORDINATE_BUS is 0
> > instead of 0xff) i.MX8MP+PI7C9X2G608GP (hotplug) - hangs at
> > imx_pcie_ltssm_enable deassert apps_reset
> >
> > In both cases here reverting ef61c7d8d032 ("PCI: imx6: Deassert apps_re=
set
> > in imx_pcie_deassert_core_reset()") resolves this.
> >
> [Richard Zhu] I'm afraid that the ltssm_en bit assert to 1b'1 in
>  imx_pcie_deassert_core_reset() is not correct in your use case.
>

Hi Richard,

Thanks for your quick response. Do you mean not correct for newer IP
core in i.MX8MM/i.MX8MP or in the case of a bridge?

> Actually, the apps_reset isn't a real reset. It's the ltssm_en bit.
> From this perspective view, It's inappropriate to toggle the ltssm_en bit=
 in
>  imx_pcie_assert/deassert_core_reset() functions.
> I consider to move the apps_reset out of _reset_ functions.
> Can you help to test the following changes in you use-case?
>
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -776,7 +776,6 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx=
_pcie, bool assert)
>  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_assert(imx_pcie->pciephy_reset);
> -       reset_control_assert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, true);
> @@ -788,7 +787,6 @@ static void imx_pcie_assert_core_reset(struct imx_pci=
e *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_deassert(imx_pcie->pciephy_reset);
> -       reset_control_deassert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> @@ -1176,6 +1174,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp=
)
>                 }
>         }
>
> +       /* Make sure that PCIe LTSSM is cleared */
> +       imx_pcie_ltssm_disable(dev);
> +
>         ret =3D imx_pcie_deassert_core_reset(imx_pcie);
>         if (ret < 0) {
>                 dev_err(dev, "pcie deassert core reset failed: %d\n", ret=
);
>

Yes this resolves the regression of failing to reliably enumerate
downstream devices. I think that should be submitted with a fixes tag.

The i.MX8MP+PI7C9X2G608GP switch hanging issue was hardware related...
i was sadly testing on an old board with a defect. I did previously
have a hang issue there discussed previously here [1] but it was
resolved with commit 9c03e30e3ade ("PCI: imx6: Skip link up workaround
for newer platforms").

How much testing is done with i.MX8M{M,P} board with a switch? I feel
like I'm the only one with these SoC's and a switch and I need to get
better at monitoring patches to the IMX6 PCI controller driver and
testing these scenarios.

Best Regards,

Tim
[1] https://www.spinics.net/lists/linux-pci/msg142764.html




> > I notice the sequence of events here is:
> > imx_pcie_assert_core_reset asserts apps_reset (disables LTSSM)
> > imx_pcie_deassert_core_reset deasserts apps_reset (enables LTSSM)
> > imx_pcie_ltssm_enable deasserts apps_reset (enables LTSSM; this is wher=
e it
> > hangs on imx8mp)
> >
> > Is there perhaps some issue with de-asserting this (enabling LTSSM) whe=
n it's
> > already in this state?
> [Richard Zhu]The apps_reset is updated by src driver by regmap_update_bit=
s().
> I can't find the exceptions to update one bit, already has the according =
value.
>
> Best Regards
> Richard Zhu
> >
> > In the case where downstream devices do not enumerate some investigatio=
n
> > points to them not being happy that the link drops so perhaps deasserti=
ng
> > apps_reset when its already asserted drops the link and restarts it?
> >
> > Best Regards,
> >
> > Tim

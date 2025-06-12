Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D09C2C3256
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 19:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757686; cv=none; b=vFnKXgl0SOrwIT3RzR8z6U7xcfGZzOzxZrCO9CJDUgV34RtFV04nS9kIcCpQ6SRjCOnW4EpZocm2MMgh2259B6g8V0CUVUFCO+K7PeFOeAVj/K+YmNWqW24Tzc0uSATTibBLeRoIqQZiqqP56kGyAjonTMjtQDlAMZZhoTuAYEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757686; c=relaxed/simple;
	bh=ioKitG+yRYhRJrtQctH8UeW8KGYpeayaBl4Ml1mBldA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWi5oYZAKI7odkQIOIiqtihitv9zg0gFjc1IvhRqJ2v8ZA2v8PhTOLvjZuU5AzJ/X/WqThRRbcBUQSPNfr9Ou7L5Qbg1WTowf+BDBO0rZm7+IGu4tWOhQBdV7/p/bzaQnbm/F/hdV0fTScgyiSHnktyiRa6FIvCB3Y5/xuOsvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=Bzx1Dyel; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="Bzx1Dyel"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-404a5f4cdedso390303b6e.0
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 12:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1749757683; x=1750362483; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e9esVoe2c1asLojkhwYh+MoQPaPYmSvfLLOY1O43Qk=;
        b=Bzx1DyelO21ZOkzCrR2M6wT0arjVfnrJf2daVPGPXfYTx7cv7WOGJUGdfG9Q4ddd8U
         iCF9k1f9+krgsX+keR1Bxj6A4F3/Pc4JyyaGXcPs4XKhBqnCbbgquJ5fI1VAXS+Wnzgi
         o0McASKGapX5nGfvptl48J8BV5zyJyzFDt8vWi0d8IRaGJ8FaW4Mxjnt+HmCP221p+k4
         uwjrcSLgIuX2DjZW9pp4NyRmWdAFRwjdgLFdpdVybur7URtSKL9WS3YiuQXftLaXdCoX
         W0+xQaThTEkKjufLqxBWf81E4Z+NCXz7t9ig8nbwnBZ1IzMGJFOJt+fwRAHvRxhbRDbh
         rzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749757683; x=1750362483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8e9esVoe2c1asLojkhwYh+MoQPaPYmSvfLLOY1O43Qk=;
        b=ZAGVhCSJlmsfzl6ApD0Z1eUxzLRIprJtCYM3O6JkDWjx2z+RIIFUDVFXTnNT119z8B
         JdauvQKHBpRMMUcLfhn1XbzaZdBix1660w0diPKms+w+rSiQRXqORDmDIVkv7wJEpovv
         0BCixJnCxxQQASTUEq2Z4biv4G2/YiPoySGRzl9yGdcKwfIORolGRIcHIEXiPacHJfSv
         OOdpgw1YW92fE8MBkIB1IxA9Ei7xZr9TzDDtri6q1M4vd48xL94LMu6qchxqiSnjH6TA
         WPe0WN5ZXm4NYMwBO6qqdN5ChM4u9/9fdQz9WfbinRdvgpWZLcwKBx0kfQuh/oCJz48k
         XELg==
X-Forwarded-Encrypted: i=1; AJvYcCWomFdK/HKhiqOXh1TulGs2e0OwW0AdOxpFv1UIiWYHTs0Pd4A8yIJBbjcN81JIpUJcO3s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5K4DpL8reNvcLfI5IYuoEcpAo6fDz+eNZ3IRPEYcxSnoU3uGi
	HCneka419QHla+kyI4b9OsfHcJPuUvpKIUtoJhLgwDveusynVUySdWQ/L95w4HGQFcsyj6yqwbh
	wmBC9OJPsIbSRF+e821n0mWt48DfHERqSMqrBMfdPCw==
X-Gm-Gg: ASbGncvDZoupJxsKZd0G56ztzVTuZjvHg7RYbnDHuaXZ2doYhxdYa2KgHaH0w9Ujf48
	pHH+VUGxS+do3SZfrpksOGHyEHb/vXJxVaYWVZ5TUP6xtGAASJbCnqt3Y7ZKVoOZWM/YW5r8gbx
	JZ6G0GS1ogH7vYnkbQbMIAqY7Z5EYeu3llcRZOVCiZjKg=
X-Google-Smtp-Source: AGHT+IFcwAXQ3PbWAljxpAOaH7id08n7aXe7ujr3lhVGcrvJaHIYrxkMSHXAY37YjImxRVd5r3NbxP9AAw1idnxghok=
X-Received: by 2002:a05:6808:3c43:b0:401:16e:918e with SMTP id
 5614622812f47-40a71d7641fmr583982b6e.8.1749757683321; Thu, 12 Jun 2025
 12:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250612022747.1206053-1-hongxing.zhu@nxp.com>
 <20250612022747.1206053-2-hongxing.zhu@nxp.com> <aEr8PxcHp55Bo5Os@lizhi-Precision-Tower-5810>
In-Reply-To: <aEr8PxcHp55Bo5Os@lizhi-Precision-Tower-5810>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 12 Jun 2025 12:47:52 -0700
X-Gm-Features: AX0GCFtVrSEePbUg8i-7Hr0xxmYOgLkuZdutnpQomlDJR8IFZN655IzCDiGytFM
Message-ID: <CAJ+vNU3vyznybZ_QZBrB+nc1=2+BcC8csOtR5=6-gmgn6sb5tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 9:11=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Jun 12, 2025 at 10:27:46AM +0800, Richard Zhu wrote:
> > apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms=
.
> > Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> > wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
> >
> > Remove apps_reset toggle in imx_pcie_assert_core_reset() and
> > imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
> > and imx_pcie_ltssm_disable() to configure apps_reset directly.
> >
> > Fix fail to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM, whic=
h
> > reported By Tim.
> >
>
> You may rename apps_reset to ltssm_reset to avoid confuse for legancy
> platform later.

Hi Frank and Richard,

I was thinking of making the same suggestion however the apps reset is
in several places:
- imx8m*.dtsi pci node as 'reset-names' and reset index number #define
- imx8m*-reset.h bindings as reset index number/define
- pci-imx.c driver

Granted it is used by imx7d.dtsi, fsl,imx8mq-pcie, fsl,imx8mm-pcie,
fsl,imx8mp-pcie and in every one of those reference manuals it's bit6
of SRC_PCIEPH_RCR named PCIE_CTRL_APPS_EN but described as
'Pcie_ctrl_app_ltssm_enable'. Can you ask your references to get more
definition for this bit? I'm still unclear why 'de-asserting' it twice
was an issue.

Regardless, any cleanup changing the name can be a seperate patch in my opi=
nion.

Best Regards,

Tim


>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> > Reported-by: Tim Harvey <tharvey@gateworks.com>
> > Closes: https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZ=
cMHDy+poj9=3DjSy+w@mail.gmail.com/
> > Fixes: ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in imx_pcie_deasse=
rt_core_reset()")
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/contro=
ller/dwc/pci-imx6.c
> > index 5f267dd261b5..f4e0342f4d56 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -776,7 +776,6 @@ static int imx7d_pcie_core_reset(struct imx_pcie *i=
mx_pcie, bool assert)
> >  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
> >  {
> >       reset_control_assert(imx_pcie->pciephy_reset);
> > -     reset_control_assert(imx_pcie->apps_reset);
> >
> >       if (imx_pcie->drvdata->core_reset)
> >               imx_pcie->drvdata->core_reset(imx_pcie, true);
> > @@ -788,7 +787,6 @@ static void imx_pcie_assert_core_reset(struct imx_p=
cie *imx_pcie)
> >  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
> >  {
> >       reset_control_deassert(imx_pcie->pciephy_reset);
> > -     reset_control_deassert(imx_pcie->apps_reset);
> >
> >       if (imx_pcie->drvdata->core_reset)
> >               imx_pcie->drvdata->core_reset(imx_pcie, false);
> > @@ -1176,6 +1174,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *=
pp)
> >               }
> >       }
> >
> > +     /* Make sure that PCIe LTSSM is cleared */
> > +     imx_pcie_ltssm_disable(dev);
> > +
> >       ret =3D imx_pcie_deassert_core_reset(imx_pcie);
> >       if (ret < 0) {
> >               dev_err(dev, "pcie deassert core reset failed: %d\n", ret=
);
> > --
> > 2.37.1
> >

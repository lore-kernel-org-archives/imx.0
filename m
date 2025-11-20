Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1409E2E8881
	for <imx@lists.linux.dev>; Thu, 20 Nov 2025 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763623546; cv=none; b=h/rAEk+U94o5WjnMdU63cCLETPH+0MVXyxhSfecHP6acdqCW0Nn1gGAH5mTd59CqJ2WcE0bcRAa9ykpeMl5TOSHyrZr7BvPq60L33m/1FjnCFHUq+k5FPHJT4y4WxV6S5Ov+8wIeqHheT5bwt022LEKnc4RB6V7Bv7VGNsUJSb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763623546; c=relaxed/simple;
	bh=0BBRzQKaztjou1FCEm1RF9AHtnEOkfEB1zV8sHnTWIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxt1nv+fIT8P0JPZZXuHtQRVJeuO/TJKQ7zYhHc+DaB6U7xvMMOTmjULW2byiOiuetaRzZ3oup8O1lyGwuyAUxj5iSaC9UAgG2wBgR8VXHCGHLVG/UjIoIDX5qQYJltZC8idQ1ghHXy9B/8VrrATXhrc+Mjxph6Oj9ToTjVjQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XAwrsjbc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XAwrsjbc"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6419e6dab7fso711797a12.2
        for <imx@lists.linux.dev>; Wed, 19 Nov 2025 23:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763623541; x=1764228341; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oiy3MCCnIY+ubzrtfzu9IxcBIzwVrHngBHadvGb6qFA=;
        b=XAwrsjbc+6mB6iJWy4wsrfeYsdFDTLPZLxhLEQr3s0jtId9P+w2n4o2xKrycJmPJG4
         dkBZCK3JKp122qn6F+/6zVNx4/NX409g9875guJ3hQATjgJDufO7JJsobV5M12ApE59M
         JfMUNY6cDvhAtWyVRkW+QNSagQ539MRvMUvrWivgkxyL6TflZqB7mYBU/LvO1sdEc8js
         JuVmkI496DmzCYSMfa1JU2SalvRKjF7yXwuFn62SsK3X+yZLxYOEfZNLgcmRUk9ree2i
         kU08b5d0qtPynAGSO3mv2ouixM68p4qwalS9maotRYmhQ5LaMja1IJPerv+hane2YGqJ
         quLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763623541; x=1764228341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiy3MCCnIY+ubzrtfzu9IxcBIzwVrHngBHadvGb6qFA=;
        b=MnVA9NMM8B1Mx8UzLAoByzOKwI7EeQjfyc5/+FHHIyPvlXBUR7bt27AWTtlmqvEfWn
         z/bXMVSFOVn+Wt/W+w4NXl9YBfmkth4PrGaP1/SfNRI3VjOp8JdgHsenSYnZFEFZJF5i
         /kyqbeyIPWO0wlt0Oz/mMeqzSY0S2hhYhvxrft2Y6Dbxo8EQb40tzntwGY62XFl6h8r0
         RHLlbMK3jpRR68Wld0gXVxzpkPlEzrV3TQQKFJebYYCVsANAs5Ms82qqBIjUAkrv941K
         lYsfCFJdGBmeF2Mvd0zMx6SF8KHs50XquD4qD9cFltLlVzs724uJkwhUybioS6SL/cBe
         rXmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiXKcR43UA9uOOCCfzLnRP5u7Ma+7V4Wqz1PXeiiEeQEkwdxAsXnH6KKTjaG8iv7f4TAI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn9H7rlAO9jQPoj3yfCmdgQHzjwQQDOC+E1Q/RPVtt/6gtekN4
	RrPd5irHoFGxQx4ypwD8skEt+lKY+uxD9/ScbKk0BA5wJdFcqKs8YEiIslkX+AKes+Fas0Rq+/+
	pVz/FsoodwO/fLRDquoehIqO2+Q3DlO8UAftXkbTlQg==
X-Gm-Gg: ASbGnctuC4ySxHaPK4OYha9shoK/4hvChcei/TLVj7K5oUAStWGxcg3jOzPRlthMIwU
	dnYVBrd7NGyoVOCZSUarNbaiTHeA53cKQS/s5UdwriGjXhJRHiTBtzPxBZl55tcLEZHOC7yAdOF
	ZAL9o6GbknV6u1YAyMcxl4WhJsqDhVuUb5vOF1quoPhgdrJBL5/yWgGH3v61JOd/Rl4z84lPvTo
	dhgE0cH+mRvnFXSuiqaI8aKlv+I48Bi3TMCn3pO86SJhJulJG/PtcT22cBV3dgOLNfUtg699+7n
	ORoekqBFECpQ/CkHSEb77kBF
X-Google-Smtp-Source: AGHT+IFAQcf4dBYNDEi3TsDPhv8jstrKlO8aZK1F8IULbrCW1q+UfabVpHtWcfiu1HcoO4gSrjXgCyaW6ykmeZfOoLs=
X-Received: by 2002:a05:6402:278d:b0:641:62bb:9c0 with SMTP id
 4fb4d7f45d1cf-645364652a8mr2343347a12.33.1763623541321; Wed, 19 Nov 2025
 23:25:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
 <20251118160238.26265-4-vincent.guittot@linaro.org> <aRymVtJKtcydh3g5@lizhi-Precision-Tower-5810>
In-Reply-To: <aRymVtJKtcydh3g5@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 20 Nov 2025 08:25:30 +0100
X-Gm-Features: AWmQ_bms-sMetVoc9nOrTa8Xt52hfzy9ouUOYIu45ml1BzNFdlb7_KVvCi0dBPc
Message-ID: <CAKfTPtAhQJK1ezv3JF6FBK5ZBBWCWM0ADeg0SG2EG_2JjfzaMA@mail.gmail.com>
Subject: Re: [PATCH 3/4 v5] PCI: s32g: Add initial PCIe support (RC)
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 18:01, Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Nov 18, 2025 at 05:02:37PM +0100, Vincent Guittot wrote:
> > Add initial support of the PCIe controller for S32G Soc family. Only
> > host mode is supported.
> >
> > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/Kconfig            |  10 +
> >  drivers/pci/controller/dwc/Makefile           |   1 +
> >  .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  21 +
> >  drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 391 ++++++++++++++++++
> >  4 files changed, 423 insertions(+)
> >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c
> >
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index 349d4657393c..e276956c3fca 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -256,6 +256,16 @@ config PCIE_TEGRA194_EP
> >         in order to enable device-specific features PCIE_TEGRA194_EP must be
> >         selected. This uses the DesignWare core.
> >
> ...
> > +
> > +static int s32g_pcie_init(struct device *dev, struct s32g_pcie *s32g_pp)
> > +{
> > +     int ret;
> > +
> > +     s32g_pcie_disable_ltssm(s32g_pp);
> > +
> > +     ret = s32g_init_pcie_phy(s32g_pp);
> > +     if (ret)
> > +             return ret;
>
> Small nit:
>
> return s32g_init_pcie_phy(s32g_pp);

Yes

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thanks

> > +
> > +     return 0;
> > +}
> > +
> > +static void s32g_pcie_deinit(struct s32g_pcie *s32g_pp)
> > +{
> > +     s32g_pcie_disable_ltssm(s32g_pp);
> > +
> > +     s32g_deinit_pcie_phy(s32g_pp);
> > +}
> > +
> ...
> > +
> > +module_platform_driver(s32g_pcie_driver);
> > +
> > +MODULE_AUTHOR("Ionut Vicovan <Ionut.Vicovan@nxp.com>");
> > +MODULE_DESCRIPTION("NXP S32G PCIe Host controller driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.43.0
> >

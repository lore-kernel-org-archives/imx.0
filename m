Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795626675;
	b=PfZOU329Ddlpw8IbRKLMmShMsZs/rDyP56ur8YDe9jpkqwmWDkPpGrIRjj4JNYYiZXaV
	 cMSckba2ubqh9vwtSwJHxA7sdJ4TJqtXiqR2HIV9kDk6QvvQ3lQs1BLK0zeZHW/fAJvOO
	 Lu0KVtql4D+MJSXDmBT4IEMeY2vNVw2jd7/mRYI79dBocPFPfhTmQ+gwCYN5C7X1hrmsU
	 wxDiCohpfcmPZ1bbj4MRsHSrSlDLSJbMTOOzrLtI/Iwb07z8Mxi+DmwVNnMGksYxDqXHL
	 HuAf0D4OPBEbP/TmK96LoPq82CG/X0pdb7AYTP3xelc9x0dOpdh0mZnlYcxdenTxmaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1cMat0V7s4bMA1eHCHDEhCYo/kbvJy8/bkwjnbPTmUs=;
	b=ajQCSRNsCWAe6lG6ccFAQzdWQFdFgh3TbWHehQJALFI81PhQId1/JrtDiZHV9RdI68/A
	 HZ7/iw3RNxogoQZXyyx5fbb9HIEOVrfmAdc7knnFDGTbfyxWGVQOgQ1RKz7sOCt4PYxAS
	 sSRM+3KA9hFyc2jgDpFtvK3xyE/4QplBY2DjipJTtsCIPRoWAo/bGCSCxwz+1esvGLvYI
	 No/u8ax2XPD/jW0TCtdGt2kO8gn+BE/3kVAyNMSCUz4JlZJ2pWiqdtJ97uE0hc6LFMKdI
	 iGZBAead2kS3pClc7SHMRvWBrGN2f+MoUSlgQLKDFFptU3e+zfW6j3HHe+i8ellbnMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b="P5mI/je6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75597606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75597606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=P5mI/je6
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4f4095a7aso52679617b3.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 09:11:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795626674; cv=none;
        d=google.com; s=arc-20260327;
        b=d1nhmHkpnSJEODAJg1asgkrf0pmMl6wOfNXNsNSjcrgF52KLWyDGWGSw4kb5hB+Dod
         y+IJgnSE2FS4azdSnhMyJuX5aHkBsiT7Qgk6eFzxfTPGHCXwXX8iP90TzcOEvlSPxZT4
         Iy5RRwJqSzcrRRZwXLwozmxmsTi7nVPpnmjq0+lpmWdvRrs27DjF6NaVBOWATjZ8ux4Q
         LZPqYnt9yf/lwUMhdkpOmXQtb/FtSKXeSB630Ll7VzBAE1p0Ev6gv95q9btvAvnnCZuq
         GrDwp7U/LZytN8ZVaqbw2fAn2yghY6JYv534XT0kWCwaM7IpVg2X/NMp9436nY+cfAfn
         rdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1cMat0V7s4bMA1eHCHDEhCYo/kbvJy8/bkwjnbPTmUs=;
        fh=gG9wUwMBghurzaUs07p/9MT6M83Z2pKrtWM8G+n9QpU=;
        b=Zg32V6za0paKWDnsHy6/aNxhXOvNx6KLJx2eQ/B6TWJqnkSlq3+jkC2ELDa0+PSLZW
         LiK83sEde/hp98pUvuIg61svUZgDKDg7L+R9a5RNt19QXIVw2dZTY1I7Q5I6OhatNAop
         JqjpB5H/3qU1mhs22C646UEANSDF+JtQjRQEIz/eo3ATonBrMotLMnKKjlKOhhrVIsMJ
         RDTBoADu80JQQGT6CjATUjCD/JJHe6OjG8D/OtVt9mY+tM4nVljprGkA6I8Z1W4nqKID
         KhywadDDxqJMvD2QnPxV0rb/m9mCEWVmHpxBMT9a045O7EC0aSEZD3yj6ZqGZ97ZIF2w
         xdWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795626674; x=1796231474; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1cMat0V7s4bMA1eHCHDEhCYo/kbvJy8/bkwjnbPTmUs=;
        b=P5mI/je67IGTMgrU9d8MlrrI/8GcKLpr+mRY+8+oftE9wph8RDo0BiKW5O73UYsIZn
         vCNhd5q96a0wX0cvgcB2fEeUnbT3Zec7xp1lrZXoWKoNLLBOy9kuJYJ6VcF4KtgPjdSr
         hMWIX2u92NneB8V8mD+yDVGjUBvw0JPl0WLbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626674; x=1796231474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cMat0V7s4bMA1eHCHDEhCYo/kbvJy8/bkwjnbPTmUs=;
        b=N8Of9nHJXLjONCA2kRldCQ7REF3neDkH42cMYLI+daoRQzCxgtN6ZNbJeXyKmZLIN+
         csXkeEQGYBqzTy745egh1GNXU7azNn+d8DcZaqvfuBNvsdMjdFE9MPgAWm76E1Tud9tY
         4GHo1EMuVMJgdEq5E1QzWmVT2sC1SMC2YYIbQk4N5fMLEzSM0Ci859nf5k29QPLlSOKB
         5lDL/4lrtC10SRUue86wUSK8UXH9+4QESAoKa3zD2rh/XnOTQzsc4n2+wtKMWvFClYbj
         R5EYnM6Fmg+GDCf4IhHYBGtdNdOZLKyzec5uNSN//W7FaowByjsqimTraneTvNnHXTTv
         Ajvg==
X-Forwarded-Encrypted: i=1; AL+hErGBeR+wWx5zZfvEIZrqF44oRJD69ll2WhBx6tvPjzMc5wBooxF/nNrGCWZ4SrXLIKnSzbk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+9xa3fzGaoTuWJgX26mG2v/BswzY5xXUwZ+/LEVFlxw2AWm71+
	BpOj/50CqWStjedq8pEHCLbnSVYHh1wdU0Wsn537zOCsfR9L38prDMX+DkQeoHvuhcr8VkmvHho
	eib1VOGYRibsStPEuCTMJ7YYsym0huCRaFa20EcoRkw==
X-Gm-Gg: AZFdTZcQ5KZEQZfFUGuQi2LSnzbMoKtybPFGaNhCKQa6FHFJ9gT5Ly7CFCvQgiBldOW
	e+hhwZGm14XcaPG2nuhiLJ7oezXN9OoJZjQ7/LCExeGCUhi6S+C1rg001Kt/h0L2qfWoVzYudPv
	xLyTPtpB6XgozHlE8Nnj1VQhT5LQHCvaKWo6PyTFrUkC8I/xkh5WB/fFBqWhuTnsIYYicEUeHgB
	+hyejtlnrHnhnPi/pJ9hFnGYnkKZP9nIX5d+pCWxxd+MMWzyfVNAg7GtXfNBfZIllPQdA7yfRbd
	Plh5VQ7NTGUQuiv7B4MafdyJSkA/Fgdz5L25LmG3zOLKX4YCDrQ6twmIYk3FXWHSeRABdr0zech
	l/9tQlAlkRalzv5CRPovV3SboYSkLh+bi1OsKmjwIy/yGEl2Wd/O+Eya3fnUi4XqjEjK8C+K5I7
	1MBv0QyikWUDWk
X-Received: by 2002:a05:690c:9a8f:b0:8b0:9def:97ff with SMTP id
 00721157ae682-8b5205179b6mr94741297b3.46.1795626674340; Wed, 25 Nov 2026
 09:11:14 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122205136.138173-4-dario.binacchi@amarulasolutions.com> <20261125121141.29455-1-peng.fan@oss.nxp.com>
In-Reply-To: <20261125121141.29455-1-peng.fan@oss.nxp.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 18:11:02 +0100
X-Gm-Features: Aa3M54o7M2qWU98Y-q7cgiD5rd9wubyIgOpZDjq-azHVQE3KFYTCT_fyLZF_Vi4
Message-ID: <CABGWkvqTi_x3Q=D4RCZjkec+_2RUcZyqa_yYxQJSh3PmUxA1VA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pmdomain: imx8m-blk-ctrl: Keep the domains left on
 by the bootloader
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	linux-amarula@amarulasolutions.com, michael@amarulasolutions.com, 
	Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Kees Cook <kees+treewide@kernel.org>, Ming Qian <ming.qian@oss.nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Xu Yang <xu.yang_2@nxp.com>, bui duc phuc <phucduc.bui@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> On Sun, 22 Nov 2026 21:51:12 +0100 Dario Binacchi <dario.binacchi@amarula=
solutions.com> wrote:
>
> > The blk-ctrl domains are all registered as off, so a domain left on by
> > the bootloader is powered up again by its first consumer. On the
> > i.MX8MN this resets the display pipeline set up by U-Boot to show a
> > splash screen.
>
> Linux will finally take over display. so is there any issue here that
> resets the display pipeline here? Any I think U-Boot has driver_remove
> to make it in the initial safe state.

The bootloader leaves the display on to show a splash screen and hands
it over as a simple-framebuffer, so its drivers are not removed on purpose.

With patch 2 the DISPMIX domain is kept on, but the blk-ctrl domains
are still registered as off. Their first consumer runs
imx8m_blk_ctrl_power_on(),
which puts the LCDIF and the DSIM into reset, so the image of the bootloade=
r
is lost before Linux has anything to show.

Keeping the pipeline running is also what the DRM state readout [1] needs t=
o
take it over without a modeset. I have an RFC for the i.MX8MN on top of it =
[2].

Thanks and regards,
Dario

[1] https://lore.kernel.org/r/20261120-drm-state-readout-v9-0-a67c2b45b8ec@=
kernel.org
[2] https://lore.kernel.org/r/20261122153032.2782768-1-dario.binacchi@amaru=
lasolutions.com

>
> Regards
> Peng
>
> >
> > Read the state of the domains from the blk-ctrl registers and register
> > as on the ones left on by the bootloader.
> >
> > Enable this only for the i.MX8MN DISP blk-ctrl, as on other blk-ctrls
> > (e.g. the i.MX8MP VPUMIX) the registers do not reset to 0.
> >
> > Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v4:
> > - Register the power notifier before powering up the bus domain
> >
> > Changes in v3:
> > - Keep the bus domain on while the state of the domains is read
> > - Remove the domains before releasing their boot-on references
> >
> > Changes in v2:
> > - Take the references once the probe can no longer be deferred
> > - Clear the boot-on state when the domain is powered off
> > - Release the references when the driver is removed
> >
> >  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 128 +++++++++++++++++++++++---
> >  1 file changed, 117 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/i=
mx/imx8m-blk-ctrl.c
> > index 7d6735728d8c..04383d7e40cb 100644
> > --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> > +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> > @@ -83,10 +83,13 @@ struct imx8m_blk_ctrl_domain {
> >       struct device *power_dev;
> >       struct imx8m_blk_ctrl *bc;
> >       int num_paths;
> > +     bool boot_on;   /* Left on by the bootloader */
> >  };
> >
> >  struct imx8m_blk_ctrl_data {
> >       int max_reg;
> > +     /* SFT_RSTN and CLK_EN reset to 0, so a domain left on can be det=
ected */
> > +     bool boot_state_readable;
> >       notifier_fn_t power_notifier_fn;
> >       const struct imx8m_blk_ctrl_domain_data *domains;
> >       int num_domains;
> > @@ -187,18 +190,87 @@ static int imx8m_blk_ctrl_power_off(struct generi=
c_pm_domain *genpd)
> >       /* allow bus domain to suspend */
> >       pm_runtime_put(bc->bus_power_dev);
> >
> > +     domain->boot_on =3D false;
> > +
> >       return 0;
> >  }
> >
> >  static struct lock_class_key blk_ctrl_genpd_lock_class;
> >
> > +/*
> > + * A domain left on by the bootloader has its resets deasserted and it=
s
> > + * clocks enabled. The registers can only be read if the bus domain is
> > + * on, so a domain is considered off whenever the bus domain is off.
> > + */
> > +static bool imx8m_blk_ctrl_is_off(struct imx8m_blk_ctrl *bc,
> > +                               const struct imx8m_blk_ctrl_data *bc_da=
ta,
> > +                               const struct imx8m_blk_ctrl_domain_data=
 *data)
> > +{
> > +     u32 rst, clk, mipi =3D 0;
> > +
> > +     if (!bc_data->boot_state_readable)
> > +             return true;
> > +
> > +     if (regmap_read(bc->regmap, BLK_SFT_RSTN, &rst) ||
> > +         regmap_read(bc->regmap, BLK_CLK_EN, &clk))
> > +             return true;
> > +
> > +     if (data->mipi_phy_rst_mask &&
> > +         regmap_read(bc->regmap, BLK_MIPI_RESET_DIV, &mipi))
> > +             return true;
> > +
> > +     return (rst & data->rst_mask) !=3D data->rst_mask ||
> > +            (clk & data->clk_mask) !=3D data->clk_mask ||
> > +            (mipi & data->mipi_phy_rst_mask) !=3D data->mipi_phy_rst_m=
ask;
> > +}
> > +
> > +/* Take the references of imx8m_blk_ctrl_power_on() for a domain left =
on */
> > +static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *do=
main)
> > +{
> > +     struct imx8m_blk_ctrl *bc =3D domain->bc;
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_resume_and_get(bc->bus_power_dev);
> > +     if (ret < 0) {
> > +             dev_err(bc->dev, "failed to power up bus domain\n");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D pm_runtime_resume_and_get(domain->power_dev);
> > +     if (ret < 0) {
> > +             dev_err(bc->dev, "failed to power up peripheral domain\n"=
);
> > +             pm_runtime_put(bc->bus_power_dev);
> > +             return ret;
> > +     }
> > +
> > +     if (icc_bulk_set_bw(domain->num_paths, domain->paths))
> > +             dev_err(bc->dev, "failed to set icc bw\n");
> > +
> > +     domain->boot_on =3D true;
> > +
> > +     return 0;
> > +}
> > +
> > +static void imx8m_blk_ctrl_put_boot_on(struct imx8m_blk_ctrl_domain *d=
omain)
> > +{
> > +     if (!domain->boot_on)
> > +             return;
> > +
> > +     /* Sync, to power down the bus domain before its notifier is remo=
ved */
> > +     pm_runtime_put_sync(domain->power_dev);
> > +     pm_runtime_put_sync(domain->bc->bus_power_dev);
> > +     domain->boot_on =3D false;
> > +}
> > +
> >  static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
> >  {
> >       const struct imx8m_blk_ctrl_data *bc_data;
> >       struct device *dev =3D &pdev->dev;
> >       struct imx8m_blk_ctrl *bc;
> >       void __iomem *base;
> > +     unsigned long boot_on =3D 0, bit;
> >       int i, ret;
> > +     bool init_off;
> >
> >       struct regmap_config regmap_config =3D {
> >               .reg_bits       =3D 32,
> > @@ -250,6 +322,23 @@ static int imx8m_blk_ctrl_probe(struct platform_de=
vice *pdev)
> >                                            "failed to attach power doma=
in \"bus\"\n");
> >       }
> >
> > +     bc->power_nb.notifier_call =3D bc_data->power_notifier_fn;
> > +     ret =3D dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_n=
b);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "failed to add power notifier\n")=
;
> > +             goto cleanup_bus;
> > +     }
> > +
> > +     if (bc_data->boot_state_readable) {
> > +             /* Keep the bus domain on while the state is read */
> > +             ret =3D pm_runtime_resume_and_get(bc->bus_power_dev);
> > +             if (ret < 0) {
> > +                     dev_err_probe(dev, ret,
> > +                                   "failed to power up bus domain\n");
> > +                     goto cleanup_notifier;
> > +             }
> > +     }
> > +
> >       for (i =3D 0; i < bc_data->num_domains; i++) {
> >               const struct imx8m_blk_ctrl_domain_data *data =3D &bc_dat=
a->domains[i];
> >               struct imx8m_blk_ctrl_domain *domain =3D &bc->domains[i];
> > @@ -303,7 +392,8 @@ static int imx8m_blk_ctrl_probe(struct platform_dev=
ice *pdev)
> >               domain->genpd.power_off =3D imx8m_blk_ctrl_power_off;
> >               domain->bc =3D bc;
> >
> > -             ret =3D pm_genpd_init(&domain->genpd, NULL, true);
> > +             init_off =3D imx8m_blk_ctrl_is_off(bc, bc_data, data);
> > +             ret =3D pm_genpd_init(&domain->genpd, NULL, init_off);
> >               if (ret) {
> >                       dev_err_probe(dev, ret,
> >                                     "failed to init power domain \"%s\"=
\n",
> > @@ -312,6 +402,9 @@ static int imx8m_blk_ctrl_probe(struct platform_dev=
ice *pdev)
> >                       goto cleanup_pds;
> >               }
> >
> > +             if (!init_off)
> > +                     boot_on |=3D BIT(i);
> > +
> >               /*
> >                * We use runtime PM to trigger power on/off of the upstr=
eam GPC
> >                * domain, as a strict hierarchical parent/child power do=
main
> > @@ -328,37 +421,48 @@ static int imx8m_blk_ctrl_probe(struct platform_d=
evice *pdev)
> >               bc->onecell_data.domains[i] =3D &domain->genpd;
> >       }
> >
> > +     /*
> > +      * The probe can no longer be deferred. Releasing these reference=
s
> > +      * would power down the domains left on by the bootloader.
> > +      */
> > +     for_each_set_bit(bit, &boot_on, bc_data->num_domains) {
> > +             ret =3D imx8m_blk_ctrl_get_boot_on(&bc->domains[bit]);
> > +             if (ret)
> > +                     goto cleanup_pds;
> > +     }
> > +
> >       ret =3D of_genpd_add_provider_onecell(dev->of_node, &bc->onecell_=
data);
> >       if (ret) {
> >               dev_err_probe(dev, ret, "failed to add power domain provi=
der\n");
> >               goto cleanup_pds;
> >       }
> >
> > -     bc->power_nb.notifier_call =3D bc_data->power_notifier_fn;
> > -     ret =3D dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_n=
b);
> > -     if (ret) {
> > -             dev_err_probe(dev, ret, "failed to add power notifier\n")=
;
> > -             goto cleanup_provider;
> > -     }
> > -
> >       dev_set_drvdata(dev, bc);
> >
> >       ret =3D devm_of_platform_populate(dev);
> >       if (ret)
> > -             goto cleanup_notifier;
> > +             goto cleanup_provider;
> > +
> > +     if (bc_data->boot_state_readable)
> > +             pm_runtime_put(bc->bus_power_dev);
> >
> >       return 0;
> >
> > -cleanup_notifier:
> > -     dev_pm_genpd_remove_notifier(bc->bus_power_dev);
> >  cleanup_provider:
> >       of_genpd_del_provider(dev->of_node);
> >  cleanup_pds:
> >       for (i--; i >=3D 0; i--) {
> >               pm_genpd_remove(&bc->domains[i].genpd);
> > +             imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
> >               dev_pm_domain_detach(bc->domains[i].power_dev, true);
> >       }
> >
> > +     if (bc_data->boot_state_readable)
> > +             pm_runtime_put_sync(bc->bus_power_dev);
> > +
> > +cleanup_notifier:
> > +     dev_pm_genpd_remove_notifier(bc->bus_power_dev);
> > +cleanup_bus:
> >       dev_pm_domain_detach(bc->bus_power_dev, true);
> >
> >       return ret;
> > @@ -375,6 +479,7 @@ static void imx8m_blk_ctrl_remove(struct platform_d=
evice *pdev)
> >               struct imx8m_blk_ctrl_domain *domain =3D &bc->domains[i];
> >
> >               pm_genpd_remove(&domain->genpd);
> > +             imx8m_blk_ctrl_put_boot_on(domain);
> >               dev_pm_domain_detach(domain->power_dev, true);
> >       }
> >
> > @@ -709,6 +814,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8=
mn_disp_blk_ctl_domain_data[]
> >
> >  static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data =
=3D {
> >       .max_reg =3D 0x84,
> > +     .boot_state_readable =3D true,
> >       .power_notifier_fn =3D imx8mn_disp_power_notifier,
> >       .domains =3D imx8mn_disp_blk_ctl_domain_data,
> >       .num_domains =3D ARRAY_SIZE(imx8mn_disp_blk_ctl_domain_data),
> > --
> > 2.43.0
>
> Sent using hkml (https://github.com/sjp38/hackermail)



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

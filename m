Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8C0392825
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 17:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041227; cv=none; b=ErwtiloNQDxhgX0W28IScQBeut30zEgNQEAUMPvykZmBYss8t6yb2FVNkMQaOWbvzgHFh7fZlk1kQpYWSyEn+6FyynPSHdsGI7Nn66w7K1fk41hsKXMaRRQmbUnz2lz27YlvHAPz49K8U8d0qdr8IvInZB/Ksj2efgPsPhFZaqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041227; c=relaxed/simple;
	bh=WwjczNGOBPsz/EeR0g7qvb50Dl67wvchAOM43COrA3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KX9dJ2Pol4U70o7dbP1MDf3xDsgQR6g9HZdcY8Q/NPVauz1nh1W9S0eGBXSpAQL3X2+TDvval4DKP9NAmK1xrE/1fRJLJJQD2rqC1clAuhhNaTt00Tu9FqDIYHO082ktzcY8eXDpC98jGe7s6ssOFQ8BktQSzSNVcE2k7jcG49E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCVdI6P+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCVdI6P+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48379a42f76so344215e9.0
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 09:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772041224; x=1772646024; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CL6smK6VBWeT4lkF0MN7QY97ZatxAvdcMeaf1sqKxMY=;
        b=hCVdI6P+3Ek0IWaD/A8Hr0wsgPKWiZVLiz//P3NK5xf8yJHAVsAdAe8vc+0kAfuqL9
         0jRzqsKjpFGR8DzIhSBosIHEBDs9/ceVWRHUyEu2yYmfw99w27m7gbXTW913XiTA+Spj
         B30tglJBCP1DpNzF0y18Bv0WJVjdVTpcXnOzxKoJ6qQZuVeGVIRHwxBfi35vwgBBAQMa
         FWrHlNa2VM0aZjlAuhDodsvz6XjArvvncHxGd8VQ3lSlMTjCX9oAVSg5Sjpth1hHHmJe
         Y6UR77Bwy/foSr7GkZ8xtd3hYf4QFKDJBhMOZVR9zEEPUKyjPwjzCkwLYemvMPF/SMHG
         zm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041224; x=1772646024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CL6smK6VBWeT4lkF0MN7QY97ZatxAvdcMeaf1sqKxMY=;
        b=U1SHeqGZcITM+EXbcPQsmRTbasnNfyV50CUUTsW07M6N6HT3kmRO7S1dbY0TX2eZGW
         KRG4AAjWxVFjxh9ioR0fam+ceW33C2gZlI42fWP/ggJxt2usoTNJToJExwdLW1dYzEXS
         b8kpXhQcs7Me9bzuIrggCBs+8RMjTTQoIeGnujXPjK+KMbxT6Xq9YVb311Bs8+RC7GI9
         LiGAqoS0nYHwqjr9ck3Julg1ydVojkn1AVJ6DhBXEuEyZeZOCSWFGgh2r5Uu034sTlrt
         +LkBn42qoo0HZ1QKjXnF7sdtu8Yla5hIKtg5auIiiK8GYAVDBkcLLvSDjoxRzPlbOGPR
         gBqw==
X-Forwarded-Encrypted: i=1; AJvYcCWHV2NmPqabXdFp7jjChr+s2w+qlCkCHZ1UQMVeIj6GdnINDxEt2ZTdFiz61d1fd8gluDY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIf1GOkFLbbfuYbGsfm1I/MC7To1jyTR6pn440yVu+jBbDKMfk
	CZmljYBL2LdczHd4KI2VPfQt79J8rLEiZrYj6yLwtkTU0hWnrMj0Sa74
X-Gm-Gg: ATEYQzxza07Ehl13oWrCQMrcOT1Fgj+G8uydqY0RD1WDizByZtLCyLKlaflM2VpgAbZ
	1wnOyZN2d5qEJh1Q5i19asTJkNemwSIPSeruKlYpXRMYyzNiJbkGwoFkV94G0JZOnKCyPTRgdr9
	V2jAscqbBebct2/6CuP9l3bPrlYynivZ7IUjlqDDtg1U5UveANlXuRhbydGT6y/wp8ccrR266kg
	v9VAi6VGKRJP3uIPuOKrKjaM4JuVf5gL22hvFtBBPiIWvG4FT6+GOrG9I3ZzP/a5/5KR6sckW3J
	mbXgrCVEOHdx3QzvsBO5MMWoVxwowNVamyqRUN/5GaLcqwoBX6fd4eHIJofPfV27ouxtxlN4mXU
	tu7KeSic/kSGrh6TUEFAOnVauDWvLdWQCBd87mAd0J2Z+YsJ3i4QjGHHKzvft5YiSr4SBiWQ5tb
	xCyH5xNZHv917URuexz0/rgJr68puLiFC2IaEl+XbLHRV3pEyR0vtFJjWsrZPrDk93ZtNB2il4M
	kFxfHc=
X-Received: by 2002:a05:600c:450e:b0:483:80b0:b245 with SMTP id 5b1f17b1804b1-483c2176370mr20494525e9.9.1772041223585;
        Wed, 25 Feb 2026 09:40:23 -0800 (PST)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd765604sm74380085e9.15.2026.02.25.09.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:40:23 -0800 (PST)
Date: Wed, 25 Feb 2026 18:40:21 +0100
From: Max Krummenacher <max.oss.09@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <aZ80BWH6DRu8_W_S@toolbox>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
 <aZdDF6BObEu_C4KJ@toolbox>
 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>

On Thu, Feb 19, 2026 at 02:41:58PM -0500, Frank Li wrote:
> On Thu, Feb 19, 2026 at 06:06:31PM +0100, Max Krummenacher wrote:
> > Hi Frank
> >
> > On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> > > On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > >
> > > > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> > > >
> > > > The change introduced a regression: at least Colibri iMX6ULL and
> > > > Colibri iMX7 no longer boot with that commit applied, while they boot
> > > > again after reverting it.
> > > >
> > > > Although this has only been verified on these two modules, the issue
> > > > is expected to affect all device trees using the gpmi-nand driver.
> > > >
> > > > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > > > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > > > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > > > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > > > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > > > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > > > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > > > ...
> > > > [    0.960443] ubi0: default fastmap pool size: 200
> > > > [    0.960476] ubi0: default fastmap WL pool size: 100
> > > > [    0.960500] ubi0: attaching mtd4
> > > > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > > > ...
> > > > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > > > [    1.650029] UBI error: cannot attach mtd4
> > > > ...
> > > > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> > >
> > > Can you help found the real reason why not boot?
> > > nand@0 is preferred format for MTD raw nand.
> > >
> > > Frank
> >
> > I guess the root cause is that the driver for gpmi-nand predates the
> > update of the binding rules which want the nand device described in
> > a child node 'nand@0' also for nand controllers which only can
> > control one nand chip.
> >
> > While it is possible to update the driver in the same patch set as
> > changing the device tree to understand the new dtb rules, maybe even
> > falling back to the old definitions this likely breaks other users,
> > most notable U-Boot.
> 
> GPMI is widely used, include i.MX8 still use GPMI. Does below patch fix
> boot problem?

My concern is that the new device tree (with the nand@0 subnode) is not
yet understood by other consumers of the DT sources, e.g. U‑Boot, older
Linux kernels (before the driver change), possibly barebox, and any
other consumer that relies on the kernel DT files.

Updating only the Linux driver to support both the new and old bindings
therefore solves only part of the problem. As long as these other
consumers do not understand both bindings as well, we cannot safely
update the shared DT sources. So I think the commit needs to be reverted.

In addition, the proposed fix in the driver is likely incomplete:
with the old binding there may be child nodes (i.e for partitions).
'np = of_get_next_child(this->pdev->dev.of_node, NULL);' does then find
a node whcih is not the node that actually describes the single NAND
chip.

An alternative approach could be to update the binding documentation
so that, specifically for the GPMI driver, the older binding is also
considered valid.
Once the driver supports both the old and the new binding, the old
form could be marked as deprecated, but still allowed for compatibility.
This would avoid breaking existing consumers while giving us a path
to migrate DTs over time.

Regards,
Max

> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 51f595fbc834e..fb126a7c4a61e 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -2680,6 +2680,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
>  {
>         struct nand_chip *chip = &this->nand;
>         struct mtd_info  *mtd = nand_to_mtd(chip);
> +       struct device_node *np;
>         int ret;
> 
>         /* init the MTD data structures */
> @@ -2688,7 +2689,10 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> 
>         /* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
>         nand_set_controller_data(chip, this);
> -       nand_set_flash_node(chip, this->pdev->dev.of_node);
> +       np = of_get_next_child(this->pdev->dev.of_node, NULL);
> +       if (!np)
> +               np = this->pdev->dev.of_node;
> +       nand_set_flash_node(chip, np);
>         chip->legacy.block_markbad = gpmi_block_markbad;
>         chip->badblock_pattern  = &gpmi_bbt_descr;
>         chip->options           |= NAND_NO_SUBPAGE_WRITE;
> 
> Frank
> >
> >
> > So I don't see a quick fix other than reverting and living with the
> > dtb_check warning.
> >
> > Regards,
> > Max
> >
> > > >
> > > > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > >
> > > > ---
> > > >
> > > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
> > > >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
> > > >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
> > > >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
> > > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
> > > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
> > > >  15 files changed, 22 insertions(+), 82 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > index f452764fae00..547fb141ec0c 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > @@ -36,12 +36,8 @@ &clks {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c3 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > index 58ecdb87c6d4..9975b6ee433d 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c1 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > index 6f3becd33a5b..aa9a442852f4 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c1 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > index f2140dd8525f..85e278eb2016 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "disabled";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c3 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > index 131a3428ddb8..c93dbc595ef6 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > @@ -260,14 +260,10 @@ fixed-link {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	#address-cells = <1>;
> > > >  	#size-cells = <0>;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c3 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > index d29adfef5fdb..57297d6521cf 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	fsl,no-blockmark-swap;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c1 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > index 40d530c1dc29..2a6bb5ff808a 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c1 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > index 776f6f78ee46..e34c8cbe36ae 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "disabled";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c1 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > index 27e4d2aec137..a3ea1b208462 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "disabled";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c1 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > index dc53f9286ffe..1992dfb53b45 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > @@ -296,13 +296,9 @@ &fec2 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	fsl,no-blockmark-swap;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &i2c2 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > index eaed2cbf0c82..ec3c1e7301f4 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > @@ -160,15 +160,11 @@ &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > >  	fsl,use-minimum-ecc;
> > > > +	nand-on-flash-bbt;
> > > > +	nand-ecc-mode = "hw";
> > > > +	nand-ecc-strength = <8>;
> > > > +	nand-ecc-step-size = <512>;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -		nand-ecc-mode = "hw";
> > > > -		nand-ecc-strength = <8>;
> > > > -		nand-ecc-step-size = <512>;
> > > > -	};
> > > >  };
> > > >
> > > >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > index 3dfd43b32055..43518bf07602 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-ecc-mode = "hw";
> > > > +	nand-ecc-strength = <0>;
> > > > +	nand-ecc-step-size = <0>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-ecc-mode = "hw";
> > > > -		nand-ecc-strength = <0>;
> > > > -		nand-ecc-step-size = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &iomuxc {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > index fc298f57bfff..83b9de17cee2 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "disabled";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &uart1 {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > index 8ec18eae98a4..2d9f495660c9 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> > > >  &gpmi {
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > +	nand-on-flash-bbt;
> > > >  	status = "okay";
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  &snvs_poweroff {
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > index a41dc4edfc0d..8666dcd7fe97 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > @@ -375,14 +375,10 @@ &gpio7 {
> > > >  /* NAND on such SKUs */
> > > >  &gpmi {
> > > >  	fsl,use-minimum-ecc;
> > > > +	nand-ecc-mode = "hw";
> > > > +	nand-on-flash-bbt;
> > > >  	pinctrl-names = "default";
> > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > -
> > > > -	nand@0 {
> > > > -		reg = <0>;
> > > > -		nand-ecc-mode = "hw";
> > > > -		nand-on-flash-bbt;
> > > > -	};
> > > >  };
> > > >
> > > >  /* On-module Power I2C */
> > > > --
> > > > 2.42.0
> > > >

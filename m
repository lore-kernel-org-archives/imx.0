Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC9288C81
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110065; cv=none; b=fje2vR5QB+TBQ6z8T4a9YXwzEaTbkIRRbaDXQc0DGnJN++roM4N2gTwPekBONdI2IQg9jogwSsjvRMcB5xcai8ns5EmVsXD2igqlBJsId1THcxxN3Ng48D16T599Vo4mrAENjrqfpN4CtLAbwRGJxMGXxyUUzwVr8LJzNXI5TAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110065; c=relaxed/simple;
	bh=peZ2pKrl3hkeZE13SfxI6khgqMFiERWLMvDZh27wTrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syxYoPr5rsZhuuaYZVc1/YQbLMscKcJR1zSXFbhjcEQkZ0RIMtnCNfGI98nsIoCL4mCvepti+zvUQtRTX7tkRyZQ0d1HkZJ20f6doKUF9mMCiamPrp7P8c/LM+AChqkewA5OpKfHlcDci1PCoRtIwXAe7ZcNsEJp857PwA1tHD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVpIdgbj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVpIdgbj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48379a42f76so6876705e9.0
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 04:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772110062; x=1772714862; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OknpKutS12AqH6XxZDLJBmeeWncyeXK10kkejhYpLR4=;
        b=RVpIdgbjNbYX2UITH/wb6OZdaIu4W204ePJoaifxr9L33XHWZSNQpf1t6VCD163GpJ
         dozgFdkLHlEWEvjeWHud/VahLH9P3bN5bokGb9Qg6bjo6b2BHNWst8VfW8RsfPNB3miM
         P7BGs7G2DV0Qw3NuqlJu/vTlDd07qFfWjtlg9xfX73flJmflKLZVwGYRU9zFCJVG8SCV
         SCX0MmleL5vhvkP+dYGYVVQhA6umYiEtln0GwxwRkbLSU4XTF1o9jwspR3o9BFg+OrLq
         9Y1g8Jduv+BRUiJTsly5NKlX03BeqEaB13oeY6DipSXU+oWBmJboCP+Zmooa9M0bXUrg
         Cp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772110062; x=1772714862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OknpKutS12AqH6XxZDLJBmeeWncyeXK10kkejhYpLR4=;
        b=brg7DZEgR10sSZfBWJ0b4yqGLd+KWE2pCuWQXd81n3GMRLFriWuFTbm1fHjj9xiSuy
         rgYVqkQY5qeS/KwDveYe/GZhkpK8qMJi45kh7vqI7w7hO7cnn/TqkU7ICaBizx2OqoDl
         ZLvEmLVS+FPvYuz4B8GHepl+MbvnywlsXB/42AhUPiAi3KkUMtKzA1DZIqrrxd2Rw3+0
         im5OvplJz19DLCbVmWbP1O84rjISc8/TpmnA9phWlDVKZ62zm+bHbzqChEEM8AHU9FTS
         y/e99QiSO/zzPnxYJQszfkVN5Ky6HClTJEqFHhQbJO1JzMwpWq+Lo/Mvzz3z1n+FWo7h
         P2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXOk2szJEd+FGUI8QzWoqcbtExyH1qFOJKZ3D/Or0fZtpJ9s81SbGndagsjMEVKzmnPheU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ1zf1GuEnxWb867EYlN74SWcos/o5Dh7dGy5i3ZeznisUUKKC
	Syt0Umrcnqx3bIsmKfDxOC/KEQcgzXRRKE3jZsJrEHV2ZQY99zTdQ9Ix
X-Gm-Gg: ATEYQzzlZaT3p7ESKIeT1yuWfU3iviv1ltGLl5MRZTy7V+HspUXRJ3sDbnvokaEfhDK
	bYHGo4azLGkx9uAExspXN0Jt1S1ibaww1750XCuDWDbq5qnsVe5ZckLyHmqfu/d3WYZrvOMEhXT
	XDBBD5iXaqwUAP1hVymehT14xhwJLXfu7x71w85qCsN+H5arVnojr+3qBeD8zBOQUmaFZN/1Ar+
	zNP3XX023qEjeOC0N5Q1pkiZT4XyNMYlrUTaT7hscVsl2P6FX+Fb3SRe1jXnc0O8pXljYSCBolY
	5Di9ErDyRDy1Wyjip5Ec+toz8DhQhmuNz60iazWJRCwOjLzTtBAWUaMtygbt3SQs2AbFNIKTOIZ
	/RPWsoot4BCfzgreEvS4vB8+5+Cf5MOCer5wIGMrHjj3WXDex+NBFoiUBeSrWdMhuRj/HxsMOpG
	g/NwFCRs0zQd3v+unu5saFQCeJcf11De3DCdV4eFzR9HbSeYWM1dTELHBAJLF8ari8FRVROFYbs
	suMWwU=
X-Received: by 2002:a05:600c:5397:b0:483:56c4:73ac with SMTP id 5b1f17b1804b1-483c216bf67mr67189695e9.7.1772110061503;
        Thu, 26 Feb 2026 04:47:41 -0800 (PST)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm85442345e9.4.2026.02.26.04.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:47:40 -0800 (PST)
Date: Thu, 26 Feb 2026 13:47:39 +0100
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
Message-ID: <aaBA65_zLu8S6WMS@toolbox>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
 <aZdDF6BObEu_C4KJ@toolbox>
 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>
 <aZ80BWH6DRu8_W_S@toolbox>
 <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810>

On Wed, Feb 25, 2026 at 12:51:32PM -0500, Frank Li wrote:
> On Wed, Feb 25, 2026 at 06:40:21PM +0100, Max Krummenacher wrote:
> > On Thu, Feb 19, 2026 at 02:41:58PM -0500, Frank Li wrote:
> > > On Thu, Feb 19, 2026 at 06:06:31PM +0100, Max Krummenacher wrote:
> > > > Hi Frank
> > > >
> > > > On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> > > > > On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > >
> > > > > > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> > > > > >
> > > > > > The change introduced a regression: at least Colibri iMX6ULL and
> > > > > > Colibri iMX7 no longer boot with that commit applied, while they boot
> > > > > > again after reverting it.
> > > > > >
> > > > > > Although this has only been verified on these two modules, the issue
> > > > > > is expected to affect all device trees using the gpmi-nand driver.
> > > > > >
> > > > > > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > > > > > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > > > > > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > > > > > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > > > > > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > > > > > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > > > > > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > > > > > ...
> > > > > > [    0.960443] ubi0: default fastmap pool size: 200
> > > > > > [    0.960476] ubi0: default fastmap WL pool size: 100
> > > > > > [    0.960500] ubi0: attaching mtd4
> > > > > > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > > > > > ...
> > > > > > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > > > > > [    1.650029] UBI error: cannot attach mtd4
> > > > > > ...
> > > > > > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> > > > >
> > > > > Can you help found the real reason why not boot?
> > > > > nand@0 is preferred format for MTD raw nand.
> > > > >
> > > > > Frank
> > > >
> > > > I guess the root cause is that the driver for gpmi-nand predates the
> > > > update of the binding rules which want the nand device described in
> > > > a child node 'nand@0' also for nand controllers which only can
> > > > control one nand chip.
> > > >
> > > > While it is possible to update the driver in the same patch set as
> > > > changing the device tree to understand the new dtb rules, maybe even
> > > > falling back to the old definitions this likely breaks other users,
> > > > most notable U-Boot.
> > >
> > > GPMI is widely used, include i.MX8 still use GPMI. Does below patch fix
> > > boot problem?
> >
> > My concern is that the new device tree (with the nand@0 subnode) is not
> > yet understood by other consumers of the DT sources, e.g. U‑Boot, older
> > Linux kernels (before the driver change), possibly barebox, and any
> > other consumer that relies on the kernel DT files.
> 
> I understand, but we need move forward. we can keep both for transition.
> 
> >
> > Updating only the Linux driver to support both the new and old bindings
> > therefore solves only part of the problem. As long as these other
> > consumers do not understand both bindings as well, we cannot safely
> > update the shared DT sources. So I think the commit needs to be reverted.
> >
> > In addition, the proposed fix in the driver is likely incomplete:
> > with the old binding there may be child nodes (i.e for partitions).
> > 'np = of_get_next_child(this->pdev->dev.of_node, NULL);' does then find
> > a node whcih is not the node that actually describes the single NAND
> > chip.
> 
> I know it is incomplete, just want to check if it is the reason cause
> boot failure.
> 
> >
> > An alternative approach could be to update the binding documentation
> > so that, specifically for the GPMI driver, the older binding is also
> > considered valid.
> 
> Not easy to do that, I try many method to update yaml file. common nand
> flash detect node node "nand-controller".
> 
> > Once the driver supports both the old and the new binding, the old
> > form could be marked as deprecated, but still allowed for compatibility.
> > This would avoid breaking existing consumers while giving us a path
> > to migrate DTs over time.
> 
> Needn't revert all, just revert delete part, keep both to help migrate.
> 
> anyways, I need know if of_get_next_child(this->pdev->dev.of_node, NULL);
> fix your problem.

I tested the following on Colibri iMX7.

kernel 7.0-rc1 and DTB are built from an untouched kernel at commit
7dff99b35460 ("Remove WARN_ALL_UNSEEDED_RANDOM kernel config option").

kernel 7.0-rc1 patched has the sources as above plus the changes you
propose to the gpmi-nand driver.

DTB-reverted has the sources as above plus commit 8124b4a4a96b ("ARM:
dts: imx: move nand related property under nand@0") reverted.

                              DTB        DTB-reverted

kernel 7.0-rc1                fail       boots

kernel 7.0-rc1 patched        boots      boots

Regards
Max

> 
> Frank
> >
> > Regards,
> > Max
> >
> > >
> > > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > index 51f595fbc834e..fb126a7c4a61e 100644
> > > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > @@ -2680,6 +2680,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > >  {
> > >         struct nand_chip *chip = &this->nand;
> > >         struct mtd_info  *mtd = nand_to_mtd(chip);
> > > +       struct device_node *np;
> > >         int ret;
> > >
> > >         /* init the MTD data structures */
> > > @@ -2688,7 +2689,10 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > >
> > >         /* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
> > >         nand_set_controller_data(chip, this);
> > > -       nand_set_flash_node(chip, this->pdev->dev.of_node);
> > > +       np = of_get_next_child(this->pdev->dev.of_node, NULL);
> > > +       if (!np)
> > > +               np = this->pdev->dev.of_node;
> > > +       nand_set_flash_node(chip, np);
> > >         chip->legacy.block_markbad = gpmi_block_markbad;
> > >         chip->badblock_pattern  = &gpmi_bbt_descr;
> > >         chip->options           |= NAND_NO_SUBPAGE_WRITE;
> > >
> > > Frank
> > > >
> > > >
> > > > So I don't see a quick fix other than reverting and living with the
> > > > dtb_check warning.
> > > >
> > > > Regards,
> > > > Max
> > > >
> > > > > >
> > > > > > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> > > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > >
> > > > > > ---
> > > > > >
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
> > > > > >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
> > > > > >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
> > > > > >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
> > > > > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
> > > > > >  15 files changed, 22 insertions(+), 82 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > index f452764fae00..547fb141ec0c 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > @@ -36,12 +36,8 @@ &clks {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c3 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > index 58ecdb87c6d4..9975b6ee433d 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c1 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > index 6f3becd33a5b..aa9a442852f4 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c1 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > index f2140dd8525f..85e278eb2016 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "disabled";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c3 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > index 131a3428ddb8..c93dbc595ef6 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > @@ -260,14 +260,10 @@ fixed-link {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	#address-cells = <1>;
> > > > > >  	#size-cells = <0>;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c3 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > index d29adfef5fdb..57297d6521cf 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	fsl,no-blockmark-swap;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c1 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > index 40d530c1dc29..2a6bb5ff808a 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c1 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > index 776f6f78ee46..e34c8cbe36ae 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "disabled";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c1 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > index 27e4d2aec137..a3ea1b208462 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "disabled";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c1 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > index dc53f9286ffe..1992dfb53b45 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > @@ -296,13 +296,9 @@ &fec2 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	fsl,no-blockmark-swap;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &i2c2 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > index eaed2cbf0c82..ec3c1e7301f4 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > @@ -160,15 +160,11 @@ &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > >  	fsl,use-minimum-ecc;
> > > > > > +	nand-on-flash-bbt;
> > > > > > +	nand-ecc-mode = "hw";
> > > > > > +	nand-ecc-strength = <8>;
> > > > > > +	nand-ecc-step-size = <512>;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -		nand-ecc-mode = "hw";
> > > > > > -		nand-ecc-strength = <8>;
> > > > > > -		nand-ecc-step-size = <512>;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > index 3dfd43b32055..43518bf07602 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-ecc-mode = "hw";
> > > > > > +	nand-ecc-strength = <0>;
> > > > > > +	nand-ecc-step-size = <0>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-ecc-mode = "hw";
> > > > > > -		nand-ecc-strength = <0>;
> > > > > > -		nand-ecc-step-size = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &iomuxc {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > index fc298f57bfff..83b9de17cee2 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "disabled";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &uart1 {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > index 8ec18eae98a4..2d9f495660c9 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> > > > > >  &gpmi {
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	status = "okay";
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  &snvs_poweroff {
> > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > index a41dc4edfc0d..8666dcd7fe97 100644
> > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > @@ -375,14 +375,10 @@ &gpio7 {
> > > > > >  /* NAND on such SKUs */
> > > > > >  &gpmi {
> > > > > >  	fsl,use-minimum-ecc;
> > > > > > +	nand-ecc-mode = "hw";
> > > > > > +	nand-on-flash-bbt;
> > > > > >  	pinctrl-names = "default";
> > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > -
> > > > > > -	nand@0 {
> > > > > > -		reg = <0>;
> > > > > > -		nand-ecc-mode = "hw";
> > > > > > -		nand-on-flash-bbt;
> > > > > > -	};
> > > > > >  };
> > > > > >
> > > > > >  /* On-module Power I2C */
> > > > > > --
> > > > > > 2.42.0
> > > > > >

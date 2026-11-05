Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895521;
	b=LMHbXkrMQSlJo//xiTQ85yMw6tRxHQkPreZ0Qcfxa7jPd9qQmt8GqXvFfLOchQU5lAf6
	 CFhFXl6ZaZhceIZupbeTB2ZAm1IhB9y19Fh6e23Rgg2SVbczC5bRNlO64rgk5NDbZM5VE
	 DYuQjlHPaepKGg3vRqQ7R4rkDcbnAbruL0O816ahAhBEQ4lTNuqtei2RSvlTLPCVcBQwg
	 wSd7ZqfOGFrbn/qvsgRoGPSFYNRjwOrein8MeshnYFy4oT8p6En0yEHYI+4wlTSviU0mr
	 NBUcW466bXhKSCXKt31A+ScFHSHLx4M21isvUpd05OqOUGZ0OzcFplAgB+LBENdZukQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895521;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=jjGITOFEbZVfMgIGnW+wZ1UcQbDHnChGWTS+tVJ4LPo=;
	b=nQG5HSZI3RdNVXx8xAgTzHbfqIN7lPg0vm1OHdowo9o0H2GgS6V8Psw7dSCWhMvZT71p
	 CNV45Gk5GQSLTM3F2maa0bgGw/P620b+DXprQizCBezPIMA0PaAvYQp87SDZkUJ4t10MZ
	 usasGCecE+8i7/ZOhcp3UW7B+6Un7qL72AewI2Sb19Y8vpfE9jFGhfbC01DMJJTbtdLTF
	 KqMXlLGVhjWKeRR4CHin/ZvG4C9174zVwC0i0YgkP2SRXj6pZmOqTEBSV3Qd+c8jLpWeR
	 5PiNVxIqAgUiSX4C2+a+bZH0Cy2OKnGkKMXJHeiILQ3vwdePsUEosIAOifbZ+/bodmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="lg3/kj9/";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A0606D83F
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 16:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23A0606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lg3/kj9/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793895520; x=1825431520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+tKMfQT08C0WHdhvauaJZ31Qu1iXJYv2JxCKBEvtIII=;
  b=lg3/kj9/kxBDcsDmDuaCidh3Ngj95EdEAQNVK+VHkJDhF5CMtIAp6fly
   MyEaz7+vnf6XQLn4HYl5Y/5Nma7fu+KAiwyaE3yQXKxLLAj4s/OE7Q333
   OwahY7FPQc84hVEL4UXgJdc+MITeCzgDbJrFlFLH54odlT1caJbsx/peC
   JiIY8Xp4Lw0Q2SEijO9tgPnrl43rc4n4vuroKLHJUkDtKjoSHShUXl+On
   ibvtpAv2iD9OumIL0EOoobBqdTFCVW5UW1WszJomTa9yNftiNlOUEPkuV
   m5S69KYM5pC4KDLP4bJdb7uHME0GthvV3dEXXUIRr8iHRKfLCysBC+k+c
   Q==;
X-CSE-ConnectionGUID: YMfYNjAnTuiUPTqTeGNM4Q==
X-CSE-MsgGUID: fYeh5wU/SwWpmIK7Sea9Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2716002"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2716002"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:18:39 -0800
X-CSE-ConnectionGUID: VPPaJ+9hRqqWnjtDTyPN5g==
X-CSE-MsgGUID: 2X+7AsqFSfaAFSLbFky6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7368194"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:18:24 -0800
Date: Thu, 5 Nov 2026 18:18:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Cunhao Lu <1579567540@qq.com>, Raul E Rangel <rrangel@chromium.org>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>,
	Kendall Willis <k-willis@ti.com>,
	Kartik Rajput <kkartik@nvidia.com>, Fan Wu <fanwu01@zju.edu.cn>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>,
	John Ogness <john.ogness@linutronix.de>,
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Zhaoyang Yu <2426767509@qq.com>,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Myeonghun Pak <mhun512@gmail.com>,
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	vkoul@kernel.org
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
Message-ID: <auysTnqWgz2kE7e9@ashevche-desk.local>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <aux2VKHnVLwq_wzi@orome>
 <auyQEVmA2KeGu9DL@ashevche-desk.local>
 <auyiAE3lhnFahBK2@orome>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auyiAE3lhnFahBK2@orome>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 04:36:38PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2026 at 04:17:53PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 01:28:46PM +0100, Thierry Reding wrote:
> > > On Mon, Nov 02, 2026 at 12:54:48PM -0500, Frank.Li@oss.nxp.com wrote:
> > > > 
> > > > Replace open-coded assignments to callback and callback_param fields
> > > > of struct dma_async_tx_descriptor with calls to the
> > > > dmaengine_desc_set_callback() helper across serial drivers.
> > > > 
> > > > No functional change intended. Prepare to make struct
> > > > dma_async_tx_descriptor private to the DMA engine.
> > > > 
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> > > >  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> > > >  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> > > >  drivers/tty/serial/amba-pl011.c     | 6 ++----
> > > >  drivers/tty/serial/atmel_serial.c   | 6 ++----
> > > >  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> > > >  drivers/tty/serial/imx.c            | 6 ++----
> > > >  drivers/tty/serial/msm_serial.c     | 6 ++----
> > > >  drivers/tty/serial/mxs-auart.c      | 6 ++----
> > > >  drivers/tty/serial/pch_uart.c       | 6 ++----
> > > >  drivers/tty/serial/samsung_tty.c    | 6 ++----
> > > >  drivers/tty/serial/serial-tegra.c   | 6 ++----
> > > >  drivers/tty/serial/sh-sci.c         | 9 +++------
> > > >  drivers/tty/serial/sprd_serial.c    | 3 +--
> > > >  drivers/tty/serial/stm32-usart.c    | 6 ++----
> > > >  15 files changed, 29 insertions(+), 58 deletions(-)
> > > 
> > > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > 
> > Krzysztof, now look at this case. I would argue that this is even less fit than
> > # subpart(s) case, because it might imply anything. Again the problem is the
> > bundle, and for such a case (when tons of independent changes are bundled in
> > the same stuff, *every* Rb tag has to be explained on what has been reviewed!
> 
> It may be a bit subtle, but the placement of the tag indicates that it
> applies to the entirety of the changes. I didn't crop the list of
> changed files, nor did I omit the summary.

This doesn't clarify the question. Wordless Rb tag on a bundles is an oddity.

> That bit of meta-data obviously isn't picked up into the tag line, but
> I think the default meaning of Reviewed-by is that it applies to the
> entire thing.

And I interpret it otherwise, because this is a set of independent changes
bundled into a single patch!

-- 
With Best Regards,
Andy Shevchenko



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895666;
	b=GgGtFALslCE7/i7xetFlleCxm7N8iyVCOTvfVA8klcqLilmYcM6NV2bLvlv0hZO3YOwe
	 V4euY8tMhmmtSOtzp95SFpkc9O/YUzTz/BysNHxLMkp8jxta0NnhWD+ZQ9N38PHEu7u61
	 tBrLKi6bcUUfI18eNr9Zm8P9IfwK13MdN32PzfHTgumsGWwWkwc2dl37lwrHCDpafYstC
	 NcpZd0DOJbAPV4TMAQElo5vWWFJtpwJYN0ZKfr+sbpEylX6zySZNH2t5x+fYxYhh5de66
	 SgMesi4AOqekHHpZBZpY4X/0ye2Dy9MC5xNZB+wgPIE5mFFzYr7PzvZKqjJ+2gAGQbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895666;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=mCDHjnfHmjXphkKNTy4mvKXOuSzSGdMBw/TihcgjR9k=;
	b=4ZBm1kTiJAQqUiebQa0UXUZ38Fg/vH+/afYfp5dB47R3NZZb7f4QS1sSqhT0FN/v6LnE
	 lemSPTyl85yJ604IKerh0JjDwuGChhj7qp/FPamRmI3EgyQVJ6j93zL7Vd8aANkt0cW1/
	 PnOXB4yX1f8Sa3MdlBF8sEYl5242mT5Lu+mC/X6U+P2TYPT3bjohigK5gIxnLF2ZpTum0
	 3In/MflcHRmqmUZwoJlpy9CJpOYHU5Gmx+7x8TYAFA6biY/ESDZFPG54OgrLs6Wfa0O5W
	 UIvYT+G2GKVS2hO2I/xD+GP9BlFQf/LG1S/oJvBDNb3E2vIFMIUrkGNC9GIB5A0A1jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HxUIB3hA;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA00B606A328
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 16:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA00B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HxUIB3hA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793895666; x=1825431666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QxDHsvCqUjq4O8YOdxOCJNBufX1aLlspElnAhn8Pz4E=;
  b=HxUIB3hAmSwyXDFj9SevwjKYONta8jNcqNStv14F7PuLt/3uo5gfHwYc
   zrllIvjD5cSgSdleFvMCdZNR70vDSivLmbPqp3d9agwAnYSCC3edPyUxu
   WGw6ZALUkLgG33ASDibm4y/mNjKnfARI5AHXNAJkzUUqGOHNL3FnPn0JC
   Jde0N93XFmjCKIbWeWkLRJYQ0jNo1UkC2f+4TiL0JC2JzQxqkTaVGnaTh
   7pRuLiOUi0INtczRsyu7yKhOSWi5UMMAyZiqNNvOlKdzPwHZQawZyizeB
   eKE/LJorm8LCi4vKIwp3qHL21CstISI3+w/66p+Rw2sBrIjFj0fxJxN1I
   Q==;
X-CSE-ConnectionGUID: w4yj21PAR2a0DISyU7Mwaw==
X-CSE-MsgGUID: kV/Y52U/QQ+N56CCMCYONw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2591412"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2591412"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:21:04 -0800
X-CSE-ConnectionGUID: YbUrFFQGSAaXsveonbABYA==
X-CSE-MsgGUID: jGKUSnSPRaK/UD1LYVlM+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8913746"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:20:52 -0800
Date: Thu, 5 Nov 2026 18:20:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Frank.Li@oss.nxp.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <auys4Yg-qAr4Rt5w@ashevche-desk.local>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <aux2VKHnVLwq_wzi@orome>
 <auyQEVmA2KeGu9DL@ashevche-desk.local>
 <2e12316d-d079-471f-9c29-ef5fb765216a@kernel.org>
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
In-Reply-To: <2e12316d-d079-471f-9c29-ef5fb765216a@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 03:35:20PM +0100, Krzysztof Kozlowski wrote:
> On 05/11/2026 15:17, Andy Shevchenko wrote:
> >>> ---
> >>>  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> >>>  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> >>>  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> >>>  drivers/tty/serial/amba-pl011.c     | 6 ++----
> >>>  drivers/tty/serial/atmel_serial.c   | 6 ++----
> >>>  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> >>>  drivers/tty/serial/imx.c            | 6 ++----
> >>>  drivers/tty/serial/msm_serial.c     | 6 ++----
> >>>  drivers/tty/serial/mxs-auart.c      | 6 ++----
> >>>  drivers/tty/serial/pch_uart.c       | 6 ++----
> >>>  drivers/tty/serial/samsung_tty.c    | 6 ++----
> >>>  drivers/tty/serial/serial-tegra.c   | 6 ++----
> >>>  drivers/tty/serial/sh-sci.c         | 9 +++------
> >>>  drivers/tty/serial/sprd_serial.c    | 3 +--
> >>>  drivers/tty/serial/stm32-usart.c    | 6 ++----
> >>>  15 files changed, 29 insertions(+), 58 deletions(-)
> >>
> >> Reviewed-by: Thierry Reding <treding@nvidia.com>
> > 
> > Krzysztof, now look at this case. I would argue that this is even less fit than
> > # subpart(s) case, because it might imply anything. Again the problem is the
> > bundle, and for such a case (when tons of independent changes are bundled in
> > the same stuff, *every* Rb tag has to be explained on what has been reviewed!
> 
> I think this case is obvious - Thierry reviewed this patch and gives Rb
> tag, according to reviewer's statement of oversight.

It's unclear from a bare tag, It misses that kind of information. Documentation
is also unclear to me as it does *not* describe the case what should I do when
independent things are mixed together.

> I don't see a problem here or what is questionable.

And I obviously see the issue.

-- 
With Best Regards,
Andy Shevchenko



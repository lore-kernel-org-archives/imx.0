Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871007;
	b=vRBxO+RXCGMqoBgsKPfVb3Nq+JpTTBuO+VUvkgWgtdmyk21rJI/i7ZGSCadWHy7cU9Xd
	 a08lO4dV8K1SbFoRm+MKV5xOWj8fQcRNXMnKinB405jIJM6c+mGYWsutQ9OWAA0XbaBL1
	 vjoNZIEy+iZu14JgxJ2gY78+qQJoGIi92Jey/rEMfPVMlMbF5bKvMO/nkceTJQ51Msxwd
	 J0x7weICLnktHQMhoOdURD2lM2Ar538TQSel2ZnIj5HAleWydGehc1JsUKFuqzZGhNSyt
	 YqsnrfekqbQJmhhlknF0uJnsbIHNKFsAy3xTEWvSvx5I1phv7G/Qwb0bScL+zfOCA+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871007;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=MzcP0ZVuar/2J0GdckfWIQkp5OrAXfjPJwzDsLW7Oeg=;
	b=fYxAvxptdXW1bGRznP/mFY6vcRfTq2Q1f8cTGaaZMzSKHkRPsadgTf5ZTgFWsXTPKXSi
	 BFz+0Qw1o+2sZa6PYEG6DgsQSC9jPvqz7Pctp+HPWevD66fiu/hCwZADpwZsGx2AINW/f
	 s3K9gl6y2hWvHInmbap90TJlFIwGiLrSWOcRbTg6kc12XM5fRm6IQfYINSDhFGeRyxJkW
	 ihI0oHdJExB5l5yNO1DanNMoxcJxG8vCNGv0G7dVCnBCdVYvQaW5m+kUrhQCNByDnH7wC
	 FpmoPeKv9VDbSGah05d5qJjsMmsJjhu4QNpc+8MNmPxrjBhmla2SrhHFiWnD+EUjxow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eEFjrbpv;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196C3606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 09:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 196C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eEFjrbpv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793871002; x=1825407002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aVv8RvjToXdNBQ+AxPn75WGDPj4D3O1pHLFNRPhnfCQ=;
  b=eEFjrbpvUsXeoeEy6uDeHX63okzZdJPDcpHnD0lJHQxucQ2UfxtVkbRf
   DuAej4v1JiCKIF5Rl30OXvUPqyGu6L60ttgbEzPSLFHBcBmWwYoRzr7Cv
   oXTGeA2eM/GL1z+V0fuPw5Lf9Jop/CvcAs8QmL2418DPr/X5kipxwuDca
   Px5RTB0cTIPwIbq3vztkeKhBeSMB/5rDV7HnRo2C0gFdlO6/GUfC3/ghr
   dVI1nubUGXTtQmshyUgnQf5iRvJIR2MYQKcXmtTHhX+UslKnP03a8xARZ
   WjpZGvlLdN53973WMxny2XR9ToK6l9TQz/ahySSsAq8vONeN7wGWaabME
   g==;
X-CSE-ConnectionGUID: vJDaTpl/TK+qHIlI5Z5x3g==
X-CSE-MsgGUID: AGcBmzVhQ3KZxti3Nike/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2683877"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2683877"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:30:01 -0800
X-CSE-ConnectionGUID: VUQbl1y6Q3yfJ7t5HK8oRw==
X-CSE-MsgGUID: SqY+yNktRvCMlE1VenPXPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7269063"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:29:47 -0800
Date: Thu, 5 Nov 2026 11:29:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Frank.Li@oss.nxp.com,
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
	Thierry Reding <thierry.reding@kernel.org>,
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
Message-ID: <auxMiQ-DvmBc2vu2@ashevche-desk.local>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
 <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
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
In-Reply-To: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 10:06:06AM +0100, Geert Uytterhoeven wrote:
> On Wed, 4 Nov 2026 at 18:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On 02/11/2026 18:54, Frank.Li@oss.nxp.com wrote:

> > I did not look at this code at all...

[...]

> > Therefore:
> >
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Then please add "# samsung", to make it clear and obvious.

+1

See also 20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com

-- 
With Best Regards,
Andy Shevchenko



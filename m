Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760017;
	b=Hu8IxR7OvoYP0w5IJa5cS2lAbyDQ+hmxz1abARvi5PZtCUaC3TiHOBjw7lLT4KVa53uf
	 ToytdFdgSzP7/mYX2VGhDJDVeB4BMSHi5RMHmpP09RkN5q/4pBoFcdYQne6V1IMee7l6z
	 qNvgjFZSZ9IhzLwKVNkABZtSW26pflF8QDb+BaskS5PfcFWKUb9UjvPF3WqzcTv+//+qk
	 nvqShBfTpF6BwU1+KIYsUsS5Ujsjet6IabWbdhSZpZFT8XwQRbo4Jkp8cL+D3jjQxgnHg
	 jWYDR/wv7sxHF5cTeUK3HRzG2k4IN8GoLkyKB5d0nH0MNMPYlfJeIDbfn36Y35ON35Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760017;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=2xE1Al8wj2vlLQSBshL2OcXzRsXJVItNZxoz+0qsrmw=;
	b=SsnwVWxjZEYQwJDp1KP0AZShvfc2GQWxEJLNUP9H98V+jWMSVsd8hV+cxckixiF2noh7
	 tpk2P44hBtLMXTcWkY6qwogSFdOesfzGXBjBvTyCFOC9qJaFmnwGDGq/vb2K3Q5i18iI0
	 02KiEK7pTRCCv7/r3G2Uj3I17bj83AeDdVkaI7wP3mkIKXWGU+CdCFa8bPkCuKk5gszQO
	 XOebnGVuw4xp8IvIFtsANgFP0eP/QQGhp7MTKlDHRNFkU+TroS8/j2petfWxwxZrQIz1s
	 iZ8eTXnYQTqudMeV4TVttqC6ovpxW5oylWtnf+rUlep3Vp/dgGPkSGxVoLMb1cTMNSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Biti4XDN;
	arc=none smtp.remote-ip=160.236.53.8
Received: from mail-m160236538.xmail.ntesmail.com (mail-m160236538.xmail.ntesmail.com [160.236.53.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47385606A326
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 02:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47385606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Biti4XDN
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5368a9cf8;
	Wed, 4 Nov 2026 10:40:01 +0800 (GMT+08:00)
Message-ID: <55255451-4778-4bf0-83bf-eac4176947d6@rock-chips.com>
Date: Wed, 4 Nov 2026 10:40:01 +0800
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, vkoul@kernel.org
Subject: Re: [PATCH 1/1] mmc: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Aubin Constans <aubin.constans@microchip.com>,
 Ulf Hansson <ulfh@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, John Garry <john.garry@linux.dev>,
 Hemanth Selam <hemanth.selam@gmail.com>, Pengpeng Hou
 <pengpeng@iscas.ac.cn>, Rosen Penev <rosenp@gmail.com>,
 Fan Wu <fanwu01@zju.edu.cn>, Marco Crivellari <marco.crivellari@suse.com>,
 Pan Chuang <panchuang@vivo.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Rakuram Eswaran <rakuram.e96@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>,
 "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..."
 <linux-mmc@vger.kernel.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..."
 <imx@lists.linux.dev>,
 "open list:OMAP MMC SUPPORT" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-actions@lists.infradead.org>,
 "open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>
References: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a46d7f6503a4kunmc8d4954b6d561
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEodVk9OHRpIHU9IHRhOSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Biti4XDNFXbuvNogqfGaU5N4HArvWpfvwOVNjSodcEYv0t0phcptB4QduFrWcRexuRTe/knwUsf0/yDB30GVNwoaPgfz++UAZ3rVuwD1APwWBcw7naO/XxLk837m4FMy4g/Fg85oMG9NPSG7H74raei5DBJ4+UegYTt0XNgCFTg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=2xE1Al8wj2vlLQSBshL2OcXzRsXJVItNZxoz+0qsrmw=;
	h=date:mime-version:subject:message-id:from;

在 2026/11/03 星期二 1:21, Frank.Li@oss.nxp.com 写道:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across MMC host drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

...

>   drivers/mmc/host/dw_mmc.c                | 3 +--
For dw_mmc.c,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

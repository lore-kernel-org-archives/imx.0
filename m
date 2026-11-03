Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705981;
	b=KUB9IwIAHBeBbAKJVGDVdSLLzWJ8P69OgVaCA21lfeyhazWRP+nApplrxHAsFuHM6ufh
	 0PDohg92gzRYfeSYTSNVanEDCTUogm3mB2dykH597Fq2bHx+JwyhJ4ziXfKzelYjjU5D4
	 STuQUJMlnTIsP5Gk+2m/NgESDzcuFuXRIY4i7fifX1Wo8NgZPrqC73v4J6vKeA87QDOCO
	 +hQSx47RKm5WmywrrGNl5y8dNS/kTgi+ePZkKgxDDtplS7K1laovQ3mcY/n+qCc6YFHBr
	 4ZNedl5JaV/Vda5bEsr79MYk23802z4JQ4aCQpTdK6LAktQZUZho4IJ4YyfySKDqn6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705981;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=PIHEnWIzZ7nCqKK2g4F2Wla4/XfshctWrwjq2tgtt+w=;
	b=193+zgglkuhwPPpnyHCSuGbVFMehasOq0a4RE09G2SNY7Y2UvlYEbUIic0F3Srpc5yUw
	 pVHsggMRfk6gF5DUCOjY8eGmIR0ZCQysMI5LWf5auoHW6DVMj560JJvbZh+NTYKGw0cKs
	 pMiFOhDVjThCFTuimA1v4+4Lx7cYWHdYV/jU8a4i+ma/zc+GZXfWPiR6NP6NaeLg6yOtM
	 N2BDkwpjjXU78IprQp6CyKzfbi2PVRaRZ+sC/FTLhVTv3nlVJaj5R9XuwkK/Aru6lgImD
	 cOTJp6t/jFvBohAuip6zHi11GlZywwZAxgnII3G0yRmZdse0zeBUIi0NSJHf/Habcqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=pNhxTM8x;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BC2606EEAB
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 11:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BC2606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=pNhxTM8x
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1783A160B;
	Tue, 03 Nov 2026 12:39:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1793705976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PIHEnWIzZ7nCqKK2g4F2Wla4/XfshctWrwjq2tgtt+w=;
	b=pNhxTM8x0QuNH/4HAX9JxS6/S0GEDfxDqNAVrXFF3mr1gZ7j3wazrQGaHLgdRzyU5JdhKk
	Kq9hOT7zEasIDJ2fd72bKOumBx7451W82dk74OXvetBPN2wdHj8R5bzeGX5Aw1Gmlm+6o6
	OAJcIanD3jHUY2fbqCJQMhMLAC6YpPHEJWrDcEcftcypYoyxn0M1/1SXTyw7sqF1Boz65S
	9tEOSkXb2tb3peYTBgRUbra3OqD8iYIC1149XVHUQ9PgGlxxxucZRh35RY6xAEvKQgi7eg
	RNcDH+vKk+Iops+rgHbvIIHH9tkKkIEmCgZr/sKwzDVO3VDEhHHPjDI3Aectvw==
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 12:39:15 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Frank.Li@oss.nxp.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Richard Genoud
 <richard.genoud@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry
 Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Cunhao Lu <1579567540@qq.com>, Raul E Rangel
 <rrangel@chromium.org>, Yenchia Chen <yenchia.chen@mediatek.com>, Zhiyong
 Tao <zhiyong.tao@mediatek.com>, Carlo Caione <ccaione@baylibre.com>, Moteen
 Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Kartik Rajput <kkartik@nvidia.com>, Fan
 Wu <fanwu01@zju.edu.cn>, Karl Mehltretter <kmehltretter@gmail.com>,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, Shitalkumar
 Gandhi <shital.gandhi45@gmail.com>, Peng Fan <peng.fan@nxp.com>, Sherry Sun
 <sherry.sun@nxp.com>, John Ogness <john.ogness@linutronix.de>, Pan Chuang
 <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>, Robin Gong
 <yibin.gong@nxp.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>, Zhaoyang Yu
 <2426767509@qq.com>, "Nikola Z. Ivanov" <zlatistiv@gmail.com>, Haoxiang Li
 <haoxiang_li2024@163.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Myeonghun Pak <mhun512@gmail.com>, Wenhua Lin
 <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, vkoul@kernel.org
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
In-Reply-To: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
Message-ID: <5d8894bdaacb407ef5a6cac2c9eacbad@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank

On 2.11.2026 18:54, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across serial drivers.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
>  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
>  drivers/tty/serial/8250/8250_omap.c | 6 ++----
>  drivers/tty/serial/amba-pl011.c     | 6 ++----
>  drivers/tty/serial/atmel_serial.c   | 6 ++----
>  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
>  drivers/tty/serial/imx.c            | 6 ++----
>  drivers/tty/serial/msm_serial.c     | 6 ++----
>  drivers/tty/serial/mxs-auart.c      | 6 ++----
>  drivers/tty/serial/pch_uart.c       | 6 ++----
>  drivers/tty/serial/samsung_tty.c    | 6 ++----
>  drivers/tty/serial/serial-tegra.c   | 6 ++----
>  drivers/tty/serial/sh-sci.c         | 9 +++------
>  drivers/tty/serial/sprd_serial.c    | 3 +--
>  drivers/tty/serial/stm32-usart.c    | 6 ++----
>  15 files changed, 29 insertions(+), 58 deletions(-)

> [...]

> diff --git a/drivers/tty/serial/amba-pl011.c 
> b/drivers/tty/serial/amba-pl011.c
> index e6f652905ca6f..e7373cd11b621 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -715,8 +715,7 @@ static int pl011_dma_tx_refill(struct 
> uart_amba_port *uap)
>  	}
> 
>  	/* Some data to go along to the callback */
> -	desc->callback = pl011_dma_tx_callback;
> -	desc->callback_param = uap;
> +	dmaengine_desc_set_callback(desc, pl011_dma_tx_callback, NULL, uap);
> 
>  	/* All errors should happen at prepare time */
>  	dmaengine_submit(desc);
> @@ -906,8 +905,7 @@ static int pl011_dma_rx_trigger_dma(struct 
> uart_amba_port *uap)
>  	}
> 
>  	/* Some data to go along to the callback */
> -	desc->callback = pl011_dma_rx_callback;
> -	desc->callback_param = uap;
> +	dmaengine_desc_set_callback(desc, pl011_dma_rx_callback, NULL, uap);
>  	dmarx->cookie = dmaengine_submit(desc);
>  	dma_async_issue_pending(rxchan);

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de> # amba-pl011

Thanks,
Nicolai

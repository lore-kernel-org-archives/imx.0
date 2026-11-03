Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723960;
	b=pp+KY/CykYmG9o54Y/nGD5r8zxY5524P9xE9FhDwcBVpw19yAHgX0ubPcg26eWdmWqST
	 hhZquM4VavKeBMKq/Xumvtdyr6ZTkxetEbHIdF55p1si3DV8lEV+f3PO3Oej0RVwQuJzs
	 X8Bbn/uBKjkmcVH1lUpuA3UdCQtXImVowbfqwuydO8rNqnf7X6EHAEKed1kK0NIVg+MLV
	 +xY6z3ewwUCwS+HG+Utc1cik7dX7osqg2DouaOZXT4NzMpGLEtghOkqIAfNAj9g/m9Oip
	 QiFIQdaSfHFwT5rmB9oqdy27ve+ad9dHHSvmRq/fqsZ3FCMGw2IwdPem9/wWUPG/3YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723960;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oZsjAb6zLwPp0TJs4AixW9+hdl4OwhgbeWLiflyHFIM=;
	b=5XdvLpfURMin3PB4rg208jaZ/AoXVxJXbXW0BSyvnq0Ka/qehIOVrSRJqu7xLedIq5er
	 RBCNm/9ALcPtLdjO0mZvO4nCDB00b49s93mkqVhhgxCEukEGGlV+UuQSf4hJL1u2YiTUJ
	 MKx3nnroOjgKDCvZZ9ASLBxIPQ4w9EQ66d0L2gDFWNh4GUI/Tfb63y43t7aXLQzcnjjIT
	 5NnTd8yim304rHp2hcSHuFe5dOIhLjVtwqJF3AsExSP/TyFdLo4I1ccEf0aKSe06Lgoaa
	 wgE6IWP8JLaaxFNzXWym/TUAkhKuNI40PWysVPpicN8MT9xiW6tULIf98NQO/9Cs9jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Q8Hb8oMt;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA88606EE9D
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 16:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA88606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Q8Hb8oMt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oZsj
	Ab6zLwPp0TJs4AixW9+hdl4OwhgbeWLiflyHFIM=; b=Q8Hb8oMtVc/5naDLltyf
	nHbDx4q0Ld8aNDXx/KR8AiVXzACj0uHu/YXU3zpTWzWnaLx3nqd4Dleu9vJQZ5eV
	EzfCgefF2HcZeZAmoIhcQi+34PbKjJQIs1AxqImORDTzuRIRYNoo2lxgZhdrvlZS
	DNtobCFdroATQst4hlEFhfNGV0zwbF4RzhpP+XzicxlyC9UGRfIDwI1Id5lprrj4
	qvkYeVAkpNfVs2YVXHXHtGKVGGs8ReFLDBsXREK/yqNCjzNjqEPc3nDlmAj3blUe
	Cf2mtc2vod+9JFwuoRh1q/a6DyXFSqMBwj68OwIM1QYxxhX7Vm4Hl+E/RHhf+Pk6
	/A==
Received: (qmail 356275 invoked from network); 3 Nov 2026 17:39:12 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2026 17:39:12 +0100
X-UD-Smtp-Session: l3s3148p1@V+b25mFfDJnAwtcC
Date: Tue, 3 Nov 2026 18:39:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank.Li@oss.nxp.com
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"open list:MICROCHIP I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>,
	"open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-arm-msm@vger.kernel.org>,
	"open list:RENESAS R-CAR I2C DRIVERS" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	vkoul@kernel.org
Subject: Re: [PATCH 1/1] i2c: use dmaengine_desc_set_callback()
Message-ID: <auoOL2JTEDY2abYe@shikoro>
References: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>

On Mon, Nov 02, 2026 at 12:00:02PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various I2C bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Looks actually less readable to me, but I won't bike-shed. Code changes
look okay.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


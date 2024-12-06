Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D51FBE80
	for <imx@lists.linux.dev>; Fri,  6 Dec 2024 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475958; cv=none; b=eAt/yfbm+HLQzUeFhhH7SeRxPZHzESthV3HPzBQGCSob7FGiXKsHvDdgwhyvqrkscMApFPJpUjzzNPGMR7D21IEr69RDsRU2EgZKaLjlRqe9393OQUBm7ZvR1NkpE7vX7ARswBJdVMhWiJqSX2oPHSLAb6frOLNfuYmHJGAlGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475958; c=relaxed/simple;
	bh=KMel/fejqC4xHakZdeJNDBt2c9vzHF+RSzfWeo+L2f4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HP4uODHHI7luhRmkAhCwL/udRqSchtHlaRCnzP1EE5bQzEbksMp4Zh13XN0Kp43EvN3FM4MUhYv7w2JX4qVpLvkprgCWQCKVokljhqAbwpl8LmCqjOtJNm/WPoWfJB6qhUuKlMQO01IczICPaRfIDmkZacWZlF3M0tykVXTB5ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=kmLyHciV; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rm6Ic1fZ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kmLyHciV";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rm6Ic1fZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733475954; x=1765011954;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+YIfUdq9OR5ROGXG2tbL8UIVwnPsC3GbJ9XOwhsQXWg=;
  b=kmLyHciVtsAXUywT7Eu5uyGdOMbOQ7ut2HF5VbwBPhhJhnOju0MmFUOk
   rejlQcw2ALh5DJPxwhW7PkmyzpCMnFpByXtWaxicPclgMBFML24emSUlr
   9x2BkJnzeofrdM7LDXr4i1rM4LjL7bHu+qfMaX/NyhI8jKZBxurm/jAq3
   6P92y9Q0saqB46dv3vCMv4S9MPOlCOQr+5s7cGWj5ral61O4lBQ9R460m
   NHoo5lGaexE7rccPF0eAR5yXpPkFl56tS9Z10fXZ6/cjp+bEoa8JKW7mt
   Yrzy1q+uAr+i0Xd8HIEmz6Xp8zEbZZBFLn9oyPxv2+tTYnH//mKeQcOwX
   g==;
X-CSE-ConnectionGUID: oVbENiJ4R3iM76QGjQUZbw==
X-CSE-MsgGUID: YnhpYHKDRjOcgqB0ukZk4Q==
X-IronPort-AV: E=Sophos;i="6.12,213,1728943200"; 
   d="scan'208";a="40449387"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 Dec 2024 10:05:52 +0100
X-CheckPoint: {6752BE70-2-1E10F2A5-CC0651E5}
X-MAIL-CPID: 313663F2906B776E37CF64B963F0996B_4
X-Control-Analysis: str=0001.0A682F17.6752BE70.0064,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 786FF163AD6;
	Fri,  6 Dec 2024 10:05:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733475947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YIfUdq9OR5ROGXG2tbL8UIVwnPsC3GbJ9XOwhsQXWg=;
	b=rm6Ic1fZRlZmgzFL/7eQp1nhcTTvMsgpS9iWRkPgv1JDg/Ns2sYSxwQf/bZezXw447Kzki
	1F8E5iNQtQQbMxiZPX1HgsO/xVUJLzMbprmisfvvnxy+2IE3Ubw4alQO5wjgMiWiPN8r9U
	3hajrS3sEQPb7Z4c2fierSy9XjVNo0tcxmvxEK02C3JH64DEFXpwM9IO/hCGLtLn/Zn4PC
	oVc8aRcUXK2gVwX3wqAwKgNiTKpoVzktaroRC6jt/6uBW6jFdRiM8bdXxNmtzDAF19mGzV
	2vPwZLMeb/8y6NyicmynZBd6CT2hydwBNuzmMTPw/NdQ7VbJgOlePcy5WxCNpg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengfei Li <pengfei.li_1@nxp.com>, "open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>, "open list:NXP i.MX CLOCK DRIVERS" <imx@lists.linux.dev>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH] clk: imx: Enable IMX93_CLK_LVDS_GATE only for i.MX93
Date: Fri, 06 Dec 2024 10:05:46 +0100
Message-ID: <4615625.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241203130530.1206526-1-peng.fan@oss.nxp.com>
References: <20241203130530.1206526-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 3. Dezember 2024, 14:05:29 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Enable the LVDS gate only for i.MX93, because i.MX91 does not support
> LVDS.
>=20
> Fixes: a27bfff88dd2 ("clk: imx: add i.MX91 clk")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 58a516dd385b..a0d2972ba9cd 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -239,7 +239,7 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_SAI3_IPG,		"sai3_ipg_clk", "bus_wakeup_root",	0x94c0, 0, &s=
hare_count_sai3},
>  	{ IMX93_CLK_MIPI_CSI_GATE,	"mipi_csi",	"media_apb_root",	0x9580, },
>  	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, },

mipi_csi and mipi_dsi are also only PLAT_IMX93.

> -	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, },
> +	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, 0, NULL, PLA=
T_IMX93 },
>  	{ IMX93_CLK_LCDIF_GATE,		"lcdif",	"media_apb_root",	0x9640, },
>  	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, },

pxp is also only PLAT_IMX93.

>  	{ IMX93_CLK_ISI_GATE,		"isi",		"media_apb_root",	0x96c0, },
>=20

Not visible in this diff, but also only PLAT_IMX93:
* flexio1
* flexio2
* cm33

An most probably also mu*_a and mu*_b, even though they are listed in
i.MX91 RM, but AFAIK this SoC lacks MU.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



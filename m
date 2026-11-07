Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083496;
	b=n3XQBYJcq2ch03VFxq//DAO/tKJc/Ksg1V+7DYp4Tc+6F6BGD9B23Xrx1s+MeSYzp2K1
	 S5liuZNkInsOZZsDFW5LqJOQwEpxaHhYdEpEbo5L8TmENkuuzs+T1D4LSYf+SOo95CYTB
	 rI77rqhLSpqoz2M5G8VYY7WduTU1dRWQ9y3QfjsOsZhiR2teDYDXwXL6dpAZZ9ErBWGJq
	 vFVTmSVmpEq0fl4U0ooYjkb/E3RshO6tTGZz9gsjYmr6PwxBoaDD0Gu10QV1YDhCskaLT
	 tiDX8RlupnPRD8Fug29TDS24udM+tL3cMwPBi8rGKKI38qnKE0cDqdu3ye792wKX2qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083496;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uVfYL/crgHpwOKUheIhGq2v1ptnfI5IGAlA37cvNCeM=;
	b=CMTKuI/sT/zXMQtg1OGHjDnAY1nGildOT36zA/DUAYkj8yum8gn8b1j7AChWZITFgcwF
	 /S8k3JMp5zupZGJytIIdcBWDFjGXKt0pHArWOFMhsZoQDtmkN1Hcdii1vg2fU0Npr//Wc
	 u58VVgAFvsNlY7HVex5yT9lUIwvCkZ1ecxwGy1DYshD7Fs1qF3zLDUzCBvGg42s6+mtEa
	 sU/qKnTEqHXAvqH5CPfoA6ReEoDt9aky7rlNatP7TYJH15vP4e2O1IvIZielh2WTF1f+h
	 lo6UiNBMT6dk9gFhTVMN0doqyUVIjeri2qItH0tHUx34lIyatGZnbN6BdDQuIOSYCqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQmQRM64;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87017606A32D;
	Sat,  7 Nov 2026 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQmQRM64
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A051F008BD;
	Sat,  7 Nov 2026 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083496;
	bh=uVfYL/crgHpwOKUheIhGq2v1ptnfI5IGAlA37cvNCeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WQmQRM64W6hKVHx476szHYttXvElu2yKjqim0wVAyHoli4626joyKYUgVYMqtaADH
	 1QBuB/kEEowdmnTQc+aEdpRB38EG5zEeYEnfcjjnK3h9Nn8POX2ggl5NPn2bmDUfFJ
	 SoUr1BE8TTsvuiEPz1w23DBvxmA0xMYYMZmD88gnv6xcMN+oM4IGs2lp1DRVin/FTu
	 v4lQ2UV4OmH7jnotAuqn68sfH95q0tJtLTLaRVF3UnBagrJLfY9G0CKltXhi1JZNoh
	 paXuaFhFVZ7wEAC9WDZyXIeFRTSqDGbPqzUSSNhOpCW+7IQSTaLXpD4AiVkgAPN7Hs
	 PzVimKFWPkKiA==
Message-ID: <sashiko-outbox-203295@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/58] mtd: rawnand: intel: retain open-handle state on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Brian
 Norris" <computersforpeace@gmail.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Arseniy
 Krasnov" <AVKrasnov@sberdevices.ru>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Vitaly Wool" <vitalywool@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>, "Russell King" <rmk+kernel@arm.linux.org.uk>, "David
 Woodhouse" <David.Woodhouse@intel.com>, "Mike Rapoport" <rppt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Christophe
 Kerello" <christophe.kerello@st.com>, "Jason Roberts" <jason.e.roberts@intel.com>, "Michal
 Simek" <michal.simek@amd.com>, "Boris Brezillon" <boris.brezillon@collabora.com>, "Mason
 Yang" <masonccyang@mxic.com.tw>, "Ramuthevar Vadivel Murugan" <vadivel.muruganx.ramuthevar@linux.intel.com>, "Stefan
 Agner" <stefan@agner.ch>, "Lucas Stach" <dev@lynxeye.de>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Dmitry Osipenko" <digetx@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Jorge
 Ramirez-Ortiz" <jorge.ramirez@oss.qualcomm.com>, "Heiko Stuebner" <heiko@sntech.de>, "Yifeng
 Zhao" <yifeng.zhao@rock-chips.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Keguang
 Zhang" <keguang.zhang@gmail.com>, "Jacky Huang" <ychuang3@nuvoton.com>, "Shan-Chun
 Hung" <schung@nuvoton.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Han
 Xu" <han.xu@nxp.com>, "Liang Yang" <liang.yang@amlogic.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Kamal Dasu" <kamal.dasu@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Vladimir
 Zapolskiy" <vz@mleia.com>, "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Harvey Hunt" <harveyhuntnexus@gmail.com>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>, "Michael Walle" <michael@walle.cc>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Tze Yee Ng" <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:31:33 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] mtd: rawnand: intel: missing hardware disable in
  ebu_nand_probe() [1]
--

commit 42115b2b815dc0a43fa249f1ae95d7eeefbb02a5
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: intel: retain open-handle state on removal

This commit disconnects NAND operations on removal and ties the lifetime of
the Intel EBU NAND controller and chip state to the last MTD reference.

> diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/n=
and/raw/intel-nand-controller.c
> index 477a427dac1f0..e4a24e69ebbcf 100644
> --- a/drivers/mtd/nand/raw/intel-nand-controller.c
> +++ b/drivers/mtd/nand/raw/intel-nand-controller.c

[ ... ]

> @@ -692,9 +699,15 @@ static int ebu_nand_probe(struct platform_device *pd=
ev)
>  	if (ret)
>  		goto err_cleanup_dma;
> =20
> -	ret =3D mtd_device_register(mtd, NULL, 0);
> +	ret =3D nand_set_release(nand, NULL);
>  	if (ret)
>  		goto err_clean_nand;
> +	ret =3D mtd_device_register(mtd, NULL, 0);
> +	if (ret) {
> +		nand_disconnect(nand);
> +		mtd_put_master(mtd);
> +		goto err_cleanup_dma;
> +	}

[Severity: Medium]
This problem wasn't introduced by this patch, but if probe fails during or
after nand_scan() [1], doesn't jumping to err_clean_nand or
err_cleanup_dma leave EBU_CON_NANDM_EN enabled in EBU_CON?

nand_scan() runs ebu_nand_exec_op() -> ebu_select_chip(), which enables the
controller in EBU_CON, but unlike ebu_nand_remove(), the probe error paths
never call ebu_nand_disable(&ebu_host->chip) before cleaning up DMA and
returning.

[1] https://sashiko.dev/#/bug/linux-34984827-527c-4bf7-baa8-10dffee6916d

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D14

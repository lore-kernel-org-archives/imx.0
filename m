Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083535;
	b=vSLpzHmtwj5JbjCnsdz9PBgTEJIxCyXjlNNeDGM+Y9mrwFyEA/3s+5ukz9UuAa84FLEQ
	 jv11UMQIB+PM0xqaj4Hv8QVV3yW9KlZxLoJb/8hiIkvbpW+9AFPsVX8/QTninBbHizY21
	 MFfpfDDssIvc+SRjrr4kZd7NabdJyOtMotsnupIIl5cLUkXF8BDSQbJ34hGnLBOl/BJti
	 xWPbNpir1YS5KQ3zFb0k4wJRb/mv+LUnCYtvQrgUzeARTywyjtLosDpwF8Qs/TpAW7oTz
	 8RUa9O1FBOSMEKPR2AKMFm7BAzh1njdMAUVrqMc5hfmak8NpTEU/v5OlI3So5BER2fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083535;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZLqHvanQhVbtqziyQ4DuDfUd8pXVp5/u5iaRuc3S1QM=;
	b=rDK61/1I/aepqrKzfkJLEne9XIw81LS2GdbZVgaZ+qAZxQKO6nD41M6H0PpKIsQ21cXF
	 n8RiIALK4FKsIpodLj35LwULD9uP5rzVQFqvlEWJW+zUSS8Sf6CGXQFh5QNs5CofTIUjt
	 ZVKgke7KWmezHdYTO8fmS6KypQFqxRkcf0mHok/eW3NW9CowVyhzU4wccn4DRAg4SKt4K
	 Up+sGWjLgilXdDFmtW3VrVJyMZFulLLpmqPg/WOjEtv1iBhUJAR8cPLzz4IFPJsjNk6T1
	 doODKPiuEZ3pPYCLr8gy36HSj+OXZE8QPmOOLiVydy8P2OPkeamx82vgabr5SFPToxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FRcMOH/H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7E5606A326;
	Sat,  7 Nov 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FRcMOH/H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F341F0089F;
	Sat,  7 Nov 2026 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083534;
	bh=ZLqHvanQhVbtqziyQ4DuDfUd8pXVp5/u5iaRuc3S1QM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRcMOH/HcA8S4LSqPnxPdStAt+Df/BqkpjzLIDhYQAiI/1GfOzIlac9ORMaQyLbNA
	 VuoF+BeTKEOjkh7jBqby1Es+6xDTMFXnL2VER7ImjLLurwLu+2A662fl4dhYd8kTkP
	 CEi0Q4g+Y6sLPpHvqZ97356XdG2mZN7IZtfOhiYTVmoTGxW5rL98DzVrIJTUTlIMGV
	 Tcjrz39WFGD27FLWEeEpSMnBqd59kuEwbUMcf7EWV7ncmClaK++ErTkWKici3NBqr0
	 EyxJNFYMqGIPYVaKpgmHhJfivVyQ/8csTug+v0S4xpDMrGfNhYV0VuNu4II6YXHfJU
	 SJlOBKu3vXefA==
Message-ID: <sashiko-outbox-203299@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/58] mtd: rawnand: tegra: retain open-handle state on
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-15-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-15-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:32:11 +0000
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
- [High] mtd: rawnand: tegra: unclocked register access in
  tegra_nand_irq() [1]
--

commit 6164eede324ed80f4bb2c1a0eea0f8635af28e57
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: tegra: retain open-handle state on removal

This commit switches the Tegra NAND chip and controller allocations to
reference-counted release callbacks and disconnects the chip before
suspending the controller on removal.

> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/teg=
ra_nand.c
> index 7f9eb5f042a7e..da7791741b9d4 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c

[ ... ]

> @@ -1232,10 +1254,11 @@ static void tegra_nand_remove(struct platform_dev=
ice *pdev)
> =20
>  	WARN_ON(mtd_device_unregister(mtd));
> =20
> -	nand_cleanup(chip);
> +	nand_disconnect(chip);
> =20
>  	pm_runtime_put_sync_suspend(ctrl->dev);
>  	pm_runtime_force_suspend(ctrl->dev);
> +	mtd_put_master(mtd);
>  }

[Severity: High]
This problem wasn't introduced by this patch, but can tegra_nand_irq()
access unclocked registers after pm_runtime_force_suspend() [1]?

tegra_nand_probe() registers tegra_nand_irq() with devm_request_irq(), so
the IRQ remains active until devres cleanup runs after tegra_nand_remove()
(and after the err_put_pm path in tegra_nand_probe()) returns.  In the
meantime, pm_runtime_force_suspend() disables ctrl->clk, and any pending or
spurious interrupt before devres frees the IRQ causes tegra_nand_irq() to
read ISR and DMA_MST_CTRL while the controller is unclocked, triggering an
asynchronous external abort on Tegra.

[1] https://sashiko.dev/#/bug/linux-ae385c5a-5cfb-462a-ab95-dd13d6f5e107

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D15

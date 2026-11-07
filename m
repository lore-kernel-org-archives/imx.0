Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082906;
	b=M/BrBaH1Ai/pdwcTTdbA0PI26Hk+T5TJUHwwv33qx4r0eQjpJ8k9o6cAr51W5Ed0dxCS
	 kW453yYR2IfMtTpKuJgIwFMb5ZmOwltcy1QrFawkzHaQa4BIdO1/Q6NjZReIKUqaFwwgq
	 ZKTCQtv+bIXplOU/Q+0xCky8uvFNUSIhhbqBSFj7/we9om164E5J0t2mq0dsh0TvTLHLk
	 QsTKae4HMpNb8yx18XPovcu7dw1F8nxyAKBFEOJuG1Fu4ob3tpqeUgPKa9nlNKIjwuuL1
	 3CahT0l86zQQ9kb3zdDxxeCQnwBr2fO90/fIzsjk8iqwCbI87WRax2t7x+G43uE4lZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082906;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y3e6ZmJgL3uEs1Y9Rb9f2LR0HYHtdMMlVxFZ0fnS0lk=;
	b=i1xEbhiCeYtSzupXnGbVxflo/itxpMoObX4Xj5qIG9SqAAWf3tjOHD93ZJLXmf6EYEN/
	 rLWWtWuWMz5hE1Jen4UUS058X6K+XRS15mrAGSImHyjISuWaoqPrp2h95XoqHWk1V+BH3
	 5Aa1eJhRsE7BXbaWWkGCUgx2CCjGBbtx7xFWLtK/WE4c+5FJgp5vYuSV48an7zKGq0K2O
	 CC4FrAvlKygTO97NSB3HH+fW4sVHBEMgx/XS663y1VJThyFGhrBI9OGhsoP65bRc/GfTq
	 +yWVyTvXANtEszOO/oTqw6Lf/b63XEz34uO7Dxy1spusJwaXwfb5mcfH9cqpvC9Wsaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnwRqj5r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6D606A32D;
	Sat,  7 Nov 2026 20:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnwRqj5r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E2C1F0089F;
	Sat,  7 Nov 2026 20:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794082906;
	bh=y3e6ZmJgL3uEs1Y9Rb9f2LR0HYHtdMMlVxFZ0fnS0lk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KnwRqj5rWofc7pbKfyK5Wnh57xzZLxXWfhfaZVzqzsEi0i0ZDYOC2V4cgyx+yEUwl
	 LVN8cI9BR/IJQ58eioEirmvIn0nGNQ4OvzWBgb5X2UMpi12H7pk/CpIDwfP+C6Cfw2
	 tbZ1aqwu9Hf1mUiGR2wFO94plCefFg+ad7skgtL1zEJHoU/WmcH/LhDWn14J8hcMss
	 gUBiWgOkUglDJtlNGJpmSys2gt80lCk2Wt3en+0J9TMnMes03hBb4HVNxRIPCIMxPG
	 22z+nxW/ASf0sjj/CF67qRkoSKpkC0qzFPH7E8jS2fVu7xDrlUMpEcwVY09SnVi1zF
	 4cuXef9yD+GPw==
Message-ID: <sashiko-outbox-203269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/58] mtd: clear OTP provider pointers after
 unregistering them
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-1-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-1-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:21:42 +0000
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
- [Critical] mtd: memory leak and use-after-free on
  mtd_device_parse_register() failure [1]
--

commit d004139d8d5ef4bea351eaa0703331cff456a77d
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: clear OTP provider pointers after unregistering them

This commit centralizes OTP nvmem provider removal into
mtd_otp_nvmem_remove() and clears the provider pointers after
unregistering them to prevent duplicate unregistrations on error and
device teardown paths.

> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 8efa2d88556e9..558a605ba7495 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c

[ ... ]

> @@ -1180,10 +1188,8 @@ int mtd_device_parse_register(struct mtd_info *mtd=
, const char * const *types,
>  	}
> =20
>  out:
> -	if (ret) {
> -		nvmem_unregister(mtd->otp_user_nvmem);
> -		nvmem_unregister(mtd->otp_factory_nvmem);
> -	}
> +	if (ret)
> +		mtd_otp_nvmem_remove(mtd);
> =20
>  	if (ret && device_is_registered(&mtd->dev)) {
>  		err =3D del_mtd_device(mtd);

[Severity: Critical]
This problem wasn't introduced by this patch, but can a failure in
mtd_virt_concat_create_join() leak partitions and leave dangling pointers
in concat->subdev[] [1]?

In mtd_device_parse_register(), parse_mtd_partitions() or
add_mtd_partitions() runs before mtd_virt_concat_create_join(). When
mtd_virt_concat_add() claims a child partition, it stores the pointer in
concat->subdev[] and add_mtd_partitions() skips adding the child to
parent->partitions.

If mtd_virt_concat_create_join() then fails and jumps to out, this unwind
path returns without calling mtd_virt_concat_destroy() or
del_mtd_partitions(mtd). Because callers free the master mtd_info when
mtd_device_parse_register() fails, registered partitions are leaked and
concat->subdev[] retains partitions whose parent pointers reference the
freed master mtd_info, causing a use-after-free via mtd_get_master() when
a later device registration calls mtd_virt_concat_create_join(). (The
err_del_partitions path in add_mtd_partitions() similarly calls only
del_mtd_partitions(), leaving any partitions already claimed by
mtd_virt_concat_add() in concat->subdev[].)

[1] https://sashiko.dev/#/bug/linux-eb184d91-0c17-4015-99a4-10b54060a747

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D1

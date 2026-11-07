Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083137;
	b=KXW8ntYpecQZ8hlNoKZPXjycH414W/cfiWw+BJc1EYEIAKRBZNJSKXE62fAbSh/vcyNM
	 CpN1zsBSV4ROuP7vbEMr2aMTbQhPLRPHeN1OHeF4NG95rK96WSKGrG1ydMohG5QNt8l6o
	 aXpGp7JK9WK9+kVFXL+U5Xw4MpvIpkelXdxQcKRZFuN0uDfgiyRzFj8OwkM0mVrMa2cCb
	 3budpMauAhFxmMxd0MsDrv7wvwIDhA/T7uQYmBhGzszCuUN5FbSBB1y53nbvFlSmpRJ6c
	 kFyEFz/8SJL0jdleVBEGUeNYRbAuMehBLx8JKl0k/q49R/S+ulaVZgBDo2h3rbHH/jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D9/dBRPi0s88VvIK111ru1vQLcmn42LnKhUI0WPNA+c=;
	b=t6nntdc3Qqt2VPcSnXsQ/J6hdEAV58K/+7g2gtmYG3ZkkECJtxmnmPQ9xEU1Z8sMMP+V
	 9bs3rKe7I4Zw3t2c2DXMka+NDEvXngLWtq7F49K4MjI8j4Tyt9KtFTqsMmVKyTgASbC3A
	 WUJsxkqcS6ZtLKalMD/6Dxty6gyyP+6YXKNrO8sZQfQpy2NQYRx8JdL3oj3PAIIwqshi9
	 gXP9jDOfPuzzFG4vsC2myyPq4z6w6vT3KwJKlfv5LLxymIQlCXn97jbwjBiZZWxQDBt2B
	 PUoxJBViNMotlcvVkE98RKAIxhzbCkP1IsdEluYpX/CJN/MrsXyMFpPEGC/Wd3b5Qjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O/kxUGPN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F5A606A33E;
	Sat,  7 Nov 2026 20:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/kxUGPN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D5F1F008A4;
	Sat,  7 Nov 2026 20:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083136;
	bh=D9/dBRPi0s88VvIK111ru1vQLcmn42LnKhUI0WPNA+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/kxUGPNVjCLjTnQDqT+AKT7T/6AILEa8h6G3gx2eiR+DJhkd1geJFNP7FwFwz8YW
	 CNVpG2Zgv4UtOzk71eZ+eWFYR8M48rGBhaDghuunpyV5bBwi3j5Dpzx+O5+YHd/KII
	 IddzrvLIG5VFN0d+537tAPnpUnsnq3Gr1EF/CYVCvbqdXmzwoH1GEss7/tVcYrZLR5
	 s5EEETtVJFPRYcWgeC4TjRPB5Ys0EKOMiWvYJp46O3Rt/SHRIHa2gnG9fS7uJ1Eubx
	 YPS1iwU3ogN/2I/Rl76Hit53CJEcWTnHQgR/gAeiwUguzO49lzeAtLFRsqTlWD+p0X
	 Me72AWvbwZDnA==
Message-ID: <sashiko-outbox-203277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/58] mtd: rawnand: denali: retain chips across
 controller removal
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-11-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-11-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:25:33 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mtd: rawnand: denali: separate __free(kfree) init in
  denali_dt_chip_init()
--

commit 6e755ee59ce57be3f5cf80ff3dfee0f73764c61b
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: denali: retain chips across controller removal

This commit switches the Denali NAND controller and chip allocations from
device-managed storage to reference-counted objects so that chips and their
controller remain live until all MTD references are dropped.

> diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/dena=
li_dt.c
> index 8c822eae72e78..8d813cc05d049 100644
> --- a/drivers/mtd/nand/raw/denali_dt.c
> +++ b/drivers/mtd/nand/raw/denali_dt.c
[ ... ]
> @@ -81,7 +82,7 @@ MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
>  static int denali_dt_chip_init(struct denali_controller *denali,
>  			       struct device_node *chip_np)
>  {
> -	struct denali_chip *dchip;
> +	struct denali_chip *dchip __free(kfree) =3D NULL;
>  	u32 bank;
>  	int nsels, i, ret;
> =20
> @@ -89,8 +90,7 @@ static int denali_dt_chip_init(struct denali_controller=
 *denali,
>  	if (nsels < 0)
>  		return nsels;
> =20
> -	dchip =3D devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
> -			     GFP_KERNEL);
> +	dchip =3D kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);

[Severity: Low]
This isn't a bug, but cleanup.h convention is to define and initialize
__free() variables in a single statement at the allocation site rather than
initializing dchip to NULL at the top of denali_dt_chip_init().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D11

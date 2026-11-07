Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083493;
	b=NSv0LrtyDiRBSrp/y9YChxwRmeyZujMIkwnwHvRmHypSuc/FGVL0PQnsdPg4Q6H8WHJt
	 VzXLh1vHrSCXHLclIsWQX7nIi4zC7ROJPaHSleF7th8bn/ZtEjlLfUgSMhhW3zrUm4RJG
	 9xjzYr5R0KJEZsbLdzxCV6i06Kd4SzwuEKJ1qmLF4UykxV08Tmtyk+BM0F7HEEJY4rDMt
	 QOC0s4P84hLweNWcyZN8o1R9fv/MhTXxyT7kJFu4fFRpXheWP8cq34wPLinrIFeU0G4+j
	 b/J/VPmY0uxPpW0XtTBv/DB29iF3ReDmSGrPiiRMO94T5MCcakRA54VkvzQHxY5Lgig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083493;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KGb8SVWOFv1GGt7zAoqUc7R+seHi6woH5xUp6hhO/kw=;
	b=NwuZGO6WCzEsX78tPj0e6MkC5JGmY4L2qWUE5nlIphu8AL+Y2nlltnma5eAggyoGGIdO
	 HeZh77JPXAQsQso4B531I7qETzWP2Tluac/E+slXMMDj7Fsu86mPFKCwGbhtfsFrQ4ZGd
	 qSVwLq7i6Pqla9CwauNx/PkoIO4uW6Dr7RSb+PYyH4PqCdXNILIR9St4uTiZoxljqmYI7
	 cZ2O8x681PuDMIa77VlfsV8lr7CLwMkIvnjo7IVDMERCqGlbTDfgXjcsIBzjM9TZtvEyY
	 qjrbd7h53rkp6APwSB8i5zj7sJYqT743FgRGkTUL2khz4LpZ5LrUkp/PFA1yxX1rv/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6kKbraB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D584606A32F;
	Sat,  7 Nov 2026 20:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6kKbraB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304411F008A3;
	Sat,  7 Nov 2026 20:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083493;
	bh=KGb8SVWOFv1GGt7zAoqUc7R+seHi6woH5xUp6hhO/kw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C6kKbraBbSFZWfZop4ncnKX4ewSiAEope7D2MZkS9KsQt5e2x/eugwCKq8eF5/zqG
	 kUhiNXMvB1zI4HGCCGU6xEnQT5/1scKIdFIsngP/vaO2swMuwWoPVY+4iNkDuCEbdt
	 gPzuzyH+qBdQPa+1wfaTjb34fU4JWYZVxWQs9clHdjqwUQ+QuWMkqHQGBp3GoQbnSd
	 Rxv/mPP9jqAqE7m3fvBLUu1ocWv151DLzwoIG6mZagbrC46hLbkDnoaO8GihCc+zgN
	 TPfzFCv56oEPBelgLGrEOOqRbRbR/PF5n4PtHQ7Alyt0MCiKrJY9bd5eqFQopIU+Gj
	 JgiMa2wrpHpDQ==
Message-ID: <sashiko-outbox-203294@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/58] mtd: rawnand: atmel: retain chips across
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-18-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-18-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:31:28 +0000
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
- [Low] mtd: rawnand: atmel: initialize __free(kfree) variables at
  declaration
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] mtd: rawnand: atmel: unclocked register access in
  atmel_nfc_interrupt() [1]
--

commit b77082ebe154b5b59053fa6c8fd897f19a5685b6
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: atmel: retain chips across controller removal

This commit retains NAND chip and controller allocations until all MTD
references are released and disconnects chips before tearing down controller
resources.

> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/n=
and/raw/atmel/nand-controller.c
> index 0bdbcbb50d94c..10b725fa61d86 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c

[ ... ]

> @@ -1638,7 +1640,7 @@ static struct atmel_nand *atmel_nand_create(struct =
atmel_nand_controller *nc,
>  					    struct device_node *np,
>  					    int reg_cells)
>  {
> -	struct atmel_nand *nand;
> +	struct atmel_nand *nand __free(kfree) =3D NULL;
>  	struct gpio_desc *gpio;
>  	int numcs, ret, i;
> =20
> @@ -1649,7 +1651,7 @@ static struct atmel_nand *atmel_nand_create(struct =
atmel_nand_controller *nc,
>  		return ERR_PTR(-EINVAL);
>  	}
> =20
> -	nand =3D devm_kzalloc(nc->dev, struct_size(nand, cs, numcs), GFP_KERNEL=
);
> +	nand =3D kzalloc(struct_size(nand, cs, numcs), GFP_KERNEL);
>  	if (!nand)
>  		return ERR_PTR(-ENOMEM);

[ ... ]

> @@ -1791,7 +1809,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel=
_nand_controller *nc)
>  {
>  	struct device *dev =3D nc->dev;
>  	struct platform_device *pdev =3D to_platform_device(dev);
> -	struct atmel_nand *nand;
> +	struct atmel_nand *nand __free(kfree) =3D NULL;
>  	struct gpio_desc *gpio;
>  	struct resource *res;
> =20
> @@ -1799,7 +1817,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel=
_nand_controller *nc)
>  	 * Legacy bindings only allow connecting a single NAND with a unique CS
>  	 * line to the controller.
>  	 */
> -	nand =3D devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
> +	nand =3D kzalloc(struct_size(nand, cs, 1), GFP_KERNEL);
>  	if (!nand)
>  		return -ENOMEM;

[Severity: Low]
This isn't a bug, but per the Cleanup API conventions in
include/linux/cleanup.h, __free() variables should be defined and
initialized in a single statement at their allocation point rather than
declared as "=3D NULL" at the top of atmel_nand_create() and
atmel_nand_controller_legacy_add_nands() and assigned later.

[ ... ]

> @@ -2349,6 +2366,11 @@ atmel_hsmc_nand_controller_remove(struct atmel_nan=
d_controller *nc)
>  	return 0;
>  }
> =20
> +static void atmel_hsmc_nand_controller_release(struct nand_controller *c=
ontroller)
> +{
> +	kfree(to_hsmc_nand_controller(controller));
> +}
> +
>  static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
>  				const struct atmel_nand_controller_caps *caps)
>  {
> @@ -2356,9 +2378,13 @@ static int atmel_hsmc_nand_controller_probe(struct=
 platform_device *pdev,
>  	struct atmel_hsmc_nand_controller *nc;
>  	int ret;
> =20
> -	nc =3D devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
> +	nc =3D kzalloc_obj(*nc);
>  	if (!nc)
>  		return -ENOMEM;
> +	ret =3D devm_nand_controller_init(dev, &nc->base.base,
> +					atmel_hsmc_nand_controller_release);
> +	if (ret)
> +		return ret;

[Severity: High]
This problem wasn't introduced by this patch, but can atmel_nfc_interrupt()
perform an unclocked register read during teardown [1]?

atmel_hsmc_nand_controller_probe() registers atmel_nfc_interrupt() with
devm_request_irq(..., IRQF_SHARED, ...), while
atmel_hsmc_nand_controller_remove() manually disables hsmc_nc->clk before
devres releases the IRQ:

drivers/mtd/nand/raw/atmel/nand-controller.c:atmel_hsmc_nand_controller_rem=
ove() {
    ...
	if (hsmc_nc->clk) {
		clk_disable_unprepare(hsmc_nc->clk);
		clk_put(hsmc_nc->clk);
	}
    ...
}

CPU0                                    CPU1
atmel_hsmc_nand_controller_remove()
  clk_disable_unprepare(hsmc_nc->clk)
                                        <shared IRQ fires>
                                        atmel_nfc_interrupt()
                                          regmap_read(..., ATMEL_HSMC_NFC_S=
R, ...)
                                            <-- unclocked register access
<devres cleanup>
  devm_irq_release()

If another device on the shared IRQ line raises an interrupt before devres
frees the handler, reading ATMEL_HSMC_NFC_SR with the clock disabled can
trigger a synchronous external abort.

[1] https://sashiko.dev/#/bug/linux-94d27cd6-f6fe-452a-863e-36cbb87e9adc

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D18

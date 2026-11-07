Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085189;
	b=VQBObQKDcBcEjhEg+ZqorD7MPfVUzi2qPXM+Jwdf9RwzAXXYcAEs+Figs9wWR8Qfver7
	 E0tAN9Xl51tb7RxEV9Iqx8A6V5j/c41Vreq7VeAuOx3+XGuJhmoJ8OlD+DGR2tLUPQpbE
	 AbO5Qa5jsIIne5DmftQraa4N4zZOe0AcRY+lNp75OW7J9Cu6lLn7jEDV4oWIb21HBu1Sg
	 9gnUotra9MlPNjx+Qoaepej57iB8zP43U+fV0wNKWFrRiVGrD6zkwZS9GBVGgpxd0580n
	 ZhTQyhSTI2OdpuZ+G+mCMY0HB+4XHZHINEiSLG6cM7u4OHZGY9Ns+qumfsxLe0jhREA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085189;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PThdQtpTeh/RmsXeafa5AkNFktPLGhBm7MYbB3f3O1g=;
	b=PcUuirfZBtg27gzWO/gyaFLWk8U6+rGbmwjqs4YJfVGDOCcxNRu+VNwvHWRC2c+KhImu
	 M1QSeVDUeYVybtkgaGQ1U7wCWU1gxi9Wy0hQ8NkbP3i3vKeUpZIrl8gTAKiXBmhwW2vbC
	 rtY17T1VkeXQ6IYnWXDJa7w86H1lyd2dvOn1tmP7jYP83osl9I2u2GURdYCUCSKRmjON6
	 PDnqT0pwFrxgdi2a5j4qaNHLlFg/AELAIOV2oeDv3kr7/49z39PmYIdFuRLEz941aDXw9
	 hlNEU8KTDAHfSR0DwVtLnpAgtIE0Im+GwS2/ForPRwEIkgDtLINxxDLmBJa76eABA+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DH7Yk5Kv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09517606A32D;
	Sat,  7 Nov 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DH7Yk5Kv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ED51F008A7;
	Sat,  7 Nov 2026 20:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794085188;
	bh=PThdQtpTeh/RmsXeafa5AkNFktPLGhBm7MYbB3f3O1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DH7Yk5KvqaIsiO4Z+fB6WNNP1XnBSphUmIj8KBP0Q4jTYm6g/VBvbeNrbK7vdWU5D
	 QbBtKx+vDKko1hC6Y9gDFOK7kt3ICwl/NhFPgfnBhvPF8o74K0PDNi8+SHrIJEEt89
	 hKWXPwEqPLVQ6kxX90IHiJPyOHI9OgMcsL7+kDFVx8vRKrTsEjdf5wlJa/6W6up1II
	 491L3DgUzuhD+GhgMXO3eWxkbt5mj0K1DB2igvc4Sh9r1rUIG7qiNrUBusoPSPURXy
	 i6e4hcIBTHi2tTiPQTAB0MRMgvY6Z871gPn3/5kHmZwTBBhNjmOB0cBNSff6qovcxu
	 wGSh9grqk9wLQ==
Message-ID: <sashiko-outbox-203338@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 55/58] mtd: rawnand: r852: retain chip state across
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-55-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-55-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:59:45 +0000
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
- [Medium] mtd: rawnand: r852: r852_irq() mishandles card IRQs when
  removing is set
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] mtd: rawnand: r852: work re-queue race condition in
  r852_shutdown() [1]
--

commit 85c05cbe4afe297d6f7e2a571f936dd2dc915c61
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: r852: retain chip state across removal

This commit allocates a separate nand_chip per card insertion, ties chip and
controller lifetimes to MTD release callbacks, and stops card-detection work
scheduling in r852_irq() during PCI removal.

> diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
> index 92c47d351c278..0fb320cd7b771 100644
> --- a/drivers/mtd/nand/raw/r852.c
> +++ b/drivers/mtd/nand/raw/r852.c
[ ... ]
> @@ -734,7 +773,8 @@ static irqreturn_t r852_irq(int irq, void *data)
>  	card_status =3D r852_read_reg(dev, R852_CARD_IRQ_STA);
>  	r852_write_reg(dev, R852_CARD_IRQ_STA, card_status);
> =20
> -	if (card_status & (R852_CARD_IRQ_INSERT|R852_CARD_IRQ_REMOVE)) {
> +	if (!dev->removing &&
> +	    (card_status & (R852_CARD_IRQ_INSERT | R852_CARD_IRQ_REMOVE))) {
> =20
>  		ret =3D IRQ_HANDLED;
>  		dev->card_detected =3D !!(card_status & R852_CARD_IRQ_INSERT);

[Severity: Medium]
Does checking !dev->removing on the outer condition cause r852_irq() to
mishandle card interrupts that fire during r852_remove()?

Hardware interrupts remain enabled while r852_remove() cancels the workqueue
and runs r852_unregister_nand_device().  If a card insert or remove interru=
pt
arrives after dev->removing is set, r852_irq() clears R852_CARD_IRQ_STA in
hardware but skips the handler block, returning IRQ_NONE on a shared IRQ li=
ne
and failing to set dev->card_unstable or call r852_disable_irqs() to abort
in-flight I/O.  Should dev->removing only guard queue_delayed_work()?

[ ... ]
> @@ -976,6 +1003,11 @@ static int  r852_probe(struct pci_dev *pci_dev, con=
st struct pci_device_id *id)
>  static void r852_remove(struct pci_dev *pci_dev)
>  {
>  	struct r852_device *dev =3D pci_get_drvdata(pci_dev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->irqlock, flags);
> +	dev->removing =3D true;
> +	spin_unlock_irqrestore(&dev->irqlock, flags);
> =20
>  	/* Stop detect workqueue -
>  		we are going to unregister the device anyway*/

[Severity: High]
This problem wasn't introduced by this patch, but can r852_irq() re-queue
dev->card_detect_work during r852_shutdown() and r852_suspend() [1]?

Both functions call cancel_delayed_work_sync() before r852_disable_irqs()
without setting dev->removing:

drivers/mtd/nand/raw/r852.c:r852_shutdown() {
	struct r852_device *dev =3D pci_get_drvdata(pci_dev);

	cancel_delayed_work_sync(&dev->card_detect_work);
	r852_disable_irqs(dev);
	synchronize_irq(dev->irq);
	pci_disable_device(pci_dev);
}

An interrupt arriving between cancel_delayed_work_sync() and
r852_disable_irqs() can re-queue card_detect_work:

CPU0                              CPU1
r852_shutdown()
  cancel_delayed_work_sync()
                                  r852_irq()
                                    queue_delayed_work()
  r852_disable_irqs()
  synchronize_irq()
  pci_disable_device()
                                  r852_card_detect_work()
                                    r852_read_reg()  <-- MMIO after disable

When the delayed work runs after pci_disable_device(), it accesses disabled
PCI MMIO space.

[1] https://sashiko.dev/#/bug/linux-ce28ca2b-1bf1-4d27-8bcd-a0ec14b99281

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D55

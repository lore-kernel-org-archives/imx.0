Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084124;
	b=eBayRGxYwzbUCGtxWZYYrho4ks5UY5lwHF93AjyA5FfEDxFxwYI4jOA65cs5B+aRQjSk
	 DEF75j+B9Ju3tt3tYuv9fUOw4QGXHfIuudJSgwm0hxn4jW6I02qIcq5rQmdE5kL8D+Yyz
	 EZkINFleH/YX7eWPWUhfNfLX6E7/8GDEkX1tPPLv1F4axSBW/aPHzJOf5xwRJANEV6mg+
	 G8+5+9qNxu+ZG05dg1dej7aLDnP9K/HLw+Q3E7wPdRdcbwqzjC8lULduJAHdxax7wMCpI
	 th6DvR6eZ+cYz7hcJqCrAKAT+A24UzOtutlTCvqp9kbBXRJZOHpP61H6pgw8j0DrXuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084124;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lwuEsjh9q5gPbKhlJcGbl7FK+AeSWFGu+PnGUu+3vhc=;
	b=bfUKHaT5ZUWFKJKewvcwHBCfuhCKlQ575Fh86Xsw4YoDbUlx0iA4Sz5CAueNLNcjIxZj
	 DqwWsdVnVbO0d5TvSlQDX4L+P5trkqX18zyy7D6PiW/7q77vORL/ZTD1F1twgcnGw2wXx
	 AmHrBlo1ScQ5JS5b0e4o5fje/vntRwIVH1T3YN2gcrDhsz+jd3/WJUeQn5IvNanqIjeoZ
	 RzTSr8QQmGHqvZsfHVC56GfJDB4lGcuXevfnC5oSZhQ5DGp6kHrHBf1vRZbJAljZerTTq
	 bt6vub7GC/BobRzqKTaldYw+g6BAtDGfBtOS9WmqoNV4fpFzsBrwSvrqeH4x+Oelgdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYEo0TeW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145A606A32E;
	Sat,  7 Nov 2026 20:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYEo0TeW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA301F0089F;
	Sat,  7 Nov 2026 20:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084123;
	bh=lwuEsjh9q5gPbKhlJcGbl7FK+AeSWFGu+PnGUu+3vhc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYEo0TeWlYT8r1fdHC56Lgr3GMEibpbQNZUheFdun5BrOo095xOtsOOZ/ghwByI5N
	 zawR+YyAvrI4RgGMXY0G3SRK2ogBlbTFCe13Hyk7RIwW+RXbg+x6ojFL1MnrWqFCso
	 ZP/ZSxZOydWBDjrYq9IdzhcyFxcYMJyxm4kyOKp5XfojhupKlGP/qb7M+rla7KXA8p
	 JoshuHDiQOMUC3h/J8WL3WNHL7rRJuwWgY2CMY8321RptAnnG3iKZxbTVxIJf53X0k
	 84cDIMVugD4Wv30OcZqFvBpPO/zGF9NDRlQlnq6QKGQb9lBLNaljHsBzQ8mw8LRbll
	 fkC5snZSFp51Q==
Message-ID: <sashiko-outbox-203315@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/58] mtd: rawnand: separate hardware disconnection
 from cleanup
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-4-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-4-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:42:00 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] mtd: rawnand: unlocked hardware access after nand_disconnect()
  in write_bbt()
- [Medium] mtd: rawnand: nand_suspend() returning -ENODEV aborts system
  suspend
--

commit 0d69828030d21f2e8c3f391544ee5a56406e7996
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: separate hardware disconnection from cleanup

This commit adds nand_disconnect() to mark a NAND chip as disconnected
under the chip and controller locks and makes nand_get_device(),
nand_suspend(), nand_resume(), and panic_nand_write() reject hardware
access once disconnected.

> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand=
_base.c
> index a5b278ab9384f..8f7d2571e8d9a 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c

[ ... ]

> @@ -581,7 +607,9 @@ static int nand_block_markbad_lowlevel(struct nand_ch=
ip *chip, loff_t ofs)
>  		nand_erase_nand(chip, &einfo, 0);
> =20
>  		/* Write bad block marker to OOB */
> -		nand_get_device(chip);
> +		ret =3D nand_get_device(chip);
> +		if (ret)
> +			return ret;
> =20
>  		ret =3D nand_markbad_bbm(chip, ofs);
>  		nand_release_device(chip);

[Severity: High]
Can a concurrent nand_disconnect() cause write_bbt() to issue unlocked
hardware operations on the disconnected controller when updating an
on-flash BBT?

nand_block_markbad_lowlevel() releases the chip and controller locks
before calling nand_markbad_bbt() -> nand_update_bbt() -> write_bbt().
If nand_disconnect() runs before write_bbt() calls nand_erase_nand() or
scan_write_bbt(), nand_get_device() returns -ENODEV, which write_bbt()
treats as a bad BBT eraseblock:

drivers/mtd/nand/raw/nand_bbt.c:write_bbt() {
	...
		res =3D nand_erase_nand(this, &einfo, 1);
		if (res < 0) {
			pr_warn("nand_bbt: error while erasing BBT block %d\n",
				res);
			mark_bbt_block_bad(this, td, chip, block);
			continue;
		}
	...
}

mark_bbt_block_bad() then marks each reserved BBT block worn in memory
and calls nand_markbad_bbm() -> nand_default_block_markbad() ->
nand_do_write_oob() without calling nand_get_device(), accessing
controller resources that have already been freed after
nand_disconnect() returned.

[ ... ]

> @@ -4688,10 +4728,14 @@ static int nand_suspend(struct mtd_info *mtd)
>  	int ret =3D 0;
> =20
>  	mutex_lock(&chip->lock);
> +	if (chip->disconnected) {
> +		mutex_unlock(&chip->lock);
> +		return -ENODEV;
> +	}
>  	if (chip->ops.suspend)
>  		ret =3D chip->ops.suspend(chip);
>  	if (!ret)
> -		chip->suspended =3D 1;
> +		WRITE_ONCE(chip->suspended, true);
>  	mutex_unlock(&chip->lock);
> =20
>  	return ret;

[Severity: Medium]
Does returning -ENODEV from nand_suspend() abort system suspend when an
open MTD handle outlives controller unbind?

While an MTD handle remains open after del_mtd_device() and
nand_disconnect(), mtd->dev stays registered on dpm_list until the last
reference is put in mtd_device_release().  During system suspend,
mtd_cls_suspend() calls mtd_suspend() -> nand_suspend(), and returning
-ENODEV fails dpm_suspend() instead of treating the disconnected chip as
a no-op like nand_resume() and nand_sync() do.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D4

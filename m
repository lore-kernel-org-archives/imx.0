Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084754;
	b=3qOApJm3P3320cC3w7XO3e9Dtgm20Q7WzDRQKXneyX+iFUUsx7Xv3bTLOM4QM3+4f0av
	 Kxg5t6/ZadQifQ1+gKGpVGzXT8yhZQM8WGgVskasFBumT+blrQL90IoAOarmTnfPY/BqM
	 6YzL8WzwU+k+jgT98tOXpsk7HRcpSlC25GFia1F9nIp7NFS7f8UrbcKD6lKHVPziQ1ZDX
	 /eLu3f+vfkH0+H0r8w841boaJxjxdrRECliuaD77qarJsOBlBtP3zqPKxwFYB0ehTn9jX
	 0yAgyCeeg/mv0uxJhExNFs5J5YOw7oXtI7MnP3KeOtXK6PjNDnKzgjHQpMNfP/PUuqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084754;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5/yAbnSlT796zo6/LxI3k/ssH+kUZUnYtFmT5XnFCro=;
	b=oiAgaZPtloTXcV41iEpNygFygtTT+ojL6en4njalcjil9MHba1ldBtG7ohc4alzuOkaG
	 Kuwr5USO0EpE3T2YOc7tkBDoIlMemPKEtj6omHfgPwA/3FS3YXt//m/ad0wGy4UEgfDGb
	 6PJLoEWfrwmPGjMnWInbEUzjyOX1Xi9Onzljzap/AZUhnVjIJd2MXm8kWNHu4b+BaNLQH
	 QWrX+wYkCC4mEbv+PK2vqG6fZwFSMc2FKuUWSJ17HCapM4L5G0cuc+kQex1GmWt+p62Ji
	 nsPzmEwkktr0H8/e0PSwqLLR4X+yBsdQuFtduv+/40rhnBqbzq2NHYfImwuI/JRnV2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fW9X6j0t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B117606A326;
	Sat,  7 Nov 2026 20:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fW9X6j0t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967C51F0089F;
	Sat,  7 Nov 2026 20:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084754;
	bh=5/yAbnSlT796zo6/LxI3k/ssH+kUZUnYtFmT5XnFCro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fW9X6j0t4J83x/radFZsJ5F/wcRHLrWKavr+S7Vr2Tl6udtBGD4FTMEyo281qdzbT
	 xuHuBJNvCDn8S6NOmEvftEBZ3yCw7rAg19u1q96kk0JHcwtxeevlKZQBz7iKcpalxl
	 rEPJhacWGxLQlE7FLGspZn9DmCyjZ7SSDXwB1fbq5XnvOm6V/R356z5n0J9Ym+cVYe
	 Lbi8CKzokYJlV6wuETANH9A2rBzisWEYyOJTL4E2GDADjQWUg6k+aiA7vLncA0mlNW
	 1s9RJJ41CUacldI2rQc/ielsN8oBmVxIhIAJ4bkS9d+Wxdsn1sTXW3UETxaKTBjG38
	 X8ZdsldmBVFKA==
Message-ID: <sashiko-outbox-203333@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 56/58] mtd: rawnand: nandsim: retain chip state across
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-56-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-56-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:52:29 +0000
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
- [High] mtd: rawnand: nandsim: shift-out-of-bounds in ns_init_module()
  [1]
--

commit c6f7998578d1a1c3b52ebeff5e9664c6e727de3e
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: nandsim: retain chip state across removal

This commit disconnects the NAND chip before freeing simulated media and
retains the chip metadata until the final MTD reference is dropped.

> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsi=
m.c
> index fe968037f75a2..39fefd83cd850 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
[ ... ]
> @@ -2376,6 +2382,10 @@ static int __init ns_init_module(void)
>  	ret =3D ns_parse_badblocks(ns, nsmtd);
>  	if (ret)
>  		goto free_ns_object;
> +	ret =3D nand_set_release(chip, ns_chip_release);
> +	if (ret)
> +		goto free_ns_object;
> +	retained =3D true;

[Severity: High]
This problem wasn't introduced by this patch, but can setting the
overridesize module parameter to 31 or higher trigger a
shift-out-of-bounds [1] earlier in ns_init_module()?

drivers/mtd/nand/raw/nandsim.c:ns_init_module() {
	...
	if (overridesize) {
		uint64_t new_size =3D (uint64_t)nsmtd->erasesize << overridesize;
		...
		if (new_size >> overridesize !=3D nsmtd->erasesize) {
			NS_ERR("overridesize is too big\n");
			ret =3D -EINVAL;
			goto cleanup_nand;
		}

		/* N.B. This relies on nand_scan not doing anything with the size before =
we change it */
		nsmtd->size =3D new_size;
		memorg->eraseblocks_per_lun =3D 1 << overridesize;
	...
}

Because new_size is 64-bit, the bounds check passes for overridesize
values up to 63, while "1 << overridesize" shifts a 32-bit signed int.
An overridesize of 31 or more overflows or invokes undefined behavior,
leaving eraseblocks_per_lun zero or bogus and leading to a divide-by-zero
during MTD I/O operations.

[1] https://sashiko.dev/#/bug/linux-85e29763-d721-4e3b-9253-7b65f9dada3a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D56

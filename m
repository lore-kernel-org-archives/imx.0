Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083201;
	b=qIzmNqifsKPixDPzmuT28hcyhF3UhX+JUM2+CKb0robfPT5qWE2KOlNixfg6g4Mb8eaS
	 QY6Sblru7ypXO8iqaSjUapJ18jqIqogc0RxM6dqS8+VNyONfE9loozTW8VOBEqdUWnGE/
	 qV+1ED6F63RvGC+hDLNvGE0dG++C9rVU0wzp6NK7c4yhW7odd+/u1dRUMXBaxjZjCzFGr
	 roWzVPv5b0xIxuIxgXHG7DY8NsGyfepRbq6TC5VQHrf9Nt91OEKphZ4lsSM3baVNQCB6f
	 U7YstaDHx51xUdHwTPhYVOqS7sGXVlVkWUGJpBNc0VCsd0Dz6XJzGwwiPpRJQu5rS2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083201;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1AESFR6UyewtBByr3oB+241AGrsXkM0X6WiJV3LJUSE=;
	b=GIN8DdtggYxQ8uFLfbEBVPYDUZoOeKfVbTkJVqQ+/Z9O31n6QKt0M2gSkUiKO6q7BckW
	 VNqSxAWgzuAA2zRYGR+YC9h1fTWCGZhXa/lqWXdhnVjvBSA5q9BfuM0wYAGYNeQbdmRAk
	 f3QqEIPQOn+aGz2T2fD1MzhCXsyt9Xy/cEcaIdKcmN/D6GIuR719A1Y/kkmwz+RkzPyKD
	 WcKvXaEXZ7ya4x8HEux6C1vvncmHJnFhZXNzvzCyZgEWxNnzte/jKBg/zWYyE9wLi5uG6
	 v4IQyU1NXO7NZzNpSa13GZojdkZhRr3esH5+IOOt76Xj3zaXNSMYH/DvAvJwjbgI5VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWRuxx+j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A3606A32C;
	Sat,  7 Nov 2026 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWRuxx+j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3551F0089F;
	Sat,  7 Nov 2026 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083200;
	bh=1AESFR6UyewtBByr3oB+241AGrsXkM0X6WiJV3LJUSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mWRuxx+jjVJdW1MPvP4YUaHNMn04vZzAZb3YqyeAjy71jG2GLOYjy5HlGPqQfvd0p
	 zcOuNu+MQiVsOBL61AOO55Hi75o0VScAOQzgcpGLve8bnaMaSR2WxXSHP5F+WAU0G5
	 sZwi4JL8jNc85JZATzW3SWp3sYuR7zIkJ9FVRYO3MI1LrMdYwHeWyBzrkVlJOIc64E
	 6guY3yV3+plltFj67HRkbuVJjk+K56GavhGzbJERhnTVqUWKKB9ZUq7pR6fhKYgnI6
	 A915qqTTFcJztN0GrRclpa1aIJ+92+ReL0Bcdt5OzbQ5JEobwv6TQDvG7yZDCDgC1Y
	 akBtDt6g8jPng==
Message-ID: <sashiko-outbox-203279@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/58] nvmem: retain provider context through final
 device release
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-2-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-2-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:26:37 +0000
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
- [Medium] nvmem: unpinned module callback execution in nvmem_release()
--

commit 6223a607fc304676fa9e070c9a5930603931e0e7
Author: James Hilliard <james.hilliard1@gmail.com>

nvmem: retain provider context through final device release

This commit adds optional priv_get() and priv_put() callbacks to struct
nvmem_config so providers can retain their private context until final
device release in nvmem_release().

> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 0556d140170a4..851fa5cabecb2 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -541,6 +541,8 @@ static void nvmem_release(struct device *dev)
> =20
>  	ida_free(&nvmem_ida, nvmem->id);
>  	gpiod_put(nvmem->wp_gpio);
> +	if (nvmem->ops->priv_put)
> +		nvmem->ops->priv_put(nvmem->priv);
>  	kfree(nvmem->ops);
>  	kfree(nvmem);
>  }

[Severity: Medium]
Can executing nvmem->ops->priv_put() here race with module unload and run
unmapped module text?

The kernel-doc note in include/linux/nvmem-provider.h states that the
callbacks must retain any module needed to execute priv_put() until it
returns, and commit "mtd: add opt-in lifetime ownership for backing
objects" implements this by calling __module_get(THIS_MODULE) in
mtd_otp_nvmem_get() and module_put(THIS_MODULE) in mtd_otp_nvmem_put().
However, a callback in a loadable module cannot safely drop the last
reference to its own module before returning:

CPU0                              CPU1
nvmem_release()
  mtd_otp_nvmem_put()
    module_put(THIS_MODULE)
                                  delete_module()
                                    free_module()
    return;  <-- use-after-free

nvmem->owner is only held by active consumers and is already dropped in
nvmem_device_put() before nvmem_release() runs.  The NVMEM core should pin
the module owning priv_put() in nvmem_register() and call module_put() in
nvmem_release() after nvmem->ops->priv_put() returns.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D2

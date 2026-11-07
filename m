Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084490;
	b=TMiy7+sCuvZ4VcjmBCuUFsmAFwAHaL8bFHvOb5LsPzwsIOvUBO1PJdMbfuCKaqMS76Tv
	 /X4ewOUL2u3IDD2v7x44EnX0xw62m6xflO360ZxD4MPvx9yblH7SpoZB4V8Pu1T/cLBFW
	 9SIHq+R6u+MR4IoHmXB8DLrUtFa8d0ZB/uaCFRCrdK5HUjVNCB29PEaCIcY7B8Cxg8UdD
	 sxcU8Dkc556ErjvrmRg7KpThyEUJ0iwv32KU9Ylp/Ag+KR0Ve1iX78blKVUyIbxqGePgb
	 dPcZ4/G8RgftW6N+fcUZ9puvUe7MmqQ/2p1Nyd/k+s1f2XJ1EbtvN3yxGRg5UW4BF2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084490;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XiglxFtRswHRrbBgkGYgYBGQsVeSRteW99GaZhMNGiM=;
	b=T0qFpJjgvXHFR1Xak4cHQOKLDD/eSyXknvB2pkAnG9DyncoY54aI31nK6vLr7USGoUYa
	 mUOLHRuJ7tsYS3fv6I+GtF3M59jnNJXMP2shMfJwHYk4c04mXFKi5bCWGMDIP2HGuiWa/
	 0B4rlj/cTdjYJb48reCEa4xzKELw12KycDiBjF9tnka3KpG0pnKCGeIU1l6FlMMFoj54u
	 utfPTq9/yakEAnupgHDlhVqOcMwYAwAlTbsO0/aflCNS0LXUAvrNy94DMi4V68w0nt8a3
	 zXg3E+tXE2o3kjss8Mu/wjfto1/R4qOgNyVQxG1WVaimM/rF6OtvZs46FIxZSE+wMrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OWje3/2R";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F053606A326;
	Sat,  7 Nov 2026 20:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWje3/2R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4921F0089F;
	Sat,  7 Nov 2026 20:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084489;
	bh=XiglxFtRswHRrbBgkGYgYBGQsVeSRteW99GaZhMNGiM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OWje3/2Rv7EJDS7J7WAZQ3IaKVBQIPUWgb0tHrXervawYZQjOzVkhShNBwmS1w0Ly
	 NYzny1weZVmROwiM5tWc21yb3MqfhlxLsSki4pBb95h2faR0TLPOt33oizxPzqU42L
	 qsZAMTfit6cvC1nImdFlId31OFqnsXb9MkcVL1pKkpy87MdgH/XuAF4ToOXabjsXGQ
	 cF/aE3/+3UYQmxXLqYrzTKwinwq0GAropZvrRS5tFQphZKCI/yA+kvKt9ycqpqbdvI
	 D6yWmoFemZW3fA01bwPsJbXw+8gocEUHNOnaBHmmuHh9sUcO/vZWR56WTIzSTM9uOx
	 J0JnvKin7eX3Q==
Message-ID: <sashiko-outbox-203327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 51/58] mtd: rawnand: mpc5121: retain chip state across
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-51-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-51-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:48:02 +0000
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
- [Low] mtd: rawnand: mpc5121: missing Fixes trailer for probe leak and
  removal UAF
--

commit 648cd21cc2eac3c4001033a11e9ac4de646c25b6
Author: James Hilliard <james.hilliard1@gmail.com>

> mtd: rawnand: mpc5121: retain chip state across removal
>
> Drain NAND access before unmapping the external chip-select registers.
> Keep the embedded chip and controller alive until the final MTD
> reference, and unwind scanned NAND state on unsupported geometry and
> publication failure.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

[Severity: Low]
This fixes a probe-time leak of nand_scan() allocations and a
use-after-free on device removal while MTD handles remain open, both
present since the driver was added.  Should it include a Fixes: tag?

  Fixes: bb315f749f8c ("mtd: nand: Add MPC5121 NAND Flash Controller driver=
")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D51

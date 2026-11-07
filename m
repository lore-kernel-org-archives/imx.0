Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083364;
	b=uaGjmgvMuh3xZ/1dbdY3kTmaPvrHZ1EBx7LK4RbPc9L/UQ8GsaH+IeKelHZrOu/Pk6ru
	 WwE/1IU2JjOHThFc3DBKasEYTzkFckUN7V7YraTUEWCvk1FCVLdUYYB2FD9VJw21aBl2R
	 ggUOjoeZ0TXbQ7Oxw56JwaFH4/XBmGEbIVBzIo5V5U52pAmOCVeVgLGcSIlBTlVDfR/3E
	 +ZUWdx3Kj7/as5oSHSjetdmyMb+OyT9iI8ds/lL1/hRnTBqDn9L3xVAVp6lrfgPxLS7Ri
	 GXt0bc+F7WbFOMWvLtvCfqmryjzWFiTyVIkjFiXLw9kIyvw4hE148T/GPKsBg0neP8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083364;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1fsl7JZFQyXxjjK/JE+evV8C5FWEAhsAMXLZmVGmCpg=;
	b=CvTdTfpCuTO2sMtSDLTugg3piI8d1xt65DX1zPL49g3Vhyk7/T5c9DMYtxuIrbcjQMhO
	 BdcwClks7JYK2T0Xvap44qrN3Um+EkEW6tUbJYkA3TE5LLfUDH/uodt2nUrk4eAn7wp+B
	 Z+/QzYBDjM6BuG+peIpwE6+dj1//Jw1Fhwa21KbifN1AVhQNHUBE08zYqBBSKDFWyqJfm
	 kCZzHwcpKKN/P6BhVMjz3tN3uwZMrIKdLX+vDdIcD0Slq1k9DJQ1x4rMZqRgr7SFd4Qmx
	 BIZhAPECRAZQ8D2lTBV0s/tLN5fMN6Yv3IQqYn8nnuujuswHSmCz2rtI7DAnkhqbH+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nlH26Vkp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F311606A326;
	Sat,  7 Nov 2026 20:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nlH26Vkp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E6C1F0089F;
	Sat,  7 Nov 2026 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083364;
	bh=1fsl7JZFQyXxjjK/JE+evV8C5FWEAhsAMXLZmVGmCpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nlH26Vkpn+Lby4qxfU9i9cpb9x2w9zz4rXIYGMpzjWzF7zLTTgjjzQsoKbdqC/qMY
	 JsAu6C9nmcjeWt+JU8qdUIu1jrzXolJzXSsAS6Ld4+LYwxg9XlCpLd8wu3aqmiit+h
	 WVO5XvrNrfHl182Qwyi9aokvmIBN7ntjxnJ1NpsT6svuBWzJKgQqyeEOKi8+dpVRZN
	 jPYRQel82BUr9Y1mxI3J1H39f7Z6b8QT/iOlKSii2jvn+jn41zyBbnHv/Dy3i7tkAC
	 JlXh4bUOZCUfBZrU9g922Ax2Q4SrbfNL6jwGt36BqcuLgKRBeH57gH5rjKC338H/+e
	 rpn/3Nu0pYZBw==
Message-ID: <sashiko-outbox-203286@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/58] mtd: rawnand: orion: retain open-handle state on
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:29:20 +0000
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
- [Low] mtd: rawnand: orion: missing Fixes trailer for removal UAF fix
--

commit 9465d514f949c22e40663ef5664153c0883e1d59
Author: James Hilliard <james.hilliard1@gmail.com>

> mtd: rawnand: orion: retain open-handle state on removal
>
> Keep chip metadata and controller storage alive until the final MTD
> reference is released. Unregister and disconnect each published chip
> before releasing the resources used by its hardware operations.
>
> Retain the embedded chip and its copied name through the shared
> allocation.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

[Severity: Low]
This fixes a use-after-free when the device is removed while MTD handles
remain open, which has been present since the driver was introduced.
Should it include a Fixes tag?

  Fixes: 2a1dba2931dc ("[MTD] [NAND] Marvell Orion device bus NAND controll=
er")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D19

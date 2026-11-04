Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757616;
	b=rp9gucqRoMvebf8psWS2YLDmtJpOCtl8Lmv25/GUF7es9fijN6Cklf05K0FqMYEyXl2o
	 VZf+he5CvxNfedChONE7unsgHViRci7Ng6VE+D2EigpASDF98j3ZKfEBePOa247Vb51qQ
	 wAY354RpGVi0B2K10t2Ts3gse9jV0Gqni3wtu6QZuG2fN+fUdylay79KEn1METmmHQohj
	 sHTsfpt1RmmOTdh7iYVOt3qyFFjtclsFoGKK41MqRE+Vrxqx5MNZS3NYjgHbKwWCAc/+U
	 3rF2IzwhvUkupRkV6IVQnZbTxD6kqf0y7C6xRGVwafR+YS3ZMD0+eTDCMkzXQIMQUKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757616;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ID6BIMHIs5dozQ7uo2Zz7lMx53/Uma4fVMefg73C8Wc=;
	b=e3lLZm36HrKQG03polT3pa6r9sgYbp3u19k9K5kA+GqgQDmvY4fbNK+48WjO7+G51FLJ
	 k/W6lyuk4E36dXY9S4jDRHTU0Nxixq29KOL+vbvUaK884cF2FOPTmRRD4O+r85SYPlY6a
	 CHZjEVVXVSGsWTz7aYJKbatVNESn7AF8DMuV36QutUfVmksHF9aJHFgkj7Vc7vz2Txvfe
	 CWC9XMoP9MRvr/3zoFI2mfIn2rkYuQff19e1xkQl3bZJpW2l3y47m73Ti2HIhILklV/op
	 Cnztk/TNqt7wbNK7xUf3TW/dbiYxL5XGU67VD8li8Uk0kKAIrAoq75FYhrPRm4VGbEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEAD606A32C;
	Wed,  4 Nov 2026 02:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAEAD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793757606;
	bh=ID6BIMHIs5dozQ7uo2Zz7lMx53/Uma4fVMefg73C8Wc=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=NR6/RAAtadCxMT4aZNlWPKRVIcS8Uk+8x0Dzwevvs6B9RgwZ7gNVgfqgw2V6jccY2
	 diZt/zl8uph3tIhysVhM5N/Yu8QvYwWUDPYY1qlQnLcFnuzUtdu8OZw0KH4ezoDL8p
	 E2DgEks2Bd8LbYe+KH6+erZz2fFcbxQrJtZNGXkc=
X-QQ-mid: zesmtpsz9t1793757596tb1b7ee28
X-QQ-Originating-IP: MD06nJQTuVrERiBp4eZOuk/3YdF/RHaLSj82pRQMepc=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 09:59:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13434004078560652839
EX-QQ-RecipientCnt: 60
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=491fac0dacb0df51633230a215ca837ce7256ffa833a7a70182b3d999b4d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Nov 2026 09:04:38 +0800
Message-Id: <DMM0TNL4VAOH.JFJQU10EQHE4@linux.spacemit.com>
Cc: <vkoul@kernel.org>
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <Frank.Li@oss.nxp.com>, "Mark Brown" <broonie@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Radu Pirea" <radu_nicolae.pirea@upb.ro>, "CL
 Wang" <cl634@andestech.com>, "Ryan Wanner" <ryan.wanner@microchip.com>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>, "Ray Jui"
 <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Vladimir Oltean" <olteanv@gmail.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Han Xu"
 <han.xu@nxp.com>, "Haibo Chen" <haibo.chen@nxp.com>, "Linus Walleij"
 <linusw@kernel.org>, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Daniel Mack" <daniel@zonque.org>, "Haojian Zhuang"
 <haojian.zhuang@gmail.com>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Heiko Stuebner" <heiko@sntech.de>, "Fabrizio Castro"
 <fabrizio.castro.jz@renesas.com>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Alain Volmat" <alain.volmat@foss.st.com>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Laxman
 Dewangan" <ldewangan@nvidia.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Sowjanya Komatineni" <skomatineni@nvidia.com>, "Kunihiko Hayashi"
 <hayashi.kunihiko@socionext.com>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated
 list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>, "moderated list:BROADCOM BCM2711/BCM2835
 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "open
 list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, "open list:ARM/QUALCOMM
 MAILING LIST" <linux-arm-msm@vger.kernel.org>, "open list:ARM/Rockchip SoC
 support" <linux-rockchip@lists.infradead.org>, "open list:RENESAS RZ/V2H(P)
 RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, "open list:SAMSUNG SPI
 DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:RISC-V SPACEMIT
 SoC Support" <linux-riscv@lists.infradead.org>, "open list:RISC-V SPACEMIT
 SoC Support" <spacemit@lists.linux.dev>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, "open
 list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, "open
 list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MxBXu3otMoKfK+OoSiCnifxZMZ3l9VZhifAoQw7dOlTg594WC2sFPX63
	Ch5IzemjS57GnDRFg04ef/hVzdjLDfknNj1F266RldAK5axSTq/5BVRh6uzfd0cGwgXCi6L
	eXkH7+vy03jW/wN1+mZg9932ITvSiibvyyq2+UbQZonGYio8+aObgCqvD8DeeKPAPxospVy
	8vufO9yksPRKREpLKIlfG6A2sbyYC78JRm9YcyVRhapBI9WdWTYEyIiG3h//IOk1d36OD+h
	lV9qfhAIt3rS4nsbvQ6tiaQcN9QzSTkmxnX13VYFQ1Rv4RcYY1b6BDa0P/9LhJmenCM1adp
	Q+p6Pw9svsDEl6uTjABgVY43Titq/UEgnHU3ooBDC0Kq4+AaLYmT6ELkqiA+mwpgBmftrNd
	JmsyAV5An0NGa+TFNX2Tw3qJSG7t0tM2Jry6CGIXu4kAGFFhCEQGPhqFD8/Go7jxb8PTfWY
	WJ7KlPK9Udvpov97OQbVGmXhY4HIfkRxq+t/xq2uG543xakt3QK+6Qjz6OYgZvmmjjK62h8
	YSmv9uDhb4zvaMdCKXRDlIgBDW5EPnTfTrBtjWAE2iyorJ5+NYLRZsnVW1nsQBs7O7qcvaT
	YLcGPmkXrNs4b2hFh5syNgU64kySBmooi6AOn1qtfb0+IP/utb/kkHpdF8vjn0rigw4z2uE
	kx25wjB9ZAipIIp0K/XoOoaVkkfZAMVlJo1QeDToNgB/u+UjN4riX0tzCTkrVfO88MsYe0x
	sCC57eBrCVw9FQ3cOMDf6yW0Z0tc2NnKhhWmKKyfVNo4WAV9jCFTInl5V82H0Vo5gBmB+5T
	0UWtJ+2NlemHaKAMdi/UwMkZCeaHlEA33bTk1KLdLHHMcPnLoHKzLoNIsziYcTfA7iL/M1b
	9ZOrU059oDj4yyq+TtnRlhZydL2mLyYjogqUWfTJFHULErMe4TZb/mYbDQHHhNuK/DhMLOk
	6aL9WTU4dunV3LCFvJjACUmKeaDOop7TjTu18Qa3g+Ss2f1BIKLPTl/7UPMmZLCn2DmH+5V
	+jn2PiUyDh3m8yYiws0cFFxDRGHhXmPfqfSQ8ng5ATnBz6trV1UcVMnsFUTrlALfZpVq2cA
	Y24BmHYXplcjYzEnHlG0ArgN3+QQcSPeQ==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

--491fac0dacb0df51633230a215ca837ce7256ffa833a7a70182b3d999b4d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 3, 2026 at 1:39 AM +08, Frank.Li wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/spi/atmel-quadspi.c       | 3 +--

[...]

>  drivers/spi/spi-spacemit-k1.c     | 3 +--
For spi-spacemit-k1.c:
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--491fac0dacb0df51633230a215ca837ce7256ffa833a7a70182b3d999b4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauqEphAcdHJveUBrZXJu
ZWwub3JnAAoJEJgJ74D5MzQvbm4A/3HANvkYXGwCFgtSV4A5x/SL0RIfjNSYBzhT
PnYB++eVAQDPfgYcXc7pJv333Y0YE7vFp8FUIkC1g+Aqf+cidgd9CA==
=y0Nc
-----END PGP SIGNATURE-----

--491fac0dacb0df51633230a215ca837ce7256ffa833a7a70182b3d999b4d--

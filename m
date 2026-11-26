Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701764;
	b=kElua62/9Jv2CpekpnZguOIhrtQMq0vQuIZo7qunD9JSlN3UJcLFj4k83/n6j0ROuuQ9
	 0E0VbfwHWGBeXSiIO1NU1+GI7RwQqQP63aII7tPdvnKHPCZ5QHnQ52TbuhhZdL4bawXVT
	 5ffQgh1NeMv5r6ky7f2HiCrBwbqxXLOaTf42GVvEgN8vnT794RAWyUYi+558xhiYRCBpS
	 fE450FDliloDGDCjoP1xdCUBlO5ol3AMJVGUsPflAcrZEkQ/FNa3wRrM33Ll0CpSniZTS
	 0jKoRd6tuTKHSJGC/pdjxv0Fc1SLL84YL8JxC73YCzA5TPxtYc+idFcBoqvLKdwyRqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701764;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=Z9epXhgk8kv7aYQ6eP03FOVDBcgOKKV/qAqVe+wwWl4=;
	b=b3Xwnlbu7UaDyM0ES34L1GzIHdtr7l6v7H0316v3z7zxRunDZheSGcDqr6F1ZEKXOVhd
	 gokD5Jaom3Jfl4DVTU41TfUDU9K717YSgwa6GEZSQ4Lcqy1uipTc6OLH6pSpF04lzws+j
	 7lEgufBEr7Sq5uqx6sygOYp5TQTCZUPx/vXJOuX8eVPev3guXwrxqjq9O2cBcPvPyv6G0
	 uJdc2AoXBvD8+jXjaBrE0oZgSTCwaQ5aFQ3TT6/+gK/O6pig8s6MlL553TR11PB5gXCln
	 XztYZYrC2ySdXa//B+Cq/yklS5MpeijjZi8YkBiUeysqVbBhSpRGd+C+hL2igBC6MDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bPhNLogQ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A39A606A31C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 14:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A39A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bPhNLogQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 55C464E41798;
	Thu, 26 Nov 2026 14:02:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AEB2604ED;
	Thu, 26 Nov 2026 14:02:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14CCD11E6830D;
	Thu, 26 Nov 2026 15:02:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795701752; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z9epXhgk8kv7aYQ6eP03FOVDBcgOKKV/qAqVe+wwWl4=;
	b=bPhNLogQ9VWimdCUOLB8QGQOQKOA3q3LOuc60lOK0VxQoGWyHNk3em3u0r79Qv2TJe9Cfe
	20qCy8RMXQUbTvgUz7u/7GfAYOKn/ewG8lLFu1QNf0WJgIG5L+UoXthH0jZDMaXvtyNszH
	N5Bcx2KVDBzThX5FDojZlNOhuwVnM0sVHkNJbJZCwV74cJVQkY6V6c/maD7VQYU6JV9TrJ
	KF7VqiJWveeytEpTWXy3Div1ic2cBtXKpikJf9lQRxH107eQAczaA2QJr8uQnmof/znVZK
	O6ZxG4QnWxNVw7k5esZ5CwwQb0hvFl5swQjUAt2M+XC1/yMdKhU32mauWb+i2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Robert Jarzmik <robert.jarzmik@free.fr>,  Alexander Usyskin
 <alexander.usyskin@intel.com>,  Joern Engel <joern@lazybastard.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>,  "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>,  Shrikanth Hegde <sshegde@linux.ibm.com>,  Michal
 Simek <michal.simek@amd.com>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Brian Norris <computersforpeace@gmail.com>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>,  William Zhang
 <william.zhang@broadcom.com>,  Anand Gore <anand.gore@broadcom.com>,
  Kursad Oney <kursad.oney@broadcom.com>,  Florian Fainelli
 <florian.fainelli@broadcom.com>,  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Ray
 Jui <rjui@broadcom.com>,  Scott Branden <sbranden@broadcom.com>,  Han Xu
 <han.xu@nxp.com>,  Paul Cercueil <paul@crapouillou.net>,  Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Keguang Zhang <keguang.zhang@gmail.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,  Liang Yang
 <liang.yang@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Jerome Brunet
 <jbrunet@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Manivannan
 Sadhasivam <mani@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Stefan Agner <stefan@agner.ch>,  Lucas Stach <dev@lynxeye.de>,  Thierry
 Reding <thierry.reding@kernel.org>,  Jonathan Hunter
 <jonathanh@nvidia.com>,  Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun
 Hung <schung@nuvoton.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Linus Walleij <linusw@kernel.org>,  Kyungmin Park
 <kyungmin.park@samsung.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linuxppc-dev@lists.ozlabs.org,
  imx@lists.linux.dev,  linux-mips@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mediatek@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-rockchip@lists.infradead.org,
  linux-stm32@st-md-mailman.stormreply.com,  linux-sunxi@lists.linux.dev,
  linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
In-Reply-To: <awg4ubbFu0FksThB@monoceros> ("Uwe =?utf-8?Q?Kleine-K=C3=B6ni?=
 =?utf-8?Q?g=22's?= message of
	"Thu, 26 Nov 2026 14:50:01 +0100")
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
	<awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com>
	<awg4ubbFu0FksThB@monoceros>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 15:02:08 +0100
Message-ID: <87a4mvwv1b.fsf@bootlin.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Uwe!

>> > Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>> >
>> > with or without addressing the nitpick I had for one of the patches.
>>=20
>> Let me know what you intend to do.
>
> Your mail was sent To: me, but that was directed to Pawel, right? (FTR:
> I intend to do nothing here ;-)

Yes :-) My question was indeed for Pawel! (except if you have plans for
the sentinel removal ;-) )

Cheers,
Miqu=C3=A8l

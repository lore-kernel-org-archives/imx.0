Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084453;
	b=MB7rDDxlrKPKRCNlHfQKRHttpKvb6Ss04jS/PhE5RwV2nCdsDi7lsZS+9fH89VFGDmv5
	 VRK+sJhhOAEPdKMjKAE5qcQTx+greOeq/I+MjnSEZSyh6B/Zu7mNKqAZFm36Gj/2qfwAW
	 hYTgbQSZWOJ8IaR08rWDY4AdaOEpnYuUd6ZY4qKNKTPu8tf4dP+OT6SUwM/2tJ57yeY0q
	 Q0v4RFbLq12eGE+mgx8OfBOX78QfsFpn24n06HYBzTeCw5Q+fY9ybvww3IvBNE5FoEMMJ
	 RlE5YvFYFFjjfeD4Zbdpgl6CLRmNVGr4YCPThVsbPQoFRY8nBmgDyejWwyELmfdVSAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084453;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0KebwVLYB2D2L6loP8NHGLZcG3tV/DtfHEbIAoU8RMc=;
	b=Ru7ATrZFSWHHfCPswvcSYB1V57JxtSyaB488jNiqJUIssSryM98gxPTTmsPFGIk6/q6y
	 JoGZuli2rZ/9RMq813I6dEkMmgZIt3cYysO110a232Awd5XTgK0qP5oJ4tpJljq4IcgLU
	 kQTe0SFkDM2sBC1HhZuc+3NUeI4lbQfuVDC7fQ9ZWVMvqkPvMchgLCzbigdO3wiLtjJcj
	 2ZOIUMkVHkJCXsCsk5D2d2FP9z+ilI7tXy3fmeXAzpcdiaxewENoWXRIFsRyODUV3BKl0
	 6KSz5gilxA0BEcJpchQXcOakoulX6jlKpisBnw1H9/cbmUoMgvV6/DMTCXxC3pA1KnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYJoNCay;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE7606A326;
	Sat,  7 Nov 2026 20:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYJoNCay
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F67A1F0089F;
	Sat,  7 Nov 2026 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084452;
	bh=0KebwVLYB2D2L6loP8NHGLZcG3tV/DtfHEbIAoU8RMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mYJoNCay27RFXMdep+ySASAN5VNIZ5d5/8bbraSiMJjesxQ+flhHAeeLo/POilJH2
	 lIbg7gWtxKy6s4+kCBlSLvhOUVrHRg1Jq3BbQxeoK/1/2XADVNLSemos8qr1zxC7fr
	 vGLU02y7h4gtXmMAnYBUOyIhoauo8XFi0M+ZYWH8Ng8lslGRXWOPjZM9/FyMbEMGCP
	 TyUU1Ufy5fdqvIC2fOo28Ay1ouCYq+tdYUfbrQiaIGWnlvNwggEhVMfg9w+8ujfqn1
	 48P7XWdSOEoigw7Ixq74Oq7cFltc9I6ySeDd27idLc3E0480Tb16dYYi6WDbq6IDvu
	 rlQdAb4eXbmAg==
Message-ID: <sashiko-outbox-203326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 39/58] mtd: rawnand: qcom: retain open-handle state on
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-39-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-39-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:47:28 +0000
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
- [Medium] mtd: rawnand: qcom: broken error handling in
  qcom_probe_nand_devices()
--

commit 0a9084cf5fec792ff4833fe6c2d5c8f9780c60a1
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: qcom: retain open-handle state on removal

This commit ties the lifetime of qcom_nand_host and qcom_nand_controller to
the MTD and NAND controller release callbacks, validates boot partitions
before registering MTD devices, and adds cleanup of registered chips on
probe failure and removal.

> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index 2d98f79b492d6..f812de1d776fc 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c

[ ... ]

> @@ -2077,15 +2091,13 @@ static int qcom_probe_nand_devices(struct qcom_na=
nd_controller *nandc)
>  	int ret =3D -ENODEV;
> =20
>  	for_each_available_child_of_node_scoped(dn, child) {
> -		host =3D devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +		host =3D kzalloc_obj(*host);
>  		if (!host)
>  			return -ENOMEM;
> =20
>  		ret =3D qcom_nand_host_init_and_register(nandc, host, child);
> -		if (ret) {
> -			devm_kfree(dev, host);
> +		if (ret)
>  			continue;
> -		}
> =20
>  		list_add_tail(&host->node, &nandc->host_list);
>  	}

[Severity: Medium]
Should qcom_probe_nand_devices() return ret instead of continuing when
qcom_nand_host_init_and_register() fails?

Continuing the loop means that if an earlier child node fails (for example
with -EPROBE_DEFER or invalid boot partitions) and a later child succeeds,
ret is overwritten with 0 and the partial probe is not unwound via
err_setup.

Worse, if the earlier child fails in qcom_nand_attach_chip() when
qcom_alloc_bam_transaction() returns NULL after qcom_free_bam_transaction()
freed nandc->bam_txn:

drivers/mtd/nand/raw/qcom_nandc.c:qcom_nand_attach_chip() {
    ...
	if (nandc->props->supports_bam)
		qcom_free_bam_transaction(nandc);

	nandc->max_cwperpage =3D max_t(unsigned int, nandc->max_cwperpage,
				     cwperpage);

	/* Now allocate the BAM transaction based on updated max_cwperpage */
	if (nandc->props->supports_bam) {
		nandc->bam_txn =3D qcom_alloc_bam_transaction(nandc);
		if (!nandc->bam_txn) {
			dev_err(nandc->dev,
				"failed to allocate bam transaction\n");
			return -ENOMEM;
		}
	}
    ...
}

continuing to the next child node calls nand_scan(), which runs
qcom_clear_bam_transaction() and dereferences nandc->bam_txn while it is
NULL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D39

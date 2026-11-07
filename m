Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084280;
	b=h8MSg23Sz/N+A8t/TZNMotxFubIqlYD5fFrazXN9mZR6u8AKrexbcFxbAm7g46I65ByT
	 SUIz/BAxhZNv4goXs2mCv1tyAm5tILGuwPEEKs56hkYKe6zEw+G1GMEHMno0xrOI/senl
	 rs42XOdOxktH6zcu3CD12HA2Ze/qRUIluKfa1Jmpp0k0WlcFWII6Fm6C8+RSiPuqyt8HP
	 RMTCx4icHB41+fGJnNEfoZetbSftxKnbCf38kvD95xuZa7shKbv+WvXyoacIoYPNJAVXx
	 0imnAgnNtZuKBg1ePNnHnxknCG1rpJ2TH6zRYcCPqYkIEd1VqKmEeP0iYkK6ojYdVvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084280;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IPm3mqNZ6e+qAhw2GbfDLGuo9LmeBSigrixHpfLPFj0=;
	b=ykA196tbcbZUHOTg6JvJfhIaZAP4juGJVib/Tix4tGTVa2tRwv1b3i9N8W/4ndgVP+5b
	 /6EGbn5uxggN1rK/i52aYfGcyHb8GKQ5Sk1/52cMd82y5cGasXOqwBa2ffzhCEaD2cJgC
	 tKPYlJEE1MeSYddDJXx5OD03Iweuorb/DXO2ovgQOXlFQ+M7/eUGJ3W2k9qbxnC2h2Ggt
	 Trjo8pUQpN/a6dag9f3yAsh2GlhGmf+Y4r08Z7oqD5ulYPegGzO5Xv4bgoaXgwJefdpOj
	 QrxUiuZ/9fFdaaceDjLDBe4MZMgL5T7LHyTFhcd+NkI6LSoCkL4CI71FzcGD5voKx2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNWucWpk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF6606A32E;
	Sat,  7 Nov 2026 20:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNWucWpk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03E61F0089F;
	Sat,  7 Nov 2026 20:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084279;
	bh=IPm3mqNZ6e+qAhw2GbfDLGuo9LmeBSigrixHpfLPFj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VNWucWpkETSDTR5IVj0MisZFv0GDxKS9e9reNOmDtEGwhfwbNubu8DAnlJ6VTCNPK
	 45oWTq3zRGDOr7iDTAKHk8GV1JXGXIb5rYS357JDhbWO9NBu+ar+0DDr/G9cEK0CSy
	 sRu3bK93XQwk27CasNRLFSumWgE3MLcciQKMuRKbCozlhKxsy7k0PFuIvNij31raz3
	 /8rTddyg7K4bWXBcfWQUjvcTzPdSUJAMjP76GPbDY0hlfxY1G5vt67uG8yFzWsqvB1
	 3DpO5ufNY3vtWo198fVq/m7zy/iZmF8O/3Lv1pog/FCl6ht3+sO/orznDSweP9QKRf
	 pKy71kcoVpFSg==
Message-ID: <sashiko-outbox-203322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 42/58] mtd: rawnand: au1550nd: retain chip state across
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-42-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-42-0181ef0cc4c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 20:44:36 +0000
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
- [High] mtd: rawnand: au1550nd: inverted request_mem_region check in
  au1550nd_probe() [1]
--

commit be3bdca7aa37bf9e70e43be29b0b99a9af4bfa13
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: au1550nd: retain chip state across removal

This commit switches the au1550nd driver to reference-counted NAND
controller and chip lifetime management, disconnecting the chip before
unmapping MMIO and checking mtd_device_register() errors.

> diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au155=
0nd.c
> index f1e99197ab845..bd78bcc842822 100644
> --- a/drivers/mtd/nand/raw/au1550nd.c
> +++ b/drivers/mtd/nand/raw/au1550nd.c

[ ... ]

> @@ -333,7 +350,6 @@ static int au1550nd_probe(struct platform_device *pde=
v)
>  out2:
>  	release_mem_region(r->start, resource_size(r));
>  out1:
> -	kfree(ctx);
>  	return ret;
>  }

[Severity: High]
This problem wasn't introduced by this patch, but isn't the
request_mem_region() check in au1550nd_probe() inverted [1]?

drivers/mtd/nand/raw/au1550nd.c:au1550nd_probe() {
    ...
	if (request_mem_region(r->start, resource_size(r), "au1550-nand")) {
		dev_err(&pdev->dev, "cannot claim NAND memory area\n");
		ret =3D -ENOMEM;
		goto out1;
	}
    ...
}

request_mem_region() returns a non-NULL pointer on success, so a
successful reservation jumps to out1, fails probe with -ENOMEM, and leaks
the claimed memory region. Conversely, a failed reservation proceeds to
ioremap() unowned memory.

[1] https://sashiko.dev/#/bug/linux-4e401697-4998-4e40-a7e4-60cc21983fb4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-submit-raw=
nand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com?part=3D42

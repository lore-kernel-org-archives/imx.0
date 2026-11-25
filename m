Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624128;
	b=V7GlNsciSPrGUiGaDcR+EE5JqX/ooZTpsCWItUHIfluoPkbNg12MlHzBN30qeiwgQgb7
	 bi5wprwTLWNKRg549gPgqaBFavMtYywXUNyb0SHaXijd5ndcg3VXK2ZY52+YlIgoDFfyu
	 89FmZ1KBSGS287N+CNJ2K6c2kzrII+icDiGoucSstfD/ZMu8B/KliDKqVCLL5u3ogIWmO
	 oa1tkyMZOhWxivVaiRSEDiXTOJNQUGAxu4Wzjg5Pi7bB/E7VIfEDZZDv7gcB6yBmVSsdZ
	 etv3cQqy/s0fyNaycD7rdn4mQe57ZnytA7AvcwU0t3RmI58NHQZ9ucWWehBFv8OJtIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
	b=4AbfO2qSzmuEtcxERMCOhbWa3N3596t4MkH6sS+rFpxSbgqfSopJn5sL+I3r+DdkpTGn
	 ltng+IGKiVNEOMSekbyPvLs4SBC6A1fxUm+hq8QUa/aoEbpN0n1Nf3WkrupSYO5YVc+97
	 ed9FTZoz0OCoIA+BVciZ9wApd8lFRiHVTEydUaexYQFx0dt20LA0gJEIIoUTNtWg4K+tr
	 a+BGGhV/Uf373Zo7SqWmYFDONYP8IXnPoqlkjK+Dk6JvCmnfy82TL1SE1Lp5WPd1hiah8
	 6K0Rrt10z6VDPj/E5VuvvsJXShu7JfFFSRJzcX+0JtX/9FcL72HSRdiXjs8LLdsFN2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lJcJnT2u;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F351D606A330
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F351D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lJcJnT2u
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso56644685e9.3
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624126; x=1796228926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
        b=lJcJnT2u9i1mvvutDEe9B7oGf2bW2J2h7T1wz42PyvwxMAH9y8HarrfWHR3AKsj0O+
         ZB3F7xVIxl7noB7dTu850dYsZDvgzU+NAXLYkKpanmQr9nwCVhrsU9ul+31UtXqQfgH1
         oYUUFMHxFsA+3nBAV9sSli9umXiCo4bTBqj689y+8VOZrMdXQmZZXYKs8/8H9JwFlOWz
         HD2VkH6fcG16Mgc2v5K9YUry7N4fwjB6r6ZUaWN8mQ88DOLP+ampcdooQelGcPT33C50
         SrVFjafH/EEtPuKePb9EN8jnvIyb+YzN4F4K9CTU9Rmw1/H/W+ULcZvUPd1n/DXMXLS4
         hzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624126; x=1796228926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
        b=NfDZgH441zWI3edCLuntjj9/H/9xdA/mt+Y0ioM0SSxhKbQBoG/Itta/o8Q4nsiLHT
         GMELN/bkOcb2rErcdTjWEKu3Wf296qPZRXC3rmy4sks9YvM81CkGc3COgYYs/h/XQW1y
         LsA/jBb3AAlFG6dL4Fw6k10CfIHrAqTM/f++IIgfyCg65ykjE//Vic/gY4Lsyxm++cAX
         NmmaHnwZKlYhVKtweom1dnyMwoj+A7BO7S0jThb0sjzAmL8Xf0ElHEo0bNHm46vbz5vM
         h8xiUen8Uswye8wAW4wzHMfL3wKEfIT2pto4P6Ei/DmVUtK+o5P+x4YnmQxARO8wv3H6
         Rf3w==
X-Forwarded-Encrypted: i=1; AL+hErGilRIh9g2TVOQAFTSRcLEjxclT+viJp5bcDRUHO7dGGzZKFiK/UIKiUdeFMgFDrJZqStc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8zDwWjXGmkaB/YxXn90XLpWRh21xxhpEZE+GtEnij2bPUD1I+B
	C5J/kbsyY3xh6WEwYV4+bfYi6963Mq3iFV8Ff3PaBf522aQwkv38a1Eiz1iDaiSnaCI=
X-Gm-Gg: AZFdTZeOT74UaYZmEzRuKY5Wr/82Hq8ByDSJMwKWfLl+95V0tg7pJQyM7JCyNo3owP4
	i328NUeZg2fVUJPpK91gOTlbRCFBVM0LhI+rEmU/WV5m5rXReyNQiKFwOpbSUt+8cGUrw16uIw4
	tT4+qsAlbDUnv7HvbfFgtS3fcY1rlcXZpX3e5yiF5icnTuH89iEl+sbtI0giQZBY+tmGkYHQn8+
	DBbPueuwlKD4mYHqH6Bje4My7yTbOPVAebAA04/ywGo7aiN8l0qzqnh5HA4hIjzJfhf8E/3zpRr
	S1FbIuWsr1EcgNjB4R5nN0+xJMJgrKrJWPNsCsE7xqmoi1EhUK8HkLq5pwu6Pf6eI3rU/XY7+ms
	YdbGr57bIUWX8JB6UT98c7CDDWurgmz/7w68MwvKvjg/UWWnC+WGQRW/bbsGfSzQhYlq/Ah7Iq4
	4rgZPkMxdmi4IlUSqHaaiqa+KMjvl824JDs56OVHa4c9fFJ80H3JZBJBDyQHpBYGIU9kUxh0x2D
	JuW28Xhi0Lovk/ew4/NqvseT8Chn31cJrPu33NHcX68hNf/IsoqtA449fmUBp1wgdQ1fCFus5B5
	wVCg53sNyYqulfQ+SK/xocd5XiUmstrYRVupM2J0o6cp8g==
X-Received: by 2002:a05:600c:34c9:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4bb88810d28mr405948895e9.18.1795624126434;
        Wed, 25 Nov 2026 08:28:46 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:46 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:30 +0000
Subject: [PATCH 04/10] mtd: spi-nor: Unify of_device_id list terminator
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-4-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=1549;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=pw1yVugjZoJ1sYzSavbjoh9EtNi40KpLFcyq3KxCgNo=;
 b=kcHPBXNDukNV21LLTOphkMkZzHhEUE3GVm5MT4GkuuM2LkB9EPUAINUu71xJWBBbyUPxGyGvR
 NyJA9ZKxwfTBYz6TriU3QIhP5Egb+QnpqA24EfhtbypOZI53FKPwK0u
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c  | 2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 4f6631950a5b..01048ca46a60 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -474,7 +474,7 @@ static void hisi_spi_nor_remove(struct platform_device *pdev)
 
 static const struct of_device_id hisi_spi_nor_dt_ids[] = {
 	{ .compatible = "hisilicon,fmc-spi-nor"},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, hisi_spi_nor_dt_ids);
 
diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 30fe2d414f07..71ee50eb1a71 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -440,7 +440,7 @@ static void nxp_spifi_remove(struct platform_device *pdev)
 
 static const struct of_device_id nxp_spifi_match[] = {
 	{.compatible = "nxp,lpc1773-spifi"},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, nxp_spifi_match);
 

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624126;
	b=Jh5S+u9MNfKgsvbUhYJv7LJ17/2aFLChfjm6trphfwgWFMZAAijwLJGYsIdfR/Dpz/QN
	 X600+1UyJglc/NVZrtjUT++wPcOh6eNuybibbHLDTUbPvOGi9EJ1hnKM56JvFkxBNAYZ9
	 fZisn3di9uLwDmyEVxnlY0XlVg3d5hHKfYssekS8Xc8tbCohryHWum5MhGaDHELMwn5Mb
	 er2aYYi+KO/4zJZZx86wZey0WKKu11WAbYJmAt7oUrawD6TaQ+RRrsKwvPVw/s4fPr2Zc
	 a8sCZ23OZ7KGL/YrbAHDPvG39d9f5B1GKE+a9EkLSL2FsDKYJ4g2Sb0CvVateDUT5oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
	b=d4aHBcdsth66NncEMOYnTZ/N6n8Nm0ySrhDjuYU2dVJBiOT7vw7Ap83MRCVEWFRHMVxJ
	 /DoxyKcl9C5lHtNeHYkcEzmhBf9pJwAeqxl0+XrNkS3VGF2NgmmWkVQ9GcyZPPuPbhuYQ
	 WzWKO77wLsRnLa6mom4uzIfSRJOKP/xlWahkOzG/6ddvwQtrT0jYJg2lEJMWs+NXimtBD
	 TacmZFlaV2GY1jBmCHPXNFWKXZZ0KPrtNJzyqhBLJCzCalbumjCcyRoda64w00NMMS83R
	 PfTdf+vYtvZ3QyxVUmoAFen2lZ1WtXX9u/lSq01+6n8kuwq6+zWeCwJPHdPLh/wAx6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lt2SRHGT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B215606A334
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B215606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lt2SRHGT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so61729815e9.3
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624124; x=1796228924; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=Lt2SRHGTJFXIq5tsQWOVxKi/dt57DYLhzEPIAcqVwCCxb8PbGa7+SLFBFQ7gpAYTyO
         9So8ijrf/wiqdicvfIykrUt1jqBUtl7U8rZgRD1HCkL/QIA42ybJC7OR/5k+iFy+6ZdP
         LkQrZz6gqF3lkK5xxB0p+CzYqpm4FMdz+YqH394nXbl/fUoWSb65lhUP5j0HdoOYI6SL
         gM3l99F7hKOFJSS0ZHdNCl3ZBgOJ1bJPDtw9LXXRiaGfdiYGppbQXNNOCFtyTERL6TYZ
         E8SBTnCmuZZwmcvd+by6koJgxm5I5oDcfM0egJOhqUb38DXk7V4mju4Vf2qiITweuUPj
         VfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624124; x=1796228924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=kxXJvo/cgo/doxiKwHw9mV34kf+gYeFfsJ5eU/nk8C1SBxynGQ6J83lp4GWG7R32Jf
         i+0isb5o8C0WrlHATfrm1IU4UImgK7fV7GpLYv8jnKLbZUvJOdFpt6UeGAjAsFzufjh6
         v3saoWI7z/YiFi6BfGw3WPizpGR/pVappq7lQiLmftbopXtGQMEaazlmOtyhor2nnO8x
         QkqegFDF6Gy5fZ4UPmgW5LOmOtV1y0aqtwIEjwFu8evasCMHjJapUiXswrJ+bHQnHSc0
         wiVGd/Fz0xJgWpQx3dayle/U550w5S2U+FHfokc4zinAkrZf0zCK4crKEFJQmwN+GMwh
         L2PQ==
X-Forwarded-Encrypted: i=1; AL+hErGnKICqufzuNapCI9jhWN4ty160Cq6BpzkS/Zo6nXvas6VCr9qs0c3FG88W5iYQbgXcTEI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/LdKtNMfXd71SGAqye2qkjs+ahVXpBaO5ORo0CxvSGNfmU2wTv
	aFqguS3MQGZRDDiNW9OWZ8hs+NR9V9GbDtcWxzTkcMSxx1+eGtPkZB5q1ziyX96kzXo=
X-Gm-Gg: AZFdTZd5E4OxkxWoLDTw3CypORGpR8wepL7t5uE+16Ia0T3PovHluczLyNo7g4Vxsvl
	1jKOVjgn9YfhpSXkhrYEOCVsBrV6YVuKcR7L6LqA9UZERrpgf/mS2laDTf5htH1zBWwkvdhkc7c
	hCCxStGQeUN0KpU2rBQMGZ+yHE6Gfg/dyatBfxwtdfr+pecs6YsBfara7437kdHP+WTQ2w56uDy
	51tuk5f8j5BjNDM22Iir0+It5tRKg2dp29rPMd1U50FnLELz9K9ZrYBolFgMLD4KjoFG6CUnP2Z
	c55SFkmvmPBhhD0lVE6sftk3d7Q4UmUAhIV/xIPl74Txp7yREy5gIJ3GIqbpw0o6yVBkYljavW7
	F5vQ/PXYCl6pRQFuCmVofd6pa8mah2GKYr9XJvCHSXQJxGfCfEoWUF/1DwAaSuIRJOI49BAgkVL
	4+4p76dJk4JiO1mCRP7QOUXejOENZ4nySuw9pvhvAVA/qe7K3O1Xr7wlt1Cywz+phWTBaxiLhHw
	PDTfBIXU7qPj9ImRSKW4uyxPgY2EwvxTipRkdU7UmjmSqz6DG/ss64nN1eTr42hHIVpyWuI7Bz9
	l7aHbUZIbmY+r/dHF5qK6UlAon4Z9IUAzpfB0SXhy4XobA==
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr361648545e9.16.1795624123960;
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:29 +0000
Subject: [PATCH 03/10] mtd: maps: int0800: Use named initializers for
 acpi_device_id
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
Message-Id: <20261125-acpi-mtd-v1-3-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=833;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=blggJzzi34PPFng5frzDjV1f6bR0P7BZrevZFLsW314=;
 b=ZHZnM3Lf8DzUboiERoH/ypcNIiAQvRVlt4l5CMlhz7vJ+CymRE50z5L8UPm9qLmBzcXPpEYvV
 3V+SKJgc8HhAzjwEkWT9COXnLzIMM7NmIiKpGWF+rOcWTSAb6lbGtOg
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/int0800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
index 1f5a7c4936dd..feb721908989 100644
--- a/drivers/mtd/maps/int0800.c
+++ b/drivers/mtd/maps/int0800.c
@@ -88,7 +88,7 @@ static void int0800_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int0800_ids[] = {
-	{ "INT0800", 0 },
+	{ .id = "INT0800" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, int0800_ids);

-- 
2.53.0


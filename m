Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624137;
	b=WSf6CGgdIx7G2Y71vX5CYymF3BLKBQ0lkcLGCsnu9ms0rBylnIFt60ruR/shTbedkhGU
	 xeLklp39uSK5pEgfLm7W365xwJVXfJudZvUep4raY41M/JEdeG7LelPXJyNJNpJXEFudV
	 f80i2BLhgDs0d9Vd+yIpH6O/etyDhRpJN87tV5XfYc0SHZ1uxKU+Qho1CA5uNcTSs7g3R
	 iV6EIgYQA9Mp+l+L/rivaI4NPqPWuZzS9ed/salvx2tMker4yeGPYF4XwyQHkmAYPgUFJ
	 VgP/SZhRaqXHtmueWMmjq7/Qn/DFbwBvsm5JZ9fZ7jO+mxbg5/7y9Qd0jV/dROPuHUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
	b=NvEaQ+b7uKxX6GD3iPlyatY1pGfpoVkM86TtLQud7zCkZRvYub7R8y8QOsGwi5c1RRDc
	 JFdkwDp12gYqzhgGYgaOIEODBnbSmfbb+cAtRyFI1WXq4NDDr00ZzVVFPWJnce++41nkT
	 oSyEh6EmRVc3wvXEQKbfEe/4vsLazTp0o8ta9lgzim0cVbEGBJn/1jNM7SNRXt9aUMPdG
	 D3YRPDFfqSoIsc51wS+6yzQt+q1wHaVbVLKcLCe5jtxDS428R5L6sAeEPCV2zm35qENhl
	 XHwocH02np4Rz6UeRtSa+nTpB0OZkrTkABAR4Epz5+ExHpvsOoA7mlG6MVP2Z/5Q5Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=X+4MSztY;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E16606A337
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E16606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=X+4MSztY
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so77387525e9.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624136; x=1796228936; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
        b=X+4MSztY0QYfTYrnOLdW/KdCvpCc81GQWgmJIp5EerhOStVTShIlaXMJ9OU2iLtU6e
         8ahWqNgvX5KWeuxLn4ICMvYqOLOlmFYAF6XX5W3rBCH0gTQrJkGI4/kZ5aHJ/GZRQr+W
         V1ykfarRfaaknlrGmBx2J3UgBt2bx4/WB+3BQ8LTUQwp9tB0uiNv0kGKkoxobKMylfK3
         2Zx+F+DnO+tQ2U5QXC5KrZpxPI9u1SfStxBDnZiVpaYQub6vQIvqpmAmWATV/0I8YOxy
         QgJu65pYuqNk+lnUIaUXYC2eKyiffTh9F1bJa/nmYfJfcYyNMwyUcC5a9ApRObPzCLqX
         aM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624136; x=1796228936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
        b=uXo4pphkHmZ3HjeZq7im2C+7C2jIm8jbV9ivqhW2PGFdBCdNb+CBMS0k8cnGf/kKBj
         M+qXG2FbJVC6Y6TvlLTqQDDbkZhSHYxZTCteL2C+1rfsyyOOrDbGnKg8k/wnm43UpTX1
         ZqtYRfRwVHszZLprGHsSUJVAFJJZco5JNObTfZ6AbSRhr1EfWriiUNdbEueJiNrEqc6Q
         5vmJv5rA8t7x6zrkgO5aR0+vnFI2k0q9htBiShPsNltPoBXGgw6NdUDRUV/A5Pvi8yM0
         BqUtxD4Ulda9NyacjF6FMM6I6YDftScZtANjE8wtc7uSzo+ppwbzwwuvRW/zM367E2cd
         iglw==
X-Forwarded-Encrypted: i=1; AL+hErFT/VCFRlEJPVbzuJkgSnujAG20Uk4+66e9JjyROgF73OAssTfQ0KnCwMMGz5ryvlkVILQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8OJRBiSXoyyVILzipBJ0zSw5r3UDCoqOs16ZGFMYF4XGfv3FQL
	UOiK91BvSfb5/4B6HOiT47dRr7guBZrFgrEWk3ImgvGgb84K5wtsAvNs+AsxPKPwHKI=
X-Gm-Gg: AZFdTZfcH3/tz8vuO4fKJ95LNIryWCe0lhHF399qar2okYTL5mL4T7MBRE/oScyQyAM
	E1llFGBeji5TsdnLzq+bYZDIO4b2y65sgAyJa5EhcAhKG7OVwvML16Jfeb2M6q5XtWAMxxevXMA
	lqHFRjfypEnOT9FsMQhlKwOkOh9boj9+KlqGJKJNL0DZiM2Jtuc90Yer4hDL0VkW7jPSGrz8Igi
	uNijRbHq8F1I07xy+9CwKAGvMtstpjQIEeaIEQQ88v5iFpjtpKPpD9hzYIDn4SsaCl4X/QsHYYN
	BFmIgFTGrgz3+PTXGSQ6Qk8Mx/7iQswdqbPiLpxNog2K6T0inSEn5yL1zr+IbWMiWPmp16I+MUa
	CYaLXEc1jJLkfOYK79/zHItjgbWe8vHrgnVtMTh8SKhb/2a/sLwwW3vXTgBb2oYS8WA+LkbYVgX
	1CqD3wna1dJOgSuAom7Kqw1V4U9ddBzfjV8WoHy28aE2P5J5BTT8lsBk2bICWD3BJDGh2WJopsl
	r899BsL25glH0kAJsK5wHSVROcj1ptiHByBEAupZ5Q5xZCyDl6IjZiZeH20mkdHVqfAw4/nLjS4
	Blgw+Oh2UO57KA7sUWuY+IJXLgwrHcAstocr+xz3c5xCfytzAGnkGlJFeIw86hS/EKI=
X-Received: by 2002:a05:600c:468b:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb888160c2mr388121675e9.15.1795624135909;
        Wed, 25 Nov 2026 08:28:55 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:55 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:34 +0000
Subject: [PATCH 08/10] mtd: maps: Unify list terminator for of_device_id
 lists
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
Message-Id: <20261125-acpi-mtd-v1-8-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=2018;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=qZ3dtpaE4yo6DqKw2ZZxvSONBhZmYTuwo6Yz4wDKiAA=;
 b=uXOj27KlhNAZizznn9ogyLPuEGUV9GthH9XWkHXihalhOuNlIXntNNK6vnlTDONhse9U1m2BX
 wgOwv22X4fNCfrJ4kS4rB81GgUoV5JAjSZu8Y1OsSvN/EQwWtziAtg6
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/lantiq-flash.c      | 2 +-
 drivers/mtd/maps/physmap-versatile.c | 4 ++--
 drivers/mtd/maps/sun_uflash.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 519126abb9a5..1ee15d50bd7f 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -177,7 +177,7 @@ static void ltq_mtd_remove(struct platform_device *pdev)
 
 static const struct of_device_id ltq_mtd_match[] = {
 	{ .compatible = "lantiq,nor" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ltq_mtd_match);
 
diff --git a/drivers/mtd/maps/physmap-versatile.c b/drivers/mtd/maps/physmap-versatile.c
index 2e779111bf79..9d308c4f21e5 100644
--- a/drivers/mtd/maps/physmap-versatile.c
+++ b/drivers/mtd/maps/physmap-versatile.c
@@ -58,7 +58,7 @@ static const struct of_device_id syscon_match[] = {
 		.compatible = "arm,realview-pbx-syscon",
 		.data = (void *)REALVIEW_FLASHPROT,
 	},
-	{},
+	{ }
 };
 
 /*
@@ -77,7 +77,7 @@ static const struct of_device_id syscon_match[] = {
 
 static const struct of_device_id ebi_match[] = {
 	{ .compatible = "arm,external-bus-interface"},
-	{ },
+	{ }
 };
 
 static int ap_flash_init(struct platform_device *pdev)
diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index cac780cd23f9..2960cebdb0dd 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -138,7 +138,7 @@ static const struct of_device_id uflash_match[] = {
 	{
 		.name = UFLASH_OBPNAME,
 	},
-	{},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, uflash_match);

-- 
2.53.0


Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C588202C3D;
	Mon, 27 Jan 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982014; cv=none; b=ZB1hHMSnFnl6RT4Kwa0qNgVlNxwc6jw2QdF7cDZSBWwNfMg897j5T4rHuQolAN6emMkZUZJd/AHAN8ghF31zrJeOwi1C1kIkDHn7XlvJGdPobSGJo5hl7IeS5y90qvKwbz1Di2wl5KvZoNqL+H1tCkJh2d/v4uWJ7UKyDnqXBSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982014; c=relaxed/simple;
	bh=edhtWkME7JcFuoloymgagg+bCTbdLj8qaR8IOWv4eug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDM/a8ypPWW/0ur3MuhLZr+w5f3WIBnbcMcXZD7xpQziZKjHzMR/0dwfWE9sY96XA/BKRMFTDY4A6AOvHPrm/16I49HzJIsBgDDOcDebEBfPIlUJHYwFKfqCNHYI3Ck7bIHLr08+fjTrzDv5tlEOzGmTFb/WbHm2IEP3qQ+rPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDBdxKyt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDBdxKyt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so50733805e9.0;
        Mon, 27 Jan 2025 04:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982011; x=1738586811; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoAOp3woacgQpHd2g/asCHp5UTA4pERK/Ity2Wb8N/Q=;
        b=YDBdxKythOtV/plVb4/qjwHjsfpN+8e58B1B4WutGSs/QE3BH9GDrTQBNL9Et/25s+
         8+EVpvE+AAS86BNrz85VdCANjHSI8j/KwTah+xkRYeYK/N5V4y4BUygMqPyeIMrWr4O5
         F3Y2jDYN6ZfpqgI5x34BUYcPv9QHkY8faQ2Ec0yDp55VrOI1T0NaN3k6te/Oa48VKceX
         1LBDj2OqglkiMCTGY491G0TUmadmkuqAitkgYcYuZmaWIcQpkvn99s7bml+qRsJGR8QR
         bOHgDTIcG/Fgoh6Z2iDAI3+zSxJM0RLUIZRpxEH7e1IeRblwrsMLIv99TvmqX0psOfL6
         ykJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982011; x=1738586811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoAOp3woacgQpHd2g/asCHp5UTA4pERK/Ity2Wb8N/Q=;
        b=n7UjmbEg0JnLjfebofBcjX4o2H4D5nlPygcTAsSBWBtQG4tfygE6+/1Mds7BYMbXEi
         zcFdFwWDsUZ3M9krgzXMnjUXPeHbMdK/I+MQsZ8MKOel1JbOPV0U9KGQ3YdkqE0GC1dq
         cbHt/JYyIui5jZq+xMWbynu9I85vAB6mtGnK28SoriNJsGEG7XUnFMoOmDD0HenyjDLR
         J3Ty9Mk9VDMw03pBPmmEccbJXAp3cLVjz8m/SPMBi6GVqt+IwQSzeQQj2LJymbs/g5bF
         JLKmvyEyhC4J8NDkI5rnWDWZMmstBzoa+nGB6g7Y+GIC4LBudKUE5E+31HBq/JT+ZrBv
         T4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCU+wr8gYjLVOqYitwoUuaebb2D1fr2WB8wwFgoUiLon9CO0OwkRdHu8e24zd01XjFXEBG0=@lists.linux.dev, AJvYcCWugEHWjzZhTdYCVWo4YB3B2ek4m3LU481CecBK3Of8HxaAxcNm2X9ye+cxJ7sfaCbyhVFfmRoW30kAfcc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywns6Ppe+o0X2vUxeXBoZ8/gPWCIQSWwgpZRjaFV/7NjRyG73/8
	rVX6em7A7fJ4nbO4KJdLLZcMWVqSGoqI8+ZGIoxcMJGT3mNgprXv
X-Gm-Gg: ASbGnctZh4amyjj8heYL615YLhrKLE2x6+h1ljT5orFcuDXExEjkWNuwUQEsiQ7cxs4
	vs6J9lHh4/J9E1FbcE+Hh07FV0bjpcTH/iciLkbIqLpW5YOA0A13cHgMo4J+1R6bq3yOGTj2mMv
	BKFXYazKlI/dWxEX4gvWwJu090FTwTjmzH9jmXD0qqsLkuaxrOvlXpcwHwysEvICb86M5snorDY
	y8pP9FlxK9N7tbiP7j8fBqf468WMC2RCAm5FQ+voUZzFy//Bllb3MztT2o1CUwoDJnD4f3M9LvC
	YTgB
X-Google-Smtp-Source: AGHT+IHMBWcLxxWH/HrE9gnP2KJ4oU9wi9iDb4LPI99X2Tz841Sv8gPf5kRGSvwJqq3n4yWawHMSmQ==
X-Received: by 2002:adf:ea91:0:b0:38a:88b8:99af with SMTP id ffacd0b85a97d-38bf566b88amr27909330f8f.22.1737982010830;
        Mon, 27 Jan 2025 04:46:50 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1761ffsm10811380f8f.7.2025.01.27.04.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:50 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:09 +0100
Subject: [PATCH RFC 14/14] ahci: sata_rcar: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=edhtWkME7JcFuoloymgagg+bCTbdLj8qaR8IOWv4eug=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsTwch8wZKpCY6BlHXr882TR4ert8jNSnQ+
 OFz7uYVB+aJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tdgXD/0R8DjMyNkTEOSEqNC8cK+UW/cs7ATY/dY56SPbehRA04bCvDyn0vB/5FxpJAoPlPCPRLR
 j5sG07A1fk+by7VohKEpDY25Y/FkgUnLB/x9N8GY+Xgbu0iJX/ZMUYik4PAZ8Y1u3SCXHuKoaug
 5N3sePlGeyyfOO1cfFahLHJCdpj4MkutMilDNOWthqBVb0G80muTn5+P7c6GIjlO4zWCmx/f0Ll
 Z2NreP3O6wPWEk04L+uvBX5CrWewgBzct3cBa6qQpwQaVZTsxWNCfePC/kcNWReNMSlID0lU7ah
 tYRc2Yr4dNCk1VZknaoKbvwHdVcoHu+cDD5hR15kXnHTlVwRb4+qmFavc2BJn5u7PyMkpI8pnMi
 UbPuV464EgJtVIWfitIWfc6nl5a/CzAsCAjxy4mCzQJ7V2LN0Ho6hNIvmcxmcaZN+r3ie0wY8qb
 o70dYTWrD1ly4Qqp6NjVaeJCqggwo65mZL2fsxEhEOBNt6bxe1K1YPab1qxwdb//noO4O6nG+Dt
 mpO/PmO0Z+S+3rcVdasfL9C0Wih46GMwv04m4pcRXFlAXM8JszH1FKnW7tn5ZKE9IbpCzzQSzMC
 zVSU7LzYibqOPwYbKCawuINy32MTTOUEdxvD431BU3xR4tALDoe0DBSGBE4QodaaX3XUrvWMqBV
 362NzhZEwhVJ2Lg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/sata_rcar.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 22820a02d7408033d698a98373e1e8e7ef47f908..4c5f5938c12efc7c8594df4092915011e83f910d 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -927,7 +927,6 @@ static void sata_rcar_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sata_rcar_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -1005,7 +1004,6 @@ static const struct dev_pm_ops sata_rcar_pm_ops = {
 	.poweroff	= sata_rcar_suspend,
 	.restore	= sata_rcar_restore,
 };
-#endif
 
 static struct platform_driver sata_rcar_driver = {
 	.probe		= sata_rcar_probe,
@@ -1013,9 +1011,7 @@ static struct platform_driver sata_rcar_driver = {
 	.driver = {
 		.name		= DRV_NAME,
 		.of_match_table	= sata_rcar_match,
-#ifdef CONFIG_PM_SLEEP
-		.pm		= &sata_rcar_pm_ops,
-#endif
+		.pm		= pm_sleep_ptr(&sata_rcar_pm_ops),
 	},
 };
 

-- 
2.48.0


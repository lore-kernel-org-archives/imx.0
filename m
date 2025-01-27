Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4D41FF7B9;
	Mon, 27 Jan 2025 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982008; cv=none; b=R/CgDoTSBhgLpPPC1W9mMda+trvcIP882TmgrFPCNv/C+znPEtlyyTKvFo2dAPnoUubwDPxTAsxEgvu9QV/gIx66cBcPGYgSBm+RiJzIklCW3mZBSE0Ab9zV/f3htK18QGSQQl2FjyKbwHg90i/DNPzZXW7IE5QfgeP5q4ghYh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982008; c=relaxed/simple;
	bh=BVe5T/T+KyUbuPkxpZh30Ji3hdJ098Bkd+OSL6K5mXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khCSqKpqP0kV1j31lCNea1r12/iEUhWHTMzsdCpeYNAKxbwPNlD3RIm55i9CuiaRzQXIQ68ihtcTuoPjikjFqM6vlegy47J1O7GyvtjGEp3sK3QBH+pPRNXvX6wCYL/ME28Z0SmldjEFlt/5hXqx2Xke4Mpg4FHc9gr+jGeg5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaAch6L5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaAch6L5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43624b2d453so47725465e9.2;
        Mon, 27 Jan 2025 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982005; x=1738586805; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oUDNS0fcrx4OaYIBd5riS15Hnp2550FLQmcgRsJgyA=;
        b=AaAch6L58Ch19zhpebRU6JWlQBxddzvs6UKxbI6xdJ/jorXdjlq9qhqhVQyBTYJuBP
         iuiFFSDQFt7cdgIg96fVhQSsDct84YKJ4Nox31BeCfYlOveAQ4jbgylj0O98OWFYsDCh
         ci+nLqcSfLAz2L5Ft/rKWTyJhuYQ9Z+8PrE67Qbwxvf8N1q2h9A3vwyTx71UcPj1YiF1
         qCsIaYRyHIKkGjP0QiY2HGKqekz05weeY0yDg3TAtuD+STlHu43NIYmx5TNwdetqSAiv
         zMFaaUl8sO2eHsLEc31kNaHO5koO/m2wMd0YnYnvu7V5gd8i2iUEioAoPsnHBGzZ4s82
         dtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982005; x=1738586805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oUDNS0fcrx4OaYIBd5riS15Hnp2550FLQmcgRsJgyA=;
        b=ZVxZUE8buDJWxEntOsQae43+QOni1rrLsP38nCNkV38mtQ2A4R/UVsCKkEUiPgQU7q
         pcUMuJrRMGXDqN3eh6AMVyRD5zybO0LSbIin1nOKnZGLuuLr1SQc63gx7xxcQl6mP3u8
         o7ssyyuzw5yG7M/bU+VdDJVKxVqZ0u2AsDN4DeVKQ5A5kiHi5oP3BwtwFcjGSnttF048
         /pLNfYAC9A9j+74oUgTiDYZrDKgJBbhK9I8x7t7qHgr0Z29xrFqeAF1vk5T9P4gD35HW
         KuKx5GgcQ5OXMYscUS6ug++zG/9SY9zp7/XbpXqK9fCo7L/8OGseRFmvTdpd622063sd
         WGCw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Rkr3dRmpy11RLx6Cb4sKShLX6i4q/ZenAC95Ig2Bior3p52i1dw+8F/WBbqYjrb7D5mVNtkFro3Fs4U=@lists.linux.dev, AJvYcCW4aDkqA7MZTTFCJi+9STGpuP+1jpxrRQb6Lt7hly1XkXn2E3Cqn8csRt66xXDFCpX4dNw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYF/Z9t+lFE3UbO1Tvh/RWXDrpc6ATLhU8YYDNGVDaHBqo06mI
	7vWxWMkSi9qvxJk9apIBaSRW20fGB3LaBb6abht63IMAJ4g6bTEb
X-Gm-Gg: ASbGnctqwP46Nyl6MKEI92ouUugsBixHpPGU6ut7fr9UQv1KW4yNsHfy6foG/nais6X
	bikhbpka1fUP1wwK9O+B4KxU2pitvmpBJIpjV5Fxi4kBgFwCPcLD0pGW6q44JXBUguwbnyxHqti
	QYhMOTmmvbov3nBUMCgYsFjj9yyZe39O5WOCgAVyYSFOYeEg2cLlQ3Ge/PqHIn9hmbsNFns/XxE
	1TeP6GGS+72K/obwtM3L6b0m93pnDzlbjv31TFcgIwbOU8tlI6LEy5g5IENrjREXMq4S+PVzCM5
	30wU
X-Google-Smtp-Source: AGHT+IGGlOON38G2cwVHy7HWLqeoiprbbsYzb+R2lpZBxzMcoaBGttOdxBgPJKnbhKhubtPPASJM/w==
X-Received: by 2002:a05:600c:4ed4:b0:434:f586:7520 with SMTP id 5b1f17b1804b1-438913c5d53mr370329335e9.6.1737982005060;
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4212sm10639980f8f.87.2025.01.27.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:44 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:03 +0100
Subject: [PATCH RFC 08/14] ahci: qoriq: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-8-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=BVe5T/T+KyUbuPkxpZh30Ji3hdJ098Bkd+OSL6K5mXQ=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4Ar/8OCYLq0jyRBQ+Yjy7zx+LAyAdn2J69PD
 7OGj9QKt02JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tVr7EACtsjKfesgoSAqC8UkGk7ueOpe82d7ckBOhdbGJnRi70fcUJQSY/kkf2Hl4t5wHe/cVsw/
 vS6zV6opL0l5hPIDzCGMq3iWUg/vFwAvE/v8B1UR/yGTY2Bw++rPjRHqaGM324LXK4iroJNLFED
 6uknhnXagzGruwoKVaNdHR2pDsajddGRtyos06fe2FDnaD9SEajOqAyL42qE+SiXTjK5zKoGXYC
 +BDknQG7waEhlDM1cQbUOIS+C1hfS3mD6tfgYBVfg3GZ7sWUxMX36hAKZr8bpChDQf/OPg/oziK
 GvkrPLOT9nGptYxN1bVPuy+RkXFAIEKb6MAC69msd6BhCy8SWKuLiYs8o1VLqYMXVOtsR4hOHY1
 Ijzl8dBxc7zrV6+WoWyRYJX16A59r2Tvn+jxdIh+/ZKtPJ1MIY9o51uahQXNsF2j1aZT4hQzXzj
 0p2crfx2gWw2Bpv+qSu9O6aEqupWvQPhwYT4sgNwrAfrAXo67VlhsIH4JJnSZ8LBUjEyJmqfcSN
 dPV+nN0tafh4c9lsamiWYfZcYj8FwEDttEUyJ0FLlVUwQ7RQcCe+ucPKcOWlT/aB/GcMUDHHo/x
 hTUM5LB+5EnSwNbvi4q3t0QvP77e4p8gjbIlgmjgEvpgcu7yOkvMWVxVeFrfSuVUmnQa+cvQ/Od
 MEUGJsxlPSjYVCg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_qoriq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
index 30e39885b64edf9cbb1eeca853659582f5296361..5f64bb8cd2e9c8d34403f76e5789fa435dce94ca 100644
--- a/drivers/ata/ahci_qoriq.c
+++ b/drivers/ata/ahci_qoriq.c
@@ -319,7 +319,6 @@ static int ahci_qoriq_probe(struct platform_device *pdev)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ahci_qoriq_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -350,10 +349,10 @@ static int ahci_qoriq_resume(struct device *dev)
 
 	return rc;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_qoriq_pm_ops, ahci_platform_suspend,
-			 ahci_qoriq_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_qoriq_pm_ops,
+				ahci_platform_suspend,
+				ahci_qoriq_resume);
 
 static struct platform_driver ahci_qoriq_driver = {
 	.probe = ahci_qoriq_probe,
@@ -362,7 +361,7 @@ static struct platform_driver ahci_qoriq_driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_qoriq_of_match,
 		.acpi_match_table = ahci_qoriq_acpi_match,
-		.pm = &ahci_qoriq_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_qoriq_pm_ops),
 	},
 };
 module_platform_driver(ahci_qoriq_driver);

-- 
2.48.0


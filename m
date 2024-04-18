Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F373916EBEE
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713455529; cv=none; b=nZC8j9morQKqGGPSOW8wM1C0WAimlz0r8P2EemxxD+b3meqnAgQQB9Dl0w4gZ5bCintGitmoXS2jecaCV9B4g5fSndVw8WHKYFBOmoGstIENC6nsK1arNPW0x7q2tQMGz9gh988KvvMgjoEhRK10x86HwH+4GXWb95ctKLCEOJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713455529; c=relaxed/simple;
	bh=wFnbcWy5gk5sXW+5zvt0NargWqewhsVtKQ7Weekss4g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c9GnnSqDfvCK98sBO9iJktt0Yz7/yvOB+0yY1ATMkmae4LvrlvrRUquDUq/c98pfH4itZJaMMb3a123FSPsnfGx0E5Dp12MK8/KxV1ClNKAzCAqR/m6p6Q7p00Iu7uZcMjJqKdWpFAbubZA7HzmVYvI25rt24An3zFeHzMeSADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0eABHAo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0eABHAo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-418c2bf2f90so6285795e9.1
        for <imx@lists.linux.dev>; Thu, 18 Apr 2024 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713455526; x=1714060326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPBZ9ExHuwu+bu/mp1K2y+evtVoXz/i7anIOf+mTPDM=;
        b=h0eABHAoZvqnrGBD5eWRN5VFW0KNiwwuUElUycKaz0fxqLdz1u+HwXUEaGOwKUS10d
         C9Q05CaFRtnbcZeFNOECq3NRPxtPywvhO7LkdGOnasxnWy7oW2a+zOcOW1arKg2uMIeI
         4/gy2fWXsaKwmrTupmsHkCwO+A2L0T/OYd4gK43lnRKRFzz4n7vpc6Y3TTsVNjjaIncE
         X5n2AUuDTSoAqbZNswpd+c+P2WIzuD7SJsFAEmnP33g/J4o1jaBKdGZwavmjx0YrzvrC
         GgXf8mYQF0qnjafQzQQJXvpqyflOE9SUSQaSzqpJ0IWgsATt0sQnabhD1LPbUAni31Mu
         noZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713455526; x=1714060326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPBZ9ExHuwu+bu/mp1K2y+evtVoXz/i7anIOf+mTPDM=;
        b=SyCmQnAHfW9VcnvlpytPLAd0Ewh8yN8Ls0SrZ4xrho5U7ZmWhar3rFJfGgY5LPbfYC
         dmC7o2yMlJUXKtLx1SUYec5ShGMB5tA64tmfD7/S/JQjvEuzAF8JKwwv1i/p+4qWR24H
         LRNizIfOrCKsHmFHfJZRyDFwvRDOGmD3Egjo0H/TqgRqIPZbSXCYj8G3IZsJcSk+Kh59
         6BeaKOIkC3yL8TfGNwK6y91qds6smfDls3vPFhp81P9jYIADCNCnR3CFY+0xlLiU2c36
         /31zfNbN0J5zecGo04ORF69CKqQ7GBL9fRuhy5je9cDa/0IZF9eDoiD7/Utqpl0pltSG
         4k/w==
X-Forwarded-Encrypted: i=1; AJvYcCUMlNqqbyCet3wEazTeCe4Wgcxn9kGGKOfMZHtr21Xiub66N1xkIk+5CphrSHDLeeOHzm8D7kyDVB0IhEyO1e1oW6Nm
X-Gm-Message-State: AOJu0Yz4z08S4drLHYnDEJ7Vk8kxqQPSY8DpmwPC2aSurjFsgABEwtEr
	xaWOFfDLa3VLqA7IVNYiqB2RSFM+PQwhoBqTNXJRgfAQ/o6hqkVn
X-Google-Smtp-Source: AGHT+IFSm2+nTTTBh/s5wnJ18wP/8/m9M0ecQsavX8QpbNXPEQlYhBTSMGaOPCVh/XJ7vaSK6GL7IQ==
X-Received: by 2002:a05:600c:4e09:b0:418:f219:6e22 with SMTP id b9-20020a05600c4e0900b00418f2196e22mr1182984wmq.11.1713455526019;
        Thu, 18 Apr 2024 08:52:06 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e622:f700:cffe:40a8:31d4:2e61])
        by smtp.gmail.com with ESMTPSA id o30-20020adfa11e000000b00341b7d5054bsm2168202wro.72.2024.04.18.08.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 08:52:05 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com,
	stable@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v1] pmdomain: imx8m-blk-ctrl: fix suspend/resume order
Date: Thu, 18 Apr 2024 16:51:51 +0100
Message-Id: <20240418155151.355133-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

During the probe, the genpd power_dev is added to the dpm_list after
blk_ctrl due to its parent/child relationship. Making the blk_ctrl
suspend after and resume before the genpd power_dev.

As a consequence, the system hangs when resuming the VPU due to the
power domain dependency.

To ensure the proper suspend/resume order, add a device link betweem
blk_ctrl and genpd power_dev. It guarantees genpd power_dev is suspended
after and resumed before blk-ctrl.

Cc: <stable@vger.kernel.org>
Closes: https://lore.kernel.org/all/fccbb040330a706a4f7b34875db1d896a0bf81c8.camel@gmail.com/
Link: https://lore.kernel.org/all/20240409085802.290439-1-ivitro@gmail.com/
Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
Suggested-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---

This is a new patch, but is a follow-up of:
https://lore.kernel.org/all/20240409085802.290439-1-ivitro@gmail.com/

As suggested by Lucas, we are addressing this PM issue in the imx8m-blk-ctrl
driver instead of in the imx8mm.dtsi.

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index ca942d7929c2..cd0d2296080d 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -283,6 +283,20 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		/*
+		 * Enforce suspend/resume ordering by making genpd power_dev a
+		 * provider of blk-ctrl. Genpd power_dev is suspended after and
+		 * resumed before blk-ctrl.
+		 */
+		if (!device_link_add(dev, domain->power_dev, DL_FLAG_STATELESS)) {
+			ret = -EINVAL;
+			dev_err_probe(dev, ret,
+				      "failed to link to %s\n", data->name);
+			pm_genpd_remove(&domain->genpd);
+			dev_pm_domain_detach(domain->power_dev, true);
+			goto cleanup_pds;
+		}
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -324,6 +338,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
 	for (i--; i >= 0; i--) {
+		device_link_remove(dev, bc->domains[i].power_dev);
 		pm_genpd_remove(&bc->domains[i].genpd);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
@@ -343,6 +358,7 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
 	for (i = 0; bc->onecell_data.num_domains; i++) {
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
+		device_link_remove(&pdev->dev, domain->power_dev);
 		pm_genpd_remove(&domain->genpd);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
-- 
2.34.1


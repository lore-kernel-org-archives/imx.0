Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B73314D1A
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 02:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787279999; cv=none; b=NxhTuh1ggLkdglsw+X8BFc7KSjI6zxVOfz/qRKJrRyuifPvwpPOQ01QdISlVfX+bYlF58BrXLMjB85VoXZC0ByrrlIaZpRxP9cWvssxSEtSoFPn1ViBpvUztb6ARUIxJ+CyF5bzU8bKjx5tOaT2HPOEXFZN9COX6PBohUGaIa3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787279999; c=relaxed/simple;
	bh=HE4yGj2yzR7i3hY2ECb74e0CHgrH2ZdPXoa4VBpgUSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9a8mv+zmXR0f+WsWPsZ74486JI0n/XHBgII+i2+EHIJZ0+QAMUP/9ybR7OwYt0EjhuxevrNAsWsrjxs5toiT1GiJaFew1Gb9IJ+naB6recAiwegrtgxmyd22VMg2h6cyz4IpiDxSi9e/D+BqYekqD2V1L7yxnuKFLUcFRSeoRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg09hIAC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg09hIAC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso328156b3a.1
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787279998; x=1787884798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbtpPhjBOt68lCtkFvblCddC1916ShOnlAarOKi5cWI=;
        b=hg09hIACAZrDU8gDOtg803NSewF5GJ6x+pZTvJfSHWcqS/DQZyWTb1A/zBc7LZjmPd
         BUn+pb4V1lPOEcfHQ4RYC9+breYzEdwRVzyJyHHiDhpAVXP8ySgzKp1HS/2A7QF8UbvE
         SpiMisfJ8ajokT2havLX8h+EtN250TcvairNjF26S7DQAat6Rp7cDq5QWk650goOSLyv
         ApwzYybojgQhZhwhW2oDiuD9miPiFpogQUqb0IkvWQAC1EUChv6U3hzhbfUkDU3a81Xf
         KKuYof2wui/8ZNBp5WKXy6IlqBCuOMWJfZod58MUvq2ZT/LXhhMeK97eF6wXMd5Iu8fd
         koSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787279998; x=1787884798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbtpPhjBOt68lCtkFvblCddC1916ShOnlAarOKi5cWI=;
        b=LiAZRTwG/LD6RBywWP79G/nLhQj3Eg9YSs3kTuDVljqEyLXTIPneZKN0niniInPaCI
         Jl3E6OfCSppq3IEj/suMOkTzzsS3J6ih41enWdn10zaYxaFfT8cRp6PnzaWWTM190L8a
         OyTxVKvID5rLrKuGwGDkcnlXLf1jsi+bP3d73B9CZU3FZDJAgCytRj1THsyGvwiJxlmX
         oD+2+lqC1+V5SGIxeFojRpWdZ/RjZ9BkPQqEipDGdHGM7DrWlptqXRgHRdr2mwYvvibz
         C9CPMq3UvysktNeNFkCdeQz9Tt9gB55IU6vtj9PTp5ops0AAhDQVymOizAKPKVUKxqaa
         bR8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrApo4D/S9H3Gf9dSlycieYK/Zfv2QuB3r7BWTdHKopSehNID851kUCmI2WFkdSwjXbOVw=@lists.linux.dev
X-Gm-Message-State: AFuF++kY6lt7a8hBlZUJz4AI9+6n3nR96bgAwCnnIYxwZLJRy0H1NXwS
	gM7/1Sh3T6n3CSbD6A3dgw0ETJm7WxJ+KzPw8ycdRDOl0l8HgWGP+Mg=
X-Gm-Gg: AR+sD10NjB9ClqSDlSDwxhCf/jTngWabqTuIUvyH9zL88IiRgvEujnEW9FX+/SkTEr6
	C2NWWu3//rnX8BBSTy2id250rKsOYwm2j6NIYy7uL5gpwnN/lD4QOiBG4R+15OXpow2kR1fVr0d
	kSRKDCaRogqAeun5HutITB2ojOIj572AFiOR7UoeBlxVxXzWhWGlp7rcVOrw3Xse1UZChSdsCPf
	e1Xhq54qBrkumt5JlYCHpCjmUj7oRBtm2bxSTNq+O+FtpFlz42ewGEyaEJHgESgTzuwNdKt8vBo
	oVfr25uKKcI6E0GGgR3sPSu5nVEoL/a4n98fO/78yD4b9nKi2BKQj37/hpg/X/XGh9+080QKtNs
	+Xg5q1vhOHImDWHlZw+h8MvsDdAhm2lYm/X/hZm68KwOBK+pksBuG4TodIRqH8pdU9TzQldkRMi
	AxZezwWTq6E6VDJTfNODBL18BNekYhTpfLTrS95Ym8KZEd3YrpiDcPA9JdgLe6iffnSmK3umT4l
	Q==
X-Received: by 2002:a05:6a00:a91:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-851f987d3a0mr4634028b3a.5.1787279997742;
        Thu, 20 Aug 2026 19:39:57 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3617434sm2281487b3a.29.2026.08.20.19.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 19:39:56 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] input: keyboard: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 09:39:51 +0700
Message-ID: <20260821023951.53199-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from the resume callbacks and reduces kernel size
when CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/input/keyboard/imx-sm-bbm-key.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/imx-sm-bbm-key.c b/drivers/input/keyboard/imx-sm-bbm-key.c
index 96486bd23d60..7fbbd44878be 100644
--- a/drivers/input/keyboard/imx-sm-bbm-key.c
+++ b/drivers/input/keyboard/imx-sm-bbm-key.c
@@ -187,7 +187,7 @@ static int scmi_imx_bbm_key_probe(struct scmi_device *sdev)
 	return ret;
 }
 
-static int __maybe_unused scmi_imx_bbm_key_suspend(struct device *dev)
+static int scmi_imx_bbm_key_suspend(struct device *dev)
 {
 	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
 
@@ -196,12 +196,12 @@ static int __maybe_unused scmi_imx_bbm_key_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused scmi_imx_bbm_key_resume(struct device *dev)
+static int scmi_imx_bbm_key_resume(struct device *dev)
 {
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(scmi_imx_bbm_pm_key_ops, scmi_imx_bbm_key_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(scmi_imx_bbm_pm_key_ops, scmi_imx_bbm_key_suspend,
 			 scmi_imx_bbm_key_resume);
 
 static const struct scmi_device_id scmi_id_table[] = {
@@ -212,7 +212,7 @@ MODULE_DEVICE_TABLE(scmi, scmi_id_table);
 
 static struct scmi_driver scmi_imx_bbm_key_driver = {
 	.driver = {
-		.pm = &scmi_imx_bbm_pm_key_ops,
+		.pm = pm_sleep_ptr(&scmi_imx_bbm_pm_key_ops),
 	},
 	.name = "scmi-imx-bbm-key",
 	.probe = scmi_imx_bbm_key_probe,
-- 
2.53.0


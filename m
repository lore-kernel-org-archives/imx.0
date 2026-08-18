Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A067A2D0C7E
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 01:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787017302; cv=none; b=dfn2Hxp0QwS1XbtWIIC0Hq6LByPaxJ/1UHvcDim067zpVxD0DIF7Dg7swMgEeH8blvnPVNTL559QxIkwqgEoCsgr8RJfCxfe2MjYpc8ndmzyUSvuuGAk0fW4k37DRSNo3o4Et36znAmEUewcirKf+GWJOnGOGfhzsBPNjnDmvVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787017302; c=relaxed/simple;
	bh=jaxR0hTctt1AjcAhG7Kb+CBfaz4rYVV9V0Uit2XQFeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H9+KrHfsH1WvZYRm3hjYaxfMBtRZQqn/104FgIEo4ET9zq7qv0+/RnZv3ecdRKziZfG0jFtrPgwKS5dTITjaEe//oGfuaHWl6IgEGrMIAdh9rM0oIwMvGzgbmq8z2G8iwCQnTyRncU2T7va2PWV15qDysv7v88hCLmPJMs97Hio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OA8Q12z/; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OA8Q12z/"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-765c077b5c1so1126718137.3
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 18:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787017299; x=1787622099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABVhC4rrgPmd/PSag+fTntDpRIoBuXV2n/EKPCakvNQ=;
        b=OA8Q12z/p+6oEQACKYLXl2OPFU2ptsoij3qweMNieJF4QVRoa3sNGP0D8+2BXG+Iq2
         Ty+s0oS8kgz7uAfnMKYrYC4L4GSaiuubXRiEuJQFhWFJ3vNLY451RlRUPVvo9E5O0gcK
         GLfg1Kiv/fYwG/XHaOiWpKL1/aA9f4d1L4nAgiLUwgBPB1EqudM2yZvmPB+hinKdlGFw
         UT9DRUH9ebMw81xUIUnu0BbRXflBiSE3LdT7cwyKcDlvvHlL+HnHYlG/mBMevNllM5lu
         J2pNyiXIlzgUJPIUClS9C3x2SKi5jbn8Weh0o9xWH76k8WutPQdo6XxKTGE1fxHbriQu
         Fb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787017299; x=1787622099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABVhC4rrgPmd/PSag+fTntDpRIoBuXV2n/EKPCakvNQ=;
        b=bVQPtR6GCfB9FoXWxIg/ozqZc07RvSbQT/T36g3UE8d6raLNNVhQmf+w0b/3WXrUey
         jebqjJKTz6n1K/Vw6JrZkRDBj7ICIT1lszqae+ZbbMhJidJYGB+TrAxQujhj+befOXua
         NskuJPk8ZkjeesO01lLMciXQi/nozR+DdGQ3KJPWuFs3CzPuo8W91KFEIRDvKT5HOy4a
         nvTv0TUK/yTVXagyWNdq6yumEG+n5lZJp6wKEsILn3usbMondy2TB0sP7cY4zNz2EjjK
         KzaQUCH87+awuz5IHrKofEDsgkpIJsAqG1En3Ct614RreWY43P46wCnCZ5zhQJM2YrBP
         3UWA==
X-Forwarded-Encrypted: i=1; AHgh+RqpUqtB+N68/HLSRvkEVyJIQeAC2RKb88WX1xVIJ7WMf12K7FAN4v3t/O2rnvMhA5rLZXw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc0vhoFwP1zMbEwbccrx1VELWCxqa78/ieC1o47MlOzloFshUE
	OCGHoO9NJm7ScDeaVnBvpAEPz62rDJHGhBiyctgl7GeW3tarqQ4g31sD
X-Gm-Gg: AR+sD11Irv4ZSgV2I/fK+zAyJiF9xhYZRtNX2L87OwW+WqSddxjjo6EU1fkX9mfM2W5
	azkeapEJLHkoCpU/7ZeOaG9hZlzDNt9UN3ltMnjW1ZaAKxADAEgFLVH/PeqUvpPH1CaxqaB4jIg
	WXS2EG462BKNzZVPZpAB10uPCLg49C7ka5dGTjYfr5QHP9l8vKan0QsvrdvtRCzf0GvFMPBDlao
	DqD1qtVTpfVJhrH4u834qaCHU/khInq4nYEXwERsUYoYw4xzfaqj2t0K/tv9ZP/dEEvpcX52gFN
	bUGYFt4rgpMwttrwugzqV+2h0i1N0/TEOHAV2irm0y5s75w9G/JZ9GSzAU6BUvLepAIz8ID+oHw
	7weamXTImlAn6qkaSEHL4JFcnx6EBF+emKbur2cbT4a6Kb0I5NDdVY2xNoSf8smG84KFHWlj3JB
	cO9k2/NTxT4xLtiqVZPrKHxu+uMtCnuv5Czzmo5ZkAB6cIxSsuXUPM2hITgfvBH7K/4x1ykXdsI
	8CvWbz3uSR9cVD+kAMffd7et2TaIkwKSgAvYw==
X-Received: by 2002:a05:6102:3590:b0:772:9999:34c6 with SMTP id ada2fe7eead31-772999967cbmr2357738137.7.1787017299334;
        Mon, 17 Aug 2026 18:41:39 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a802:463c:ff0a:9155:ae80:b1ba])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c508ab92sm2160162137.7.2026.08.17.18.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:41:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 1/2] regulator: pca9450: Use LDO5 low-control enable mask
Date: Mon, 17 Aug 2026 22:40:58 -0300
Message-ID: <20260818014059.351152-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

LDO5 has voltage-selection fields in both LDO5CTRL_L and LDO5CTRL_H,
selected by the SD_VSEL pin. Its ENMODE field, however, is only in
LDO5CTRL_L.

The regulator descriptors correctly use LDO5CTRL_L as enable_reg, but
use the misleading LDO5H_EN_MASK name for enable_mask. Both mask
definitions have the same value, so this causes no functional problem.

Use LDO5L_EN_MASK in all LDO5 descriptors and remove the unused
LDO5H_EN_MASK definition.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- New patch clarifying that the LDO5 ENMODE field is in LDO5CTRL_L.

 drivers/regulator/pca9450-regulator.c | 6 +++---
 include/linux/regulator/pca9450.h     | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index c41db70fa052..93d0af7f7eda 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -621,7 +621,7 @@ static struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.vsel_reg = PCA9450_REG_LDO5CTRL_H,
 			.vsel_mask = LDO5HOUT_MASK,
 			.enable_reg = PCA9450_REG_LDO5CTRL_L,
-			.enable_mask = LDO5H_EN_MASK,
+			.enable_mask = LDO5L_EN_MASK,
 			.owner = THIS_MODULE,
 		},
 	},
@@ -866,7 +866,7 @@ static struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.vsel_reg = PCA9450_REG_LDO5CTRL_H,
 			.vsel_mask = LDO5HOUT_MASK,
 			.enable_reg = PCA9450_REG_LDO5CTRL_L,
-			.enable_mask = LDO5H_EN_MASK,
+			.enable_mask = LDO5L_EN_MASK,
 			.owner = THIS_MODULE,
 		},
 	},
@@ -1086,7 +1086,7 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.vsel_reg = PCA9450_REG_LDO5CTRL_H,
 			.vsel_mask = LDO5HOUT_MASK,
 			.enable_reg = PCA9450_REG_LDO5CTRL_L,
-			.enable_mask = LDO5H_EN_MASK,
+			.enable_mask = LDO5L_EN_MASK,
 			.owner = THIS_MODULE,
 		},
 	},
diff --git a/include/linux/regulator/pca9450.h b/include/linux/regulator/pca9450.h
index 0df8b3c48082..2aa73624d0b8 100644
--- a/include/linux/regulator/pca9450.h
+++ b/include/linux/regulator/pca9450.h
@@ -210,7 +210,6 @@ enum {
 #define LDO5L_EN_MASK			0xC0
 #define LDO5LOUT_MASK			0x0F
 
-#define LDO5H_EN_MASK			0xC0
 #define LDO5HOUT_MASK			0x0F
 
 /* PCA9450_REG_IRQ bits */
-- 
2.43.0


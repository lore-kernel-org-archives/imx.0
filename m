Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451431836FE
	for <imx@lists.linux.dev>; Mon, 29 Apr 2024 21:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714427110; cv=none; b=NJs0kxwlcNd/5C5Rbz8mA8OIqyROP/NbRO2nPPQAJRb7JgbqDbvVgBN35iifVMO68Thrykrj+2OmmxM3gtM/dgS57gAxlUGe0l+eagf/kf73TD9yMb30FOYsQLOqWrWgQFKnjl9gOd7k1/2I+losFklwNsL0kIkU39aZDsotvs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714427110; c=relaxed/simple;
	bh=HGaYPJRPOTFMcmk0QgXPGnhslgpidMloqJBRXcZG3so=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lzZautec7ssuaysU6X13Qjzy62k4vdv3VyRpa5w09yIsgp5d18SbOocqEAUXVf9HwzEjirXpO0C4/Rzl4MECrwu5EwXMTAiwiAygVFQCq2tq9gXXQCSGxuRrpXBKVFiGbowqsiHs+Lj5zgDhJ+Uk3xHfDcuvGBspQcEFBfJ40/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daXlXmxC; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daXlXmxC"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6eb7a4d64e8so1204102a34.0
        for <imx@lists.linux.dev>; Mon, 29 Apr 2024 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714427108; x=1715031908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D42c3j0xOA3Mu80ZHSNRZeVSn94ADvU2Gg4eug24XSI=;
        b=daXlXmxCI2NgqZ0yLYfJsn73xoLbe93fKDJCQz8NbVd/igxNwcBdgXGuy0WGX8Dvwc
         7WtEJoCN11RiELO9mDIZfpv/pNefZXJ8P6mBM+GZoeDRSiACMqBrurVh3YpXvWl7IiWh
         v/gPwg4P/dU8hJiZo4lwIEhNiDz+vJTnt16KaXhnRQzLbyeIEIKUt5FkmAouj4TTZw5k
         LCI91mPzQTjhdZRnQ6xogmxZPcWpJWG9AjhwXRl14Et+fxM7z9zitQtehtHZQgD8A1Tj
         2xemL/X3wGmLthuQs0CcHsVSvVA0FOJKP0WDfwJFZ1gT4/e0vIrAHbEwSMNj3Ula8K32
         s+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714427108; x=1715031908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D42c3j0xOA3Mu80ZHSNRZeVSn94ADvU2Gg4eug24XSI=;
        b=o1xd7AdlM9/+Y8tm80bt/UB9rd3Qmk2+Uz7qF5N76g0Y4dzG3kcxGn72TAZDhnSbG3
         AypteFKBLxtPy3wewf2+7SZ59NqTqZemjXmJkECkzL4RzykB/xtj0jVCOr+866oXyux/
         snsqCLGn7JFZg4WkFJ7xn+tAc/+VnJVhk+e+ZsOurqPbuXAWzZIH9kuoGZNzu/VZOKfI
         xGPR25I/ykoaC2JFgWTRwkmdUbgaUkNVYaW/ujLf1ePUSmesKUn4ChJDXSulan+kp6Dr
         +cKFdixUcgbsls7Sk8csFV/PjKw+7pupGy7E9qhsVudt9fQoBjUOE1xCePO8eNyd+NjO
         8g9Q==
X-Gm-Message-State: AOJu0Ywt3Bx2XXi+CrTMCBkDiaKE1yU00DWKKV3GjRQo5A+endLItlON
	VgGZrjazeCTApRAgR3ceixD8bYHXC66BG+2Nd4EJX3xHUIubHWuX
X-Google-Smtp-Source: AGHT+IF+mA/m3DWxzc3uIGD5tEYzyZD2DZAjgCKIIHpjdsS3oSRm5JWxeCV0F09evPJU9trgNGtm6A==
X-Received: by 2002:a05:6358:7252:b0:18d:e99a:2520 with SMTP id i18-20020a056358725200b0018de99a2520mr13328471rwa.2.1714427108162;
        Mon, 29 Apr 2024 14:45:08 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fa90:8aff:324b:5e2c])
        by smtp.gmail.com with ESMTPSA id 192-20020a6301c9000000b0060795a08227sm9170840pgb.37.2024.04.29.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 14:45:07 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: abelvesa@kernel.org
Cc: imx@lists.linux.dev,
	shengjiu.wang@nxp.com,
	linux-clk@vger.kernel.org,
	naresh.kamboju@linaro.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
Date: Mon, 29 Apr 2024 18:45:02 -0300
Message-Id: <20240429214502.1363592-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the suspend/resume() functions are used at
buid time or are simply dead code.

This fixes the following s390 allmodconfig build errors:

drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: error:
'clk_imx8mp_audiomix_runtime_resume' defined but not used
[-Werror=unused-function]
  363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: error:
'clk_imx8mp_audiomix_runtime_suspend' defined but not used
[-Werror=unused-function]
  356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/linux-clk/CA+G9fYuP7S+a89Ep5g5_Ad69EMwRkJ8nM+MMTzbEcP+6H2oMXQ@mail.gmail.com/T/#u
Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power saving")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index 574a032309c1..6a9b48b20cd6 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -368,8 +368,8 @@ static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops clk_imx8mp_audiomix_pm_ops = {
-	SET_RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
-			   clk_imx8mp_audiomix_runtime_resume, NULL)
+	RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
+		       clk_imx8mp_audiomix_runtime_resume, NULL)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				      pm_runtime_force_resume)
 };
@@ -386,7 +386,7 @@ static struct platform_driver clk_imx8mp_audiomix_driver = {
 	.driver = {
 		.name = "imx8mp-audio-blk-ctrl",
 		.of_match_table = clk_imx8mp_audiomix_of_match,
-		.pm = &clk_imx8mp_audiomix_pm_ops,
+		.pm = pm_ptr(&clk_imx8mp_audiomix_pm_ops),
 	},
 };
 
-- 
2.34.1


Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2D813A276
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723051410; cv=none; b=CC0V17ipTvwiZ32P+EQoplsBSOmaufUjf+7keu8H6H1LCCrz8bGRiAZ6zDOeso3Ke8yKSOqD0qELW8cwIcKc2ZpRXAlPmQ88PrGFQsI/OjInIHPDC4gecQEM9UXRUugSWZ4vK/LnQaOW5fwhqY4dd4eC4hvPyPkGg/QeOwmE0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723051410; c=relaxed/simple;
	bh=EYzGczITxzqmYLT01PwrDI8MGFsGwk/I8y0m/O49lRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CeA0XtSGxDGFjL2ICsuk9A1LXWWAqmh2bZy5IC6nmb346aG2M8vnk0yQU+fH1TuyQ/g5AUupT5JsBi1Mc5+hI3WMblBsbOfZfhaiyH8BobC826hXGh4jMacXhWrEnft9oD5HaprTTgtbUlubWoz5Ckv5A1FnM24FIwYmO4qtJAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qf7xpH0T; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qf7xpH0T"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7bd04f8396cso6903a12.2
        for <imx@lists.linux.dev>; Wed, 07 Aug 2024 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723051408; x=1723656208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2VfGxvvrtodTt4Uoxajg9WwZwPH9dbWJ0QoUIY7mzs0=;
        b=Qf7xpH0T3fsbWaW6iJl5SPm9dj9M8YLh1j80YzuuTL07rhohJojXfP1xb6pRKYo52B
         95NgxM4lhi5pLdlSl/ryqWr/DzbEE2G/d2thmW6gZ/yT/xitNxBAyzaMzW+SuJgluqzR
         XxKGS5HoaU5dKWS+iAEaiw1uxcoM9rqNO0sHXPTeR4/euwHO0QrtYwXg+ExS2ALMfv+C
         Hfie30h0Ggc4Z/ZJOuWpRKknhU0Rgw2LhvyByEmb58RRuH2jJy/3lhUMV/gZ0vvXh43u
         uyIa8/WuTrHy9CLhBKfXyLq/mbZHHpSa9oCwNQ1lUPzc69npEWQe+En1RPdLtRSdUf+U
         74jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723051408; x=1723656208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VfGxvvrtodTt4Uoxajg9WwZwPH9dbWJ0QoUIY7mzs0=;
        b=u1RxrbW62IoYM+ofi+fwkFKQoGw6+poTMM5GF0TiS2439U3i2cmI2h/YcHt+Rc3lio
         5CAgOfAp5droGjQL2N4PUZxe6KKwCgHfZsedB8ZqLqOvmXoU1yjQ7cOF6xdKj5ztR35d
         TqtrzUenk6gBBRhJYP/55UxB7GoN51o7u8ovftE6PHDogeVlklElHVIqx2BxzB/wDvuz
         uNvqwrvyl2HfEt1yxn3f31jgv3gTeXTg/3ZC8BmcD1AHJAxJW0kVcKSksrFMgxGEetCS
         HzshBpnoxCKJ7ObGkFI//MHY8fFVr3kvQ2HOCNv3DEzQvRWb59l0g7ZgxYrcZjl+oWzw
         bFaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvP+8efJxz4H26ffCrPWQEApMy2pv0PUyBEK3ILbPJk/Q3WZY6Q3Gpq06wJflI6oo9svY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy76KGhnlBrTHF7acBOxGJjsoxDe03zr/Q9BO9YgaMRsi+ZMES7
	OfVZT2q669OD20ClMIWfczmyUWekOef4azbKSp4Cu6TGyCh9JCMt
X-Google-Smtp-Source: AGHT+IFI7/o4PcNIwRXPflK/O7ig096EGfnm7fr3LvWJfY85Ui30/ki22RxRf60g5HkH8Vs9zLd1Yg==
X-Received: by 2002:a17:902:ce88:b0:1fb:19fc:1b44 with SMTP id d9443c01a7336-1ff5728c6c3mr125844275ad.3.1723051408229;
        Wed, 07 Aug 2024 10:23:28 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5e1c:17b4:a72d:e3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm109406395ad.261.2024.08.07.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 10:23:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linus.walleij@linaro.org
Cc: aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Date: Wed,  7 Aug 2024 14:22:56 -0300
Message-Id: <20240807172256.69440-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_LATE_SYSTEM_SLEEP_PM_OPS() with its modern
LATE_SYSTEM_SLEEP_PM_OPS() alternative.

The combined usage of pm_ptr() and LATE_SYSTEM_SLEEP_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9c2680df082c..c83e866d78e9 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -772,7 +772,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	imx_pinctrl_desc->pins = info->pins;
 	imx_pinctrl_desc->npins = info->npins;
 	imx_pinctrl_desc->pctlops = &imx_pctrl_ops;
-	imx_pinctrl_desc->pmxops = &imx_pmx_ops;
+	imx_pinctrl_desc->pmxops = pm_ptr(&imx_pmx_ops);
 	imx_pinctrl_desc->confops = &imx_pinconf_ops;
 	imx_pinctrl_desc->owner = THIS_MODULE;
 
@@ -804,14 +804,14 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(imx_pinctrl_probe);
 
-static int __maybe_unused imx_pinctrl_suspend(struct device *dev)
+static int imx_pinctrl_suspend(struct device *dev)
 {
 	struct imx_pinctrl *ipctl = dev_get_drvdata(dev);
 
 	return pinctrl_force_sleep(ipctl->pctl);
 }
 
-static int __maybe_unused imx_pinctrl_resume(struct device *dev)
+static int imx_pinctrl_resume(struct device *dev)
 {
 	struct imx_pinctrl *ipctl = dev_get_drvdata(dev);
 
@@ -819,8 +819,7 @@ static int __maybe_unused imx_pinctrl_resume(struct device *dev)
 }
 
 const struct dev_pm_ops imx_pinctrl_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
-					imx_pinctrl_resume)
+	LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend, imx_pinctrl_resume)
 };
 EXPORT_SYMBOL_GPL(imx_pinctrl_pm_ops);
 
-- 
2.34.1


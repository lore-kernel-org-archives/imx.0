Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECFB12BEBB
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723054241; cv=none; b=qilhlPnVeaLegcSudz2b95BoAJarQ/9hA1JZx1zfSF1vOM7oUrk3tIE2R2wgBZzB20Kxb3kfMYJOx2+fO8NDiaAJv4b6soTcXk374w71OVS8vBaQB6VHq6KANm3dGX4NWl4tp8hRfh06nIsBZchpIKA89WVwlSLO15g3CrtBfUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723054241; c=relaxed/simple;
	bh=lxt3wUYsg32Y18gNjqNue90CYCyuNl1ac50RLDDEZ7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OjRvKCZaQunq0z3r8K878ajyMZx06VOMSAFKpBN54jrNiqD1YZiJohQhs+w0R3A7sHU9EiOjZXAMlbUcf22H0ajDW/pUIdnZcneIC13ORgPA0CbqAwlHqatEsx0IdJxm64xqsB7P7cObZZY6Y3e7K09wyp7ydvZi6/bB+G3HqhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlUYncZO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlUYncZO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc4b03fca0so246695ad.3
        for <imx@lists.linux.dev>; Wed, 07 Aug 2024 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723054239; x=1723659039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PzWFF3zyatgSU8DsPRQcSn1wkfXRR1Z5HCTDg1S0vdw=;
        b=WlUYncZO+4PBQo7vsVGheItWqrdFgTKO7IJTX8NHFSMhW+LNP7FOLElFLIf8pq+gMT
         m5hFWeyFVeg3dGIsJnX/BC5TXf8h0u+EiJ9A7IZvRSrljp+6KmoW5/fMShGRBMgzfF0Y
         i9j3P11tstE9/Ro7TNvz1KTJy54zIwT/y+9IpQstpVfb7gymNsRBwrGhn+QSeDgGHYhU
         7MQN3v7eqECgOXOaGREsxhkG4p6S4oTWPg36XsxHQrvImcvB4tp2H3P32x3XKcmEP7xI
         5gQWnJVnQLJkFhB34d4F4ttY208r4h5Zpa6KZ2WPfbXFuAh7faXCtPio+XCk8UBlW6ws
         dQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723054239; x=1723659039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzWFF3zyatgSU8DsPRQcSn1wkfXRR1Z5HCTDg1S0vdw=;
        b=E1M2hBC9LqbImFlQTjF8b1G8ai7OqOMbntI9a5j53c6MDbgCHfOgg+gq92S9aGP4HD
         ny0On3+RKZUj9RPpsvEK3j5ItY6E6LCrKt5lI5dNMqkGFoo8NKTaCvJUC/ohIqGH1cBP
         V/cjtQsgZ3z3Wv5Q1y6shk1LLtvJ4OMLVZQ9JGphlO3pWeaMXr85VPHeWbzfSUFhsMwO
         9kNOilzOEHvnD+/DYsT+q5I2tr63yM1fBnfzK6wESD1IpyV35gO2ifYzTTPS8zJbZuay
         gLTrSn/CU1YXQgNciJko4Dsk8255ZvOArsj8+3lJ729r+7yFN74Y8C0rix72vFLNJzcp
         eaqw==
X-Forwarded-Encrypted: i=1; AJvYcCVzj5TLMC6D32pYVnORO+v4ZcmetDmVCufoTKpoE4R7mJNPUUZNWT55HGz4W2OqN5hoZcE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDeXhKZUCbzstP00UN5xPwAln0Fpuri6cyYCy8cj8S0yaJ9ny5
	mzSx1dFswAsNCU1T5HlZ3UWJzILl8EDluqF7Q+vVy8EjATOwYeSEc4xRug==
X-Google-Smtp-Source: AGHT+IHIE2Hukwhp/3pXgqVSa3SzFb0Uuqa/JkMxguoK3u4mdG7KI7VhP0Tm3hsZ8i/fO/V50tVHVA==
X-Received: by 2002:a17:902:ce86:b0:1fc:72f5:43b8 with SMTP id d9443c01a7336-1ff573c181fmr152793815ad.7.1723054239526;
        Wed, 07 Aug 2024 11:10:39 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5e1c:17b4:a72d:e3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f5331asm109799365ad.70.2024.08.07.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 11:10:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linus.walleij@linaro.org
Cc: aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Date: Wed,  7 Aug 2024 15:10:33 -0300
Message-Id: <20240807181033.77848-1-festevam@gmail.com>
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
Changes since v1:
- Pass pm_ptr() to the correct ops structure.

 drivers/pinctrl/freescale/pinctrl-imx.c    | 7 +++----
 drivers/pinctrl/freescale/pinctrl-imx8mq.c | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9c2680df082c..d05c2c478e79 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
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
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
index 529eebe46298..316469e72a17 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
@@ -341,7 +341,7 @@ static struct platform_driver imx8mq_pinctrl_driver = {
 	.driver = {
 		.name = "imx8mq-pinctrl",
 		.of_match_table = imx8mq_pinctrl_of_match,
-		.pm = &imx_pinctrl_pm_ops,
+		.pm = pm_ptr(&imx_pinctrl_pm_ops),
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8mq_pinctrl_probe,
-- 
2.34.1


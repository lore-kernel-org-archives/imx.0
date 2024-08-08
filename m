Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6996B18E743
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723134486; cv=none; b=B+xxzq23TWWgcgAX772ake9IEaOg4T2fW0jWhyvnmyhwI7bPM+8zIp6ziJekDepFxwToKBbCSmo/lSCj2381GJ5sAuIeN2+XRAI/ekGxgRXibZDyfCMdJ6rKr77eYHTNxPx306syTUc1X/h6jSbCZEjIxPvKhfERRAyNMVxV28M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723134486; c=relaxed/simple;
	bh=UK/cETamLxpyFIOG9UuHmjCuwYs5yCzAVU3e8VKJjaU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X7mynLmp0uvbkQ4KYJ88tT8cAt2DhLxQ3aEbeF+0mV+wx83Ju7Jh2TeGcIR3qcW9F+S6OVnU96cvuh6AQIr7hyh6MugdC0OtJplIGK54mKmXQDvaah0/KyjLw3JmOTeoGiT9nXP2QzEXbnN5QHXhTzS21GAj2/8fycbWG++Rmfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6XU9owV; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6XU9owV"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2cdba9c71ebso219855a91.2
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723134485; x=1723739285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h55Ss4x4ropCBofo0X6KlfEBUKmmcmXJv6SUvAqr8VE=;
        b=L6XU9owVpOfLY/4tXuAq4d9Moh42A89iXGC67Q6HA706E7rlDf4lAcGeKKG65ravvp
         Cl+cvukksZshhGXwjEOQtxiiCJpXfN8NkqP2zzF6oOZWHai5M7QpJeNmgnNS7zTrXw5/
         E36B8hPh3eDBn3+SPRej6gZHp7CbF1uBIPMwv40wkTSIrKAy4frsFeTBAqOiZb0bLvHJ
         rPVDhMwm0UzSt1Gm3OgUZaTfZIKuuX1dW0VxIO9H5JULp1LRY8dQN3sBW7DxXbcS7JNQ
         agBfoYyTjkVIExa+QSWy8KrknWHLhXCyplS+mXIS5i+TCUHp1dhJg1IB6EzdBjsHydxh
         B9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723134485; x=1723739285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h55Ss4x4ropCBofo0X6KlfEBUKmmcmXJv6SUvAqr8VE=;
        b=cXiCumvH+Xv5Sh3NTnbxXWxD99kPZqT9T5WarrTTO1LSLq69WT857tcNgEw1r57PI6
         19VtCbgTVwcewvl1/3HM7rbFDGffetrlCny50iSEQ61j1VcFXvUA24GltMoDRh1IpfIX
         rTr9uW1NyuVqkpbb3f6YQExD0fAB7Kj7qZ68lJNj91gDMYm5y4A8vVbDlri3yW1KiBRR
         SLDiE7Y+TEJZxm2iwtQFD8aDbWyjaNzvGT0Y3ukAqe/CZVOSReQkHOPPy6uX03hBr3nA
         RFSJ7xJmYVQD22d8DiDxEG3PzaOSWk+MH+uCRVeT23cOiIdbM9bebT63kJRz61kMTzFp
         H7hg==
X-Forwarded-Encrypted: i=1; AJvYcCV0C41Ky5SJkGTF5vfP+3JY7rVgGrhZ9N/coIen2qdLbw5M1FW/vZNWGddS1SuTTEPvFaQTX5cnx6HunGgFaiy8Fs8z
X-Gm-Message-State: AOJu0Yy8W4bdu6Y+18sPk/mlBZihyENPthIEz4BhlTInBGwhwjTMXEp4
	WkwjyqIV6/y8rW4idphgACL9gr+caOPz9FUSh/AemgYKkeAsJQR8
X-Google-Smtp-Source: AGHT+IGRTgtmm4ljHUK/mCPuCaC5RCAN35nHV+wyRTJR8W+TGHEqgLOwkGi16J1pvUjgVOVGJ/6qLg==
X-Received: by 2002:a17:90b:3cc8:b0:2ca:63a7:6b9d with SMTP id 98e67ed59e1d1-2d1c3465e32mr1669631a91.3.1723134484560;
        Thu, 08 Aug 2024 09:28:04 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9dce50asm1327934a91.54.2024.08.08.09.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:28:04 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linus.walleij@linaro.org
Cc: aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	linux-gpio@vger.kernel.org,
	peng.fan@nxp.com,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Date: Thu,  8 Aug 2024 13:27:50 -0300
Message-Id: <20240808162750.244092-1-festevam@gmail.com>
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

The combined usage of pm_sleep_ptr() and LATE_SYSTEM_SLEEP_PM_OPS() allows
the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Use pm_sleep_ptr() (Peng).

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
index 529eebe46298..e59e4fc80193 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
@@ -341,7 +341,7 @@ static struct platform_driver imx8mq_pinctrl_driver = {
 	.driver = {
 		.name = "imx8mq-pinctrl",
 		.of_match_table = imx8mq_pinctrl_of_match,
-		.pm = &imx_pinctrl_pm_ops,
+		.pm = pm_sleep_ptr(&imx_pinctrl_pm_ops),
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8mq_pinctrl_probe,
-- 
2.34.1


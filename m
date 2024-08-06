Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3281C37A5
	for <imx@lists.linux.dev>; Tue,  6 Aug 2024 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944588; cv=none; b=pLpaOGAv0ENpxl38aTNuZTzhcJ9ao/e7BVkFajhcQAJFZeOqN+GJ5BuXQWAeehSd94rtFgy/eTgi/rMRIieIN9sOzBqbMp/Gzhby3SUeOlGjO39nJV+Uj8XJr6hrLRbsBpmj9XDtJSkaxcnRv8k/KvVumg3nZBdTW2cJV6g0amY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944588; c=relaxed/simple;
	bh=Z6xlId7q0Vfm+FeJ3zQeLCCXzCKiMho5wSh4gtbswc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nf6rwwQVWdpmcW0x6KY237Q4U8zD9SgdlpjkGHbMZFZAwUVuMCAMlD6vmrOtbbLClXCUc4YChnakZ3zP7Sommw+CROUhh/lp0U9Ngl5OT1PGuCOP9f/h5q0they0j123AS+2q0IB87T3Jwlboipl1fyQCWsXbwmwKWrNGD/1htk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwHUStvK; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwHUStvK"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb77ecd7a2so170274a91.1
        for <imx@lists.linux.dev>; Tue, 06 Aug 2024 04:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722944586; x=1723549386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pH/NKRMVdwEmIgLR7UulwVxQzWNz1LIelnNAG0aSToQ=;
        b=lwHUStvKr8oEWzQulUDbG14INpZLC8SNgEuPmlxBcfLiECM2VJv+Jb21Kmk+Hvhi9T
         Zy0U9FdV7DPC2sC59I8xSNSlvJjfuJkm2NcyNr9aegB7NqVvi6v7+WMiGgB0NgLGbocC
         3f1F60uQ5wNPzHfwzreVN4wL5eaiMXolG1ToFBkKaDf0LqqP/ll+PACU0LnmYnf6ruLV
         M3Cph7LDbyZtoatacGy51mHf8yPiXGKxCMNRNmPu06Lt5uRbPbsjRPvdkgOi4jp0AHwK
         0YZ1L30UTJIL476CBkGVcjowqWNrv7oFqjY9yzE4Gr6EWg8LVAPvvcTO64j6BfQ32QYo
         f3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944586; x=1723549386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH/NKRMVdwEmIgLR7UulwVxQzWNz1LIelnNAG0aSToQ=;
        b=khwYOl/T+RkcSOd5VUrc9/dYBEC6kNm6np8+P4Dito8zqBmEuqIdKdUWIHYN6WfGAo
         eyDo5AJsVaJgV50nFKKvQLlQrKT5GZp4V8jIXO4k0NPrETonPKxg39Ddddd1QvFRRa9/
         FAIE03Xn2oNaS160wiVNBE8KRS+b7BKP03zEHx6Ybx2QtK/JOw/2yDKoBGalzED27dAC
         0sCkRpiqQygW/8KCsuuDewVgjEDAJ0OEOpTrmz1BFngMKRFp0A+8bUfibbtC/qJ9iSGp
         0PTmaXTSgo+QtQsB52H39hWZd5KzRA1IPviIccRXJMemhgyQia4atHtkEJQ8EhZ75PX+
         58xg==
X-Forwarded-Encrypted: i=1; AJvYcCW2b4ksHeXGDeU0g/vypP9+Q7CezzSm7uK8RcxeUXjOeicNejsRGKCjTlZ8W2SpDfILmmQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz38iEuaxVei6jBr4QlFc7n1C+mC8NP0bP1BZFtRr1ZCenJZXzF
	Mwe81JA7W69IBLck3Uu5IWaeKaboT8AmrVISQlbKXwmplXJgGt7dDCD4dA==
X-Google-Smtp-Source: AGHT+IFgvhOHFRNvB5yg48uIGUBXXpWCcGVIkdqI3DQEmLQNwk7SE1SYo72hNTyEEkGV82QRW8043Q==
X-Received: by 2002:a17:90a:c68b:b0:2cb:4382:668f with SMTP id 98e67ed59e1d1-2cff958fd7amr10079172a91.5.1722944585723;
        Tue, 06 Aug 2024 04:43:05 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3668:14ca:30e:638f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf96996sm9007938a91.16.2024.08.06.04.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:43:05 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Thinh.Nguyen@synopsys.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] usb: dwc3: imx8mp: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Tue,  6 Aug 2024 08:42:31 -0300
Message-Id: <20240806114231.2603055-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS()/SET SYSTEM_SLEEP_PM_OPS() with their modern
RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() alternatives.

The combined usage of pm_ptr() and RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 8ee448068503..a8bd0850a873 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -282,8 +282,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 }
 
-static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx,
-					      pm_message_t msg)
+static int dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 {
 	if (dwc3_imx->pm_suspended)
 		return 0;
@@ -297,8 +296,7 @@ static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx,
 	return 0;
 }
 
-static int __maybe_unused dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx,
-					     pm_message_t msg)
+static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 {
 	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3);
 	int ret = 0;
@@ -331,7 +329,7 @@ static int __maybe_unused dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx,
 	return ret;
 }
 
-static int __maybe_unused dwc3_imx8mp_pm_suspend(struct device *dev)
+static int dwc3_imx8mp_pm_suspend(struct device *dev)
 {
 	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
 	int ret;
@@ -349,7 +347,7 @@ static int __maybe_unused dwc3_imx8mp_pm_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused dwc3_imx8mp_pm_resume(struct device *dev)
+static int dwc3_imx8mp_pm_resume(struct device *dev)
 {
 	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
 	int ret;
@@ -379,7 +377,7 @@ static int __maybe_unused dwc3_imx8mp_pm_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused dwc3_imx8mp_runtime_suspend(struct device *dev)
+static int dwc3_imx8mp_runtime_suspend(struct device *dev)
 {
 	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
 
@@ -388,7 +386,7 @@ static int __maybe_unused dwc3_imx8mp_runtime_suspend(struct device *dev)
 	return dwc3_imx8mp_suspend(dwc3_imx, PMSG_AUTO_SUSPEND);
 }
 
-static int __maybe_unused dwc3_imx8mp_runtime_resume(struct device *dev)
+static int dwc3_imx8mp_runtime_resume(struct device *dev)
 {
 	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
 
@@ -398,9 +396,9 @@ static int __maybe_unused dwc3_imx8mp_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dwc3_imx8mp_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dwc3_imx8mp_pm_suspend, dwc3_imx8mp_pm_resume)
-	SET_RUNTIME_PM_OPS(dwc3_imx8mp_runtime_suspend,
-			   dwc3_imx8mp_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(dwc3_imx8mp_pm_suspend, dwc3_imx8mp_pm_resume)
+	RUNTIME_PM_OPS(dwc3_imx8mp_runtime_suspend, dwc3_imx8mp_runtime_resume,
+		       NULL)
 };
 
 static const struct of_device_id dwc3_imx8mp_of_match[] = {
@@ -414,7 +412,7 @@ static struct platform_driver dwc3_imx8mp_driver = {
 	.remove_new	= dwc3_imx8mp_remove,
 	.driver		= {
 		.name	= "imx8mp-dwc3",
-		.pm	= &dwc3_imx8mp_dev_pm_ops,
+		.pm	= pm_ptr(&dwc3_imx8mp_dev_pm_ops),
 		.of_match_table	= dwc3_imx8mp_of_match,
 	},
 };
-- 
2.34.1


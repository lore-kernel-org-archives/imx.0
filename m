Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D881742
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563014; cv=none; b=ao4SrXo6PYD2YmCiW2JwC6AkITW892BpudAHV05/Xe/+np9M0ltJLzol3ltsek8fiId5pE0l+chbXW8murekOuApkdbjRAZJ9uDt3RrUR8SKMjsM4Z1Cf2yBr1p0rZSa4QDy25ZZzyswrdf7+eibJiuui/m51vs4naiIY3Azz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563014; c=relaxed/simple;
	bh=wNujzFkWY2QRnJ4eoygNvp/2j66nWvzzi/2rJGjoD6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEnMr2x+d7TqS54bakSD3CS9bIBNVnWMtI8XyJOVSYEdAv8Rapz8/SGcMfOkI1xt+e0V8om61KYltbV4Dpp5EOxkiIdVDiVP0WF9Ek+fMgpJITy+mkwCHfAZR0iYOI2HHHuvaK5CsoN6MP5SKGCEtyzVvbB8gfTGw5d5v1X6vDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPTS5JDV; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPTS5JDV"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7093d565310so3251318a34.2
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563012; x=1725167812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyPqTHyh07puR7bU3JACy63C0BspLgz3ChuDMwPsOL4=;
        b=QPTS5JDVLVaWI26EFzSipQkhklqNtxZosnayntiyn0+fD0+QAIURuBbbzObrcthU2J
         4ZlcuU/fDOWex3ocka9w3A6CZntOfmXn9UxyTF/GQexRsJJkvFSM8Zn44QKYzTD26MEe
         fdQf5BGpPUYTTQGi3QxEaKsGlyA62729/A7ET1tn3JyzYQj082Tj8AlEexhygIg0dtZY
         pri11E2+KvHgr1B8gyNeXXQUMI8OBEx4f/zWA+LHy1XtTNYZHB57SIxo69v0khyFnKqT
         LbCcugZZ8AQ4MkF/kUtb04nOVkXIir2GOylZTkit+OEorMByhMcuSWf2UrNlY1JKR2Ke
         dRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563012; x=1725167812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyPqTHyh07puR7bU3JACy63C0BspLgz3ChuDMwPsOL4=;
        b=P//EnqB/8DdSL5dITtOMTJxpMQ6WSEsGkTmIeKUfObRYM+PdhgM1ZD1cIHAHpRlK2j
         N7Q5lrffSEgnAXYqLBdUSLFFZuxdjTr+Gb4It/ZV1UMYHtxdzD/zFL61hszFqISgPZuY
         eU4vlaaM8faFbmz1gntQ/rzEfD+7NoEdJ78YqaBicDVdNHkZqHD1h1FtKX/VmOUzbvVx
         Ep1VxJOQ+UZUhOWQ6pJ2WCH7E298PPCqdGDZGlQqcuSG6ZpQOOw/z4lQ2fUaiQbJxoHq
         fjXoHFo77jUMbKXt+29nZbxkvB7Yl1wEDj+ZCuRpd7uglM7aSZDGhBcrtA4pRfQcvx+/
         9BvA==
X-Forwarded-Encrypted: i=1; AJvYcCWf4nDY1xIP5gu+12181uoo/0npCAhSg1ZZTFwLziZHJNYHNS7fafo23Tij6ZFjhtWOJhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXwK3NtmAi8t4XRDMKcrcz0DP4vpBeb4kSovdfU5mqXmDiU6e9
	hKJct+OQbd6N8QtTjPDWByH2xUvKqw5JcGbaAE0sL/IqjktVlHfL
X-Google-Smtp-Source: AGHT+IElTjsj7Q4fdjXuCiV15fwaclHOkI2Ai1DHHC2EwetOtIQNk0UHrxm09mtsUN+F1sUh9V3o8w==
X-Received: by 2002:a05:6830:658c:b0:708:b32f:ade5 with SMTP id 46e09a7af769-70e0ec90cacmr8581080a34.32.1724563011839;
        Sat, 24 Aug 2024 22:16:51 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:51 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 10/17] Input: lpc32xx-keys - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:14 -0700
Message-ID: <20240825051627.2848495-11-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/lpc32xx-keys.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/input/keyboard/lpc32xx-keys.c b/drivers/input/keyboard/lpc32xx-keys.c
index 423035be86fb..2392e7ec3b19 100644
--- a/drivers/input/keyboard/lpc32xx-keys.c
+++ b/drivers/input/keyboard/lpc32xx-keys.c
@@ -262,7 +262,7 @@ static int lpc32xx_kscan_suspend(struct device *dev)
 	struct lpc32xx_kscan_drv *kscandat = platform_get_drvdata(pdev);
 	struct input_dev *input = kscandat->input;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	if (input_device_enabled(input)) {
 		/* Clear IRQ and disable clock */
@@ -270,7 +270,6 @@ static int lpc32xx_kscan_suspend(struct device *dev)
 		clk_disable_unprepare(kscandat->clk);
 	}
 
-	mutex_unlock(&input->mutex);
 	return 0;
 }
 
@@ -279,19 +278,20 @@ static int lpc32xx_kscan_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct lpc32xx_kscan_drv *kscandat = platform_get_drvdata(pdev);
 	struct input_dev *input = kscandat->input;
-	int retval = 0;
+	int error;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	if (input_device_enabled(input)) {
 		/* Enable clock and clear IRQ */
-		retval = clk_prepare_enable(kscandat->clk);
-		if (retval == 0)
-			writel(1, LPC32XX_KS_IRQ(kscandat->kscan_base));
+		error = clk_prepare_enable(kscandat->clk);
+		if (error)
+			return error;
+
+		writel(1, LPC32XX_KS_IRQ(kscandat->kscan_base));
 	}
 
-	mutex_unlock(&input->mutex);
-	return retval;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(lpc32xx_kscan_pm_ops, lpc32xx_kscan_suspend,
-- 
2.46.0.295.g3b9ea8a38a-goog


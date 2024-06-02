Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3482B10A3D
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717325244; cv=none; b=u2Im7i118pqDL6/C8gJ6ZSj1uOVByYUpxd2/KDsI4VSX6XR5RffZnoYokSio8MaGyJnI68l0KHI6rvWHKnDEyEX7+tOS3Q1MnQ9FGVdr4F3clpfzemR5VO5gTl91wSq5h8XRZ4dmcnptHNOlbL48OsKYV08ATmAMXln1+UyMrKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717325244; c=relaxed/simple;
	bh=1/+2llMpQdP/3+o/5wjiyOWh74XNKa5CnOfSFGvFbOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dv5Mw51sA1mFAH7uxgfMSiRe6VIHAPFrYnS5rvW+xQs2x43jx/LNX7bKyB4s5q2hPItaJrAGAiRuXb5zuJA9W07PrIRkMn7Bj2qD7p5KUhUbI1sB3znDjTXkcLp2R4F1SR1xJLRE+gvJCU9/+GyLmrXJakV+/7OWHwuniBGthoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JSJqFLuj; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JSJqFLuj"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e72224c395so30597621fa.3
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717325241; x=1717930041; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4+cEYgp87ni0KKsYzhCn64iTe9kQ3eMZgy4fJLAApoU=;
        b=JSJqFLujWy7Z1qYDafmOrtkKo9E6FYrsR0ZQ19P0iykdoZAMEf+8ZjAnRGQfyTdhD6
         0wUEa4vcR78/3JoVUS07gG84zruTWBccRawVVNNWetvVJsUiwC47UIYRKJQ9zM9UWPtZ
         gXxaLA+Ruu3mhNrfW0CsnLVu5Jsh89ScecYUbsAM+Ips6/YEgwBVo96V3EG3OIjpN+LR
         JbYTnuaNhNlzHijqWZH7tWnbKFXWQZY8SH0Yo1ISLd2F78ZinInUShtdrZTdghbHQX7/
         b7hlKHh1LXTamC73vbKy6dp7+cJZjcZly1da3ROymuBf5MpOG4pJY3kdaHSGxYnIXkRC
         brUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717325241; x=1717930041;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+cEYgp87ni0KKsYzhCn64iTe9kQ3eMZgy4fJLAApoU=;
        b=WkIfxXDtq1Omz3gpQ0p/+VvZnNGLoZ8uYLEoHQRQaybjb1ldKIELbFz48dHPJuQgt5
         Zsk5xfxVG+geyQA6tcn+M5NozY9399TLp7scMMOYpqivtVk1TxpiNJpsKBXy1nvlhT9Q
         33j6qdoVSdzoHUn6Zci5/s7t8IM6yM8shesPVze9QNzxHtwgFIWgD0PF+7wSxb20mr8+
         kWvbYN/ARw6vCl+M4TmJMdv9OfvZnuRAWgPx4xC8wlEppNYXQ2VM9WEdbIWGvoEUeufY
         SXXOOKxn+SSIHGbLSX+0jgt/7Ake7IN6DjA1GTalI43KqSR1cfN1aCJqzyON3unNEWGA
         ZRbA==
X-Forwarded-Encrypted: i=1; AJvYcCWRkaKiOCwI6u4MFxfAHUGz+R1icKdCZopW2HyLyaDhZLSCzQxx38QQ9M5GdSzm8Js/aPqHHtget9d1VSJtPoQCLKwx
X-Gm-Message-State: AOJu0YzTaeL8E34dCqtbbi3EOicz10VnyFyJfjmLslN/KsHfMywQLeOc
	MX8kk2zzX55v0bwunDEJMVLdbohOfcaBoIv11xJtXCAqfQFozTXAow5Jg6sV/6o=
X-Google-Smtp-Source: AGHT+IGozxv1VWYFsf9D8aRKbHwKqmUaoTabG0HYVCxenmdRvpAZjxLWQ7YD8mdajF0g2zEAaACOPA==
X-Received: by 2002:a05:6512:39c5:b0:516:cc2d:f6a1 with SMTP id 2adb3069b0e04-52b896dc4f6mr5799698e87.51.1717325241201;
        Sun, 02 Jun 2024 03:47:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f327sm925261e87.97.2024.06.02.03.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 03:47:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 13:47:20 +0300
Subject: [PATCH] ARM: imx_v6_v6_defconfig: enable DRM_SII902X and
 DRM_DISPLAY_CONNECTOR
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-imx-sii902x-defconfig-v1-1-71a6c382b422@linaro.org>
X-B4-Tracking: v=1; b=H4sIALdNXGYC/x3MywqDMBBG4VcJs3ZgjCVWX0W68DKx/8IoCZSA5
 N0NXX6Lc25KGqGJRnNT1B8SzlDRNobW7xx2ZWzVZMW+xIllHJkTMIjNvKlfz+Cxc++k9255dzI
 4qu0V1SP/v9OnlAd6ZWsoZwAAAA==
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=991;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1/+2llMpQdP/3+o/5wjiyOWh74XNKa5CnOfSFGvFbOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXE24oJTSygDI0XRWsAL8mENsW+cDFmr+XKazP
 qHwJcelldmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxNuAAKCRCLPIo+Aiko
 1bGEB/9Q2zDWKpIlKO9dqdQAohnRKBlkPWRUjQ4r0mBQXYfoqqDLv8zgLmKR9alSGDOBauYlkDh
 jQ1CF4GUaKtSz/QRvJ8YzecuYumFXc2k5M2Zs4WQHhvKL6XHKej+DQFpX3wlGzcM1us1EuSyJxT
 mqDOD+1DSyaG7rS2dmbOijObFKyjH6bH8qJMi9ACg30wV5IHwcZfOPec4JlF5ZP3gsyusIeKxxB
 20UST1x7y2tjfWy7IX3YLDJzy5zuKjYXmwGuIFcr5X/+O38bJa3BVRpQiK27U/vSLDhaTdUsxst
 J/tuTq4nAX8Btn2ZM1v7pFM/Jwt8izNMd5NcEtZ4FcEZMydD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable the LVDS-to-HDMI bridge and the HDMI display connector drivers
used on the iMX53 board with the HDMI mezzanine.

Cc: Chris Healy <cphealy@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index cf2480dce285..b6a2d0689cb6 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -282,6 +282,8 @@ CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
+CONFIG_DRM_DISPLAY_CONNECTOR=y
+CONFIG_DRM_SII902X=y
 CONFIG_DRM_TI_TFP410=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=y

---
base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
change-id: 20240602-imx-sii902x-defconfig-7607f6b83096

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


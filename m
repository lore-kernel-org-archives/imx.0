Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF256B81
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 14:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165715; cv=none; b=HW9b/LLR9ZO6PZAq0vR3bXEvCIYE1ZY6VwKInOX3AMJfUpShrnWfyDt6mvZfgfKabYZh8zwP0AevTyTX2G5UmdCcK5Og9xGj+jiiDBth0h2wryQPOY+xyHZAex4gEyuXR+kouht3YneUiYlCWksI6GPoiTm+rrp3E30NlmCyl5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165715; c=relaxed/simple;
	bh=/N1yQaP0StdUG0iTdpvPhiNr39u+E8m0LrixdASsDiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kEMCDqxa5B4Qql8sJDiPNCFboOmPBA6Q1kfz6K0p4OToIt3XVBlp7sKHTOdhnCe0uxgDvc1g6P8Hn31vgcTrOg+Cq5NJLxaMwGhiQCo8plKk9qj9215EkqySVkzK37Sb3XryVZlKWQdKjgl4lMX02UyQLGs85ABqXJY4FZJcLaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfnHW176; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfnHW176"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso32688545e9.1
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 06:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764165713; x=1764770513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BWI068vPYLSXZ5RCwTG2CH0PZ4pNstxIHxCa8vD/TIk=;
        b=HfnHW1760y6S2l2w60HlgqNTGdf66f54wrEM6NFmaJtDt3U/fDxipZGVCwpGar15ZC
         wOaC4LHMulTuXyjTbLFJVaJsVS4AzsaJe6tJj317v0XSEaWRFJCUhr9GGxW/ymM3u55v
         IjTMSpUze1FJ1zz7Vemx93MyY+/9Y9PtPZ6rmLuzfdJb8puMvoVTW2SbZcnue+D+ycDo
         EvSTPao4OJxskg/AyWTqVz4/uXQe5rmMzC/U+6LRmelzHoUQI/HwjDhQmr5341N+/KUl
         oF0dtp3BaENqsubnrhTWJDLBQPvPYpmU/eBwfL2b0clxoXxtLvEmTZShAr9Vm8957suC
         VLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165713; x=1764770513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWI068vPYLSXZ5RCwTG2CH0PZ4pNstxIHxCa8vD/TIk=;
        b=dEzUkSUOBfUCnSNPReEs4LcHEZ1Ud2S8f629Uz/KY+ulEFBLGtoKmWrxtzdZ8PLmnV
         LCCrmdrA37+N9+msCbsnq05b/88nejxiucGGuKuWi+Ic/KjHkOUSY8BBL/aCqMrLfKWJ
         dWzMZ9mBKRO5yMtu9Oobz49+6B9i45Lvl3cg3cg+LeNTRzju3tvQjQGI6Vhijbu8zN2u
         D2rqkLtBBoAOVNwfxRQn2x0mHaGhwrjrMM8N+N0JpbrMGR5GwSdPnBhb63KuNMccL4FW
         i7O57h9dcQp0fMsLSMnBeGxnBlcnCmlD5cEE2nM57tLxjTbBxIzZD3WbsQV+YUaRg6DP
         BjkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9eE3IZvtDAo+QlwUuN4PE5Od8+uOw9hXT6WekQ8Bh6RjzKy4xqwnzgsUSLdLp0B5sdok=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz71KHj+3ifK66TpyaF8/+12lPY0sJK/7f675xE6F/76/1gyPPm
	hrxRmLqN5gdylsSaHbCkMVApBFp2CUxM3ISp9NTvzTI3IhYLGKsNZmhU
X-Gm-Gg: ASbGncso1wTE/stVHJgpdpk0zHj02k+XtC7zGK5adfhSOjLFY1D43mUTr/DthqLWx4Y
	GWD3cxOus/AWGs4jrzdWIAD9XMh+nTYe8zuvg8pdO1Tl1dTpMm8Ki/C8QhcM7tZnxlAG5ayg1Pc
	x6RvUR8Po4CD90oKdHBpwTTYOmzNNggHRapvo3L6YSXlwPe35brwd9SoTxAwjrws2j/y7oWhzQN
	DNViVB1LT/el7A1ijsqHk/tRxOurrsVqjNm9XUxJvewrW2+KnOrbQz5054LnW8UiEa/1jaLBVd5
	QtkWF5AWIlXgzXeDp2qLNKNGdQh/z+wenhrdPH2O3BvCowL+C3QUP4Rzoh8Eo8lWpQjv2+xH5aU
	/VCoH4965LXdSFa4PK7TJ67MlpQycGxzF8A0M8TP6fDEKdMA3CAnFpfBxnkUfA7rABMUllhp5K0
	zvT9uid0GfbTYH+k6dAadPsUDFq6r9hTiUakitgvGKwUiqcJJX/ynhk4vmbjtRnpMB59Nb4+z9t
	ZqvI+XPYXU+eJv6spGZnpk=
X-Google-Smtp-Source: AGHT+IFzSn+vJCoVouAYGcpvzgFcmoMn1o28RCuRXQI35098v7LfOQ48EpWiC41admPbMKt9BZI5yQ==
X-Received: by 2002:a05:600c:8b16:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-477c115dc85mr167384395e9.32.1764165712461;
        Wed, 26 Nov 2025 06:01:52 -0800 (PST)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add608bsm46720265e9.5.2025.11.26.06.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:01:51 -0800 (PST)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	stable@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v2] phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
Date: Wed, 26 Nov 2025 15:01:33 +0100
Message-ID: <20251126140136.1202241-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Franz Schnyder <franz.schnyder@toradex.com>

Currently, the PHY only registers the typec orientation switch when it
is built in. If the typec driver is built as a module, the switch
registration is skipped due to the preprocessor condition, causing
orientation detection to fail.

With commit
45fe729be9a6 ("usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n")
the preprocessor condition is not needed anymore and the orientation
switch is correctly registered for both built-in and module builds.

Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
Cc: stable@vger.kernel.org
Suggested-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: Drop the preprocessor condition after a better suggestion.
    Reviewed-by Neil tag not added as patch is different
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b94f242420fc..72e8aff38b92 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -124,8 +124,6 @@ struct imx8mq_usb_phy {
 static void tca_blk_orientation_set(struct tca_blk *tca,
 				enum typec_orientation orientation);
 
-#ifdef CONFIG_TYPEC
-
 static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
 				enum typec_orientation orientation)
 {
@@ -173,18 +171,6 @@ static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
 	typec_switch_unregister(sw);
 }
 
-#else
-
-static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
-			struct imx8mq_usb_phy *imx_phy)
-{
-	return NULL;
-}
-
-static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
-
-#endif /* CONFIG_TYPEC */
-
 static void tca_blk_orientation_set(struct tca_blk *tca,
 				enum typec_orientation orientation)
 {
-- 
2.43.0


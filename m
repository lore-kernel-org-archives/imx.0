Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6FE3E95B2
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409569; cv=none; b=qAa+AQcX4p7P0Sr6OzNHXlVl+LXvkv9ZFIAqLsEJn0P4z3VX+ZRZP+evaMmah7TUPga/DghyZ3YuiATR8mPApBzJwhenQwcIdSUaL1vGXOzoUt264Pzx5LlgbBT7kkLXXyRcjkIwNEkuj+9k7YVqaYVJ7i4vBOTLjPJrygQ1Ozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409569; c=relaxed/simple;
	bh=kpmGkkU11ecTwdVdTxlaGp+lNBsMTsb/Nj9af5UXA/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ard7kBbdJ68mtNHI8i6XHM+OQtXdJua4vGxCGcnxVmTW0Wupqm40szYUF00mZmVimOJaqndAJbBSzsQdKHjw4sSKitCKhtT31njnOmGgHqsVh9K0b75CISU4416WIj5D52e+fGTopQ/751JSo1EiHMVgQd+TwH4Pn3MBMDAc6Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia5CTYke; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia5CTYke"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so2609531a91.3
        for <imx@lists.linux.dev>; Tue, 02 Jun 2026 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409567; x=1781014367; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XCowtVnjKXnbcRNuimTNpT8EiRYTBtdlRiIVINQJ3g=;
        b=ia5CTYkeIRgaAYWU2Tk2DDKAFZGcg13xVD+pC9l2vlveV3hAnPm2NEUgykw8VTkpZ8
         RZ8utyZjd6ewavQ/YrL7dk2xMgD+TzlK89mLgr/3sm463LlgtczRdDB8lcafaSaOKauX
         mCl0AsgA4xbJvUK7nYeQUQsECt47ZTiQrV/dHBgv4sn9NQpa2ZescnLkNycAt2nr0p/L
         95TF17LlrVowCwXX2XX27cWDmgC3xj0QToaOAH0H9a73ILVVSGHdDFWFvtX7ppWfDn85
         m2W+KU58x9jFYIrdcsbTMNbFT+R19MtUoG2H7rAGOhZb9dpvX/fq8GW01UT0ubIsxTYp
         VoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409567; x=1781014367;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XCowtVnjKXnbcRNuimTNpT8EiRYTBtdlRiIVINQJ3g=;
        b=HM3bUqR5leBk1pKpJQrSizXMuf7ykw+z/wQC0Bzq9/QiDRubb7rWvq1rTNh2xsSA/K
         R3OoN+YUZFQClZIX5KYzqYk0EKfX8Oo0i5NG5dBh9gFzp/JMjsTUXLgHyAR1F49kd8MV
         pcjDqGCnqwf/fY4NWH2Z9UmGlcQVSnnkKMD+exAZZ4mUTDBb72GLz0SFe0n4G98dtjj3
         hE8EY+JeG8OjokClsWC+DBwumM8X6Q+Nc+p1RVhuIdN+CcUU1mnGwQ+08WcQjk3uvfZQ
         sWcfmUYeZyUgouJwmh3/7yIetmnX/a2SDo0bTmrHF0lxk2k9ua40F6o7hEPuK04/jSaY
         4hKA==
X-Forwarded-Encrypted: i=1; AFNElJ8Rh+V3I52Qo8js+kmfhY0cBxoN2q4cGbg3lN6Rz8NOX2Wn+WeNOZQUML6WOsuLLQYYqwU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo8/K5NOtoWD0xUbTa2Z9krIHXEPW723Z6/BCzMMGMZfx1FkBS
	IT+yv6mvmnInu74dzmRHpS7P0Qqy7DZwfSudrVB0GEFnUJTm3ITKUlEn
X-Gm-Gg: Acq92OHuCiiSZAMOV2ft4oF+4mR7uFZAUrMEtutAiVdQaXd7jwJdVGb1nRpBeHC0QJz
	U2XYImS7ck6Zivj53TqluMRKB2GF2VeDq8D/tDkzXaYuAKR1CCOJjBhpemzpnusAd/By7UZz6kt
	+uT0rsNXh5uu8J0E83u1x1Jx+BSNWamLCyq3b9HUDyGk9K618fwWHzoSzbIB/BEgRiANGcrZcU/
	nHXISJI3ssf/gNS5/LvLv86YY+57cVj0yh6lRqzACQhHlTfiwFkHbjl7x8G7vCeKMWhKDlMyyaF
	lfpoDDSI+BAKpO056QsSCkaLiO+faKL+T//VviIBE6xCqwuC7y8V+t0cuoHAruI3QWux5/mdhT4
	jDVxM5/p8oue17h1uk6EbWwClVfeBhbaN6SJ1f2NVzmDj65EH1l1HUSpy6sAsIH9J8GuqcYMZkJ
	E2ERdfqvl5yX8EFAFB8qE5V3u9CAI2IkHyICsulYBsNSZJtqvotIxZHYFINbO1Hsm+7C+ftD0ul
	+SC5jnfIKkODR/23NHj5RectD6h
X-Received: by 2002:a17:90b:3442:b0:36c:e254:4d5 with SMTP id 98e67ed59e1d1-36ce25410d6mr9832117a91.4.1780409567301;
        Tue, 02 Jun 2026 07:12:47 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd90415besm3601775a91.0.2026.06.02.07.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:12:46 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 02 Jun 2026 22:12:41 +0800
Subject: [PATCH] phy: fsl-imx8mq-usb: fix typec switch leak on probe error
 path
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-imx8mq-typec-v1-1-3debe9bc77d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIANjkHmoC/yXMTQ5AMBBA4avIrDWZdtHgKmJBTRmJvxapiLsrl
 t/ivQs8OSYPRXKBo4M9z1OETBMwfT11JLiNBoVKo0YleAzZuIrtXMgIhbW2spU5ooWYLI4sh29
 XVr/93gxktvcB9/0A33aWg3AAAAA=
X-Change-ID: 20260602-imx8mq-typec-20a6f1d1900f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
 Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780409563; l=2735;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=kpmGkkU11ecTwdVdTxlaGp+lNBsMTsb/Nj9af5UXA/A=;
 b=4YSIt8pCDNOFocdXGuAudSQFQldGYnUBr8V6MOtFtbIGLD00AcsWNSa6+B/Ptk3ul3742sf1P
 htOMmlEyovCCgKwh7yZxmffvwspM7qwRIj/dbKpNJgLdmX5jcRHNlr2
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

If probe fails after imx95_usb_phy_get_tca() succeeds, the typec
switch leaks because the only cleanup path was in .remove, which
never runs on probe failure.

Use devm_add_action_or_reset() so the switch is cleaned up on both
probe failure and driver removal.  The .remove callback and
imx95_usb_phy_put_tca() are no longer needed.

Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b05d80e849a1..8af5a4f85698 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -173,8 +173,10 @@ static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device
 	return sw;
 }
 
-static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
+static void tca_blk_put_typec_switch(void *data)
 {
+	struct typec_switch_dev *sw = data;
+
 	typec_switch_unregister(sw);
 }
 
@@ -248,6 +250,7 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct tca_blk *tca;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!res)
@@ -266,17 +269,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
 	tca->orientation = TYPEC_ORIENTATION_NORMAL;
 	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
 
-	return tca;
-}
-
-static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
-{
-	struct tca_blk *tca = imx_phy->tca;
-
-	if (!tca)
-		return;
+	ret = devm_add_action_or_reset(&pdev->dev, tca_blk_put_typec_switch, tca->sw);
+	if (ret)
+		return ERR_PTR(ret);
 
-	tca_blk_put_typec_switch(tca->sw);
+	return tca;
 }
 
 static u32 phy_tx_vref_tune_from_property(u32 percent)
@@ -739,16 +736,8 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
-static void imx8mq_usb_phy_remove(struct platform_device *pdev)
-{
-	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
-
-	imx95_usb_phy_put_tca(imx_phy);
-}
-
 static struct platform_driver imx8mq_usb_phy_driver = {
 	.probe	= imx8mq_usb_phy_probe,
-	.remove = imx8mq_usb_phy_remove,
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-imx8mq-typec-20a6f1d1900f

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71E34A78F
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016538; cv=none; b=notH31Fa/hLpZXHd0jyWq974lPLKBYE/BiebK7/0/xrr7c1AvT58MbzriSmUUSShHSZUnwFcQEEtm8H9f4aocS0dYCA5Ezb20REkyVjElm4wGFJP6EOWqT+/GTej5z3zHYfmYPB7ryw3Dq1AT/LkW3vzj8LRcpouNXCQ5qmTZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016538; c=relaxed/simple;
	bh=qLlRgnDvVIOGIOwv8hJ8MxfIWNVhS2goiG/w1fmsMUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E3Tvd/95rMgPU3dTw0hJwnQ8LZkivo0yoflCBr3FMC4FhNwMXjmZ5Lu7z3khH/UiRhZ01G0SQRxbcZjHpuK8qpJ7uOzwZ3YHy86HMxXAl/hEKDe9ktQOiHzW9QpxnW83dd6zkDSqt7zBKASuBt10B6NOO6RcG5/arXvh7yvVLDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRS6pG6z; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRS6pG6z"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8588f8fef3so2116478a12.0
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781016536; x=1781621336; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssQbrVnKF7op2GL5R9NuBDcc9CEDLMmM16A9tAh/aJY=;
        b=jRS6pG6zmrsHxZOwstzye2lzey7qVaHrVXfylFxSmDQ9dkitFRmThGZDTLG/Kr7Z+C
         rvNMqqtA7864IU1orNrbsVv2R1IGtMXE4SHRA1Xt4ylQ+YVFDLJBtmwaiix0yFD0+Jdc
         oI1eiZuSvOvQzp8mFZB7XxjDD2pqnSezd5OVOy3ijWnkqNVlhHPlBLAefYT4nOGX8Eem
         ltVK5sCoq9X1J5S7kKyQUA4xBmRzd077OukxCYczYFXoI+j3aWdq5Ru/UcJFKywK6kvT
         BD+vtLvq879EuY3gLbAZLTmTqCIazvuFwZnnwqUm9pir7EJ5ooKl7OQeGYHou3etg0xk
         OvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016536; x=1781621336;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssQbrVnKF7op2GL5R9NuBDcc9CEDLMmM16A9tAh/aJY=;
        b=DzPNEn/CR71KsiZRT70dD8JGKa9i/+aUmwxNFRJb3dOMFYHdi9VuXC8XCoeI6PHbet
         2z4Bauwbbxmpu6CMURsTHqTCcrpJCvySkDkLbWekE2Ayfb2tQDw5PbIEsMKAU+AKt+4J
         6S+z+EM55pbxM4Ckq+AykjLPYY9PCR0mLf0xbVWE/E0oQtNAx90FMsMtbu/gPFbAOZxR
         YiEFWNUGq1+dj4fpzOVepi/z2vBGIcKevY7Yi0Dl7SdOZeUXLD+6XC43hynTCHvffk5X
         z5ZA+fv8VOPZIt0UtqCrOeVL8UK2Gcu/TdIoZPCHpWNGPBFuSgxUDWXAeB4/TKqrSyTO
         /5ng==
X-Forwarded-Encrypted: i=1; AFNElJ+1czNkoEz70sLpUcXvAvaaO3vOfJN0yQrpCyCblRjCxW2prWK4hEjL7RdsjciUdlyJA00=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgHWs2IC0B1Oe3Mn7Axx15sekPClDAbALCVHWaR2lP05ceUUdL
	ca0UgKHClw2Chnkvhb4CE6IfpIJf7mPeakqzfYw8UilHnZ5fsXyjBN/q
X-Gm-Gg: Acq92OEDIVA+s+UFUBQI6KZJIK4gbc93YM9BiDNfeZgNfMb7X89Vjq5IZNxgFB0YhTu
	g0f5qVN4CMlZhLTHDFdAw52vp01TrhNe4mnsfbjm+zhR2IveLBRY0ekySBiffKs6BsWqRa4XIto
	hdBYONPwTrbtNiAbIIzWx6GQSj4BO7Q0jn+HwrzN/9qOVmI1dAjmE5LM2zPQY0+tEe/00d2OcH6
	Y3SRtj9M438RwZ0dRGGmbCGaLXqMt/hakOONP/4rcSgFatYNXNWamP5eOz7GHT8TpjmL+phDiwI
	nrgWHNU8/zBkxUrqwDILIuBVHpTEEbDsYWQs+OiTqseAWz6YMt/HXalfFbL/O4BduGAcX7oX2ln
	0TcYXTX6fMzBAXGksw3rtDo1NxT7TzaKpe8B6XDB6wfI2OQXc6OTzZPGWUuatOft2C+OMrC0sgO
	2odDAjsQcMvVOeIoisJY4z9k08vCIJ/k+wpMNSdq3n9NUcbVCiMdRVuFWguknXIWoXrofJGHN9D
	yLMVGwE/Mef+7vVBFH556HpZlSm
X-Received: by 2002:a05:6a00:b92:b0:842:5ad6:2d3 with SMTP id d2e1a72fcca58-842b0fbbe6emr22139626b3a.38.1781016536024;
        Tue, 09 Jun 2026 07:48:56 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm21143237b3a.0.2026.06.09.07.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:48:55 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 09 Jun 2026 22:48:50 +0800
Subject: [PATCH] phy: freescale: phy-fsl-imx8qm-lvds-phy: Use synchronous
 PM runtime put in reset
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-lvds-phy-v1-1-6ad790c6d0ea@gmail.com>
X-B4-Tracking: v=1; b=H4sIANEnKGoC/yXM0QpAMBTG8VfRubaaqTVeRS7YDo6EdhAt7264/
 NX/+wIwekKGMgng8SCmZY7I0gTs0Mw9CnLRoKTSUstCTIdjsQ6X0LkyuSkaZbsMYr567Oj8rqr
 6N+/tiHZ793DfD4YB1ZZsAAAA
X-Change-ID: 20260609-lvds-phy-6328389a2cf1
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sashiko <sashiko-bot@kernel.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781016533; l=1367;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=qLlRgnDvVIOGIOwv8hJ8MxfIWNVhS2goiG/w1fmsMUw=;
 b=IqL5DMF0Ti3kRukr5DGbKVt8A7KSEHSGptH6E67EIOU4j0g9Yu1SDjO7QRbcHOnrcXqMeHBzU
 PQpAdcIsTQLCXQP6Uhk/S0u3Lyo+gHKLtuX1gKBcIq7tpfUcFXUei0V
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The mixel_lvds_phy_reset() function pairs pm_runtime_resume_and_get()
with pm_runtime_put(). The asynchronous variant queues a work item
to handle the idle check and potential suspend, which can be cancelled
by a subsequent pm_runtime_disable() call if probe fails after the reset.

Switch to pm_runtime_put_sync() to run the idle check and suspend
synchronously.

Fixes: 06ff622d61d2 ("phy: freescale: Add i.MX8qm Mixel LVDS PHY support")
Reported-by: sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260605-lvds-v2-1-3ce7539d1104%40gmail.com
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
index ece357443521..e2a1645000ae 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
@@ -286,7 +286,7 @@ static int mixel_lvds_phy_reset(struct device *dev)
 
 	regmap_write(priv->regmap, PHY_CTRL, CTRL_RESET_VAL);
 
-	pm_runtime_put(dev);
+	pm_runtime_put_sync(dev);
 
 	return 0;
 }

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-lvds-phy-6328389a2cf1

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


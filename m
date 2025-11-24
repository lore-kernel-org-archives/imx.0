Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6722F7ABC
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763977829; cv=none; b=dYthbq6PC3/6oWRUud83NgC4zuEL7ZOaXlVSE2HMMZ0EmNTbBcy0kY3PGrUxaP4RghP/TGJJsu5oH/pseMkddfqDqCyRAflE/JLEnbo490EMTZ/IXQYUDJU8EMeWIwEz5EG3dBwwHvqS9Kcvn98HIu5dUJFRK8OF4vzM1FieknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763977829; c=relaxed/simple;
	bh=LnM3LOBKv3J1a/AItxebFeDH9yPOhm+/Li8DOR8PcFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mh+8051KY+X0Bqc2EiV+uf06R6Ypw6dKsTzEOK64velBZvfinIHhFxsaQi23wqtH6YA/0dRabip3MyEmcQ0dIZF3Gpv3v3SnN9cySzel7OALV0dEPJmNoiWQXL5aKwzi6ynzAtKlXV9CHTtq3iFfOox6z09UNVSKBMdvXC7b/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHLZrrw8; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHLZrrw8"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-644f90587e5so6280367a12.0
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 01:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763977826; x=1764582626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0DekikVpLnsKsiER1THEE6pO3XdOQLJ+lM0HCKbOyV8=;
        b=bHLZrrw8jQDDZxNzwE0HTcCoCcNZdNnUVK20qbMt2AECNDHjG6GCeQz3cx4QSfViOj
         5rlFsfF/qLRfb06TlEwTMUfBx+s6MivP2q3mnOJGLjj+oCeFmdCGJ4cP7mji7a+pUNsN
         /V+LV5kCMldHjbzJxfFzLuVcAi6WOuEZZZInw14Yrsl8XaKTXvbJc3Wiz2uswwsmoMCV
         DDGUd9FFum9gYNhAC7RLlEkKqrM13XV1nO96WwC9h+sHLyHTSLjtNBgUlE1rXWGUpeTe
         iIdG1ZLcRNaefx2QIVQu5JDZhbWAfRA1eFPLK0MMJ+UYL26v+rbrVrkvJPxuPGBRApBM
         Q+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977826; x=1764582626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DekikVpLnsKsiER1THEE6pO3XdOQLJ+lM0HCKbOyV8=;
        b=eR+qrYqR3daetIiDVBBCfR3ZXplMo5QsPNUCqr0WcEMLMK5MZgGUu7cDxM95pxPdJg
         XVQLLyxzC0I5EhWHkAIXV/7CX3d4KFnqspGNBLHPcWtY797E64SB/0UR46CE98SIr2SE
         SR3VyhFcCif4YBKxZiOFw8DFLOB3rH07gYYI/UNa0mmrvqmZKE2sjONt48yMir8CMCD4
         yvOVapWWtZKT63XokMITju/u7JtX3Nj5RCdMzN2rNJ+Fw/APN7S+bJbPk7VNVCB8Fv/7
         QoiAXBhGIjoMoZmUjthrf3JXiZ6rHbaJP1gT/CwQN2KHFJF0vxkzVvjYlSQBjSM/V8GF
         VXSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrdTov0FTjJwDm5eiJhJCB0N/oBRg0kKbAL6BejxkuUqEWN36tXUCO3o5xZ/fOAnHe9WA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJKCK0KphGCbd1TOEyo5S/PPwzxszAE2KZprnmvlnpi+RVaES4
	AA0EwIwHOFpUZtr83KZFlqgDRFbvFEqxhCRe6Kh+baDS/u4c95Bxxcca
X-Gm-Gg: ASbGncsm4Jus9mUOgpGNqv76X6sH3RXBPawc/op6XC9AA0OuWsefGaCTIoknNH/6Agi
	dTr2Rpww5GwN/6sro3RVIZT4Fks8xVivwb1IwOdAtxlOCNbg9mdkjL4mi/suS3OkZi8akF2wVtF
	aiATylVKMReEXifYoV5ap7fdg/aRrhy/DNjsR3s/A5w8LYdTiuPx6vIZeirLItBdKukM89B3bSL
	vPY5F+lTWvBc5HwebEMyjPauE5zHH/WBu0W1VmD+tkLW7JNg1OFwFaGT0OcgKlVJxCjhVl5wyR/
	yz6SpXhT/bZOYVJVf9cqO6pb9voompLX+GMrJ/ZxlhFv9hpuixoJalcirvECUicOP6tCOetBfdY
	mM1c/bMv7O9Txn7ruAag5rrhkKznCrWZnbFgiW0FLpyO+rEFqmxnwK5uQWY1qm4bZGnFA7HwkeV
	5ftO977r4xBcmp2rbzGfTLiqc6Sf2uraVz2L6cSzhZhuyjA4zcWLzVsj3PkKovf1AMiRgW6kahe
	wnaPge8IPfRtgSGNjTNsCo=
X-Google-Smtp-Source: AGHT+IEL8+nySp0VAycSYHZn+I7GwxBVv/UyrBmMEYYVlEgpR7XzCQyUy/x/1//vDbu/fyhX+j6fpQ==
X-Received: by 2002:a17:907:7f19:b0:b73:6534:5984 with SMTP id a640c23a62f3a-b767158cd57mr999143066b.16.1763977826184;
        Mon, 24 Nov 2025 01:50:26 -0800 (PST)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd5e0sm1309608566b.1.2025.11.24.01.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:50:25 -0800 (PST)
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
	stable@vger.kernel.org
Subject: [PATCH v1] phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
Date: Mon, 24 Nov 2025 10:50:04 +0100
Message-ID: <20251124095006.588735-1-fra.schnyder@gmail.com>
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

This patch replaces the preprocessor condition so that the orientation
switch is correctly registered for both built-in and module builds.

Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b94f242420fc..d498a6b7234b 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -124,7 +124,7 @@ struct imx8mq_usb_phy {
 static void tca_blk_orientation_set(struct tca_blk *tca,
 				enum typec_orientation orientation);
 
-#ifdef CONFIG_TYPEC
+#if IS_ENABLED(CONFIG_TYPEC)
 
 static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
 				enum typec_orientation orientation)
-- 
2.43.0


Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03444207DFE
	for <imx@lists.linux.dev>; Sat, 31 May 2025 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674671; cv=none; b=HADpXCXVoPx3cAWKWXOlHXshti5sJP/OqS0O6x/za9Mt1tZveuwoa2dX2yRKJt01pDm84zjbIvNrbfDaj0b4PZj4OofizMNW4vBnDJxHQ+Y2OfPQuXFF9Mu/VGWtY6vyA9eoMCpQtipRkyq/paiJscaPGmKGtqEs6yRUtvic7T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674671; c=relaxed/simple;
	bh=kzfikvqslmcNoM9cU44BoA71y4mZZRBxiPJC+FC3nqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tleUEVI4HmECAGXfaxc2XFqwROd5r9S2YmmvlpPOIowfeeMVFhupyNKo+UEM2vS5m4q3kNxh+h5tqQWnXMXMxKO6KFGb+NUoHmAVD6MDd33jwJLFNm7l42QLAvEQ1CQmthOg9yyLlcc790VKeGwcc8gF8p/dfefNNqJQBaGrZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKU1jTJE; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKU1jTJE"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-b2c40a7ca6eso2763426a12.1
        for <imx@lists.linux.dev>; Fri, 30 May 2025 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748674669; x=1749279469; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=204UNc2Wl3rmtEs6OGcSVTV/VNrUI6SdVkUZQOxQBr8=;
        b=UKU1jTJEOrtv6BvbeE4iZedIGRTb8WoOBQNAqQzpv2KM+TZzAqOf5fULj6PAYvY/cS
         bYCQKHH1diJqv2jLdJGOibQHz+t0Bh46DHP+9wGN1jRSzzd5ur2AhW9ssz/4pPvNrnye
         Eng2Ok7FURKgkgfWkZCnf6cStrWeV0UyvQGNcYOfM5r4sE5cQJ+lsO5Ya8olUQTtSMez
         8e8j0RFqDWIZ+lJPLuU4OxLbSpoXbQd54RsP3I5ldP19/1SM3J8FXtAx5oPe54J2gULd
         2AMgNY18RhEAmhuxS66k3TaG5B7f0Br6dk4xgBZopTiSVWWZAyZ/A3cK9P+1DgFboeCe
         Sbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674669; x=1749279469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=204UNc2Wl3rmtEs6OGcSVTV/VNrUI6SdVkUZQOxQBr8=;
        b=xNCckkG+MT55T7KsIEMK60mQ5HBkQMKfQn8Pn4EkjQq6kiqNLIlFBdRuIPuk0Y8HUG
         md0kr9NJ/4biEinYFHtxN7qFEopqZj0h5reAgN9oA38qAs2a4D8f1gHeNl0cN0ZHZBlm
         HWptFcsoJIlh6jMgF/vaM2qrmCmc9iFfy+qlU+Ko+3/VdLKASksRxEIiATyMg3gc04R5
         DVX9MR5aBptf8E0HFxkWVsLnEvH7Mu2wtnjPxh9xth/RXCSOmucYpeFpgjZayqQiqbYn
         Nkvx68gG+O45aOmwwX3kJiMg83XVG54/QsaWITPvS/FT1wmNUApqavAs3K1aQilnNguS
         PJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUV1GMheiPEzedcUeHHAOzFCLdSVtKCh/qa8zAkHEJVSkDY3wMxe/huyIobhQx+rjAm4Y8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMowilvDeGFad5CZ083YRH9Re12aNUlkIY/y5NiFaG4Cty9Qvm
	gSGphUg5+b0waptr2Vh/ZbUHPOK6QiUpWlE1ovxxOuGpLO+ZxlUdXj6wLQJTaCUuUD5f9Q==
X-Gm-Gg: ASbGncu1kUd/3fVdsVwnXfVIxe1SMOctyGzxVrJA49+gJAHwgrBO32F4N/SSs7rxZu1
	N26b5tnGFD8jwwYqjYxHodlF8vg6p/48ErHkJ1rur+BMyG9DNpDcWSYjCoymx88aN/TC/3fUfVq
	uk3LjaG18CCKHj3tkrtUKFNACoYcpALJmzNkF6t7+MLtHDy0CnLZTQ2DYEmt20Jk4Slo4x4U2f/
	enDlYJfBLKK21PtS6UtuRDuFxP8qfFGYCAA7nXaCeBSbEFlR2LqHV9L68IFl/W4hfna3vn/yu3z
	cttdsk1pmX1idKVDOePvOPlTxip1up9BSRw=
X-Google-Smtp-Source: AGHT+IFyM1uZ0Xpp3l9OJV7SKmrYyK0ZVxdW6vyRglphqDLVvMKdPGkWMU7FlfnGr4XgkK+hBC/f3A==
X-Received: by 2002:a17:903:289:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-2352920a1b6mr86911505ad.31.1748674669029;
        Fri, 30 May 2025 23:57:49 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5448sm37596625ad.185.2025.05.30.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:57:48 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sat, 31 May 2025 14:57:26 +0800
Subject: [PATCH v4 1/2] i2c: imx: use guard to take spinlock
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-i2c-imx-update-v4-1-bfad0c8fd45c@gmail.com>
References: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
In-Reply-To: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748674650; l=3153;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=kzfikvqslmcNoM9cU44BoA71y4mZZRBxiPJC+FC3nqM=;
 b=mSmDu4RPXx7Q/E/jz8U9/3TeqXi9A+CHJVNhbEnD/etxzCaQKeXuGPBn44QvPeKRfsEUAomxS
 RS7ibvc1PWlD2+I2WStej5tGgy79/YVJzveC6SOm9EFUHoN+iWAemox
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Use guard to automatically release the lock after going out of scope
instead of calling it manually.

i2c_imx_slave_handle() can safely be entered with the lock held.

Refactored the i2c_imx_isr function so that i2c_imx_master_isr
does not participate in the guard scope

So Using scoped_guard simplifies the control flow
by ensuring consistent and automatic unlock,
which improves readability without affecting correctness.

Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318..5b276e007292 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -23,6 +23,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -891,13 +892,13 @@ static enum hrtimer_restart i2c_imx_slave_timeout(struct hrtimer *t)
 	struct imx_i2c_struct *i2c_imx = container_of(t, struct imx_i2c_struct,
 						      slave_timer);
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
+	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	i2c_imx_slave_handle(i2c_imx, status, ctl);
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+
 	return HRTIMER_NORESTART;
 }
 
@@ -1125,32 +1126,26 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
-	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	scoped_guard(spinlock_irqsave, &i2c_imx->slave_lock) {
+		status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+		ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+		if (!(status & I2SR_IIF))
+			return IRQ_NONE;
 
-	if (status & I2SR_IIF) {
 		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
+
 		if (i2c_imx->slave) {
-			if (!(ctl & I2CR_MSTA)) {
-				irqreturn_t ret;
-
-				ret = i2c_imx_slave_handle(i2c_imx,
-							   status, ctl);
-				spin_unlock_irqrestore(&i2c_imx->slave_lock,
-						       flags);
-				return ret;
-			}
+			if (!(ctl & I2CR_MSTA))
+				return i2c_imx_slave_handle(i2c_imx,
+							    status, ctl);
+
 			i2c_imx_slave_finish_op(i2c_imx);
 		}
-		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
-		return i2c_imx_master_isr(i2c_imx, status);
 	}
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
 
-	return IRQ_NONE;
+	return i2c_imx_master_isr(i2c_imx, status);
 }
 
 static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,

-- 
2.34.1


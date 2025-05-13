Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8017D1EB19E
	for <imx@lists.linux.dev>; Tue, 13 May 2025 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118202; cv=none; b=nsE+vKhlTalbiJxTJG0G3l/wzojPDowx0HecPmRT3jPzmGT3wosOejAZxKN7212/zsCx8qahqgSTAsDQRluFy60vkzOFZN3vNcH3+/pLZDRGS2RfDljcp2ZfEyaHyUO/NY7+RhuLMM2/zc+Nq6xfVEDYelMtHjk5iK8cEK+UV40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118202; c=relaxed/simple;
	bh=h+IkIgCUvVv5X/EgaxFnbE68t9F1Ebt3Kltz7OM6R0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cU0TvejNxeHfWmV7W4qLolLg1syLWzxLm5maXvHEXU1HbAMUzqylIVHlJNlsr4/V89Gcy9PAAMJvEREPVumEBYKOWAQlidGQPeVk+6ZiB18vHEmXRZ/wXeEIcNViWfCa/TmknbLln9ln9tblZJ6RUjqPs3dGUqNgaFc6dJHV1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3XvQtk7; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3XvQtk7"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-74267c68c11so1609195b3a.0
        for <imx@lists.linux.dev>; Mon, 12 May 2025 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118200; x=1747723000; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/m+/Li5pJXxIfZ18YdvYQcc+JWVJfDghRV2cswxgso=;
        b=a3XvQtk7ilojtFVZYSN9/zS8mqFvaMGCG4PTWCT3wCL1Z08vRAvEZ9bReMOERUxU0w
         IXFGEt7sGp2ty3UsBewfJjmay2py7RKLv6W/207vgR0Ksk1JQjuCDio4IGoG9tudlg9z
         /jKCEII/sfty/+eBCEerJkLZo8W6SBd5fYi/M13Tu5DN/CTaEK1ZQCY6ymKh84frF81D
         SKzCg0eDWzmRoxJ60XmQwbpLbxRHqN77M624e6y/IHvcjYbHS2mx8d8WyE7NDm/ahVcV
         dqVDObD+J6QrnXHRHkZLRnNfU6cTe4IGFEr0+hG0sgC3uAYgi7T3uWSp/gmAbel7jJ0U
         MW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118200; x=1747723000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/m+/Li5pJXxIfZ18YdvYQcc+JWVJfDghRV2cswxgso=;
        b=VVKmBCaW4jWWVaGedXM7D0nt1eC5gIxEqYMyzzumlY+MqJjvGWFHcHXbkINyoSIjbK
         AjNrsUiVr411U9GLheUeDmMBfZBNSWR1v/1lq+z6hRt/WUS+552AfvdHAB5zajiFnSZs
         JcHiJM+E+OnRfwnfT1DfKgr5hEXs/S1XpkU/mnG2IojYBQ0u797Vr6Jcsq/P8wnV+ygM
         6feM8iFK+gtGJDuz1YCv3+JTQ9+xywQ4P/7TmWM9wwMlx3sQFJoEVYm2V0zKbnD4rcIR
         EsyYPSyH4N/krbQcSnaBs24G0uKudmyS1wwFLYymKL1Qt5qmuwL0BlynlH3qCwF3qWsV
         7G2A==
X-Forwarded-Encrypted: i=1; AJvYcCV2CbrW+qFwshkiHrMxyj9BRj9t4euh/UCmkpEJjLthxz+PV00Ga8w9V8b47nlCsfcMQsM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9a3oElrdvRv/BnuMQGMb4IHmh+Gh6nCjJ9IhQzqgDqoicA+d0
	MUy75TvJ4/ORfKsfBDydNaOaRCmjelb9U35R3B1rbGh7RpsrVRpG
X-Gm-Gg: ASbGncu//u1P0ez+OcMUuV3WHhfExDXT0B2ilHJD21xIV4mUEHTi658XmNz7E4bm9kK
	YnVswInM5lD9OJLIV6BwhTHQha1yp6XGuzhA8ZdoGJZPmCMTMSUGKljAW6Xfdv+hQQUqtc7bKxs
	y906aPhDISS/glyE9ylJyqi+J/R+XdL8BBY5vkEmf7Ic25+Iloacb0HNYEFzszKIRIL9D696XBd
	/sMPC+S9wlv/I+QW0cP7w7Js16nItyPRpgM2Sh3w8/eBCbkOlQWddQpxOp3S033tpqcW8qZsMpv
	PkbdULh6aq1GngXj1+wJODlVjM2Kzbg2xXOZ8gkVdts5du9NHvvizHI=
X-Google-Smtp-Source: AGHT+IGZ12WCZaO89aqysPWzb8ptQomhGLUKACz8fvPTEYceAq2R5hRP0UZ1mryvPQHCijtI5AB34g==
X-Received: by 2002:a05:6a20:7fa4:b0:1f5:83da:2f9f with SMTP id adf61e73a8af0-215abaf92e9mr22671112637.12.1747118199649;
        Mon, 12 May 2025 23:36:39 -0700 (PDT)
Received: from [127.0.1.1] ([91.124.30.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b76ccsm6657936a12.27.2025.05.12.23.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:36:39 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Tue, 13 May 2025 14:36:13 +0800
Subject: [PATCH v3 1/2] i2c: imx: use guard to take spinlock
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-i2c-imx-update-v3-1-817b7426a67e@gmail.com>
References: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
In-Reply-To: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747118187; l=3101;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=h+IkIgCUvVv5X/EgaxFnbE68t9F1Ebt3Kltz7OM6R0o=;
 b=GEBTx6+w7HdlyIV2HGzJrrowsb4WUjf9YUDMcusHX61zNyz4tZoMS2uN2u12UPh1FXB5/cVSC
 QhMiNEnbqgnAxvnM70de3VHUi8VKsRvt/VNeqwQ9jVbxs9ve176vtez
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


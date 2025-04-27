Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C486238149
	for <imx@lists.linux.dev>; Sun, 27 Apr 2025 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734586; cv=none; b=LgIvGdaODPE7bA4uEPKwxxeoAesDQYWEnRO+sKKq9PGUWz3ONjZyVP91GZPohVCMKo/9WsjurluRVJ9N5ofq5tx4lqejLWnIf8NFL61FZBUTkD0hqWj7++XiDUtaVrNwjGhMZg+n/sRB7ohKgleEBd8GcSTdT3lnAUfGDG+T8Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734586; c=relaxed/simple;
	bh=E1ouHhYW5PVDVuXzVF747nKwomAL6wn6Nilv3Ee5mas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2QWzK2Qu9uGBNJveN4mQaoZkiAXfBi52k35hUMkvm+3SPVxzY7NxhMf2kmK4tBVxjOYf+7A5o96ZC5A0ehkiWaaWmLKOhs8aKMsy5ko3gJpbHM1TDjZk2FTJqUrzfvTG8NGzonznD+/OUN1jY7Qz3EHRsv41uijGbf7I8uzUmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXcMWHlH; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXcMWHlH"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-3031354f134so3074126a91.3
        for <imx@lists.linux.dev>; Sat, 26 Apr 2025 23:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734584; x=1746339384; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU3GcwlVx1NDSs8nRLWvQptaTgy/PPey4t/ZeBvdCf4=;
        b=TXcMWHlH5gTifzNTIzqir0eZLB2EaG4nNU1Z7LhM+kxoTh4qlJmBDDCA5CvpEK8Oqe
         jfQB4WB3CUPYkNkY7JjtXm+bOd8XHmCIg14hVeMx2iZ8hlX89c9QUfkamQumPQKv4QUc
         ObI309VeEgKezEcGHnYxEIseBwBR21ktTuBmxbAHLh1xRA9OkC9dewyuZNFjPcztiwBc
         wJWG09JA4k+zax/5n6mRPROnWibXK9LrjWu2XqynyBg2tACwxjET0bkMvOcnxGfMVWco
         kjarxPnAJWALnlOPj7NQpjgVyA4SJmLH68PLm3ZLTq5equrjnGS48VUFtJa9WnOhbdc6
         2iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734584; x=1746339384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU3GcwlVx1NDSs8nRLWvQptaTgy/PPey4t/ZeBvdCf4=;
        b=j0oY1mNqRwXhjjDvrc3OdeFdRX+gCTyH+1kJ2JzDMXrTgEd/dD84HQtJPf0WOvwJFt
         NDvIeYXyvqfyNGIeXnSOYDEn99U1E+dXC1ixk1IXjQ8iGYNSbFKujWYHIzdi9MgLDNoh
         08RiXT580Z+wq4HYcoabALAiJ2TN6kpKrgr8SB+YqovMG1g/fJEIBGygI6V3srH3JHxf
         vrk5teBatOUHMYgezUKeKjRDyI+K+/kj7+79NnMvqRkLljtk2BnwnOlfQII7xkDsoxIw
         5u4GSto6a+YazfJ/ML0+TeK4Pcm2+FM8RJ5I1ClGrWJsoOys8AbNcM8W7Pm1NfjVYSmU
         IGkw==
X-Forwarded-Encrypted: i=1; AJvYcCVJFEbi3BE7rvgrVVrGXqnNNS9cYIdhUIYzogfg9EyHR9i34SoPAy2hhFV5MhJgaHWocsU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyX8jcPqzjBeIS/3dvkbk4eMyPQF6dnKBJb138gjtlKBSOS3l4V
	85AbFDrGf/rQvO5uivZEThdb5HzIUNJfDI0TDU3r5HQqi3h6+YMB
X-Gm-Gg: ASbGnctlfd9m9M5qcWzQRjT1vT6Rbdyxzgn8FD/9uJFsRLyKnLLuVlTP0Cel9p0xWF5
	kbtWZJ3FW1bY383zWZ2S7xzDzAjkF39HAOIiORSaTa7L4jBjtN+EqHaORHdJpQdlfaY3wZimV49
	8ZRky+fkMNxxLGbJXHtf8i68vD7mL1r2KjwETLwRUfrX7SXF6crY8VtY2V8rEemE6C2CJ3dRhoV
	M+hEY1ZOkooaJkFx7tKsleyIYWBw5WKdYwVMYGfWk02J5RQnLuRnAKkVrTfEqD3MQbwCLhIJ/UM
	5LixI/ewOmfAZOdKuBjHyEd3
X-Google-Smtp-Source: AGHT+IE3i6OjCQRWdv18uxdsodyVfMfSGch53emtn4PADO6a09T0tF9jjDHqnBrDwcUxVZwLyWkrPQ==
X-Received: by 2002:a17:90b:4f45:b0:2fa:228d:5b03 with SMTP id 98e67ed59e1d1-309f7ddd53cmr10233411a91.19.1745734583686;
        Sat, 26 Apr 2025 23:16:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d461sm5080287a91.39.2025.04.26.23.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:16:23 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 27 Apr 2025 14:16:09 +0800
Subject: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-i2c-imx-update-v2-1-d312e394b573@gmail.com>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
In-Reply-To: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745734572; l=3115;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=E1ouHhYW5PVDVuXzVF747nKwomAL6wn6Nilv3Ee5mas=;
 b=xfkTzhbIKjZVihZsGuN+Wiqoz3QU8UyXVphp6monpZqAVNl9kksWQe1ths3ySasDwYc/f6Dq4
 YzWT/UQnMRlB6Zefe3NjGRJCt+XV1q7GScMa4RCx+WxAvwDOXAvW01M
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Use guard to automatically release the lock after going out of scope
instead of calling it manually.

i2c_imx_slave_handle() can safely be entered with the lock held.

Refactored the i2c_imx_isr function so that i2c_imx_master_isr
does not participate in the guard scope

So Using guard(spinlock_irqsave) simplifies the control flow
by ensuring consistent and automatic unlock,
which improves readability without affecting correctness.

Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318..a98bf01c5dde 100644
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
 
@@ -1125,32 +1126,28 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
-	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	{
+		guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
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


Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E272580F2
	for <imx@lists.linux.dev>; Mon, 21 Apr 2025 05:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745213818; cv=none; b=myart3xguMj19Xcr6ZIn4OEMYyJm6AB14i0nf75jSQ+2YjCD4X1iuuifSMmSohvs0IDsmfVEdIDup+yTQZwoY4kDPVbdrIEJepyF7uZjaFC8O7bzsQqUUrDeH3lSnjaENhyLNGN85CEaD3DKEffOl6sgDq2p+0Un7VOXlvDRY7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745213818; c=relaxed/simple;
	bh=Set1fjuf1biaf2SuWAgg0znD5Dkrjnd4oyOs91sYddk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XymFWpNoO7HdojP150tcYZ2FsWffbzJiEAyt0XCABiety4ArX+jyfm4YsKl14L+wggBSwwg3EOR6fVYW8Y14HoFxSaETnvsIHyCxQLj1/kQO+2nnMYG2NcJBj76x/v5Hcz/evK0qiqS3sYI+zVBfl3skzYgnYShP3KVFnyLmPgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKctx6zR; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKctx6zR"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-224100e9a5cso42275635ad.2
        for <imx@lists.linux.dev>; Sun, 20 Apr 2025 22:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213816; x=1745818616; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSA5b1FEsUGzIuKxMEGaepPxh4bbazOZcDDU8ZWSGNA=;
        b=BKctx6zRDAwXl8TzrpTgDeyR6keA9WE2Csr605lqlklDxxIlJ6v5GNcHDsLvbtRAWE
         jvPmhQsDwLkNRQ1Y+150PDnRpPtf9JXlwyDZIxb+5aJhQNqItg8xVLwyhVQsPbsybdK3
         FvWh7NqJJkzRgM9QschHtzeMFkdqeWJRtXcnpiUjabBNnKiEb2BDVHQ5XLq/enKqhK9+
         k/dqHiKtejHyCvhEbKQj9t+eL5vNWww7mMs1ruEQYjKrihJ3kEs/C+0rU51aL6qsmeMb
         /jeRv11Mj7/aiHVEPCw8vJ8XjtpzKLyBZ7snHUtWn/hudEif2/fdIvBXyfCE90Pg6YHU
         zelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213816; x=1745818616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSA5b1FEsUGzIuKxMEGaepPxh4bbazOZcDDU8ZWSGNA=;
        b=riITlBzO73lkP8WaZjQXdbmzmAvrjrincrhrj7C/6qEw135nk82m4yn6eF0vYzLU7a
         Ub3BrLkbyg4qUa5w+XkTH/9ApJEnLpJKTq2UF/xRnDYVPxvXqBbqGu7mAMU7TxkmWrYE
         mHjJmuCGN8PuMyeGBBYKyQrfBVXINWE7ItdAwbsoYOmrDdOZXHc5wd6EkddwOKGGBjRr
         qLGbnhj27TOTDNOcV7Wyh8Effy+NZDb6I06Gy3/IT/TUaoDUoWHbYxcHlslj1tsva0ge
         IZVV+NV/vToc+ZrWNa6u6oO25zBYjmWJP00E7ZRvUEisVZosOLizBdv/Wo+99DgBCjp8
         vsyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+iay4aAs8Xi1UFVBLN7IftwU12UXuM2n49Ngw9PbDoPQaWCCwdXJ+Mp+w8SjKAmAVIRA=@lists.linux.dev
X-Gm-Message-State: AOJu0YymHaCVIYZc6ZBZF2Z8LdC0ZNZY6jRhVpiCAYmf7nmW5BMi0bq4
	xwTXgpDnze8Tnofvw3wuYBK1GmBICQVz/5e3o+XZjQPlVq+TQwt8lVTebcUf4/0mi1Gt
X-Gm-Gg: ASbGncvYVgmgKgh5oz+79NYrkWXpp3P6e09E2ATVnXoQxQK1nlu/pneDUbUr2D2j8Hn
	dtGnSm2WlpmU0E3+nopXLkqqNhDFQ17B0/FlIeTwCEM/AYh78U9+w1GB3oTjerOC2MZe8vPtH0n
	nIts6NKTKVCoX6raXKrpjyr1vE9P2e6Jso4+LjV3ZLiPNp+tQE+NnovRQ/LN43M2r7gdtj8jQz9
	TVPQvWR+UJOByf3WY2EMtWDd0OS5FCNA8JiWXqvc4TLYFXa24MKuqf55BJHE9GjtUGXF/S8Boyj
	dBOzc6WWuFTetTSu7l71h2mrlSCgPQYRf5w=
X-Google-Smtp-Source: AGHT+IFdvPVdGt6bGKOTEAZd0BvJShuSbJm+7EE2v5LaJ6enDyDnKAh0CiwtMffaCxTIlWx67pF8CQ==
X-Received: by 2002:a17:902:cf07:b0:220:f140:f7be with SMTP id d9443c01a7336-22c53601243mr174775625ad.41.1745213815840;
        Sun, 20 Apr 2025 22:36:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beaf2sm5634270b3a.5.2025.04.20.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:36:55 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Mon, 21 Apr 2025 13:36:38 +0800
Subject: [PATCH 1/2] i2c: imx: use guard to take spinlock
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
In-Reply-To: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745213806; l=2404;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Set1fjuf1biaf2SuWAgg0znD5Dkrjnd4oyOs91sYddk=;
 b=tEP6aUtRbhbNcn6p9VRzN+spiIyigQUd5XmgAGlJJju83zFNFwP1FbHiog/EELaoE+7jIMtv1
 HzZyFy6JtjXCJNVtNJGJRHL3XnOMgmh10UhQYJf2EgpnP3gz+4xhOf0
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Use guard to automatically release the lock after going out of scope
instead of calling it manually.

Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318..cb96a57df4a0 100644
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
 
@@ -1125,30 +1126,27 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
+	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 
 	if (status & I2SR_IIF) {
 		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
+
 		if (i2c_imx->slave) {
 			if (!(ctl & I2CR_MSTA)) {
 				irqreturn_t ret;
 
-				ret = i2c_imx_slave_handle(i2c_imx,
-							   status, ctl);
-				spin_unlock_irqrestore(&i2c_imx->slave_lock,
-						       flags);
-				return ret;
+				return i2c_imx_slave_handle(i2c_imx,
+							    status, ctl);
 			}
 			i2c_imx_slave_finish_op(i2c_imx);
 		}
-		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+
 		return i2c_imx_master_isr(i2c_imx, status);
 	}
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
 
 	return IRQ_NONE;
 }

-- 
2.34.1


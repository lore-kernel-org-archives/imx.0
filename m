Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504A83033CD
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427396; cv=none; b=Yfha4i+biCgiPGWHUCmPm93+tULfY5ryW6C4mdRhBRb8OEuyrfmwHj9U3qXeSxvAwaMlUc+0aRS6TBRz4AM/46Bge5j+yXXi0AASUcJTfLMQD+AUzNcrrsk6aZLp/MAy41BK4Y//M0p3BAb1gtSuWJCZ0hCpVbCH+LNWbDKHWJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427396; c=relaxed/simple;
	bh=nD2q10ThWeIvjvO9WzEUwgKZIjJ/JreIZj5OT5fabdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pET0M1acOJVvuSfejab2FwrU6tDmpBsn+2/ULPjDdm5kQKm+9jEQ49LdLr23/IHzoijpVBod2NbOpV6MZryKWFsGHPlgxSo1PFNKplJv8yMNZ/53OwGzPZAIn3/OXBG/EnA2vfo8TfUdNQdxeveRNzEDNoRHctVfgvDAd6YEXYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAiGfR/E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAiGfR/E"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48371119eacso51479165e9.2
        for <imx@lists.linux.dev>; Wed, 18 Feb 2026 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771427394; x=1772032194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiCCUrdk9XYqcbI+I7lzNNzu+GG7xW/ZdG+JQfCsf/M=;
        b=IAiGfR/EaCUa0gzuNkhDLyl5XYgcsepfYz+ipSZW0Jubjb6WDDWMzhR0a/O8mbQ4/Q
         vrSJfzxeq8qMAqQCE6xXhXhKgPf3P3c2ZymAHzJDECN8+5/2cyHyCO94ZbTivkx4Qk1C
         ZeeSUfozi5ZZmk6R4bOw07/PSeJAk1W08Xl7V39eS0SfOYAK8YOH0Z5ejVNBVw8yjKSQ
         x+m+x7g47rrIYWOg5xL+MNycRSe71H3r+O6LyxOzsuHTvqrLeLig2B+2gP2Lrn97RKhi
         xfe+A9zwWYQEn7od6265Ao8xMPcw68IAojqPqoSch4k8HdVHI6rBpFu9Df24QQVsWOyc
         LkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427394; x=1772032194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YiCCUrdk9XYqcbI+I7lzNNzu+GG7xW/ZdG+JQfCsf/M=;
        b=qnsRV8oOO7gtNxNSHz8lY61icH7dc3xj+f3ly1oSs/wB7Gdc4C4vWCdK9CfeRBL62S
         zAIltthMFSVzrU1JnTLFMh5Q7xDl7dBL/XQAbWNWjGVA9Zi9HZybb+d2CgDdRT8kksQh
         3QZmx/7ZY2lAA51QpbqUNkJ5iH9ITlnd/rc48Ae5Tdrep47OFuwLQBRmZbjM73fHhnlJ
         Df4itnk5/+YLj0c/b7Bd5OXxerUJWSyKmGcBAZ2gbPHEfLsuFr3hlv6s1EqhrSIvINDq
         C/SFMZyPMyWWPr3NyVuiJBZ+NkG7/hjp9a3GIhBZoBVNyMTpwVM3LqlAep10cZC950Cv
         iYkg==
X-Forwarded-Encrypted: i=1; AJvYcCVpUzt420WiN9iXy3j676dyEXgb43RV3zS7vCCO1SrtMI3gag1nzEU+w/cO8eypqnUafIw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmqUOXs7JWdBuIRvlLTHjmXhpOUdeFkSyxcDLo3CUQZEv1fkWV
	yMqTY5zGR84U3fBNiG1hmde4vxlbmWBkTAW5EU+Q5sN9waLnRNWrYch0
X-Gm-Gg: AZuq6aKW2O7Is5vgcjnSTMmwnG9wSVhf7Qbq5CEym9E1oS2M89Dc6G4dUfOx6jBhS1m
	N4x+tp+8NNrjMX2xxisXFcuvTHcSq66E03qAdRMTPuU4GgJvq75QCzmbZ88jUF6TGVUVNkAi3Pz
	BSnUSnrQV38emjfglMG7VMqgu6IptqqdKUAi/UKqzeBqwXqXBEWWSKA7K0732AvGPLQqRtPHT0j
	leDnd0saqsmFrLmhzTJVHc41GhvT1SkAbpb90IGJCvyhmJ6PzUQgVzzu6K4IV3S2u4o6RZCaXhf
	BzrbTEzfrwGGhd+EztuaIk+57NVIY6r0lQxsr5VCQu61ASprE75NAdjB8zGqw0lVj0HMXbbRS/y
	job/ttPoznY7Tu7uTfQqZqfn45edvpPB71rorp/IZg4Ntg6Cd6awy/L7j8CHoQfBnETbcUIe7+d
	em65V5PYOpEhoxBOxSCPQY4pZfcXxrGLnZWIkZi+01LUNZaX160RK65cKGDPZ92wcr9pF4w9q+0
	rp0rRRo9ffSR5JW4/38pMGZ8Fa6InreVM4MNeyGO9i3+JQ=
X-Received: by 2002:a05:600d:13:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4839b4c7242mr20986195e9.5.1771427393465;
        Wed, 18 Feb 2026 07:09:53 -0800 (PST)
Received: from eichest-laptop.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm44333116f8f.26.2026.02.18.07.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:09:53 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] i2c: imx: ensure no clock is generated after last read
Date: Wed, 18 Feb 2026 16:08:50 +0100
Message-ID: <20260218150940.131354-3-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260218150940.131354-1-eichest@gmail.com>
References: <20260218150940.131354-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

When reading from the I2DR register, right after releasing the bus by
clearing MSTA and MTX, the I2C controller might still generate an
additional clock cycle which can cause devices to misbehave. Ensure to
only read from I2DR after the bus is not busy anymore. Because this
requires polling, the read of the last byte is moved outside of the
interrupt handler.

An example for such a failing transfer is this:
i2ctransfer -y -a 0 w1@0x00 0x02 r1
Error: Sending messages failed: Connection timed out
It does not happen with every device because not all devices react to
the additional clock cycle.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 51 ++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 56e2a14495a9a..452d120a210b1 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1018,8 +1018,9 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
 	return 0;
 }
 
-static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
+static inline enum imx_i2c_state i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 {
+	enum imx_i2c_state next_state = IMX_I2C_STATE_READ_CONTINUE;
 	unsigned int temp;
 
 	if ((i2c_imx->msg->len - 1) == i2c_imx->msg_buf_idx) {
@@ -1033,18 +1034,20 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 				i2c_imx->stopped =  1;
 			temp &= ~(I2CR_MSTA | I2CR_MTX);
 			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-		} else {
-			/*
-			 * For i2c master receiver repeat restart operation like:
-			 * read -> repeat MSTA -> read/write
-			 * The controller must set MTX before read the last byte in
-			 * the first read operation, otherwise the first read cost
-			 * one extra clock cycle.
-			 */
-			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
-			temp |= I2CR_MTX;
-			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+			return IMX_I2C_STATE_DONE;
 		}
+		/*
+		 * For i2c master receiver repeat restart operation like:
+		 * read -> repeat MSTA -> read/write
+		 * The controller must set MTX before read the last byte in
+		 * the first read operation, otherwise the first read cost
+		 * one extra clock cycle.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_MTX;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		next_state = IMX_I2C_STATE_DONE;
 	} else if (i2c_imx->msg_buf_idx == (i2c_imx->msg->len - 2)) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 		temp |= I2CR_TXAK;
@@ -1052,6 +1055,7 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 	}
 
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+	return next_state;
 }
 
 static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
@@ -1088,11 +1092,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 		break;
 
 	case IMX_I2C_STATE_READ_CONTINUE:
-		i2c_imx_isr_read_continue(i2c_imx);
-		if (i2c_imx->msg_buf_idx == i2c_imx->msg->len) {
-			i2c_imx->state = IMX_I2C_STATE_DONE;
+		i2c_imx->state = i2c_imx_isr_read_continue(i2c_imx);
+		if (i2c_imx->state == IMX_I2C_STATE_DONE)
 			wake_up(&i2c_imx->queue);
-		}
 		break;
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA:
@@ -1490,6 +1492,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 			bool is_lastmsg)
 {
 	int block_data = msgs->flags & I2C_M_RECV_LEN;
+	int ret = 0;
 
 	dev_dbg(&i2c_imx->adapter.dev,
 		"<%s> write slave address: addr=0x%x\n",
@@ -1522,10 +1525,20 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 		dev_err(&i2c_imx->adapter.dev, "<%s> read timedout\n", __func__);
 		return -ETIMEDOUT;
 	}
-	if (i2c_imx->is_lastmsg && !i2c_imx->stopped)
-		return i2c_imx_bus_busy(i2c_imx, 0, false);
+	if (i2c_imx->is_lastmsg) {
+		if (!i2c_imx->stopped)
+			ret = i2c_imx_bus_busy(i2c_imx, 0, false);
+		/*
+		 * Only read the last byte of the last message after the bus is
+		 * not busy. Else the controller generates another clock which
+		 * might confuse devices.
+		 */
+		if (!ret)
+			i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx,
+										     IMX_I2C_I2DR);
+	}
 
-	return 0;
+	return ret;
 }
 
 static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
-- 
2.51.0


Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C662158A37
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052064; cv=none; b=Vxc0kn1RVQmDiWtK/01XR1V+uZpZ/X0q/sKHESj55Mt/FSADo3eXbpyvUhde6pQjomFkrOj1H9S7QqdNFsrYQm0YWZsJDCCr1bTJgeTn9ZiPHWzR8L/9UGyw3MtJFAbxNoPYA924DNZZkq0AEEpefqk+akA1AGOVVgSa3Koto/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052064; c=relaxed/simple;
	bh=jdMp61VUNYVrRInDbNTwUxcE9tIGxOf/1oKR7InLrBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFngjTRZaFZpUH7FjkXA58wFhVyoq9e6MY0XAkSUYvsLEjlc8YxP1LxpQtf5R0DbZnc9t4wlKZVnskfbyUN5rKdfW1Gz5VEjo+7d71FGAWzLLQs1L08dJFZGMjkfY/TBxtW9s7knUxTRZcuTxv62xKtZ0Y9yoLlOlOqnVlWR18w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJPuFZk0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJPuFZk0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so31576995e9.2
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 00:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724052060; x=1724656860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3KBKn3hIbLkJ8gmSmq/aXjtvTfK2PXz6B1ifBMJ1p0=;
        b=HJPuFZk0i3hJ19eiRgrSyJY5aREMTmK9ewZ/0yLI1X2fPrzNbU1b1wr+DYXiBCrrHi
         7N5QbmQuk2TQIxe2bZ3J8sLTfVSQ+u2uBoBu6uuOK/9sqnERBdafUXAzlLVkSC9A0hNU
         0heTNyZX7l+sR0rRuiiVH6op64M9BCtbiGgwR1Q68G5Jgzf0A3EHMbicGtFMIH71/Ls5
         oYzuXKyeE+0lagRR3yLBZKCRpAHvaBdG9H6kJ76o/53tdUAlZCPTiYE+/pKFnT7/2MLb
         mevadrf1p45U0eKOLYo7o3CfAxqx4gozR2WryZqI/nlPGUgu+q89EiJbBOQ8Q95HtEoR
         wTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052060; x=1724656860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3KBKn3hIbLkJ8gmSmq/aXjtvTfK2PXz6B1ifBMJ1p0=;
        b=YQ9fvlCn/EEWQLIOhUwh4PY5HmwNT5dwnuXKyNMz8El9tu9etP9ez1Tibi2yUofbgL
         k/GA9HWezu/boMSw7IgndtPzvqQArE/pvbWJX74BQ8aPeaUV9WXz54L2wJdnBWe/Wkrw
         PP7tHCgXDIzFpoZu56yLnqw39/q3kIFMtLf0qm8pQxKvPZFTc3G4sSPPm7+OIbmduam5
         o+8hhQomjDQ2I9HfWtjLIpC1Y4WAdki0UNhksB70aRZni6PpAYdrPtwHhyHkjO+BZglt
         NqG/G2igNTdMdH7RCPlm2BT2wyk9jHZPhEnZpuhWzOQdluiOsgdJfFBut1YQWfQ8Ibdy
         QDXw==
X-Forwarded-Encrypted: i=1; AJvYcCU7OR6dowCGRemclURL4TTnUwdY5C29zEVn4Ojv2hkqtZuBrGK1puSqQ/Ivl5//jK4xfDCDtR/Gc7uWaJqz4zRUqkr+
X-Gm-Message-State: AOJu0YxVED2HxVe4XHyRB3ckpeps017tW3Z6hk770qS2AOlnJzwUv/JS
	4vP27NkJwKe9VpLKseijV2PjMth6r4nDSjOq3/4uk/6WwUz2g/uW
X-Google-Smtp-Source: AGHT+IFHou7AqNMYqGK1AFINyHHTYuraj99mHsJJCq3yavVqfhxDw/w57fjfl96ZeDyeOzrnB4yzNg==
X-Received: by 2002:a05:600c:350b:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-429ed7d1ec1mr89135405e9.29.1724052060202;
        Mon, 19 Aug 2024 00:21:00 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896a9csm9683734f8f.79.2024.08.19.00.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:20:59 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v2 4/4] i2c: imx: prevent rescheduling in non dma mode
Date: Mon, 19 Aug 2024 09:19:10 +0200
Message-ID: <20240819072052.8722-5-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819072052.8722-1-eichest@gmail.com>
References: <20240819072052.8722-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

We are experiencing a problem with the i.MX I2C controller when
communicating with SMBus devices. We are seeing devices time-out because
the time between sending/receiving two bytes is too long, and the SMBus
device returns to the idle state. This happens because the i.MX I2C
controller sends and receives byte by byte. When a byte is sent or
received, we get an interrupt and can send or receive the next byte.

The current implementation sends a byte and then waits for an event
generated by the interrupt subroutine. After the event is received, the
next byte is sent and we wait again. This waiting allows the scheduler
to reschedule other tasks, with the disadvantage that we may not send
the next byte for a long time because the send task is not immediately
scheduled. For example, if the rescheduling takes more than 25ms, this
can cause SMBus devices to timeout and communication to fail.

This patch changes the behavior so that we do not reschedule the
send/receive task, but instead send or receive the next byte in the
interrupt subroutine. This prevents rescheduling and drastically reduces
the time between sending/receiving bytes. The cost in the interrupt
subroutine is relatively small, we check what state we are in and then
send/receive the next byte. Before we had to call wake_up, which is even
less expensive. However, we also had to do some scheduling, which
increased the overall cost compared to the new solution. The wake_up
function to wake up the send/receive task is now only called when an
error occurs or when the transfer is complete.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 257 ++++++++++++++++++++++++++++++++---
 1 file changed, 235 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccb466c50f598..aa0c99ac7cf7f 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -197,6 +197,17 @@ struct imx_i2c_dma {
 	enum dma_data_direction dma_data_dir;
 };
 
+enum imx_i2c_state {
+	IMX_I2C_STATE_DONE,
+	IMX_I2C_STATE_FAILED,
+	IMX_I2C_STATE_WRITE,
+	IMX_I2C_STATE_DMA,
+	IMX_I2C_STATE_READ,
+	IMX_I2C_STATE_READ_CONTINUE,
+	IMX_I2C_STATE_READ_BLOCK_DATA,
+	IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
+};
+
 struct imx_i2c_struct {
 	struct i2c_adapter	adapter;
 	struct clk		*clk;
@@ -216,6 +227,12 @@ struct imx_i2c_struct {
 	struct i2c_client	*slave;
 	enum i2c_slave_event last_slave_event;
 
+	struct i2c_msg		*msg;
+	unsigned int		msg_buf_idx;
+	int			isr_result;
+	bool			is_lastmsg;
+	enum imx_i2c_state	state;
+
 	bool			multi_master;
 
 	/* For checking slave events. */
@@ -908,11 +925,150 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 	return ret;
 }
 
+static inline int i2c_imx_isr_acked(struct imx_i2c_struct *i2c_imx)
+{
+	i2c_imx->isr_result = 0;
+
+	if (imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR) & I2SR_RXAK) {
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		i2c_imx->isr_result = -ENXIO;
+		wake_up(&i2c_imx->queue);
+	}
+
+	return i2c_imx->isr_result;
+}
+
+static inline int i2c_imx_isr_write(struct imx_i2c_struct *i2c_imx)
+{
+	int result;
+
+	result = i2c_imx_isr_acked(i2c_imx);
+	if (result)
+		return result;
+
+	if (i2c_imx->msg->len == i2c_imx->msg_buf_idx)
+		return 0;
+
+	imx_i2c_write_reg(i2c_imx->msg->buf[i2c_imx->msg_buf_idx++], i2c_imx, IMX_I2C_I2DR);
+
+	return 1;
+}
+
+static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
+{
+	int result;
+	unsigned int temp;
+
+	result = i2c_imx_isr_acked(i2c_imx);
+	if (result)
+		return result;
+
+	/* setup bus to read data */
+	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	temp &= ~I2CR_MTX;
+	if (i2c_imx->msg->len - 1)
+		temp &= ~I2CR_TXAK;
+
+	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
+
+	return 0;
+}
+
+static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int temp;
+
+	if ((i2c_imx->msg->len - 1) == i2c_imx->msg_buf_idx) {
+		if (i2c_imx->is_lastmsg) {
+			/*
+			 * It must generate STOP before read I2DR to prevent
+			 * controller from generating another clock cycle
+			 */
+			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+			if (!(temp & I2CR_MSTA))
+				i2c_imx->stopped =  1;
+			temp &= ~(I2CR_MSTA | I2CR_MTX);
+			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		} else {
+			/*
+			 * For i2c master receiver repeat restart operation like:
+			 * read -> repeat MSTA -> read/write
+			 * The controller must set MTX before read the last byte in
+			 * the first read operation, otherwise the first read cost
+			 * one extra clock cycle.
+			 */
+			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+			temp |= I2CR_MTX;
+			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		}
+	} else if (i2c_imx->msg_buf_idx == (i2c_imx->msg->len - 2)) {
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	}
+
+	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+}
+
+static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
+{
+	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+
+	if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
+		i2c_imx->isr_result = -EPROTO;
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		wake_up(&i2c_imx->queue);
+	}
+	i2c_imx->msg->len += len;
+}
+
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)
 {
-	/* save status register */
-	i2c_imx->i2csr = status;
-	wake_up(&i2c_imx->queue);
+	switch (i2c_imx->state) {
+	case IMX_I2C_STATE_DMA:
+		i2c_imx->i2csr = status;
+		wake_up(&i2c_imx->queue);
+		break;
+
+	case IMX_I2C_STATE_READ:
+		if (i2c_imx_isr_read(i2c_imx))
+			break;
+		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		break;
+
+	case IMX_I2C_STATE_READ_CONTINUE:
+		i2c_imx_isr_read_continue(i2c_imx);
+		if (i2c_imx->msg_buf_idx == i2c_imx->msg->len) {
+			i2c_imx->state = IMX_I2C_STATE_DONE;
+			wake_up(&i2c_imx->queue);
+		}
+		break;
+
+	case IMX_I2C_STATE_READ_BLOCK_DATA:
+		if (i2c_imx_isr_read(i2c_imx))
+			break;
+		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA_LEN;
+		break;
+
+	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
+		i2c_imx_isr_read_block_data_len(i2c_imx);
+		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		break;
+
+	case IMX_I2C_STATE_WRITE:
+		if (i2c_imx_isr_write(i2c_imx))
+			break;
+		i2c_imx->state = IMX_I2C_STATE_DONE;
+		wake_up(&i2c_imx->queue);
+		break;
+
+	default:
+		i2c_imx->i2csr = status;
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		i2c_imx->isr_result = -EINVAL;
+		wake_up(&i2c_imx->queue);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -959,6 +1115,8 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	struct imx_i2c_dma *dma = i2c_imx->dma;
 	struct device *dev = &i2c_imx->adapter.dev;
 
+	i2c_imx->state = IMX_I2C_STATE_DMA;
+
 	dma->chan_using = dma->chan_tx;
 	dma->dma_transfer_dir = DMA_MEM_TO_DEV;
 	dma->dma_data_dir = DMA_TO_DEVICE;
@@ -1012,15 +1170,14 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 }
 
 static int i2c_imx_start_read(struct imx_i2c_struct *i2c_imx,
-			       struct i2c_msg *msgs, bool atomic,
-			       bool use_dma)
+			       struct i2c_msg *msgs, bool use_dma)
 {
 	int result;
 	unsigned int temp = 0;
 
 	/* write slave address */
 	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
-	result = i2c_imx_trx_complete(i2c_imx, atomic);
+	result = i2c_imx_trx_complete(i2c_imx, !use_dma);
 	if (result)
 		return result;
 	result = i2c_imx_acked(i2c_imx);
@@ -1058,7 +1215,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	struct imx_i2c_dma *dma = i2c_imx->dma;
 	struct device *dev = &i2c_imx->adapter.dev;
 
-	result = i2c_imx_start_read(i2c_imx, msgs, false, true);
+	i2c_imx->state = IMX_I2C_STATE_DMA;
+
+	result = i2c_imx_start_read(i2c_imx, msgs, true);
 	if (result)
 		return result;
 
@@ -1139,8 +1298,8 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	return 0;
 }
 
-static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
-			 bool atomic)
+static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx,
+				struct i2c_msg *msgs)
 {
 	int i, result;
 
@@ -1149,7 +1308,7 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 
 	/* write slave address */
 	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
-	result = i2c_imx_trx_complete(i2c_imx, atomic);
+	result = i2c_imx_trx_complete(i2c_imx, true);
 	if (result)
 		return result;
 	result = i2c_imx_acked(i2c_imx);
@@ -1163,7 +1322,7 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 			"<%s> write byte: B%d=0x%X\n",
 			__func__, i, msgs->buf[i]);
 		imx_i2c_write_reg(msgs->buf[i], i2c_imx, IMX_I2C_I2DR);
-		result = i2c_imx_trx_complete(i2c_imx, atomic);
+		result = i2c_imx_trx_complete(i2c_imx, true);
 		if (result)
 			return result;
 		result = i2c_imx_acked(i2c_imx);
@@ -1173,19 +1332,40 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return 0;
 }
 
-static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
+static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
 {
-	return i2c_imx_write(i2c_imx, msgs, true);
+	dev_dbg(&i2c_imx->adapter.dev, "<%s> write slave address: addr=0x%x\n",
+		__func__, i2c_8bit_addr_from_msg(msgs));
+
+	i2c_imx->state = IMX_I2C_STATE_WRITE;
+	i2c_imx->msg = msgs;
+	i2c_imx->msg_buf_idx = 0;
+	/* write slave address and start transmission */
+	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
+	wait_event_timeout(i2c_imx->queue,
+			   i2c_imx->state == IMX_I2C_STATE_DONE ||
+			   i2c_imx->state == IMX_I2C_STATE_FAILED,
+			   (msgs->len + 1)*HZ / 10);
+	if (i2c_imx->state == IMX_I2C_STATE_FAILED) {
+		dev_err(&i2c_imx->adapter.dev, "<%s> write failed with %d\n",
+			__func__, i2c_imx->isr_result);
+		return i2c_imx->isr_result;
+	}
+	if (i2c_imx->state != IMX_I2C_STATE_DONE) {
+		dev_err(&i2c_imx->adapter.dev, "<%s> write timedout\n", __func__);
+		return -ETIMEDOUT;
+	}
+	return 0;
 }
 
-static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
-			bool is_lastmsg, bool atomic)
+static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
+			       struct i2c_msg *msgs, bool is_lastmsg)
 {
 	int i, result;
 	unsigned int temp;
 	int block_data = msgs->flags & I2C_M_RECV_LEN;
 
-	result = i2c_imx_start_read(i2c_imx, msgs, atomic, false);
+	result = i2c_imx_start_read(i2c_imx, msgs, false);
 	if (result)
 		return result;
 
@@ -1195,7 +1375,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	for (i = 0; i < msgs->len; i++) {
 		u8 len = 0;
 
-		result = i2c_imx_trx_complete(i2c_imx, atomic);
+		result = i2c_imx_trx_complete(i2c_imx, true);
 		if (result)
 			return result;
 		/*
@@ -1226,7 +1406,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 				temp &= ~(I2CR_MSTA | I2CR_MTX);
 				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
 				if (!i2c_imx->stopped)
-					i2c_imx_bus_busy(i2c_imx, 0, atomic);
+					i2c_imx_bus_busy(i2c_imx, 0, true);
 			} else {
 				/*
 				 * For i2c master receiver repeat restart operation like:
@@ -1257,10 +1437,43 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return 0;
 }
 
-static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
+static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 			bool is_lastmsg)
 {
-	return i2c_imx_read(i2c_imx, msgs, is_lastmsg, true);
+	int block_data = msgs->flags & I2C_M_RECV_LEN;
+
+	dev_dbg(&i2c_imx->adapter.dev,
+		"<%s> write slave address: addr=0x%x\n",
+		__func__, i2c_8bit_addr_from_msg(msgs));
+
+	i2c_imx->is_lastmsg = is_lastmsg;
+
+	if (block_data)
+		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA;
+	else
+		i2c_imx->state = IMX_I2C_STATE_READ;
+	i2c_imx->msg = msgs;
+	i2c_imx->msg_buf_idx = 0;
+
+	/* write slave address */
+	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
+	wait_event_timeout(i2c_imx->queue,
+			   i2c_imx->state == IMX_I2C_STATE_DONE ||
+			   i2c_imx->state == IMX_I2C_STATE_FAILED,
+			   (msgs->len + 1)*HZ / 10);
+	if (i2c_imx->state == IMX_I2C_STATE_FAILED) {
+		dev_err(&i2c_imx->adapter.dev, "<%s> write failed with %d\n",
+			__func__, i2c_imx->isr_result);
+		return i2c_imx->isr_result;
+	}
+	if (i2c_imx->state != IMX_I2C_STATE_DONE) {
+		dev_err(&i2c_imx->adapter.dev, "<%s> write timedout\n", __func__);
+		return -ETIMEDOUT;
+	}
+	if (!i2c_imx->stopped)
+		return i2c_imx_bus_busy(i2c_imx, 0, false);
+
+	return 0;
 }
 
 static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
@@ -1334,14 +1547,14 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			else if (use_dma && !block_data)
 				result = i2c_imx_dma_read(i2c_imx, &msgs[i], is_lastmsg);
 			else
-				result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, false);
+				result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg);
 		} else {
 			if (atomic)
 				result = i2c_imx_atomic_write(i2c_imx, &msgs[i]);
 			else if (use_dma)
 				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
 			else
-				result = i2c_imx_write(i2c_imx, &msgs[i], false);
+				result = i2c_imx_write(i2c_imx, &msgs[i]);
 		}
 		if (result)
 			goto fail0;
-- 
2.43.0


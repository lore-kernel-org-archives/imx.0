Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450286;
	b=KIdM0AAJtuU+71fEWARtz0Gi6h5fsPa3S71LldC8DUJvepv40dGqcGcWAtkUc3Dd9Czr
	 VqAUEAPA2nTEEYYE6qOBdZ61zOybhEZiYfFEOBZQmKHpWEq8yJ+nkilT9lAqt9hCcFPH0
	 qCy8zmy9z47AiBfx89wJr3AHRYRgJCgoqx1VI6nq+LR2qLmotMnFPDqydcyoYHKMCKQzv
	 0Rp+Ou3+Ti8w6EUaB8uy6MubbT7UiA/MuUYYzTyPvjsIAEnm4BEe0baC/y2VG3i2JlwfN
	 M7nLxOOVrnv2C9oWJrhyafHGlJvwdbIuFW7ayt1cPn7/bsDsmhJnsxB6FesFGnAH1tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=maS1TlQtTNtCaHJfozZuk+FUqQKZG+g+AwgR3S2V5EU=;
	b=UyYSLl2vf6eJ3/Qbsdq3vry1J1H5OdM/gHL8kgzWNfoFj0EYWl6J0lgtwGHY17m6Tawa
	 VybIBaIta1CA9Fs/k9QOoIDP9AqXxuPEw8XiM11OJhOFG4ncamnDp2OcXv8rMPElYgIbK
	 /TYH7t33PwHo82Cyb8O+O1bYZR3CdXcOFeNmddB665QLfhIkU91sS2F40aE+JHfWZlcAH
	 D+pCdOeIkrbbRQdoeximzySFgkb5qhpvPgj3oj01uQ3voDg5QCfXJofkJet18DWIXG/zz
	 zr6asDIQ/UzCKs+sKzIg2ChiXdfsO/FYc9GPSeJkaeSjRj/AM/9bebnpJxLKydXE26w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD1fuB3z;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A47606A31A
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 12:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A47606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD1fuB3z
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae18eb9b69so911627c88.0
        for <imx@lists.linux.dev>; Sat, 31 Oct 2026 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450285; x=1794055085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maS1TlQtTNtCaHJfozZuk+FUqQKZG+g+AwgR3S2V5EU=;
        b=oD1fuB3z1JlKgDu9G7kX2PRtxRemjNQyhFB0R0duEoq+m6rtAbI//DX6D59ntk/ogH
         C9XYgU9QSxEwtNGBpnWUUvRu9YycQpSuufCq5WzCgASxqlb6MggBdkCfuOmXppj24Ecw
         3XTJ9bcNmWc1NCPjEbW0b54Jfb/ZXlCQ8ZQ4E88anpKT+s6Lfilr50GXU5dxUfRkFcTt
         LpwlLTNbqtJzAzDZOHus3/cuKbBCkPLaXP4Nie101h1QDBySY3WJ5mSmHM8j+krFwKEL
         YTl6kEblWJk+9OBI5efFjRGZW3Qqq+wiO8CZioFVdS+7bNAon1YQ80k44Q1vsC1t9iiS
         8kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450285; x=1794055085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=maS1TlQtTNtCaHJfozZuk+FUqQKZG+g+AwgR3S2V5EU=;
        b=urUFFghOpW/eNk0idKhhBr09ZsWTEa2s998NqpMM6lqBAp2qi68UlcnkyEIQw+csIJ
         IlYovILZ+JT8UgRAIFzj0QC2hU32EWjjIQYhH1fWMnIAwXDvSaTt0xsZzTo5CXs2suHj
         FVhkC8wmX1Wkh1AE+bTfTyAvKDunIZb0gfVrTWGNOnPEL1eSZNvaSEPAXN47Ip9MU/Yf
         0mAJzoEqLcjv2jdIbvmhvZtU1aOxTL38ALkRyFex/yU52syon8d+kKLCZOagFdo8kx7u
         IaqM4W07wBO79wA00jgnD1wkzSGOMnO/Q5y7xaFean/u0syeMSM4a0t4YT5YgWFZIXSs
         mbLg==
X-Forwarded-Encrypted: i=1; AKwUvBx2hE9ubrs+D9/GYw39wwfPQ+6VTkk7Jb4xnJ+MdtbB4ha/dYWK7JAa10zuOvvq5wFNpiY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKZKNUnjzLruVGWU4lkJGKWva981iAZtInEKFDyOC5vrQ8mKz0t
	XZep2On2FjGR4zoQgr3vwqr0dAWkwN/Mn92QowqiT6NLd2lUHFXqIIps
X-Gm-Gg: AYBFou1nN5BxCJY7VBDNVUg2aNs3e854Dq3Msx3dVkhXkDwJGsiiy0mhHPPr7UM/53h
	aTJHKm3XI9Awa7N4uLpUBeNMCdtVvDnqaBVZNirCZlbLMY7oQKSLsgcLPI6izARWf8cKrq0acXC
	Dp3xFm+b8ctAeNOQklaDnx+sK9wRaFTHMMCo7sT+R81uCSD6X4aA7peiuEhY8XUl/wrXwTpiU84
	l+iFCqAD5lnckUlCKgwD767hew+95tXY430UMleMx9a3tlOWR8GBhnbs7mvXCMqxYVGHrIPh/6b
	/boGHhT3pWvDZpAPcYaoo8Fz31vtcPBuRniVGUeS/nrqR0Ey2RpoR4ZfOMCKV5vgfZJ8n/Ip2os
	tEglzugImEgXkYobONUuPMokVQkBLBK7uTSPhV8vxmXLRDagVEuwztzOjmO4k5wsl7eVi6YHDNX
	D3fL/1LJ9iWrf+zxgsVhU81RHgUnFobxy1XYb+HYwQuB819qImRKddqvGjc7cQHfP+BCJRpO+oN
	F1n4IhCSB93x3IQ8Ow7nK83zXXO0pVTBPb/mY4aO/64P3L8hnAaeodQrqaF62AFE6Pswalws3kL
	PSn0/yY+JcLD7SYyuR29UQeW6sMQgXuWQzELYMHxY5ENyUMGdB0wh+mSA0yB3h3Zt8x9ggRT4FH
	7cbhRPk5189wqsyDhYeIlkBm5D02g4hOOU/7PJgnVrAizFW1OzlglVj7EaxLcqsTxoCIgJzvwFX
	58Jb3sInePOOhVUF/xU8zptt6lj4B0ElvxKTI=
X-Received: by 2002:a05:7022:3a03:b0:152:9e88:daaa with SMTP id a92af1059eb24-1ac5f181628mr8313206c88.36.1793450284992;
        Sat, 31 Oct 2026 05:38:04 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm17300763c88.17.2026.10.31.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:38:04 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] tty: serial: fsl_lpuart: don't unmap TX buffer before DMA has stopped
Date: Sat, 31 Oct 2026 12:37:49 +0000
Message-Id: <20261031123749.3783352-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123749.3783352-1-samarth.colleges@gmail.com>
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
 <20261031123749.3783352-1-samarth.colleges@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpuart_flush_buffer() unmaps the TX scatterlist before calling
dmaengine_terminate_async(), allowing eDMA to continue reading from the
buffer after its mapping has been released. Reversing these operations
would not be sufficient, since asynchronous termination does not
guarantee that DMA has stopped and dmaengine_synchronize() is required
before releasing memory accessed by the descriptor.

The issue can be triggered through TCFLSH(TCOFLUSH), hangup, or close
while TX DMA is active. On systems using SWIOTLB, outstanding DMA reads
may access a bounce slot that has already been reassigned to another
device, potentially transmitting its contents over the serial line.

Since flush_buffer() runs under the port lock and cannot sleep, request
termination there while keeping the scatterlist mapped and
dma_tx_in_progress set to prevent reuse. Defer unmapping to a work item
that first calls dmaengine_synchronize(), have the TX completion
callback ignore flushed transfers, and ensure that shutdown and suspend
wait for the work to finish before resetting the TX DMA state.

Fixes: 6250cc30c4c4 ("tty: serial: fsl_lpuart: Use scatter/gather DMA for Tx")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/fsl_lpuart.c | 53 +++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index c8575c965203..8343351199eb 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -26,6 +26,7 @@
 #include <linux/serial_core.h>
 #include <linux/slab.h>
 #include <linux/tty_flip.h>
+#include <linux/workqueue.h>
 
 /* All registers are 8-bit width */
 #define UARTBDH			0x00
@@ -280,6 +281,8 @@ struct lpuart_port {
 	unsigned int		dma_tx_bytes;
 	unsigned int		dma_rx_bytes;
 	bool			dma_tx_in_progress;
+	bool			dma_tx_flushing;
+	struct work_struct	dma_tx_flush_work;
 	unsigned int		dma_rx_timeout;
 	struct timer_list	lpuart_timer;
 	struct scatterlist	rx_sgl, tx_sgl[2];
@@ -530,7 +533,7 @@ static void lpuart_dma_tx_complete(void *arg)
 	unsigned long flags;
 
 	uart_port_lock_irqsave(&sport->port, &flags);
-	if (!sport->dma_tx_in_progress) {
+	if (!sport->dma_tx_in_progress || sport->dma_tx_flushing) {
 		uart_port_unlock_irqrestore(&sport->port, flags);
 		return;
 	}
@@ -558,6 +561,36 @@ static void lpuart_dma_tx_complete(void *arg)
 	uart_port_unlock_irqrestore(&sport->port, flags);
 }
 
+/*
+ * flush_buffer runs under the port lock and can only request termination.
+ * Unmap the TX scatterlist here, once the terminated transfer and its
+ * completion callback are known to have finished.
+ */
+static void lpuart_dma_tx_flush_work(struct work_struct *work)
+{
+	struct lpuart_port *sport = container_of(work, struct lpuart_port,
+						 dma_tx_flush_work);
+	struct dma_chan *chan = sport->dma_tx_chan;
+	unsigned long flags;
+
+	dmaengine_synchronize(chan);
+
+	uart_port_lock_irqsave(&sport->port, &flags);
+	if (sport->dma_tx_flushing) {
+		dma_unmap_sg(dmaengine_get_dma_device(chan), &sport->tx_sgl[0],
+			     sport->dma_tx_nents, DMA_TO_DEVICE);
+		sport->dma_tx_flushing = false;
+		sport->dma_tx_in_progress = false;
+	}
+	/* As in the TX callback: no restart while shutdown waits on dma_wait */
+	if (!waitqueue_active(&sport->dma_wait) &&
+	    !lpuart_stopped_or_empty(&sport->port))
+		lpuart_dma_tx(sport);
+	uart_port_unlock_irqrestore(&sport->port, flags);
+
+	wake_up(&sport->dma_wait);
+}
+
 static dma_addr_t lpuart_dma_datareg_addr(struct lpuart_port *sport)
 {
 	switch (sport->port.iotype) {
@@ -605,12 +638,16 @@ static void lpuart_flush_buffer(struct uart_port *port)
 	u32 fifo;
 
 	if (sport->lpuart_dma_tx_use) {
-		if (sport->dma_tx_in_progress) {
-			dma_unmap_sg(dmaengine_get_dma_device(chan), &sport->tx_sgl[0],
-				sport->dma_tx_nents, DMA_TO_DEVICE);
-			sport->dma_tx_in_progress = false;
-		}
 		dmaengine_terminate_async(chan);
+		/*
+		 * The transfer may still be reading the TX scatterlist: keep it
+		 * mapped (and dma_tx_in_progress set) until the flush work has
+		 * synchronized the channel.
+		 */
+		if (sport->dma_tx_in_progress && !sport->dma_tx_flushing) {
+			sport->dma_tx_flushing = true;
+			schedule_work(&sport->dma_tx_flush_work);
+		}
 	}
 
 	if (lpuart_is_32(sport)) {
@@ -1760,6 +1797,8 @@ static void lpuart_tx_dma_startup(struct lpuart_port *sport)
 		goto err;
 
 	init_waitqueue_head(&sport->dma_wait);
+	INIT_WORK(&sport->dma_tx_flush_work, lpuart_dma_tx_flush_work);
+	sport->dma_tx_flushing = false;
 	sport->lpuart_dma_tx_use = true;
 	if (lpuart_is_32(sport)) {
 		uartbaud = lpuart32_read(&sport->port, UARTBAUD);
@@ -1926,6 +1965,7 @@ static void lpuart_dma_shutdown(struct lpuart_port *sport)
 	}
 
 	if (sport->lpuart_dma_tx_use) {
+		flush_work(&sport->dma_tx_flush_work);
 		if (wait_event_interruptible_timeout(sport->dma_wait,
 			!sport->dma_tx_in_progress, msecs_to_jiffies(300)) <= 0) {
 			sport->dma_tx_in_progress = false;
@@ -3179,6 +3219,7 @@ static int lpuart_suspend(struct device *dev)
 				writeb(temp, sport->port.membase + UARTCR5);
 			}
 			uart_port_unlock_irqrestore(&sport->port, flags);
+			flush_work(&sport->dma_tx_flush_work);
 			sport->dma_tx_in_progress = false;
 			dmaengine_terminate_sync(sport->dma_tx_chan);
 		}
-- 
2.34.1


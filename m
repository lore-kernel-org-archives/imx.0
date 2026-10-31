Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450282;
	b=IGqvwt1ViaDOL9kiCzhO19Yfy4v9Op8cbQ8tMbZVRmlK/kRZIgjuQi4cPov4qbMzy7SC
	 pAfBDx8Da80Igxcp+B7Uw1zwQYxFR5lQtsaWx/6G9kLIqkW2Mwzi7uC/Tx76EcNzq/oTd
	 8gSwyQlD7n1vouE5013vwWA1KUv9P51txHIUjlIPeZOiC7bgI+hyN9kNowKWN5XMCFW06
	 XOz08XPAVUMcffRK+497R5/sq5BSe7yodHXi4ZiOzeeAMXYtkqA+KC2AxjI+c5Ewdy6Uz
	 zFPgLoWO5bKYc2zRWxq9rzUSiSw0DuW+6G+voVTzlvku094Aa5wU5oV1HzGyBUfa1Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hF93A2swUvHoNDKG9XcYGoRrUhQY3sGOfHMmfcGcHo0=;
	b=fqgwCZcS9tB4hUk/DcqEng3x6STUJHB47itbZYpRDBkwozTGki5P3XbQlbTQW/ank8Fm
	 v8tcUwTvaezegJERSoWy94FHvssRN/ghEHQHconNhnwxgHkA6BhwMrx9jLlscRZY/U9Q0
	 stIMpmyQUx+Pd2yRmiHTwDRItZYC7urc1nP3uRveAMS3+vySPtHSgZItI5TgX8kNSdout
	 mwg4zr4Pdq6wuX1c8XJnXgyJojRsW5UhV4WJR+i97aFBPIRW+gO8g/mTlWzbcz6+Sdpkq
	 011AsRk3IXHT3X6zthoaxLs4CBX9F6M5UaKMgWYmiM0xwphMu2lK5xmxZTYH4Lny2Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3ydzjC+;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F86606A31D
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 12:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F86606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3ydzjC+
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1846bc43c28so1845246c88.0
        for <imx@lists.linux.dev>; Sat, 31 Oct 2026 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450280; x=1794055080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF93A2swUvHoNDKG9XcYGoRrUhQY3sGOfHMmfcGcHo0=;
        b=i3ydzjC+yG9yqWUyFm45nWNf7E0ziF7tumehmqyVRRV61watp0gTy0MxjYaBWNvsGa
         T5DxTCe9ArcjpGfJDU/lYg2amAqdbbm3L6sYjkrNlt2z2wEYgdVeSGk98U3WHqph0b3a
         0Nw94grTcyww9tm9a24SzHLNzSNBrcmMJ8pbRJ6fBdhXpf4fnVDtGrSAWhq/4PLkBryJ
         zEbLGVu1kO5o9/40X/l4HOULh2ktQ+LYf9tJEXIEVuw+xJceBxKq10N8+pVHqadWywxU
         NidN7hNgXjM6Dn9M0SfNq9NEHjjd86LLSJAdIvlINaZhScHCFGZOemx72FfNDfsyVX/i
         SJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450280; x=1794055080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hF93A2swUvHoNDKG9XcYGoRrUhQY3sGOfHMmfcGcHo0=;
        b=tO57fANmdx1JH2hZntlvkrutHshFMelRUU02RYPg+BrhExNVMO96UtnejHgqZ40W14
         WGJ2zfeuF/U0xSf7TAx8dwdyZx22puQCluHJGJnwx0gWBh3niVoV5dn1CPWvSKde0+R7
         vWElnfIgefvBQv/FynJyoAeia1MJy8DRIRZdnbmrNWZ+atVMepMke2gCc5mML08kdVmV
         9RC4TUJYgf0JdYPHaTZCCVIwxdyuCGjPaKv+l5c6XXJBBAaJEog4BcYB9Dfp7qyRNyci
         0IGjiVHEnTW66RzKNrn6iavM2qaI1RmmJ2mHol4HnvctlI6Gr5OnBn8DcB8IDpVTVPJz
         V4gw==
X-Forwarded-Encrypted: i=1; AKwUvBwvnEMS9W/vAqU2j5IGhiOUIi4+QKPSGjC83BQ0Jq9A++T5b6L7n5HGOkSDf1CNiszki5o=@lists.linux.dev
X-Gm-Message-State: AFq9FYK79Cgx9bKQfniw8pDvxH88qtyhCgxKSKZzAyMqKBw3guMOLs4/
	ozBvd3Pq931KXaBuuKvuwEeyUZsCPAfW9M6AwkA96wPEGNVAleepLG1pzbNASF02Ay0=
X-Gm-Gg: AYBFou3Tw4nLVYlfCs8gI8ycKR2UY1uP4NGXKBmnTpQXzLgSXTUuHtnH8Nr3S9B+7d4
	my8XH+nNazpaIzdeYte89otuT8mOmY03t37mR6CsI15K80VHupIUq9yjRGgrfKy7mVpJoGjuiYk
	NX6cDfPtHIvw/pBgq68RBZWCUgrufDlChHfvI6Ru2jHLkAN2qkXyZ8RaQQCDzQppsbsE3ZvTuT3
	yXiV1vYXqc6mvuO2Wb71gSHzEvJvyQ3hC+sKOLc5Gg5ffYfhd9/Y6GEj4FK88v68PmAhcbRk6XC
	6mC13/R+RK9MxEv2HAwlOE5A+UA0UvWHrr8ljq63HbGqejB46xPGzVNHcdYkEroeoxn1aAuDri5
	5Qzc36Ew/xompnBs13QYDguWQwJmZOY+rTcGp3x2XS42aaF5VYitv3RBIXdMgdFmQqCY/xdK8BA
	dsrJq1cMdVlhmyRy8gfrXANc5odR4yu+W2mgM+FqtvlGO5DB/6n3UTxsYR7aDssX44fb2MXCcRb
	GLrXHH2YNvg7pb1nPDRL3/WRKLsBJu5cvpcqxB6cc1v8vP67N34mlg+/MzM1A0F8SEsY486GSIu
	DJG/mmIn9tmCw58S5j60O2EFd2Ulea6pVqoqJ85y5XseQERG/1oqkRV0b5apQV377tw63ZB5E5M
	+93KRKiTRDiOWcEWz1UzwumKd6/VjEE46prtIkEEBtx+/8qR+8WCe/RbzkauqGhJEDKDdkAhtjC
	3zrvLptY1iaFXC+Q==
X-Received: by 2002:a05:7022:5f15:b0:1af:d691:1b4f with SMTP id a92af1059eb24-1afd6911cf7mr850231c88.42.1793450280250;
        Sat, 31 Oct 2026 05:38:00 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm17300763c88.17.2026.10.31.05.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:37:59 -0700 (PDT)
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
Subject: [PATCH 1/2] serial: amba-pl011: keep the flushed TX buffer mapped until DMA stops
Date: Sat, 31 Oct 2026 12:37:48 +0000
Message-Id: <20261031123749.3783352-2-samarth.colleges@gmail.com>
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

pl011_dma_flush_buffer() is called with the port lock held and currently
unmaps the TX buffer immediately after requesting termination with
dmaengine_terminate_async(). Since asynchronous termination does not
guarantee that the transfer or its completion callback has finished, the
DMA controller may continue reading from the buffer after its mapping
has been released. Commit f6a196477184 ("serial: pl011: Fix DMA
->flush_buffer()") introduced asynchronous termination under the port
lock, but did not add the required synchronization before unmapping.

On systems using an IOMMU or SWIOTLB, outstanding DMA reads may access
an IOVA or bounce buffer that has already been reused, potentially
transmitting data from another mapping. On systems without either, the
outstanding transfer may instead race with the next refill of dmatx.buf.
This can be triggered by flushing the TTY while TX DMA is active.

Since flush_buffer() cannot sleep, defer the unmap to a work item that
calls dmaengine_synchronize() before releasing the mapping. Keep
dmatx.queued set to prevent buffer reuse, disable TX DMA requests, and
let the work item restart transmission if data remains pending. The
completion callback leaves flushed transfers for deferred cleanup, while
shutdown waits for the work to finish before tearing down TX DMA.

Fixes: f6a196477184 ("serial: pl011: Fix DMA ->flush_buffer()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 54 +++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index e6f652905ca6..863a050cf654 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -41,6 +41,7 @@
 #include <linux/sizes.h>
 #include <linux/io.h>
 #include <linux/acpi.h>
+#include <linux/workqueue.h>
 
 #define UART_NR			14
 
@@ -302,6 +303,8 @@ struct pl011_dmatx_data {
 	size_t			len;
 	char			*buf;
 	bool			queued;
+	bool			flushing;
+	struct work_struct	flush_work;
 };
 
 enum pl011_rs485_tx_state {
@@ -609,6 +612,12 @@ static void pl011_dma_tx_callback(void *data)
 	u16 dmacr;
 
 	uart_port_lock_irqsave(&uap->port, &flags);
+	if (uap->dmatx.flushing) {
+		/* pl011_dma_tx_flush_work() retires the flushed buffer */
+		uart_port_unlock_irqrestore(&uap->port, flags);
+		return;
+	}
+
 	if (uap->dmatx.queued)
 		dma_unmap_single(dmaengine_get_dma_device(dmatx->chan), dmatx->dma,
 				 dmatx->len, DMA_TO_DEVICE);
@@ -867,13 +876,47 @@ __acquires(&uap->port.lock)
 
 	dmaengine_terminate_async(uap->dmatx.chan);
 
-	if (uap->dmatx.queued) {
-		dma_unmap_single(dmaengine_get_dma_device(uap->dmatx.chan), uap->dmatx.dma,
-				 uap->dmatx.len, DMA_TO_DEVICE);
+	/*
+	 * The terminated transfer may still be reading dmatx.buf: keep it
+	 * mapped, and queued set so that nothing refills it, until
+	 * pl011_dma_tx_flush_work() has synchronized the channel.
+	 */
+	if (uap->dmatx.queued && !uap->dmatx.flushing) {
+		uap->dmatx.flushing = true;
+		uap->dmacr &= ~UART011_TXDMAE;
+		pl011_write(uap->dmacr, uap, REG_DMACR);
+		schedule_work(&uap->dmatx.flush_work);
+	}
+}
+
+/*
+ * flush_buffer runs under the port lock and can only request termination.
+ * Unmap the flushed TX buffer here, once the terminated transfer and its
+ * completion callback are known to have finished, then restart TX.
+ */
+static void pl011_dma_tx_flush_work(struct work_struct *work)
+{
+	struct uart_amba_port *uap =
+	    container_of(work, struct uart_amba_port, dmatx.flush_work);
+	struct tty_port *tport = &uap->port.state->port;
+	unsigned long flags;
+
+	dmaengine_synchronize(uap->dmatx.chan);
+
+	uart_port_lock_irqsave(&uap->port, &flags);
+	if (uap->dmatx.flushing) {
+		dma_unmap_single(dmaengine_get_dma_device(uap->dmatx.chan),
+				 uap->dmatx.dma, uap->dmatx.len, DMA_TO_DEVICE);
+		uap->dmatx.flushing = false;
 		uap->dmatx.queued = false;
 		uap->dmacr &= ~UART011_TXDMAE;
 		pl011_write(uap->dmacr, uap, REG_DMACR);
+		if (!uart_tx_stopped(&uap->port) &&
+		    !kfifo_is_empty(&tport->xmit_fifo) &&
+		    pl011_dma_tx_refill(uap) <= 0)
+			pl011_start_tx_pio(uap);
 	}
+	uart_port_unlock_irqrestore(&uap->port, flags);
 }
 
 static void pl011_dma_rx_callback(void *data);
@@ -1177,6 +1220,8 @@ static void pl011_dma_startup(struct uart_amba_port *uap)
 
 	/* The DMA buffer is now the FIFO the TTY subsystem can use */
 	uap->port.fifosize = PL011_DMA_BUFFER_SIZE;
+	uap->dmatx.flushing = false;
+	INIT_WORK(&uap->dmatx.flush_work, pl011_dma_tx_flush_work);
 	uap->using_tx_dma = true;
 
 	if (!uap->dmarx.chan)
@@ -1236,6 +1281,9 @@ static void pl011_dma_shutdown(struct uart_amba_port *uap)
 	if (!(uap->using_tx_dma || uap->using_rx_dma))
 		return;
 
+	if (uap->using_tx_dma)
+		flush_work(&uap->dmatx.flush_work);
+
 	/* Disable RX and TX DMA */
 	while (pl011_read(uap, REG_FR) & uap->vendor->fr_busy)
 		cpu_relax();
-- 
2.34.1


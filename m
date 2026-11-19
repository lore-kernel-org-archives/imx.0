Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095753;
	b=h2B6o5KDPa9VTIMbrlMp9TzZ5/mCAAzzC9gSxrEa4VGLxNtLKlPrfMcV6MAkqMnkmkwE
	 xsNr7So0Kzsu5vt9Yc9mGos+vLriC3jPIofHy/1XkYJaCkCxNaJuQl9L8XY60C8vAM2Bo
	 7YoHe2daE8mr5Xm5lGCE6+ez+wEhQohMPXCdvtz1LbrIs+yLDSieMPM9ORvH2CdOfXzcY
	 zkupCo25+P80d0N4f9SZ5pXI8Bi97OKcsxGaX9h3vQgVY15nJoBqf75Bye3qaAiKrO7PT
	 stWcBUpHmM0TZdmrmLKTqdxMV2kH6Xkk8eP4YrsEiavEKxbF+HAFDo+uW4A78CSJPAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bV4UJVZ9NL/7DCp8HEJshTGUvYsQkJNidhWUdfBTaSM=;
	b=GLaOqA64GUOnZtiBrgcs4GzFLPYK5Y6MwF14KLHUGjwF/3RTw09C88czoCShMiOzttoh
	 UZDV4qn+WNcg16OEjVCjsUW7mXMEJA1qir0s4FtNCdafsD+Q0JuPCUTZwmh+rnCGDy1ty
	 nESscvTae2LlUXqAYPiFEr2ZKriRmeDOmpBF33WdEfijTyVG0nSR5XuQioQyuALfYneEK
	 54G9OrMk3XkizaBpox5RhalSYvD3QrAmr5WdR8XodrcusZx+J/v2nkLyUQOVQvnUex6C/
	 gruS6IXpbVurYEwxj6wjkeVhhE4MgdiBRn/yhIEnSKUomGkldW1CXTyf9eKYK2uKnRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Os4rszHb;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F160A3813
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 13:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 623F160A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Os4rszHb
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490f38e9688so788776f8f.0
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095751; x=1795700551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV4UJVZ9NL/7DCp8HEJshTGUvYsQkJNidhWUdfBTaSM=;
        b=Os4rszHbvLEm2AH7RO7NvuqY2Fc+/mbioRcRR7FHJve26Ku3J1sMHfJJ6nl70EKZ8K
         cRiGEpE6Bw55VIs2AgwuZ0lrACEVxKTZI3FCzxwX1xpw64ionPUUSrCr8a0ZoJoyQKsB
         U/pJjwtTG99AIeQ3aNx2CukqkWlBYUyWg29IRxVZzjsWQQ2ZfAFNQRy9roVetQzTEsIm
         gXS6EJ4cH6d0dIlhMZ1YS0iKKy95KmW6fH5LJmiZycjku/GEauWnpElglIggYH1KO8OR
         4jqJtCNPApwcHTtGHR1PTVMpLZkYvQExrRWB5829ajWrzC2wp4HXKXxKfXTPNQzcleRg
         IpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095751; x=1795700551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bV4UJVZ9NL/7DCp8HEJshTGUvYsQkJNidhWUdfBTaSM=;
        b=UpW7Lp39EJQ55QzZesud58ovOVZvbQBXMENsBEfkBIEUFqVDhkqSMm3IhmYJ/SNCYJ
         WT67ouLL8qaBklGr7ujz3/MI0eEOwtdbtLPsmN0dotaPN1MKkRsog2K7+ep+Se0L+I/M
         N81V5KDXmnbPG5sW6flEiSdbKNpkfrHjIs6gbKzUixxOsllc7EKwNqSfueJjz06sR1Ax
         YnH8wxMjAkmua7Z3QvYGDL05R4IBFWkrraFZDVAMhFP2lowljIV7HeDU8cIjq662nfim
         a+e97x4LUhbbRG5aXIfLUoNA91ZcpLWjpXsKsf8Qsol5jHYoeeWvNwFR+FN881Ic2qJI
         lUHQ==
X-Forwarded-Encrypted: i=1; AL+hErHuY3tO0IAIblBu4ep4n1naaC9QsQs4FGft52PxFaiwYQPhH/UTpd/uFNx8HSPZ4CoUlI0=@lists.linux.dev
X-Gm-Message-State: APuU4Z9hgDKMlafTUIQZdXo349frksxeOM94JjTc5C1GxEhHhl9TKoBx
	n3urIq4LylJ2Oc7sm8VNow/JSl9FMIXAKk13ZJVt3txVI7fS7h3CnI7G
X-Gm-Gg: AZFdTZfBM1KrNFsjTU8FlRX8N4sgSE53ZB5MHtBLivWkrIRHPPPL1bNJOcrBbDdcCcz
	R0njePuK2NtD/tz1UHJzdIoW7hP3ZMRWYB/OvyuKr1mRLYQbgT6HpFraL8SG1d1Ee6w7BLMiZRw
	6A9qHHE0CApTYb3UV8ffn/jf2kk/imiS9Ym2x/SD1gSQGRfJ+QK6OkY6XMorYVDMDiIRFDGhiMr
	8Zoi+jDXNXS35z8coEAnVHfmVF0lLwCwEclzVI3cPEBEhB9Kc3Yo59ajRZ9p0oGu7vbUY+uznjm
	mmHRtH4HXksYoi705W8dAtHvq5iMWfcZba5odmUH6Z6XwgCNuxwwn/Gwik/XYTn4/cFSaO3e4H1
	BLBPv0Lvw3c1ivZgWwgIYbhh+p40rXA6bhyVPXpTOV6GKxMp2XM2zvyXfJ/9Dqm6TGEr2u4d2Jy
	6h/6/f8LngO+YGWmQWENv850fVepmCljKI2fA2ohg5D3bQHjrce6+Z8e1ezi+Q1DUovMnsVlHx4
	5FtRJ5ht7GMeXvn7bPVmtpYeSrrcX+upU5v30JEtpkXq5Oz0lwsE3SKV5gTLfvN5ojJUKsx4+JQ
	3O2x5ohUwSVIlBvgkoTOdjb9Yz4QSkFHV94=
X-Received: by 2002:a5d:64c4:0:b0:4a8:647c:f962 with SMTP id ffacd0b85a97d-4aa573ee4c2mr3035038f8f.23.1795095750641;
        Thu, 19 Nov 2026 05:42:30 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:29 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 2/3] i2c: imx: unmap the DMA buffer when a transfer is terminated
Date: Thu, 19 Nov 2026 14:42:24 +0100
Message-ID: <20261119134225.265242-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119134225.265242-1-mehmet.fide@gmail.com>
References: <20261119134225.265242-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The buffer of a DMA transfer is unmapped in the DMA completion callback
only. When the wait for the completion times out the transfer is
terminated, the callback does not run and the mapping is never released.

Unmap the buffer where the transfer is waited for, after the transfer
has completed or has been terminated.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 41 ++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index f20727ffb5ce..fbfabceb29ac 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -469,11 +469,26 @@ static void i2c_imx_dma_callback(void *arg)
 	struct imx_i2c_struct *i2c_imx = (struct imx_i2c_struct *)arg;
 	struct imx_i2c_dma *dma = i2c_imx->dma;
 
-	dma_unmap_single(dma->chan_using->device->dev, dma->dma_buf,
-			dma->dma_len, dma->dma_data_dir);
 	complete(&dma->cmd_complete);
 }
 
+static int i2c_imx_dma_wait(struct imx_i2c_struct *i2c_imx)
+{
+	struct imx_i2c_dma *dma = i2c_imx->dma;
+	int result = 0;
+
+	if (!wait_for_completion_timeout(&dma->cmd_complete,
+					 msecs_to_jiffies(DMA_TIMEOUT)))
+		result = -ETIMEDOUT;
+
+	if (result)
+		dmaengine_terminate_sync(dma->chan_using);
+	dma_unmap_single(dma->chan_using->device->dev, dma->dma_buf,
+			 dma->dma_len, dma->dma_data_dir);
+
+	return result;
+}
+
 static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
 					struct i2c_msg *msgs)
 {
@@ -1192,7 +1207,6 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 					struct i2c_msg *msgs)
 {
 	int result;
-	unsigned long time_left;
 	unsigned int temp = 0;
 	unsigned long orig_jiffies = jiffies;
 	struct imx_i2c_dma *dma = i2c_imx->dma;
@@ -1217,13 +1231,9 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	 * The first byte must be transmitted by the CPU.
 	 */
 	imx_i2c_write_reg(i2c_imx_addr_byte(msgs), i2c_imx, IMX_I2C_I2DR);
-	time_left = wait_for_completion_timeout(
-				&i2c_imx->dma->cmd_complete,
-				msecs_to_jiffies(DMA_TIMEOUT));
-	if (time_left == 0) {
-		dmaengine_terminate_sync(dma->chan_using);
-		return -ETIMEDOUT;
-	}
+	result = i2c_imx_dma_wait(i2c_imx);
+	if (result)
+		return result;
 
 	/* Waiting for transfer complete. */
 	while (1) {
@@ -1298,7 +1308,6 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 			struct i2c_msg *msgs, bool is_lastmsg)
 {
 	int result;
-	unsigned long time_left;
 	unsigned int temp;
 	unsigned long orig_jiffies = jiffies;
 	struct imx_i2c_dma *dma = i2c_imx->dma;
@@ -1321,13 +1330,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	if (result)
 		return result;
 
-	time_left = wait_for_completion_timeout(
-				&i2c_imx->dma->cmd_complete,
-				msecs_to_jiffies(DMA_TIMEOUT));
-	if (time_left == 0) {
-		dmaengine_terminate_sync(dma->chan_using);
-		return -ETIMEDOUT;
-	}
+	result = i2c_imx_dma_wait(i2c_imx);
+	if (result)
+		return result;
 
 	/* waiting for transfer complete. */
 	while (1) {
-- 
2.56.0


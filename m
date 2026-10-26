Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009389;
	b=2QfCDmUTRex2QOvJ2QuzjiXmpsAdaQPuPKHnMZea9GxWCXEZlZ+dMhWRM3ouKkqtNY5t
	 PftSYiiL8NUcLcSNanviOTcOJuY3nhmaEfbYMB72kFtN0dMsbHVj04w3SXnF1/ZYyxpdj
	 nmU+/v/Z0QwVWUfpM4RboQo9To4ago8rey5KxElEGRrVtEv1H9mSWmTm3gK92/fKxRNAu
	 DBRaw6QiNsb12yE1Ggzj+lGI0f2mfQiw9/JoeOn8NTRRSx/BoPqJS7111tn+MHVQcbieH
	 ItqGTKE54/3KHxOpdWCypDDPVPZmhbMb++m6szj60Ez9ZHdsOHBOyyAeym6MhYADJdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
	b=flDe2OPWk6ixykiwaNd/RHb63BtJWco8ke0auajEtE0g1dcQcODfXzHdUeP3iVsUMVVw
	 4MrGOArtAk1fOTFTVx0AYM/baQKSkyZQ9aqUhZuEuI9He7JrRMfOAobfDlY8AegecH7AB
	 4OKWsF7L7Vq5IRkfnw3a+aU+slX4ykY+YzWnX6T9qUiZBHfQ56ed/WZu2YvOfAidGxJt8
	 YQXCKtg37ZKoFT+ERgUcLrzgcXyKgv5L2CL63qTxODWjGOnvppS5JglmUWprF0EbVWxrp
	 +zTtyQyYAeiwPQHUkBmyS9Bho3MIa5JmHknKTTzSKzDp9EeNh/R8ymsVI+lxI38pa3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PKChsttB;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF1606A322
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 10:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AF1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PKChsttB
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12232105e9.2
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 03:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009387; x=1793614187; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
        b=PKChsttBvQYhH5zIDMwnidKiDVrl7pv13eKx1ybj5gSopJEfiYc932qX1q1U4Wz/kE
         0IqeYBevXKiSJZYmbGkI0LP2y2VVL5yUBqPX3ueVMo7ucDdDVVf8kf+LqHhtFPYv/U94
         Upu04JAMXo6QO93Ah8/oasO6Hyy92990Gs3mrQaIPf3+MnSFJjgUIaIDWXYBRuCjQ4sE
         4S7Homu8bAn9kDPRvuSpqjmycN3PhR5TtwDY4daakg90LzBAP65tMMpZR2gTwIku8y9f
         DwkUY6uiO5YnT7UgD5ol7O6T8agEJ9TGT8kqpeQwde3KZQ5rE1Hl0dQLRhy2J0Wwo/zm
         yMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009387; x=1793614187;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
        b=qjIL1SJLQY8oB6Nl3IIzpxH6unNlwW5MnQk2TC21duPp3NsMGr8/A5Vb+bS7D8AtW0
         zcT/3sus6/W7eCLHbC8zUxNbzwnp5vLHbtNRAtqDec4OpCcHvGE+sJO4wNIjWbMkfso+
         Tch3ue17gRXFhdTycgXt1uYkZeIrQD2CGo4MScAT6aeWIo1uo/fEyYMlEGjQoa8/+wHd
         n9wiPR+oF/QnQCeUR1UNYqIILDbYV1O/WLZBYpAFoASNr/WegCAuSJkk5DyQLwg0KbRv
         7hkPr1/O9dHGYpl5eimNNLF0auy6CUo22RlKoDP7HKc4mM5wEr1oBtEzFVEwhTqp1mz0
         gDEg==
X-Forwarded-Encrypted: i=1; AKwUvBwgdP5Imp0rT1DkIOlbrHxR0s82aJatonnJrxOruAEiLjhXfTKtqrZ6LigtAJToQNFlPm4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJgM1eMFLYoTBj9qouCQP25+EBPpPyHwePv42SKB+Ve934h2cqO
	XsruggPh4RspvNCOyyP6ys0okP2XEkVVKNGzOW1EFAVRIJKpr1Jf5fj1I8ehnw1pq+w=
X-Gm-Gg: AYBFou0wP+DFgQdGnAj2DYymPL6+z2az1fFVKsvuYHizClwPQqSfC9Vc1f4fEIMuDji
	yUI1zAtVr+EWDk81E9wzdXlJQwtBVov/fU0B+q6vMrOxOtMJHeE/CKBeSDQc+bBji2W5RViVuIg
	ASltGotOvvJsX6ABA1NO8PyRHQI1S/qzRyXbJqtfaLZ+9zm327NYe0RmVr2izflN21lAq4NUNSq
	0Xa3/vy1nz4s6bJi4vWf9StsM1hc+UZZAeOv/Np8npjXaEYVzmDk2w4BHKcRkmzDSwI0Mz0kuHh
	xiaLmQ6lqIaPMEB08EnYi6Pd3bfPo9ZWJgMp+VCyavi22Mgc6Z1uSUSduu2y/nNzb9SnHHbzDu3
	04q1DjjFup3NEujhZFJuChggr7Mz9PS67YrM5wv0U8/5AWE1+goO9P8xXpbl4Mo1us97iLKZcNs
	Co2/cqvZTszHyUdErvQ9AQR5o2DP8RGdvR6tE0YL05NdDHxCAJhTidSGm5RXJoxDKiuLoOq0ano
	w5GcSPMfF3J96TKJdTn2FFv8fDAESDbSJntzJW44ocS8x9vqBlsOV4/eA86Na8rgsTCNE5prnAM
	cOA8WgC06EKJBpGGeyV3nia6O8WDzlq2WUfm/AGPreI=
X-Received: by 2002:a05:600c:c08d:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4a373be2a68mr73417995e9.14.1793009387038;
        Mon, 26 Oct 2026 03:09:47 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm178981245e9.12.2026.10.26.03.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Mon, 26 Oct 2026 11:09:30 +0100
Message-ID:  <4757287789726692e13b141b3b2af5245ae17e30.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4531; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iP/a86pijHCRmv9wBS5FEuq1LQ6MVYUXu9CglvvJMck=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3yberBd3EQ5Kxjbd3sOQabalehlLr8is9shUn Mr7VDefgJCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m3gAKCRCPgPtYfRL+ TnoBCACmPXG59pHH37OKjk0cHYhrDhchNp4kPrX3S2palkOtr/leAierbz+le2U+7KOrhvBU7KO OP80a7baa8OKpNF6noVMplFsMaR+1zwsJh1ljDSDNIWaTCV0iSh9ffxQCGITsepdNgcKiJx2+8Y zc1UyNiNySdsVvA19Uob6xHpTkz1UEvdmm9MBU2AU3FGEV7jED+HEIOSLn0cTCC/+4gMJcR5rWz VpfXJVB8ddeqWCanJj6J9nA9f3OrlROMm3uV8+Y0L6HXRJFE/0BlFpH0w+RJlUii6GXn0RG4Ncw M6aTTX3VJ0mn53FOzapKvPhm9N2hPV+DrHOkOouTEGWRCUN3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
memcpy_toio/memcpy and memset_io/memset isn't suitable. An affected
mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data.

The new callback can be used to implement just the driver specific
memcpy + memset to increase code reuse.

The patch only appears big because of indentation changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 63 ++++++++++++----------
 include/linux/remoteproc.h                 |  3 ++
 2 files changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..0698bba2db89 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,44 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			break;
 		}
 
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
+		if (rproc->ops->memcpy_tova) {
+			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
+			if (ret) {
+				dev_err(dev, "Failed to copy segment %d to device addres 0x%llx: %pe\n",
+					i, da, ERR_PTR(ret));
+				break;
+			}
+		} else {
+			/* grab the kernel address for this device address */
+			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
+			if (!ptr) {
+				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
+					memsz);
+				ret = -EINVAL;
+				break;
+			}
 
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			if (is_iomem)
-				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
-			else
-				memcpy(ptr, elf_data + offset, filesz);
-		}
+			/* put the segment where the remote processor expects it */
+			if (filesz) {
+				if (is_iomem)
+					memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
+				else
+					memcpy(ptr, elf_data + offset, filesz);
+			}
 
-		/*
-		 * Zero out remaining memory for this segment.
-		 *
-		 * This isn't strictly required since dma_alloc_coherent already
-		 * did this for us. albeit harmless, we may consider removing
-		 * this.
-		 */
-		if (memsz > filesz) {
-			if (is_iomem)
-				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
-			else
-				memset(ptr + filesz, 0, memsz - filesz);
+			/*
+			 * Zero out remaining memory for this segment.
+			 *
+			 * This isn't strictly required since dma_alloc_coherent already
+			 * did this for us. albeit harmless, we may consider removing
+			 * this.
+			 */
+			if (memsz > filesz) {
+				if (is_iomem)
+					memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..ffa22c2f04af 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -75,6 +75,7 @@ enum rsc_handling_status {
  * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @memcpy_tova:optional platform hook to copy data into remote memory range
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
@@ -99,6 +100,8 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src, size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.47.3


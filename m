Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483603;
	b=XsicZl4q0lTr7uoHs8I1WqkKcWCaXBnepJEwwxsgbBz2W+CQDHoOHTM7E1sfpxFy8NPy
	 qx+OQ+DcTk2/nM8wa6n8PXuget9gNEKX1/Rny2fJLYY8Vb3IazcU+WHomXIcB3eF7dWRP
	 0Ob4qlfLJoFNeyBSuXrSgXNWiBFlurBLKD/QeTjGYDP+bg4z52mH1Z5yKWt2o7MzOG5PW
	 /PbHLFNBJL4gqSAGGv6LKXR0apJBBv/W0QiytqOOFgyYIPzqaYp7/9R+P2ph2QLisOfnt
	 hPV7HX+93uz6+ceJwoWAKa7iMWpU11ctZlu8ci/b7rb4WRIv2W4YM3l6jRFWL3jvSkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
	b=p6kP/CDPbU3euAY+nuCmcaBX5aE353JuieqSPfXp36xz5BGWSk8umcfBSiEDkDlhhOG1
	 ItdOia4YirW0f8xVAxIIfQz6C/yK/Ubbp7gCz23zXzd8nEHKOOUs5v42zSs8i/sONQMou
	 BWgwgfeRFiZ2Gh/oxc7aH2wfUBvGgijqoJsSLgY4uybbgA4cmsr6oj3Oz48LWpVoxpSpl
	 O+egqET/vXzIK3qsEO8NJ23GOWT4XAk50JvwI5aOctBQxcndv4rxFldboSW7M6SpnszsL
	 AMpWxeNW8GonsvZ0OOGXwA86HKdnKnV3pqqhk0hOiLPkLzMc3C2NYSXWp3yi9iRyztQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hr09BVri;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02445606A894
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 11:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02445606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hr09BVri
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922523d1afso2490312f8f.0
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483601; x=1795088401; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
        b=hr09BVriTec+vzYg5LfGSCdg/D+uAR3NQQvvROEjCS9ei/r4kUV0Zp6IhrsZp7hzuL
         JTpI+z1tV6ZOxGBxb9gnypvf3sL5mDCi0ezjaVSon/L/x9C+wpSUPrQ4bEs4/voO1dlY
         0WfLFQQm0S19JPvwKPxwAGloE1CX8dFCDAnAVYrJiG6ueEa6jWyPJBt5/9dZlDAyM+dh
         KW0tFoZ3wEFpyZGyTD5eOH+GRIRKlIYID4GssV1QrvrlKdi87CMaqX3wUed3HeJwYgo9
         BH4Dl+FMogV2MEitzwBPBQg0FuoP0IaqmhGfcMQGX0FIAU9qetZCWRhNSElEmkdO8384
         jb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483601; x=1795088401;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/LK2W9tMRY5x8wpA2h9YuUMfckHvhSfaFlgBZU2Y7c=;
        b=pi4GJ6YOqSO9b158+4a56+8hN6nWteEbrtwbL6NCYO7F0a11GA/Fy2vVuqGGMUBChd
         Jncri5AchPC7wDsRuSe8mEGAdvnNTbmxSJPq2ikU92h8B7ObP8b1KQ6t5WYuEEYgvceq
         Yq5ZUTc+WorCnXhyJm0ZkW9OQ/b3gejPJsiPbWXVitkc3E+nD5CKlJ3Iquw2VNomkjIL
         MpUb43fnrHKCkKddBV5l2Z7ET/9pWxpYqQdFSh0EubUAABlPQcxRAg/+bui8/Y8HNBDE
         jjvurYfWz83pg2eZ+wukREbRDDh/2y3BfcmAQ2LLIL6qL2HUgXjrgbxvKuy6nC0Bbm14
         LEtA==
X-Forwarded-Encrypted: i=1; AL+hErFKWW1YytH8p1Cg5r+wMyBuMq2B+Uy58LBjv+wJCrmDursFMbZsDjYuEsCTn7c66VX7fMQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9YxNaLszqaYW1HN7BcdLkvxuTwzsJ1xs9K+sy5G6/mu31AIltq
	5219aQxa84UwAaU2A7l0nP7IPfhF1LMOGmZ4ExafMf9N8UE3UJXMLjMlfxU9cTj9w9c=
X-Gm-Gg: AYBFou1pV+tpnjT2lI/utYBNyfw0+bTapmkhKkrtN60gsQxbdsOi6n24Fl9RiX8RcKP
	+d/+S388E4NhnZ03FWqnPcKynO59OSJH5mGhYn9pQ/ypn9ustlay9zoXX9sWqIbKQACiDNVFyeX
	gmv6ZZHdmZFI4hoKpG80rLtEJhJIHHyLQedHBg0rV38rSI+WLjAX/H8ixUaAfoGnsyw6MEUMWCp
	mlCrE/syQ7GdF180gpB9V2EJ+zZWEkcf59DfpNmQjcKuOJI2O8KNKjyhTgqAt5slVPeM3BdV8rU
	gzZt/+/WYIqcRbuJLHBOZenGGyB8S/iQ2GBU8IGxy3cPcWg+ab7eDBc12rz7LMFWs3IHjbwQJM8
	CPOHIqcQnt0nywbpG0okKo0YdDRlPdiE5cSNCR1LsGWc4q7ayFkDZIoW1tz4XVnej44PbaZ/yvi
	aNFl/uBPZn9vVbzjIyJIAvDSuR83uJ5wfGDt4g6gvKEHF9tN25ry0XCmjmIOhu5aUwl4UtrH8SS
	2pwtBnfWtTJWcsZ/p5WieLGywJ3dpt04X/DnNxdTiw9Y16apETMnE+0DkbayUeU3zueRXsZWol6
	FHurIXAblrFZpBjggqHVlFeigC5ORfuFrmcGi37y02vXN4cIu6IPaxinEBmD+pltYEi5vvCK+pP
	9i9OuUOWcWla95uPO
X-Received: by 2002:a05:6000:40c9:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-499c83c0d12mr9610739f8f.38.1794483600775;
        Thu, 12 Nov 2026 03:40:00 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49836b8eb11sm17512463f8f.57.2026.11.12.03.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Thu, 12 Nov 2026 12:39:50 +0100
Message-ID:  <a6e3206a90f3be915a57a7497a34ef97f914b340.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4986; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=N+9MpIEOMHu+xlJxUw2mD/JXqfJF1eqVB7nMk5Eh7D8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV2s8sFfFVOC95VOupA+IXP3fdYI2xxC6vn/ iHUWQY7n6qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWldgAKCRCPgPtYfRL+ TvLzB/9SAwbizeNpaG5VX8F40ZM0gqXMvkPFUjPd5fWsSsgflHW37D6qTZi0Hy6tMwfOBRx5FL9 z9329gZpkYZ2BO9TlrhlDR0n4EHawZPES1yyLw3utlF3vt2kGtlaUK2UPYWUFabDCoXF/9FBRb3 4IuKrl8TTSvOT2JiVFtlLWqK3J9S1obd1J1frD66oRhf4+AwrFC5uXbxHGRqvPMAfyT5/fAYp8l QCzAhRxPHgvizEmswaldebcNk1c93h9lEFeNniN2Da5oG/C/O49s6x1CymDFlrkjuOO/9yRaICZ GRGNSBNYed0GgnudxNHtbGspOPm7C2RXZURJEsbgywCXCkfZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
da_to_va() + memcpy_toio/memcpy and memset_io/memset isn't suitable. An
affected mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data. To
cover that usecase don't keep rproc_da_to_va() in
rproc_elf_load_segments() and let the new callback operate on the device
address.

The new callback can be used to implement just the driver specific
memory mapping + memcpy() + memset() to increase code reuse.

The patch only appears big because of indentation changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 64 +++++++++++++---------
 include/linux/remoteproc.h                 |  7 +++
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..3c749a39e5da 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
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
+				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
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
+					memset_io((void __iomem *)(ptr + filesz),
+						  0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..165ba8fc1d88 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -75,6 +75,10 @@ enum rsc_handling_status {
  * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @memcpy_tova:optional platform hook to copy data into remote memory range
+ *              The objective is to copy [src...src+filesz] to the remote
+ *              processor's address da and set the remainder of the memory range
+ *              (i.e. [da+filesz...da+memsz]) to zero.
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
@@ -99,6 +103,9 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
+			   size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.56.0.rc1


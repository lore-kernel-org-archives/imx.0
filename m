Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880008;
	b=eBRRvlC9I8nSuuNqvVQS4QXLoiEeJexR8W+i5BkW+gxFiaxG+mdv1zrrgdCNgDL2KCSg
	 oBz4JU+yUhLSVN2wBo6KkdUm9KqFC4l0mTIOkjba0T95ieNtqLFKBewihyb4CF6aB6FF6
	 +yn8C0rIcpq6qtPSpiuykV74GQuk8DKgmclNemlAOrJT7NI1xIjENbit0DJNMzm1oiRDk
	 Dx9J/OEzGVG+NiA+T3iOmE2wFh8TVmzYHAYmbGz8feJXvIHqhlmTAMIt+Bbr8ZJcBGOeE
	 pmzhpmq91/hluRTe+ALbB00nP/kFnoUyj76xwoh1gDaiK3veoCCvuZsCdxW9zwl3O4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
	b=Uq+QX3nOErA1skbl3RV0bLoURZIz3dD4oqqNGMIYBGpVuIN7OU1BEuaerVX1G/RWe1FD
	 fYw0e/HBbFNst9ABISNvtOdtvhnXOldCxAlFn0TbIkrQsZA22XqHAop5Hf218ZbWkt286
	 HFsBfdUCGoDKWUp0mwS/kDdw5aIyZWM/5aICN2fMh47jEpPl5hVJgWkICpZyf4trSqUSj
	 jxkOOHkEtjJewE73JGU9gNq02yZV2kJRFBBJqqS2fF1FHHGyNnc1CDe+jjiAtGskm221I
	 KfTqKEwGGvDIPObd+tqflQyjAXouTz8yoUnz92A7HTv1Py1iDI8WUj0zgqwg4prH4cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="AVp4R/9i";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86CA606A328
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 12:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A86CA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AVp4R/9i
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13219835e9.2
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 04:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880006; x=1794484806; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
        b=AVp4R/9i3WZCgPsscrfUAL2ykIBeUeJcNHEFe9eoIpWZHVElN0uI3RCW9L9TDs9hUf
         9EQN8JVymHNjrnvX932nQuOgqLZLtxTlRN/N+1YKUFoOXbSb8SOjo4Nfub7SdmIpGONz
         86M7AxOCyzswhydLzWA8asrkLc0QAQ7QzYn5OevhN0VTXqv0yKQu4gQ9louvZhZcX75G
         msSb9Pk0E/a6wbxAcyTUaySGmSVOQu+hKgu6Tf+ueFgRFycppi/FqcjhCf2JUuwLa8jj
         fluDpPQDvytNhrvVPSvL+isiPvvfZnk/Ae60A+TJStcKlwsNvRqIkct0QmLMww8V5uxc
         i6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880006; x=1794484806;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
        b=hA/Xf66oLf8gzl2DEEVyn81PaMsY+CZeDiSaAFWbbvY+c0sHHNkHoLxQMl7Gy88Cxu
         ra6+HQBFlgVIVPtZtZg37qHU5x+AT087q1eQVwiUnXhAEAhIRk6MFSCyU3KMzfXuoNu1
         yvmQ3kKgmC94BZn1UYVEbUlHBUR/FGu0GprFoILVQUPb6ee/++nZuKiVd7vYCO4w3fXU
         OfXMBbIdIG0D6nYz5puQ+W/Nk8lamW2WythnaP+8HxnDWnaYIGW64hBnn6fY994yKB1H
         bvNkoyIDnSNsrm61WOCzo8LFE63gMXqDUpARCFddbfu0J6tSwR2YnmYy9u6pKUVv5Nc5
         kXvg==
X-Forwarded-Encrypted: i=1; AKwUvBwd7GDFbMk+fcaDIGGpbj5Lw3Jq1jne+xb5VtvDXUOpu/eLyH8wQJdTYiDubDTCv44Zl1Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z9cGJ+5uGF+f/1r2H/oI/F0DkII8Q6/n48y2a+t12fhnZq2Mfdp
	1Bw9Kho/zuTPZxGF+07zn7DCdH9bsnPezhZhfeT3WRn9JdcED0PRbl/weaz0sj4kc+I=
X-Gm-Gg: AYBFou3lUJFNCRI78v2Cw4dhZlC15vKeZpHuJIymXmUka7syjclvzCB47fZm8Ce8iwO
	HtYMIbMJ1uFzeL56/BvR5Kjdm2v0timI7GYCv5glKHHDBc4oWTdCOgjEACHR6FDv0PuLXfVBK3z
	cfkdiyTeS+V/1ZK5Lf4j7HWY/+wuPHFugD0fXbDkdCz3zZDnVbdziNbl/IivvNfwIxOJacaj2m4
	VvBECOAJILon3MGr4t9mulUpOfOpZJl2CaTYdOWg8gyMlATr4vpF9jkqIg6NxyKa2cjz85w/OIe
	9Iptxw9Lmatwn8dOBV3PTEAbJVOLrHsSqhbKcWPwQqrJ78VlB0iDWq6fXVr0svisdEpTm8PclkO
	skv8E9kS8afrlHothu27QSTlwy2Mnk4HHV4JcVuWc8x/b70U7NK9+/B8pSdVMosKvCvhvssMID9
	rAmV2I1CRj9ER+1Wts4+y4ZHRYZRlrWgPP+Rfws/hyoB6BilUwAtv/ADy/MwWGpx5xTQ3Im51Ui
	uM2fjWBZhTakJTOfcc3ivCmi6cEyXiNJqMbqvW+5D4Bx6wmHPqv6xpqY+fp/ruF9F3iaDDsFNab
	flTklvODPzhPeVe/1rx2DtTusfEi85BOWHEwNkbBFpfSgIXnQtU4c6hhD5sAcZyDzfjTRQSMGT2
	ceasKVQ9mN1FceUFj
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr436813095e9.13.1793880005590;
        Thu, 05 Nov 2026 04:00:05 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56fca22e1sm73091395e9.14.2026.11.05.04.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:04 -0800 (PST)
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
Subject: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Thu,  5 Nov 2026 12:59:51 +0100
Message-ID:  <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4764; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Z/fCIVp9RMJTrReXJyUJn6ua+y9sBVz+x0H7XlZvi4g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+5Gk4Q8ATYuAmIR9DTokmwc///VvCwal9RT 0Q+SzcLu66JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvuQAKCRCPgPtYfRL+ TnLPB/4nC79lPyLlqp10Q5F7ECcaSOk4HGB7s1h+upM72K8ZIRD4qE30eRuvw0eeyDwVqAIVE8p BAor5pNJ+SP4kvqA2oIUxtFqWsFQMOxAsHbfHs5DcCYjvyyrDc+f72Ax3/eiQg3x02Zbstqf61+ knGCo0cgViF8bSvnRkn7YdfeAdRWO06P7TUfGt6LakU0STGCVNz39MGsiVTdEqzYERqITokSStT zsuoA51dTkKAnw2B1nPeUAqItS9etWoDQCm9xeYoCPk+vXUuMUVleKV55rUOUBSljhUqx/CEgAy hb62FNMp4EmG3KK5vjaTGyiCyOvEyljj4nM+fDYQrz3yepib
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
 include/linux/remoteproc.h                 |  4 ++
 2 files changed, 41 insertions(+), 27 deletions(-)

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
index 00019b1895e6..e750a127cbc4 100644
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
@@ -99,6 +100,9 @@ struct rproc_ops {
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
2.47.3


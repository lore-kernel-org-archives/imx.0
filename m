Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118341;
	b=oOPwC2HwjuqzXvm9h6iCXDzKSJYX+SMNKcGrnoshUCS4Ml9McyKhsuOyPg+l5tL0qw3r
	 05jaTEDHPC4TXvxgmHKdTykP1H3jKOQpatPyqDSgl9oOUQutsfMS9aA6T94oiLKDgxeFX
	 L/nxTUWGBmv73RNdnhuTt9ffLRJHMCSyKuYoN8fV+g9Qb82o0xBn16n2zf9ByZTyAyXE4
	 UMXMWjHLVM9zHqUkRE01W63MOh3z3GkcxfrMxrHEyk8uL3xYKVEKMfT+mdqqqgCd9Iexx
	 fg3ouQbuxlNUpNADQO7rcFd6T2gW2JG/cl9xMJPsQP6L80o3nTDasa6P73582b++/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
	b=K8n4dMmbAb0Ldsq9BhEFWaRLd64NDN+WpZ6YcnETQWtizrMTtBnbTLd/ctEpCs9huj0G
	 2uNUzKpsPnKRDN8z0voNEGVCbMyJB6z3OcCaJ3Ux2FQwMLx2Jx+Yf9DbDwX96DSd1KQTe
	 da4Egi+WC7bdIHoLiAAAUG9nlcaOuh/wl2MM9chQzA1Pi3DT5WGr7IcixcW6kxbxF2Wvn
	 cOD25b+f+BsRzrEMTK6Sz2EBYAUOpu5SxjpE2HBqqfVWxa4DuKpXDYu2WGD19ZMx2wzZA
	 PttUqqHcDy9RRkt1QCDFYhP1WmZgbcKVTIYkz9eH0gmIFF1+fLiVC4O99rGOThLGpsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RXXaJeS8;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFF606A329
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 16:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FFF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RXXaJeS8
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso86175e9.2
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118339; x=1793723139; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
        b=RXXaJeS8mf3QoAKxV6HEoWVbRmVcp+1RaW2D5DJE6eDSfPI87lg9cneO0t+E2tsR9N
         XsZUn3CyXCgN1nO7gCUQJxCvC4Xy3QdZqhZisgdaxvIc2yhKdVAI+iE1/9F44Fksdqee
         v4IMpayaW6g0+adfL8Z7ya/eCHV1zNZizXfoa+B2gCroxBDzZV3uWT0GuVcyCDjsm/se
         lHAedTNSm7cBOYh7/gxfq2kvYLAHpjvrrSnPKkSwTB6ZpSiO6DbF90SR7KCJL66ddsZR
         0o8hASx1AzzjUrqZ2s3em/Yic3ZAQIGjTyiUzpFCpWBefu0GavWn8UwYABCoNB95oh+u
         z1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118339; x=1793723139;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
        b=UBc7U9QdD4mbFWMLvb2xlcbzRva3eaXIRFi4pR8GuAgc1AeWOd5yI5iHX65+WDfZoW
         wmzHVqWCyVqdzGkhO4xh5u4ybm+OJ1dCKAb8f0k2IN5AagVCEbqGVW8/H4QZbL9qJ78U
         N7sZBmorgQQ4ROA3/6naBI96ng0CwBdnUTU5yCORb8Qgot3D5dckloaibN53rpmaI+wK
         8jVqcLeiwx9A5sGdMYeewViJGxUJ4qbBl5+QkmbYFwLvL0IJu4AciSD1xHxZee0tJJKS
         YBHnxR2OT8kuEkNLJV76fiYro74ZrrNGfr3Yp/cNzx1DKAGAf1NaUlc9gBqLCQJ0JoqG
         tL9w==
X-Forwarded-Encrypted: i=1; AKwUvBxPPwZKJ7+wdPFO3yw5wUvW/LGRv6obeXSOxSFYOCddxZ+bmjEhkTyg60ri3xuwj8n1+LM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLaxCOH289g/kuSdaimCNZrHRscwbtDhLSpH6Yfi3M8sC98vkCd
	9WmWzibGSMueUhALZSPtWCCw5vgice/qaiB6vED6TUnRs3bCujBqxbcrhDPuauMLCXc=
X-Gm-Gg: AYBFou3n9RUH8UStvTMFfy5uWczEWS6sGSU9d1QMF8u2sh5Lkswn+Tofi8F1y8h35R4
	x2sCuyjS0acZ0S9wgHE8Po1PK9f1ySS4uFEz77iF+JbWJTpX4qTvOcIO/gxJBxjRznqeGT7eU+1
	yAhkN2+EU8yL0kYuFKXD2Cs61k0bRV7Bhhbdg3sgEMF/OPYM1ynxN7BsiI8/Ru1gsqSjGsAKyPJ
	eocZ0HlKEJTNDW1VtnDCV4r0k0Gt00r0nl79fi4VrmLwhg2D6AffOG2H3k7/8lYs4o7cz0TLcvs
	Mgl+G3d/sbIti2yanGDDfYPr6KlYUi5RxM2TF4eEvfOemfJxYZQaIcy4RmABxwpSG+2+TooNPFz
	bTm+X373xiGqUpJCLs8uPNmsIduUFNyk+OEQ/GdmnhhTevk1eMbzzuESTo9xo9cUt/KyFKYpT7x
	yRiQEBl8SmG7Iv6IZr0ZLtbCsG9QPmrfTSvbZIL+5R7QJDoP/PSJEcBvBKYwpLortayh1buEh1H
	Cz4qvi2mdrPMt98kAzpAriVhf5Pdb2W6ZzfNIN8RlwNa2u2qM6xZ39a9KMFxVNaChDr70OQYp47
	tgKzOQaeLT6FO3SkPj9SZzcvw7AFkrLdHb09HE6IIsEZp66S8XWSUTmH5Lrq49wk
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr206232885e9.24.1793118339017;
        Tue, 27 Oct 2026 09:25:39 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb8e0sm22996206f8f.29.2026.10.27.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:38 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Tue, 27 Oct 2026 17:25:20 +0100
Message-ID:  <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4592; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xVwXpYXWgABJZ9x21P2crTLydOse+u663MkGSpQhphM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NB0UKaEa77WgrPF9mWEd8jdnTucff0k56SvQ /7jqxppSbCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQdAAKCRCPgPtYfRL+ TmQRB/41RdBguIWrTGSuq3Br1wn3037QSqHgAqDnMnMeug563he8OY8v6f+CtVGPgXSx5QVz+iA AAq1nMA9eiM6vaqNfUMtAhSPOpvyFx95JPVD7XLogbKEFxB/TC/QRLOmzbrfadSBWZefgX4dEKe Sx6sL2irRsarkZcZnLdENK79iV81WsBzeqN7GynA3EJt7w9uCXsaEl+a22XMtcJHELNMuSfyyNk f9Kcon02OOS/Ia9yJQkXEQEL+rWybwPQNkGOZOuNn35OM1rpH/oY7dqIkiTMh7WyypOJvwUI2jb +9Cz47RoIu/eQrSdVio4Rx2d3oMxR10j9nrhGxt+2VMqMTYj
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


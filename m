Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793426629;
	b=tB3MeX7AiMBAojAZT4SI/4p0if+EeHUZC5BCBqYZ5yckXnK/iEIo6ZzxqOaK+79jnjHC
	 xp00orWQOG/RwoGgRR+ZivS5mO+xg5ROAAJPqufZxCSugD/eyDpY7euiyJcPRc3oHNm7j
	 2+EUpVT3aUL7CljYVYB1YUvPWcfcg49j6bImn8YSYqcdlHKE6hX6Kvx+UJmnCSn+6qMRu
	 31mEKv/6DU9qO7zF43ru0SFWL+TkGHRXQv3A6FKYM+iIZB5rwOAJ0yKNNAUsLMtno1gOZ
	 ili1XDJls/tTMUiKFPkIiq/zuLd60Opx486mxXNVfdYn3Hbl5FT3Fv9K1XGpmL3LRwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793426629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZnHzpDNAsYwgZW+/BH7mx2GO7ajwWfSCvotHqaQHR4k=;
	b=i61Nk5SDVj1ZfadCaMTbFo5cqjO3ifoxlTFz5kCplBK8BOng9+82Mi/B8ic+Tvy2FFRO
	 RfFLAKvxxhXtvsOWPexTOcZuoqiQ+hZ1tT5eNTYulZUqTMkXs9A7bnFVOoR19dVOZygVm
	 gJaa+pRGBxP9tIr4sDxndgvlGf+t0Sux4KtELF52WMYPtj9SPBoylKCHifiJ9mmAw8Bzp
	 rmqt1OcXehDWb7iftcZDIko0ADRc8KOfXS0pBVtnJJLMCXuDfjUAm/jevdnlCKF4XWo0f
	 ErWi7eGri9BZ1/YBCeAsdVzpevvi68GZTWfdwHLvJ9S7UhbUASHRtz2vHuLUuyGSDgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZhsH3//C";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32CE606A31C
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 06:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZhsH3//C
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so859374eec.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793426628; x=1794031428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnHzpDNAsYwgZW+/BH7mx2GO7ajwWfSCvotHqaQHR4k=;
        b=ZhsH3//C8RpavCEylb4y7EcUoASVqtL9RBB0mUx5j7PK/ZBGM4l4sVHwO13Veywa0q
         4eaa2vrd1OgiU2pVwR2V6GAB6RH2lHC9BvgraXaOJIkoHoy7pn4SEXcRejgcO1fsNnfK
         cXiSRJSinGzTGSQxx0ljz/Tb9JKoe+u+KurAeM1J6sSq40NLlhEvw5md2/5M2l5imkM7
         WDhtR5dSgBrUQP/A+7YKDtakgr4ccdWJp+QRKzW2ADa+0CxyQgB/RaFwS2vjXjFxZS1d
         dQtsR3w7NxWWQl4M7fDcrPyFkAbdxcpHyPN5Ki+BRik6+qb/XhKCyVFsohTApM8SJgUI
         f84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793426628; x=1794031428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnHzpDNAsYwgZW+/BH7mx2GO7ajwWfSCvotHqaQHR4k=;
        b=zV6xO5FAuLdJ8eTdWgs0uwYcqfijqYxgY9Us4+KuM/wtdgh1JYectUeOGY0xByKrnr
         pJB8nr+QLVigNHU1Dt6vQiDf235rngzEzvHm4NRVHbEV+Oczu6RwRNy8nM6Nol23dPxK
         wfhVXyUGa/+8IKJZh3A2LzCoOd4Q3wXxSAGCqs3W4EnJ9PVcyD/dIUr6Pehm4UWMUG7i
         gqvAvnQm0dfUpGj/DKwbNPhKs4Q2dn+aiKxI6e934WXKcVcUrn2CkA03D1qhwwDg0J7X
         CjeKkzK/CLTr4XnVrTJtJt3q6yNj5uh04+dymuvpoUZ+JwVVkhhdv7gUKyvVAg57LNcH
         UE0w==
X-Forwarded-Encrypted: i=1; AKwUvBzJyHK9TjYJNBZ6agZB3HahbhpiJ3bGz7sX2fjElE4Mzs1byT9/+3DZdULkOPFgcCYB2x8=@lists.linux.dev
X-Gm-Message-State: AFq9FYL6gkJ9HCrLr7r9Hj4CL+nkOXHxdqLqmW8XBk3C6EYVadFVDS+Q
	c7mFd7zdehJXYEgqbbzMAYAbVYeeMfBA/d+/rNgtwCEM2q/mxl/1vMIW
X-Gm-Gg: AYBFou1rq0lE0mEfbVeeS2gqauRrmExEWRyB8jCck3cRMJMbMQPhyEvYrhkJ3Xyj9kJ
	SG4DIqqXKXcQWdsdLOjzYs0B/aL/86E1O2+1lXJdUEhEAgI3YIurwQrHKPRvLf9n4CkWNeDPH8x
	bIa5A7d9Ea8bJ0884XPBffDTFSJfJ21kQ7tYtuXZiMIaj+V9j/Bo1v0SevkDhiSD8jO0VERHFE/
	D/os5rqfx2Uj6coNdpq/BRemtcjFnbJggr2w07VnoYmlKqG1Vv6Qsr6/8/IW6r07w9YxIRRbpMP
	76lRBCr95Rii7ZHbdljIbNrQx+xLg2W07hxBzCioEZB6UgL3f8v16wInhUPMwq4Qx9LrmQoVcLe
	BFS4Ghs4TsXi5pKhyjQd1klXb5ewqg6SE4q5TPNLZF3730RiHpeEOAMZNLezLgzrapsCo2fiDTR
	q78vjq2A1OdV9wHhCOeh6R9bf6rzc+OJ26GNVohogXv76Dbh56jkqzRXx+mjfaP5eeFD6HtX9VM
	6R1goDJw0/38sJ4FFv175R2Er1DKAr7eOiDp5QDklwmKl0ImmJx1xsJuT2EuzG7rReYcpwZOstA
	UA0e9k5KS8o/+7m0WJT/4IW0d0pi9nKZ5/rCU60onGUVGqrWTY82CjxOQmM/5ZxVLyI=
X-Received: by 2002:a05:693c:65d0:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a423c5d12mr6714625eec.25.1793426627830;
        Fri, 30 Oct 2026 23:03:47 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm13254968eec.8.2026.10.30.23.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 23:03:47 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	Carlos Song <carlos.song@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: imx: Avoid PIO replay after a completed DMA package
Date: Sat, 31 Oct 2026 15:03:44 +0900
Message-ID: <20261031060344.94687-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

A transfer can span two DMA packages. If the first package completes but
preparing the second one fails, the helper sets SPI_TRANS_FAIL_NO_START
for the second package. The driver treats that flag as applying to the
whole transfer and retries all of it through PIO, sending the completed
prefix twice and reporting success.

Clear NO_START after a failed later package has been unmapped. The driver
then returns the original error without replaying the transfer. A failure
in the first package still takes the existing PIO fallback path.

Fixes: faa8e404ad8e ("spi: imx: support dynamic burst length for ECSPI DMA mode")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
In an arm64 QEMU/KVM kernel, the SPI core and spi-imx driver ran with
modeled MMIO/FIFO and DMA provider callbacks. A 513-byte transfer
completed its first 512-byte package; failing RX descriptor preparation
for the second package made the original driver replay all 513 bytes
through PIO and report success (1025 bytes in the modeled record). With
this change it returned -EINVAL after the first 512 bytes and sent no
PIO bytes. First-package fallback still completed through PIO. No
physical ECSPI/SDMA device or external slave was tested.

 drivers/spi/spi-imx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 79a6c1a60b0a0..eed1936388aa8 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1968,6 +1968,9 @@ static int spi_imx_dma_transfer(struct spi_imx_data *spi_imx,
 		spi_imx_dma_unmap(spi_imx, &spi_imx->dma_data[i]);
 
 		if (ret < 0) {
+			/* Earlier packages have already been transferred. */
+			if (i)
+				transfer->error &= ~SPI_TRANS_FAIL_NO_START;
 			dev_dbg(spi_imx->dev, "DMA %d transfer not really finish\n", i);
 			break;
 		}
-- 
2.55.0


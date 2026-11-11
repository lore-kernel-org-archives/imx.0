Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364138;
	b=k9ue+4UhysZ3oDQHUy4KjypvvGZzl6ECKWydc8RAh+iivSo5sbzj3fKWJU0KP727ocUy
	 7CPz1UM+s1EehfZuGhM5GAT7sopmwy+JdwP+b2ib0XZz6wy3cn0WOK5CrZvWoGf4fLJB2
	 Uz10hueWNMabGVwj6K6KBrjWyHJGpYDpWoVEKvJXTdXtEDCxzlEgBHAmDvtyCEy3NRyjV
	 Oi9rYY9CgpMJ66oY8AX8A993hpO6WimFvFUFHBIajrGtM7vXmRQInahfb2J02pBwcyuYm
	 G3dMT4kiuyy8T56jB/DpsJFS53LQPj+3x2DsDrLNPsbBmgBybOpLdoKvY2ZJhYUk4qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
	b=h7+PlwN+ukOkIhrSpyJMeeU29evmlCkAv9Azljd75nNKYBDgpjXo4G/HfO95D6UdnmMm
	 2OeAHzMQvYbkvTDlvW4EwB6hpOvJYjstd+97vOG1nC31zcn1ikLJsPrA6P4/RJDleYqZl
	 K7GMj2GTioIh7W1NzpVembt13E4/8slDIwP7vuZ9yBYjNs1BR5WUMYqfSZo0GHBw5H9SX
	 HEkdedoI2YzQOIjZfdDOh6pB4H2BTNQfFgaX86qsptFL2TEzrpre+tITM3XLfuAoLfgPa
	 g+wlIJOFQrBvwp1ceHHXFlvXsLeJeMV+sBUqJ0SkmjgeLtrsybGzinm+8qM3O04ba0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c4bTQ0fM;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767A606A333
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 02:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1767A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c4bTQ0fM
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b5efadd183so1279183b3a.1
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 18:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364137; x=1794968937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
        b=c4bTQ0fMDOAs3TOjRsvW6OJgdb8mWj482CSUzcNNMneO83Tl2vuLWHoHPpDOfwSuOG
         xkhsghhMlnx1PIgZQRjztYhlBZFq5G9cnGEoBn8q3KnSIii4UAJrQdgeTGaqRfyIk6B8
         rFcrU/r7T7RBqju6F9R6WDj5PBxjdDLuT4J3/YxhbHACudTkDMirP4Ks8KMpgy3VDDT+
         N+ddDW8CekTOKB5uIOVH+fOdLRtm/g3ceU/32qEDEZTPu/Tf7AHTqgbnfEMnOmPOsHa4
         hRKqflQGUSnov61jc3QbmzNH3jn0V2FmZfz481M/TKUKyUj6CSc1fTvUZ396bcQuTHOW
         z7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364137; x=1794968937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
        b=v2XX3HwO3kkOI/oyuGtYEHaQc/fk6Mk5U3O3dMJHjUPcNkJP89LCUMfTntoHwR67wd
         XuSi8/jm6VbyMz/UsZ6Hhu/wwoup3xAom22zkN7rfWG4PlCeAtyDUnTm0gb8+uVfHj76
         zbq0m2S5HTgm37iisMGP/N40msabs0WiE58qTjcTp0eAGkPfsOf7v6ZKReMVfA5WtuV2
         TCTFgMWJnm6i8mf+nZeIxN4hSAZbnfDZt82cOonaQMvYww9AmkrBJx4vx9hCGoXLhZOn
         KTX6dafT3FVucYMQVciIfoLZ5LWJEmkT99Tsi/1+ceMsJ/3Zlrx1KhsUT6l6zpzlUR6N
         RKAA==
X-Forwarded-Encrypted: i=1; AL+hErFV1lKGTyyq6gYPRf5nSZUrO9xXw1eeuHQwnPnao5cbS1EsuIstQajbaYgVQCcAUdMu0K0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8wiXLGKDPuIfLMxKAZFPG+/1UDdE2n1ukNTZY05Yxo51tsokOY
	s7VJ46WdBs6MtbE7SjhaS0609+16QMbDbUWDGf5fDE8fKVMBKCXmZiez15OguQE3
X-Gm-Gg: AYBFou0fTi5wqs13vWYYLeJr08pgL9GrGDlHmzPkMIqPBdJ09ia4l0hzgKEUzo0q169
	xivDW8NEQL2PpG2BDUE9wrbekhj39WVFV4FPeXsYDVHR/Srp3P56Ni2p5tZjqMm5AQ9VQfYjLhn
	MAynQkaMnlBfjSyIewVQcg0IJfv2PY+Xsc8kSSNvrbuyfPLK1NtseGM3OeFVeCPWEc730JZNVlz
	nuAYkJP4kMEwpAymq8x42qgFw/kUryrExvHad0JdSKOlyGwdEsPSIwH6snSTLFC6Zh+lHFBdHXF
	geqj9fG5B4NwokwAZmReyLC9wooI9Om5OAPEYO2s0B7iCti6bkmV44l0QdeDDBMGY+R0OroSjxn
	+fdOfqhk42kwzGQRfZvdFI8RvoxhGE+eqOQz9aMJ5G9AJldDcqYnniHdu1TdzaxSlADfGpMNz4D
	ssAVSsP6eO4xKyaEjr9A8Bk7D9mbH18f+ii5ZpGROiqyjBC6c6wp71FscJYA2a62QkhJht861Jo
	L356TUkFE7IWKgu45q1c/r6ybmyAoCPtwyJLTpdmQN3MQCHQAgXlr+BqsL4yfkSg3+n0EXQv3qg
	ltQtQ9SlWEra+XqORrLeOnarR+S48+yEECaPe9GI+XXfW9ujDzgNfnvDeB09kI6iLiG/k+vf8Bh
	4RwRlE7Q9KHmGZpLfGF8drOkPN24/V7fGImlhOQUncdEmaieSNU8vO3fLW6nMDogsYIqIjpC/KU
	93wA==
X-Received: by 2002:a05:6a21:1391:b0:3e1:9071:acb2 with SMTP id adf61e73a8af0-3f2ff2e0b6cmr821227637.33.1794364137319;
        Tue, 10 Nov 2026 18:28:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86ce5fsm1603153b3a.21.2026.11.10.18.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: nxp: imx8-isi: remove kzalloc_objs
Date: Tue, 10 Nov 2026 18:28:22 -0800
Message-ID: <20261111022822.67474-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Use a flexible array member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use devm_kzalloc_flex
 v2: add fixes tag, fix typo, and move pdata assignment to original
 place.
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 10 ++++------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 2005584a1215..dcf6c25d7faa 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -473,24 +473,22 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
 
 static int mxc_isi_probe(struct platform_device *pdev)
 {
+	const struct mxc_isi_plat_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct mxc_isi_dev *isi;
 	unsigned int dma_size;
 	unsigned int i;
 	int ret = 0;
 
-	isi = devm_kzalloc_obj(dev, *isi);
+	pdata = of_device_get_match_data(dev);
+	isi = devm_kzalloc_flex(dev, *isi, pipes, pdata->num_channels);
 	if (!isi)
 		return -ENOMEM;
 
 	isi->dev = dev;
 	platform_set_drvdata(pdev, isi);
 
-	isi->pdata = of_device_get_match_data(dev);
-
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
-	if (!isi->pipes)
-		return -ENOMEM;
+	isi->pdata = pdata;
 
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..3165a65391c1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -297,7 +297,6 @@ struct mxc_isi_dev {
 	struct regmap			*gasket;
 
 	struct mxc_isi_crossbar		crossbar;
-	struct mxc_isi_pipe		*pipes;
 	struct mxc_isi_m2m		m2m;
 
 	struct media_device		media_dev;
@@ -305,6 +304,8 @@ struct mxc_isi_dev {
 	struct v4l2_async_notifier	notifier;
 
 	struct dentry			*debugfs_root;
+
+	struct mxc_isi_pipe		pipes[];
 };
 
 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
-- 
2.56.0


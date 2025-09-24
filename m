Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C00A302741
	for <imx@lists.linux.dev>; Wed, 24 Sep 2025 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719276; cv=none; b=pC8CVF/SxLuR7yf7EKSMQnk94kIkroYLd4ViIFkZbRvKRtIPdTRQBX8O4XR/LMSMHcYPvk11i1xvzQcgik46KuGUaTVytetXIAf6DIt2eTEnHd5fAXs6Ys6o68vM5fZ8hBrH+s9R3Tlay7W4fw5dpwHBWIbd1kALajVLVGQbE2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719276; c=relaxed/simple;
	bh=/qGCNh8abWDm3X5xS+Iz+DznKUJ2gBpds0vUYbMtcNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOQmnZ0E5FjZ7wof/g4xXgqrVpzVWR2NA+mb9YUaWYe/Mvh2cGo2cdDQw3RFI6pthbYqS5wbzFCMxcYUTnvSqjgvGVqAgeqfcfZOR3kq3EwtgB3OYaks0j9+7uVZhIeMlU8BICxA7HxLedGtbUHBJFTtQmp5tkIoMKWXAs9jXUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=B/WHm/hV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="B/WHm/hV"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b33d785db6fso78198466b.2
        for <imx@lists.linux.dev>; Wed, 24 Sep 2025 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758719272; x=1759324072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pL2uoqzypHbRpbvTBPNzb3YECUS6GHGmBJvJaUK0ytc=;
        b=B/WHm/hVf3cIOChitvkzTkZwpfhIDMwyEPJum6WdGPfY2MyQfmKZNo9TeeooiQ/wPP
         RpNBargdNOeJN3mQjGEK945Nbg7EjBxe2goS4bMPIBwLDKuO/isHhMv+t1Kbx6r2XY21
         o6iwiUeDfh/35UK+gF/lO9v0TCRaZN+sHNs0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719272; x=1759324072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pL2uoqzypHbRpbvTBPNzb3YECUS6GHGmBJvJaUK0ytc=;
        b=VevhEha3ym3CRXELukZIsKSh7TQeX9by3uGKxjk7sY23SJ3lblsMafs3973Z/2PXuY
         LPeK8QRn32zPH+G3SXSGBZuG4X4XBrVypwZVQOoChatre0zXBjSr0kdT59lbI2qGF++w
         uPmoapRbUU81dIXnUInMH0SS5JLwmgSqe2eWHVSq4WqvGdwvAnlhku1Kzm46CZf91QcU
         yIhsKUtHQXozJGf5kdGsF3xN7rIc13r01kfZ7eXNNukloRsK6Tb5xCnt9Ky2CgBejwWL
         hvdA4ZgDcVPTox1wWtRy7oir8zCjci35ArUP0uZPmheZL7Ifj4f+M9sO9A2lAj4oQ2Qo
         glKA==
X-Forwarded-Encrypted: i=1; AJvYcCX7fj1hRm1wLxkFmZVUMvwnBKyho44bj+u9Hc4Ae6xkPO/oUqw3EbxVtB9tdbqYqrdZI7w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqY+WG8GRWzS/zvym1rM6o9Af65dZWA3Z9adHs2GOMcnH658PL
	rCkTFF6j6N9qeIocjGDLanCnK1gRHeA8RUH2pvEUZr4YWy1Dl0jG7WZzpEjITJivh1k=
X-Gm-Gg: ASbGnct04Wjd1sNvaKQCRWaO8aiZf4dLB89qUJ5qMIAvvkglNAc6lvod9VTvpSZP22+
	Lnz/7wLF5/OID+cQvGIfSl9GA1KAE892RQS/eP48H28sJtt5kRBLmXelwLMtoEJ15793nG8EOwd
	H+WrJa7PSEzWAjZU3Aw1Jluue4VOnfvE0WYyLKW/YgydVYyF21lGK0AjCD+wtAuKDHyAyHjMsWA
	fZ3dyTheI6qEeJw5dRxJXR8XF2kYp1E2RTkPTtkjl3sRXDgWtUW51LrfGnI42g8JNjsTbo4IgYm
	Advy98oaTpt5WKtJ0JipFbBc+qgRwnUhMLX8xOj7GEkDGRd5pXFjjuhTHewzlgtt4cFQnGVKLuQ
	JT7+lcsS5JWF2IoSPJ0lV7P3/1YyRobfNvkJCCvtpgKlGySHe3Iab+zritOX5ZFQTmZqidp8Aa2
	zo8YzimOaQmuF1PO87j1U8mcq+3M35Mw0NR3k1dgNBpqeAy78aUYLbP5hmhp0=
X-Google-Smtp-Source: AGHT+IFYMpB/hfnnMwqXioIIY9YN2MfPYZ5TpMlDu73cNBgIUPkKRv7kC+0WMvzmPN4O0yWcKdtA3Q==
X-Received: by 2002:a17:907:3f20:b0:b2e:34f1:9dbf with SMTP id a640c23a62f3a-b30261c1e6amr601703866b.1.1758719272475;
        Wed, 24 Sep 2025 06:07:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f382b0sm1574379866b.2.2025.09.24.06.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:07:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Takashi Iwai <tiwai@suse.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [RESEND PATCH 1/3] ASoC: mxs-saif: support usage with simple-audio-card
Date: Wed, 24 Sep 2025 15:07:44 +0200
Message-ID: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for enabling MCLK output when using the simple-audio-card
driver. In the sound/soc/mxs/mxs-sgtl5000.c use case, that driver
handles MCLK enable/disable by calling mxs_saif_get_mclk() and
mxs_saif_put_mclk() at probe/remove. This does not happen when the
simple-audio-card driver is used. Extend the mxs-saif driver to enable
MCLK output in that scenario.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 sound/soc/mxs/mxs-saif.c | 123 ++++++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 33 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 3e3a62df3d7e..a01a680ad4d7 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -24,8 +24,79 @@
 #define MXS_SET_ADDR	0x4
 #define MXS_CLR_ADDR	0x8
 
+#define MXS_SAIF_BUSY_TIMEOUT_US 10000
+
 static struct mxs_saif *mxs_saif[2];
 
+/*
+ * Since SAIF may work on EXTMASTER mode, IOW, it's working BITCLK&LRCLK
+ * is provided by other SAIF, we provide a interface here to get its master
+ * from its master_id.
+ * Note that the master could be itself.
+ */
+static inline struct mxs_saif *mxs_saif_get_master(struct mxs_saif *saif)
+{
+	return mxs_saif[saif->master_id];
+}
+
+static int __mxs_saif_put_mclk(struct mxs_saif *saif)
+{
+	u32 stat;
+	int ret;
+
+	ret = readx_poll_timeout(__raw_readl, saif->base + SAIF_STAT, stat,
+				 (stat & BM_SAIF_STAT_BUSY) == 0,
+				 MXS_SAIF_BUSY_TIMEOUT_US,
+				 USEC_PER_SEC);
+	if (ret) {
+		dev_err(saif->dev, "error: busy\n");
+		return -EBUSY;
+	}
+
+	/* disable MCLK output */
+	__raw_writel(BM_SAIF_CTRL_CLKGATE,
+		saif->base + SAIF_CTRL + MXS_SET_ADDR);
+	__raw_writel(BM_SAIF_CTRL_RUN,
+		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
+
+	saif->mclk_in_use = 0;
+
+	return 0;
+}
+
+static int __mxs_saif_get_mclk(struct mxs_saif *saif)
+{
+	u32 stat;
+	struct mxs_saif *master_saif;
+
+	if (!saif)
+		return -EINVAL;
+
+	/* Clear Reset */
+	__raw_writel(BM_SAIF_CTRL_SFTRST,
+		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
+
+	/* FIXME: need clear clk gate for register r/w */
+	__raw_writel(BM_SAIF_CTRL_CLKGATE,
+		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
+
+	master_saif = mxs_saif_get_master(saif);
+	if (saif != master_saif) {
+		dev_err(saif->dev, "can not get mclk from a non-master saif\n");
+		return -EINVAL;
+	}
+
+	stat = __raw_readl(saif->base + SAIF_STAT);
+	if (stat & BM_SAIF_STAT_BUSY) {
+		dev_err(saif->dev, "error: busy\n");
+		return -EBUSY;
+	}
+
+	saif->mclk_in_use = 1;
+
+	return 0;
+}
+
 /*
  * SAIF is a little different with other normal SOC DAIs on clock using.
  *
@@ -48,6 +119,7 @@ static int mxs_saif_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 			int clk_id, unsigned int freq, int dir)
 {
 	struct mxs_saif *saif = snd_soc_dai_get_drvdata(cpu_dai);
+	int ret;
 
 	switch (clk_id) {
 	case MXS_SAIF_MCLK:
@@ -56,18 +128,22 @@ static int mxs_saif_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 	default:
 		return -EINVAL;
 	}
-	return 0;
-}
 
-/*
- * Since SAIF may work on EXTMASTER mode, IOW, it's working BITCLK&LRCLK
- * is provided by other SAIF, we provide a interface here to get its master
- * from its master_id.
- * Note that the master could be itself.
- */
-static inline struct mxs_saif *mxs_saif_get_master(struct mxs_saif * saif)
-{
-	return mxs_saif[saif->master_id];
+	if (!saif->mclk_in_use && freq) {
+		ret = __mxs_saif_get_mclk(saif);
+		if (ret)
+			return ret;
+
+		/* enable MCLK output */
+		__raw_writel(BM_SAIF_CTRL_RUN,
+		saif->base + SAIF_CTRL + MXS_SET_ADDR);
+	} else if (saif->mclk_in_use && freq == 0) {
+		ret = __mxs_saif_put_mclk(saif);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 /*
@@ -238,34 +314,15 @@ int mxs_saif_get_mclk(unsigned int saif_id, unsigned int mclk,
 					unsigned int rate)
 {
 	struct mxs_saif *saif = mxs_saif[saif_id];
-	u32 stat;
 	int ret;
-	struct mxs_saif *master_saif;
 
 	if (!saif)
 		return -EINVAL;
 
-	/* Clear Reset */
-	__raw_writel(BM_SAIF_CTRL_SFTRST,
-		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
-
-	/* FIXME: need clear clk gate for register r/w */
-	__raw_writel(BM_SAIF_CTRL_CLKGATE,
-		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
-
-	master_saif = mxs_saif_get_master(saif);
-	if (saif != master_saif) {
-		dev_err(saif->dev, "can not get mclk from a non-master saif\n");
-		return -EINVAL;
-	}
-
-	stat = __raw_readl(saif->base + SAIF_STAT);
-	if (stat & BM_SAIF_STAT_BUSY) {
-		dev_err(saif->dev, "error: busy\n");
-		return -EBUSY;
-	}
+	ret = __mxs_saif_get_mclk(saif);
+	if (ret)
+		return ret;
 
-	saif->mclk_in_use = 1;
 	ret = mxs_saif_set_clk(saif, mclk, rate);
 	if (ret)
 		return ret;
-- 
2.43.0

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: microgea-rmm-audio

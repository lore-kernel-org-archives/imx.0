Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B40F2DEA9B
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272731; cv=none; b=d2Qp+PGLc00LfP9Qrt0AyfHDo1ExOFNlBMH/v0Y5pjacD+KQS6B4saLo31SdGXWN7Xj2nLncmn0xhHZ8UYS82B0GEGZk3UBJiMK/MBa9zw+kdCXtSa440QRsS0jnbDmqmkcUdhqaYOMwguL7+GPUyU1Pvrl/rGjpSxA4Pt1RdeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272731; c=relaxed/simple;
	bh=9X7Ik0ab5d6Iz/18MVVGvVc22VgP6m21NK5Flfc6r74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ib5IS2YsnzQ51WsBA/mVSf+W/tVEx5KYr1wDhuC7SbfWeZxo/NXzMCaKdBW8/ibJ5BI4i2jk7lkKF6S+pNGyfVmQ3kpkLRfyJgrEwDWrJB9iaOJlOY3sedyEXD8W7LIILFm9kQ0HBui3cHKHnhyWLLStHih8zGakZpwpcoWr5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzO7CdC9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzO7CdC9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3438231df5fso6818997a91.2
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 01:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272729; x=1765877529; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT5Tpa0cRknM+Vnr1JQ25hhT3yDeTWdGEabrHv7VB7g=;
        b=SzO7CdC9ghW5QbGCIV9G4Nx6VzJHsKeYqq/MQWBCKzEfzZtWcpyYTkHdDuhLEYlXXF
         R9xrkLVwbs/AcuBA1YbVXjKXinagfgdN4OTHxU2nT7AFMgoRWfT8NKRDszRvkB+0sPv3
         9oPfcmiHfuaCc7o9G+9cEs312JJvvHUzslbJGOO4Due6DWJZ0WsHA4WIVzqEn/AcKd7d
         he752XDGZ+8Gr17paKxQNOLn7LNF9HmPbRc+/DGpIkPDgi22aRmEwkqGJkBUObgXDPWA
         SvkLopFfETAvYGiInrIDwV87NL2a6ZkYEja/LUmd1jj7YInMPnD8y5thjBD1woBAx52m
         it+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272729; x=1765877529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wT5Tpa0cRknM+Vnr1JQ25hhT3yDeTWdGEabrHv7VB7g=;
        b=PvJ6soDZSG/EYTu0ya1UyhN8nYkz+hMMlH5SGPZRbVPRcJcihH+qxSAGD2fpa7X+ZK
         EqD3i5H1v8hVjaf81ohD77BWYBdb4fjP3XDUE7FgXPuf+HY9LVoYje6T34VhqSRWa71u
         b6EwdbG2SMcExuylfNExMXGwu9YjEBHH9iBKXAYNph3OgEcXHZzxfEtpgEyX08ZWkSlw
         MoWsIYh+HCPBVIKdAG4Fj48OJGgAWlC9ukkf5y4rzsrlFJRnFfzGaWScoDlNntzMkTVa
         dWmH1OZkjMZmttR6oBrV63URls5mps+lOtwyxeELMU1wLYsy1rTWgIdhRhetrKtUsQ5K
         JyfA==
X-Forwarded-Encrypted: i=1; AJvYcCW9zgwkuh33IkYqbsCKh1bsZPSc28m2HkE9iKtnZTdr3r45bWw6bP9JbI3w4JAqgw2dk70=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIfeU7BFcg4EaGvivRMYR0Uj0Ap32yBXpxaptqNCcCybspcRkB
	CUfro5aljrxkSUR7cYPQgnjz03v6PFoV5u00s+g+Rr+1a2FvMOqdwb/e
X-Gm-Gg: ASbGnctAQAfM/edJeAJ79LGw9oseWwbQQAcPJpXy7aTv/QTKE03GRLnsO981XdoXe5r
	uWEGx8ck/jnK0kGiGRUgsEi8ry9/yxHOVfBWI5A9kDo3+O4QO5f63a3r6FxU/8neOl4qjnjf1Ap
	eCU3e/si6tjtFJwmElkie6paRBwly1wpcJgXWknnEYPKOQeVsA0UYt40DBE0SQ8KePZBg/0GNMB
	2byjECtsj56LymEnh4tCsTrf1/9kQCkqKbEH8Y0pOVg1/8VeIxxdvY/Vc35xG26s7QRUe0KVR0Q
	gREMTlvmI2gX09fa4lW/xUQ8cQ3T83x3ep3bFuoIoLNPKuqPYKKI6rjULd7AH/PFUaVQb/x/2Lq
	NkfDn/e0h2vx9Y6wTIshLPMlLUfO0RuuhhWwYcC6v9I4QSUVXeTtnWJhuYlbugVvK5e6/YjPg9+
	q8T3hIpBZ5vziitvYESeVwaU5AHsQZefYFGwppeGaXFx2LjOBpCVNx0Ih6RXOnv61ZQH7gFoxVd
	fs15O/Kz/h3iR5JhKHmyoKXbRoBYZMswYb3UTPBiMgrBf7yqCLiwE757b1K2ynf3uw4ZL460VwQ
	DKqHs6tbn9vdLIvriO7VdAgktrF+IIQSiLotm37eEFLRvB4G/H0=
X-Google-Smtp-Source: AGHT+IEf8k2cGwcYziNVTfhJRUNWm4Blk7mY9yN2+i0tDJn66zOZx4itoz7PdkJwqZ4b134kt4zn5Q==
X-Received: by 2002:a17:90b:3506:b0:340:bde5:c9e8 with SMTP id 98e67ed59e1d1-349a2613605mr9150879a91.22.1765272729310;
        Tue, 09 Dec 2025 01:32:09 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:09 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:18 +1000
Subject: [PATCH 5/7] ASoC: soc-dai: add common operation to set TDM idle
 mode
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-5-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3549;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9X7Ik0ab5d6Iz/18MVVGvVc22VgP6m21NK5Flfc6r74=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7I1nvHsL9CcfHRpJM/b7PymxSXtYfH8PI94VRjWN
 Nop1LR1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApvpKJcP/hCPlHm6PuVo3nGwJWLYz+8wxVlu1PgahH335M3Z3v1DmYWR4cPhcbHe
 w4rJdj2QFo7h+m50xEP60+dIS0Qn7l+jL39VkAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, like certain Texas Instruments codecs, can be
configured to alter their behaviour when idle on the bus. Now that we
have definitions for various idle modes, add a snd_soc_dai_set_tdm_idle()
operation to control this in a standardised way.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h |  7 +++++
 sound/soc/soc-dai.c     | 40 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index a5784ef8e3f7..1f411237dde5 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -194,6 +194,10 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
 
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode);
+
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 	unsigned int tx_num, const unsigned int *tx_slot,
 	unsigned int rx_num, const unsigned int *rx_slot);
@@ -310,6 +314,9 @@ struct snd_soc_dai_ops {
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
 		unsigned int tx_mask, unsigned int rx_mask,
 		int slots, int slot_width);
+	int (*set_tdm_idle)(struct snd_soc_dai *dai,
+			    unsigned int tx_mask, unsigned int rx_mask,
+			    int tx_mode, int rx_mode);
 	int (*set_channel_map)(struct snd_soc_dai *dai,
 		unsigned int tx_num, const unsigned int *tx_slot,
 		unsigned int rx_num, const unsigned int *rx_slot);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a1e05307067d..2f370fda1266 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -282,6 +282,46 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
 
+/**
+ * snd_soc_dai_set_tdm_idle() - Configure a DAI's TDM idle mode
+ * @dai: The DAI to configure
+ * @tx_mask: bitmask representing idle TX slots.
+ * @rx_mask: bitmask representing idle RX slots.
+ * @tx_mode: idle mode to set for TX slots.
+ * @rx_mode: idle mode to set for RX slots.
+ *
+ * This function configures the DAI to handle idle TDM slots in the
+ * specified manner. @tx_mode and @rx_mode can be one of
+ * SND_SOC_DAI_TDM_IDLE_NONE, SND_SOC_DAI_TDM_IDLE_ZERO,
+ * SND_SOC_DAI_TDM_IDLE_PULLDOWN, or SND_SOC_DAI_TDM_IDLE_HIZ.
+ * SND_SOC_TDM_IDLE_NONE represents the DAI's default/unset idle slot
+ * handling state and could be any of the other modes depending on the
+ * hardware behind the DAI. It is therefore undefined behaviour when set
+ * explicitly.
+ *
+ * Mode and mask can be set independently for both the TX and RX direction.
+ * Some hardware may ignore both TX and RX masks depending on its
+ * capabilities.
+ */
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode)
+{
+	int ret = -EOPNOTSUPP;
+
+	/* You can't write to the RX line */
+	if (rx_mode == SND_SOC_DAI_TDM_IDLE_ZERO)
+		return soc_dai_ret(dai, -EINVAL);
+
+	if (dai->driver->ops &&
+	    dai->driver->ops->set_tdm_idle)
+		ret = dai->driver->ops->set_tdm_idle(dai, tx_mask, rx_mask,
+						     tx_mode, rx_mode);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_idle);
+
 /**
  * snd_soc_dai_set_channel_map - configure DAI audio channel map
  * @dai: DAI

-- 
2.52.0


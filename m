Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89E72F5496
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272739; cv=none; b=r6DxCRM3GlV+ABCvAQ26OIduVOJ/imXfDt6j+XLxdgVj9xyA6k0YlM79O0tLox0Cn+TJcZLJr85ohw8ZWSciM4md3Zx1RKTPn9T3iXb/h3Mn7Hg9nIiUkgebzftX3YhZz2Yvn+98DGPQy2ydtG6xRLkzgJXh+ptwBBvbp8alUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272739; c=relaxed/simple;
	bh=+drHU6Kv5dx2gWI6Rb8MzRIPjOqO6lKIV5+rr02mpIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZk53Ldaa8IR5YNPGLeD31UCfYd+8+l5E26Xe0hEgGK3ccHVS769ewufVCLjL9CveJ0cW8CNzocBen0a8aS/mtyvF3ukYBacPXydyqRI0x8LVL+QRhkv+l9p1MLzE4M+avlDbLTzJOrebSe59t2EdAGJ5MeDZWn39e4wR2zdv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byHFOVuu; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byHFOVuu"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso4620287a91.2
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 01:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272737; x=1765877537; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PN0Qd2/OSPDiP/SCt4m3b00gB3oBVDwfSgnMIlH8+4=;
        b=byHFOVuuAhAn4RYa3NRdHjzGAER8X5qrIvTc9qJzz4DPVEI9uknjggnWfhIUbHpDUI
         GCTztdpe5QKhaBVizDk9I0oT5A3U+AQDnHPnCHtNL+5AYgBTHzrpR7bpdasgFbn75oej
         AMe38XsFgm/i1dI/mQHYx5tbmp/NLAz5t0jDOzJbAitC0Jg8MfCM4VqjcdgM3+JJ22U+
         3iJQ+1sU/ao978qqvTHYUuBp77dbTQgZtX4RcCtsIoawq5Ujekp/E78QnANJ0Z9gAPGx
         XdjCS8GDGoIVy9T/L/8oxhNZTlhrvSYaCHqJD7Du+a6eQf1O2jB3GIX6TrwVW+7nO0Xb
         h8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272737; x=1765877537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+PN0Qd2/OSPDiP/SCt4m3b00gB3oBVDwfSgnMIlH8+4=;
        b=rw1lbUqr6IKsNizCyFo/z4ymKLVIj0XZNPCXIW4ZrRm8yXTNBVDWmnr0TjhipDVWtr
         r2UDMILUpzfnXXXDhQuSE4YgdHdCtciBUEKGTVM1t4Gyh5mVVwFHVV5ylZ9hbxRey+Hl
         Mvp23rx3+bpJhjCQ23ErIZ890+zLAsLonPUZ53ETH6viAljkR2DfJ50COAcOBh/Y8sO6
         qIKIFn4iz2tvkfvMpVQVO/CHm1LHw4FCECyslYhArdeY6n3cPVeb6FUmJi9OrxEIoyH8
         tH4DEDfw34JFJXJAWPjPX2dkU4fvyIQ8FZz4v8oKhW4AIhBWN5SznTek7GwB8LFCeHA+
         4uvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQaJgaSyJy1HkNqn8+FEtHaCCx6uwnw5i95zwNLCYTRC+bypgvhnOi3DHBZIZTRN2z4Hs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvuBdfu767iiGiyjDaNmrPNjTTEA5OalIYrsmiUCEbSpcCiLsg
	gGOj3FocVv1DqmlhgZqPaIvjNH+Fy4LVuAmQAQ1++r0D4K1TfiGfTayY
X-Gm-Gg: ASbGncslcTCm9yNp1kqhXBk064VLgY9xJ+fG4368WD7a4x2vYIZf3S8kBqnWpFc7QSD
	bjnijerVUWXNKqkelAM42wbs61wjInDol+QesoNoOpLkjyTsr9BHHjaXk6axEakqJ2WC4MfQCia
	xJKDWYlbL9EG+/dTX6LLp/vA2ML/kMeBidPghmCL89T5bmNDaIaex26XMWUacxDAKPGhTjAKjn9
	B8uIYiQyh4EbLNFfaUkV/jhZL7pFMqjk4z/Rb6RJvSztD1322OjpkiFGw5+r44gX8JCUjedMJEB
	nlQR1uMRh6iYUlDlrv6vT/XP2oOpGdtyoz/blry0SWX2G2f1v65NcbynCV6fLZShUwjktApsAfB
	azhgaRB9l0V7s2gYpTHGSiyD8nliI+fyPheQwK1jl9I0FzD7BESiwSGfjNNLLp9PblpusGtGkAl
	YDtvJqYXyY7Wse78ICaZOHUl7GvQT7IxITKSPhj4Ye0R3Yj/dpzhkkNvT9zUrO2yhjfONFpmc8h
	Gxp075XZUDv0upGTy+KK6q8FNlAyhQfhTnMdC2cy6quA1BS2S70WbgZP8Qhs6fAPoD5Ru++hg98
	q6q/og7j1kU8z+IYcF+FIH/Z2/9PReIhrKtaNZJiZ3mWQQ2l28TiAahHN7jCOw==
X-Google-Smtp-Source: AGHT+IFotzk8vBpJPn3igE6lPKAddyobbStk24n2ejESg7hiOK8wrzqTNKlOE578VcVOs6JfDZz2qQ==
X-Received: by 2002:a17:90b:35cb:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-349a250ee48mr9384938a91.15.1765272736911;
        Tue, 09 Dec 2025 01:32:16 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:16 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:19 +1000
Subject: [PATCH 6/7] ASoC: tas2764: expose SDOUT bus keeper via
 set_tdm_idle operation
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-6-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4997;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+drHU6Kv5dx2gWI6Rb8MzRIPjOqO6lKIV5+rr02mpIU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7JfL7h9ab2x4v5VXfeDrtgleVdwvmWYk9b4w7zy2
 8sdd+yvdUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKb6xi6GP1y/mVemPYxX+hStFdmwwFavarPMj9QTcfuDGrtMjn48W8rwV+jP1Fa
 Wa6duhjKu/KD9X1tVgbXtvWZDDaN1WaBCvOcHFgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2764, and the Apple-exclusive variant SN012776, include bus keepers
on the SDOUT pin that can be configured to alter the behaviour of the
SDOUT pin during specified TDM slots. The chip can either leave the
bus floating (default/uninitialised behaviour) or fill the specified
slots with zeroes.

Expose the SDOUT bus keeper and allow it to be configured using the
set_tdm_idle DAI op. The mask must be cropped to only cover slots
valid for the configured BCLK ratio, so introduce a set_bclk_ratio
op that properly configures the bus keeper too.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h | 11 +++
 2 files changed, 106 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 36e25e48b354..423b7073b302 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -44,6 +44,11 @@ struct tas2764_priv {
 
 	bool dac_powered;
 	bool unmuted;
+
+	struct {
+		int tx_mode;
+		unsigned int tx_mask;
+	} idle_slot_config;
 };
 
 #include "tas2764-quirks.h"
@@ -509,11 +514,101 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int tas2764_write_sdout_idle_mask(struct tas2764_priv *tas2764, u32 mask)
+{
+	struct snd_soc_component *component = tas2764->component;
+	int i, ret;
+
+	/* Hardware supports up to 64 slots, but we don't */
+	for (i = 0; i < 4; i++) {
+		ret = snd_soc_component_write(component,
+					      TAS2764_SDOUT_HIZ_1 + i,
+					      (mask >> (i * 8)) & 0xff);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int tas2764_set_dai_tdm_idle(struct snd_soc_dai *dai,
+				    unsigned int tx_mask, unsigned int rx_mask,
+				    int tx_mode, int rx_mode)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* We don't support setting anything on SDIN */
+	if (rx_mode)
+		return -EOPNOTSUPP;
+
+	if (tas2764->idle_slot_config.tx_mask == tx_mask &&
+	    tas2764->idle_slot_config.tx_mode == tx_mode)
+		return 0;
+
+	switch (tx_mode) {
+	case SND_SOC_DAI_TDM_IDLE_ZERO:
+		if (!tx_mask)
+			return -EINVAL;
+
+		ret = tas2764_write_sdout_idle_mask(tas2764, tx_mask);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component,
+						    TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
+		if (ret < 0)
+			return ret;
+
+		tas2764->idle_slot_config.tx_mask = tx_mask;
+		tas2764->idle_slot_config.tx_mode = tx_mode;
+		break;
+	case SND_SOC_DAI_TDM_IDLE_HIZ:
+	case SND_SOC_DAI_TDM_IDLE_OFF:
+		/* HiZ mode does not support a slot mask */
+		ret = tas2764_write_sdout_idle_mask(tas2764, 0);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component,
+						    TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN, 0);
+		if (ret < 0)
+			return ret;
+
+		tas2764->idle_slot_config.tx_mask = 0;
+		tas2764->idle_slot_config.tx_mode = tx_mode;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+/* The SDOUT idle slot mask must be cropped based on the BCLK ratio */
+static int tas2764_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(dai->component);
+
+	if (!tas2764->idle_slot_config.tx_mask)
+		return 0;
+
+	tas2764->idle_slot_config.tx_mask &= GENMASK((ratio / 8) - 1, 0);
+
+	return tas2764_write_sdout_idle_mask(tas2764, tas2764->idle_slot_config.tx_mask);
+}
+
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
 	.set_fmt    = tas2764_set_fmt,
+	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
+	.set_tdm_idle = tas2764_set_dai_tdm_idle,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 538290ed3d92..4494bc4889dc 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -126,4 +126,15 @@
 
 #define TAS2764_BOP_CFG0                TAS2764_REG(0X0, 0x1d)
 
+#define TAS2764_SDOUT_HIZ_1            TAS2764_REG(0x1, 0x3d)
+#define TAS2764_SDOUT_HIZ_2            TAS2764_REG(0x1, 0x3e)
+#define TAS2764_SDOUT_HIZ_3            TAS2764_REG(0x1, 0x3f)
+#define TAS2764_SDOUT_HIZ_4            TAS2764_REG(0x1, 0x40)
+#define TAS2764_SDOUT_HIZ_5            TAS2764_REG(0x1, 0x41)
+#define TAS2764_SDOUT_HIZ_6            TAS2764_REG(0x1, 0x42)
+#define TAS2764_SDOUT_HIZ_7            TAS2764_REG(0x1, 0x43)
+#define TAS2764_SDOUT_HIZ_8            TAS2764_REG(0x1, 0x44)
+#define TAS2764_SDOUT_HIZ_9            TAS2764_REG(0x1, 0x45)
+#define TAS2764_SDOUT_HIZ_9_FORCE_0_EN BIT(7)
+
 #endif /* __TAS2764__ */

-- 
2.52.0


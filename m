Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AF92F5A05
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272750; cv=none; b=dtB5aVfWB5ewm0yY+eyIdjYGIb2okXQXsH7j82EHGBeloz6BeA7Hztop3UFz8InBwWkkMHLFHwIUrJC4zKIZOxhf94KH6fd9o2MDIQr8+9LlNKCqsPC5i/x9G46i3gBB9rWcSbs7wT4yctbnsdCJaE811sipgllyR5aqiqijfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272750; c=relaxed/simple;
	bh=hQ3yIQ+LRbuFbg4idC7Bt8j/T1Iri2PmTgdBl9Lz8Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+xbDD1WappymfBLrC11T2XKl/KNRwzLpoCCnrGmtGLqdKCmzJbjv9XHv+ivv965cINR3yFlg3IvqfGmU5XyTQVDsUfv9mWfKi1i/sg7eNPSqJ5xtrNVacFG5Z/ILfyRDOaMFPSk0qi+ZWJOOk1TiBLS+29bRO+mY0TuKigrHn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIDTt56A; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIDTt56A"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so3694700a91.2
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 01:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272744; x=1765877544; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=MIDTt56A9O7CEDIBTqA8PdSXoLsytqh0u3WBFFlTVhCevcYOqXQB+AjmeB1RRYN/jh
         to0l/PgZJdvUSJNdetehyJg3K8wvakNB3I8Sb/ivS17YDp/I1OI6nGqbHQFpTiL9HwNK
         5TkNwrIzUkcmABa03ERWkRTHPcnVOOv1z28TLyiOP8jiIqktOyqEMwiqmk5xtnFjxQVN
         tTaPuQCP5sxoEPUNY3nvmyoWzOkcKOQhLf7Ebg/DcRgfzUxVl2bltIBcm7TxFsPjnEaF
         yc7AjsKTKB7cE9oHrIdPAtIUFonuuKbgchWQEE41w7HHtfkw639Lmu/X8j4xNGRfNSiQ
         DKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272744; x=1765877544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=dqMeLlQKSOEMxatgHGkDt4ziLPqxPg2UVHnG4ePUiVx6HI97VP5r1/PZ8hN+IXf8+Q
         jYUQ7zjs9rXX7IkktK+PomdN3aLXFWmBVhUeffDQs3vBE3GkZjhs+6dGxXrDjGg0pQU9
         rfvHMA/rAEX4M+uC0nbXmZUeUK9k74srV1Fv6UraZUezwNHNGFtbQEITRavJSihy6XTJ
         FY1rUUzfwYUtghA2C/awI+A/8Q9WPh5B4dF2hMyhGwU8FO3+PiRbbrNob+Tj9UAs1F3G
         Ydlji0P2s+wBrjjnKT9/0gWNq/dv/Zb4f8xky1sak5IslJuDD2JNpOj/fP644OT3v32M
         DAjg==
X-Forwarded-Encrypted: i=1; AJvYcCUHmpXsJ19ix8PUZdTTiju5UT/8QBuXk+gbeRsuck7FZsAVKRy1bC0lidsvOa0Ihur2fkE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTmofBwvjQHlKLqDTFwffvnM9ggXHjf6dDAcKmJylNJA0BsJ4O
	LLXJMF427FnkwoMEw3eZEWadVJOnEOd3JeLINHDq0/CD6Mtgwjc4gsdh
X-Gm-Gg: ASbGncs7TnJktvbX5O+y3pAN5/8oyco04l0WBf8THwrzGyOxObPUuSDtU0nOg8XyWiC
	YMaThZwksWjdyDBmLJT5k9D4Cxxiz9Ak5PqSal+qPNU6g2O/8OvD/2ZJtH7lxvCdEJqIKlzuhca
	KYx5B4QRcFua58c72mfk+LavFuM/hvs4jf/ue5JhufiQZpGaOVXgG2wnEvpduyk1eptGg7uawmz
	juQOVfULnzpSgwLgJDjwrtJZhNHSUGFnpefimKOgcDk6FF1swFAtU/l431ZyVWWUMg0MdKN6JgH
	vWQfIelU55liePLPuqiAPiW8eT0ldEnopBrbgVH5yTtCQU29uvPiNz4hXAj1yEtqU+cD4ZN9Sqp
	MNFKKG44XQd39MOLSAeY91Yval8dY+9hnNmnXtqumC3PZHCUse+/jd7WyFDJ5AluUZyWmfe4Pgm
	YYBjz25KX9No/fLx6XZOPF11+3QnsUxoRVy4+SvfUGZv+3QVv7jtl9Snyxgxa2sA5jUzgzQ1NAt
	nceZEyEnujLD+5Tdehwy/fffMZu9+SlPqv7cwbYYE4xFuelgHEZks5ciWN72qKaKZhE4M+90Zgz
	pCoHU5Ngc+EqPtf7WsKJKWwcvkl+y/EfU1Fh6XhSQAvZ+1dbIKI+QreXJW9WOw==
X-Google-Smtp-Source: AGHT+IHshWKoIvDGYXvDIhmbIHXx+eRzKnkbv3j7ltjnhSQGKLSVw2gL9b8YPyFcCo5W0olsRE/M9w==
X-Received: by 2002:a17:90b:390f:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-349a268665bmr9074422a91.17.1765272744486;
        Tue, 09 Dec 2025 01:32:24 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:24 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:20 +1000
Subject: [PATCH 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-7-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=hQ3yIQ+LRbuFbg4idC7Bt8j/T1Iri2PmTgdBl9Lz8Vw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7IPlyhL6Uu6eG8tPd/1Q3SR2v6KynBNJ+Oqo+syC
 zJyDzN3TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApvpPJsM/020srMGnkqR/HGyTX+x85Moq67CKyEOXP/GGJqm+Fr2/ipFhuf4ktV0
 Fqk9nqfjJLHtnY16gJWL952ahxyKW61suer3kAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 includes a bus keeper which can be used to control the behaviour
of the SDOUT pin during specified TDM slots. The chip can either pull
the pin to ground, actively transmit zeroes, or keep the pin floating
(default/uninitialised behaviour).

Expose the bus keeper via the set_tdm_idle DAI op so that it can be
configured by consumers.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 75 +++++++++++++++++++++++++
 sound/soc/codecs/tas2770.h | 12 ++++
 2 files changed, 87 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 6f878b01716f..d4d7d056141b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -492,11 +492,86 @@ static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
+				    unsigned int tx_mask,
+				    unsigned int rx_mask,
+				    int tx_mode, int rx_mode)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* We don't support setting anything for SDIN */
+	if (rx_mode)
+		return -EOPNOTSUPP;
+
+	if (tas2770->idle_tx_mode == tx_mode)
+		return 0;
+
+	switch (tx_mode) {
+	case SND_SOC_DAI_TDM_IDLE_PULLDOWN:
+		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
+						    TAS2770_DIN_PD_SDOUT,
+						    TAS2770_DIN_PD_SDOUT);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_ZERO:
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_FILL, 0);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_HIZ:
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_FILL,
+						    TAS2770_TDM_CFG_REG4_TX_FILL);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_OFF:
+		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
+						    TAS2770_DIN_PD_SDOUT, 0);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
+		if (ret)
+			return ret;
+
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	tas2770->idle_tx_mode = tx_mode;
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops tas2770_dai_ops = {
 	.mute_stream = tas2770_mute,
 	.hw_params  = tas2770_hw_params,
 	.set_fmt    = tas2770_set_fmt,
 	.set_tdm_slot = tas2770_set_dai_tdm_slot,
+	.set_tdm_idle = tas2770_set_dai_tdm_idle,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 3fd2e7003c50..102040b6bdf8 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -67,6 +67,14 @@
 #define TAS2770_TDM_CFG_REG3_RXS_SHIFT 0x4
 #define TAS2770_TDM_CFG_REG3_30_MASK  GENMASK(3, 0)
 #define TAS2770_TDM_CFG_REG3_30_SHIFT 0
+    /* TDM Configuration Reg4 */
+#define TAS2770_TDM_CFG_REG4  TAS2770_REG(0X0, 0x0E)
+#define TAS2770_TDM_CFG_REG4_TX_LSB_CFG BIT(7)
+#define TAS2770_TDM_CFG_REG4_TX_KEEPER_CFG BIT(6)
+#define TAS2770_TDM_CFG_REG4_TX_KEEPER BIT(5)
+#define TAS2770_TDM_CFG_REG4_TX_FILL BIT(4)
+#define TAS2770_TDM_CFG_REG4_TX_OFFSET_MASK GENMASK(3, 1)
+#define TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING BIT(0)
     /* TDM Configuration Reg5 */
 #define TAS2770_TDM_CFG_REG5  TAS2770_REG(0X0, 0x0F)
 #define TAS2770_TDM_CFG_REG5_VSNS_MASK  BIT(6)
@@ -115,6 +123,9 @@
 #define TAS2770_TEMP_LSB  TAS2770_REG(0X0, 0x2A)
     /* Interrupt Configuration */
 #define TAS2770_INT_CFG  TAS2770_REG(0X0, 0x30)
+    /* Data In Pull-Down */
+#define TAS2770_DIN_PD  TAS2770_REG(0X0, 0x31)
+#define TAS2770_DIN_PD_SDOUT BIT(7)
     /* Misc IRQ */
 #define TAS2770_MISC_IRQ  TAS2770_REG(0X0, 0x32)
     /* Clock Configuration */
@@ -146,6 +157,7 @@ struct tas2770_priv {
 	int pdm_slot;
 	bool dac_powered;
 	bool unmuted;
+	int idle_tx_mode;
 };
 
 #endif /* __TAS2770__ */

-- 
2.52.0


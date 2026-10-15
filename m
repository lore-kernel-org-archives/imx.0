Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8531F99C
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028904; cv=none; b=EpeI/ylBmOTT85xJ9sBOsYwbwaVPiMHXw+NQSJ9XPmzzIcH+HYSOmGHtiqrLxfvIsmRxAZovC4qmrGTqgQEhHDTI7Jxn984pjyq1AdcI2hxnX3JiwcN4Axeb70F/X5rPdo4ZmrdthLz4CYz1oPRD6JAr+k5mst+bGsTZSpIRGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028904; c=relaxed/simple;
	bh=tEX34tHuv9Enx3BSXJsLezOkH8S4dBDt6DQw1nfmw4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5lXgVGUCeDbaN34OAtTEHyzKMPlI7YxOcYEq8TrJzcO45CxR3mN5w5qkv/oTPiDtfhf26Q9d5voo08NpottsRS00rZjZ0m4YcKfZPd5R660HThppnH4+rzlInD4cSqI4zZW36vpmFI9Q+6f++xJhsVuqwAygmYzdhtYei7y540=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhNHNeRE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhNHNeRE"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e7e742a2c7so32173955ad.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028903; x=1792633703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6Pl3gMBQYmN9D7oerWQplIq1HLxsu+OxdUd7erjjPU=;
        b=MhNHNeREZonaCENMGHx/0KrhRaPU1K+xr45RxskL/vsxC6OBgcjn7v7bVIC6tfXjzq
         7/bfE+GNvV4Ky26nEIzVDLe9NnsrpQXej7X/1OFEybL++uHALsXfo/W+b3yvwCvIdU8f
         MnPsiGn4RkWFHloyb00dnZ/DaWNlxpWuhWfPYuULD73/KkFMwsynbnXGN+8waJRI6f1b
         h3wnt4vvDt/Fmek2GpZ+H9WNkziV16DRPG2YeycD8FrGQ2YRbMJiUbADRZMo+vf9p3J1
         uzNLyhMXI6QVfE6UigR6lYhZ/Glcor4oW0ZXZlemCtZg280LEF1S3F5KiONJpwqSyR2K
         HtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028903; x=1792633703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6Pl3gMBQYmN9D7oerWQplIq1HLxsu+OxdUd7erjjPU=;
        b=pjfThde75sp9WAeny9hAMA/okuNrkzpZ8NX8hIQoXtFySEuDSR2dnkrU8yoTXHEnGL
         uOvPIHG8gw8qjMXOcjDEBwToNndg/AmdWl8A7lF1MVzpIhXDwASwMSC13zotv/NWx08Y
         pwm1MT5JK+oMhm6oXHIMunXBdOTlYSyzV0O6Q8DCF2ADEqZ4k7FMsNCDGijGlpeBsHQr
         /qvcqEQnktJF96PA1+DJwaw09RqOmXgRfDLS7+uQ3QjpCWpMyOJfah00saeb67pCinPc
         uTNlmY68Lqa5peNJimGfu0lmzbCGbapSErAgWiiKv4pR66K/ptRYawoJOxVKgGYGkyzV
         xDbg==
X-Forwarded-Encrypted: i=1; AKwUvByqnsyvKMhebrxGYjqB1KWG7/GkGXMGsUQouweS4Y1ZJRa7AiZjZJffQEL+2sHLfgAS6V0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIZ3uAUatqqQpkIEyIXELC6eKzUPTdClWc08ZOmmEqbgTZ7bJ+I
	KRYYVjsVpRWENpvTcZeqmmDh8sZxHCJ5QHuaxtt9L8WZh6r73LrxVn3G
X-Gm-Gg: AYBFou2QtOFCB1rm8WT0bwYhatJqwEkQz5z6AijmLz3xN7IaRTLnlvhCdq1Bo7Xztpc
	YTDgVjIfK7smZ8ChUuqdBr4CH1am+b3drKm6vBkuqn10Md1VAfyDIGA/OpRc+nf9h6VwnK/oJwW
	x6iJ3jRz1/nyWoosXRczR4ZwCEBlcLgWwmUGwOPgJVKxCbv1OxFtablNnAKLxYJOgnKem1D9ubT
	P/QCdryUy7t/WGOIYjuOWOXFda2bEisXzarZGtFKFKQLnNEwjTUtz7k0YkIJTNfiK37gH2/UhOb
	o6CTyL7KEGAl17Ib3gRo44thIhF9076CuQtGVBSflw+NB0rXQw/xHvioZQHJg/Z56IY3+94ZmVr
	SlDMTXWxIKqbkxlWjm/Fy0ZOAa7dtTZY6T99JIsYUOiyCVaQseP+z1Hp2/hAw629FOPF+2USmnP
	vuEQK5DfTFG7c3G97048HKSJzVzaAq8o2vwUlqomb+nlZFCA829KmGwnNDfNpxR/IhYxWv0/JJB
	liHQra3mSMPnBEyqlcjru6i1aIFZf2EvGUo8XNVcr+iYL94eIF/lDuxI2+vyEGclIxFDpPG5MGm
	sr/o+mJ/r7mzJtg=
X-Received: by 2002:a17:903:1b06:b0:2e9:5d1f:dfee with SMTP id d9443c01a7336-2e95d201631mr3403435ad.25.1792028902474;
        Wed, 14 Oct 2026 18:48:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 16/25] ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:15 +0700
Message-ID: <20261015014324.5569-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from wm8580_playback_startup(). ASoC only marks the DAI as started
when .startup() returns 0.

This currently has no functional impact, as wm8580_dai_ops_playback
has no .shutdown() callback. Still, return 0 explicitly on success
to match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8580.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 9bc5d1e795dc..cee80da8f753 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -852,9 +852,20 @@ static int wm8580_playback_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8580_priv *wm8580 = snd_soc_component_get_drvdata(component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-		SNDRV_PCM_HW_PARAM_CHANNELS, 1, wm8580->drvdata->num_dacs * 2);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS, 1,
+					   wm8580->drvdata->num_dacs * 2);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 #define WM8580_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
-- 
2.43.0


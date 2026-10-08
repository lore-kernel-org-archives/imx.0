Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EC8493D3B
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456203; cv=none; b=IBYDmx9LhH4PZzkyiUec/+MebMJ4oqxVCQYRouE9iTmJKNjl6wdSNqfEhvpSaJvAbASLffXXqTRQlmP1RzedoJPOULem7JeA/GmY2ca3BGMfrvPiOt47ytfvQYQVEnjpDnZJ3K6ccrrDnPilu1tQfhKS76iK0wu6TbvoSA9l5sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456203; c=relaxed/simple;
	bh=aeGEPZ62WG1rYJ4UmaiX7V6fFIdooxIunanCDD+ki4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jinWyLjn4jgls41WOvqP5toQ0rTl0x0ucfY4tFOyW1MEuFQ4rReubtZ7I+rPcZ5vmVdG7FW+PAafAl0uVryvDe0Vvv/5w8lryb4LMfdlmnjRBkJ3jjiYCNtdJlP5g7yHpZUDcFs7XY8xTrmJqRGxPFmSPcfVVQk0UujdtsDyrJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVQ3zFUb; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVQ3zFUb"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-34c4a0868b6so4656564eec.0
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456202; x=1792061002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tshzH2hs2YBcBixu+hfpqJYKGYNe4yJtAc6VriLVkyE=;
        b=SVQ3zFUbrVddsQR/x2UvAzqaVYgGgRhNvXcpHqKIXHhs5VRBiVXkuVU8hBMmM8EXf+
         BuHJGqVU3n9UHlaaFhB3uJ6sdBGUVeHVqc3rW4GUu0g++WQt+Znr5+ttXnbq5OrrUyw2
         pNVxhTkkYCl+JxlqSDrt/SagFzFHD3KEEILhkf4uLT30l4HIf2DISeWVVcmDhqdGZcMB
         7l/yPZT5UZKanm5wAjC8vrZN5tCwSRSrxbAX5Poah+a2lMnWyJ3pXM4SmpC70MlyDG3+
         tErcTCFPZFDxKTCYQJ8vHGRWU2zOtPdjGZSPggPYb7zSsxj3vAFSCChRjrSPNWpJfRrn
         2ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456202; x=1792061002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tshzH2hs2YBcBixu+hfpqJYKGYNe4yJtAc6VriLVkyE=;
        b=1u2DX/hEBbrFjnbc8Qrn+XgU+Uax+25A7ZiPEgQAJNVJ+VC0oLpKozdNLhVV0pVnh8
         3JTygUNfysFlLZ6hmQEr7iTQMAzx1l7sawiDMvOHOTeUfjMU/knJJhqmBD5YkOOjwrmm
         I6UaW6LNs6PiVMzIcn88MTC77Kbsn+Siuj645obXOO0VaYgmZ/kLH+1R5Tqf7QEgiu9j
         tVRpEPTi9R15x7wF+/clz8U8IeBgxQ5XO48j5+e17LE71N2gky5EujDfYZNkLcckXVB0
         Q8EDmF/sb5SmWBobj9rdIJdWwxQQhoezFJZJKvS3u0gpVc341pR0qk6LU5AZhpHQbSnz
         XrFQ==
X-Forwarded-Encrypted: i=1; AKwUvByr7dR025UYvXwirDu2VColjbMhPZQh7XXiKH96WXzmeboIa8L1bv32pfzqw+Am2lu4VdU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLqYvLFwale37Qc6WuR9kLQy3lnv45h1yaTe446aqIC/kruJO6+
	YxKfK7y3IYG6qF32DQRW8FGBnLveKY9eYUsduRL3K9xlj6cq3Wp17MIn
X-Gm-Gg: AYBFou1zXfOLELxTIQokc2W0nJM2vBMnY8eTPGySEBeBRjvuUM9ITIL5d/7qkXiS0I+
	QUEUyJUhiCG8t+Onv9vOa07A0B99k5s4lXSFZOQhPe9x+LnKc4WxQpGt9cAH2rvzwfcVO8BAa92
	Ev7EnD/5I84uP+OGy98n7tA15QY49O/PdT21Lct8Z/JFl5We7928Yzv+R4ex3fRBP10CtPDlA1g
	k6f1rBfG67nxiABSx2dFnTnDD9fr6eDMgavCs3hvWr47bZcug4lQlGfkeiP4ylVtf5xKGyQt2Vk
	bcAS22DpkHnlhcPZErax/eRggfg2ZDoA4neXMxiC7bSXjprO3HIV0/d0qUiAU8svumEqUXXxvWB
	VSC3/t8EQ0NTR8TbjIanAczCPVs12At4tzyAbYvql/2+pUndfNXaKIuXKzNeuQCYceQSdJAv3Yn
	yMpTcsYSn03D+7su4wEMFq24Cc2KJBxxL6PdWDeYxnKsx1DM2iqG1tl0eNB/KQudUoI40g92LTr
	c5gvG6J5YRFKSeJree4RRsklfuUerW4GQMPvy/aLIZtE5+XyeYs2IEUxsbnX8wJc5ranx50mNMq
	rHrpMDnjVmJlsA==
X-Received: by 2002:a05:7300:601e:b0:351:2200:1cde with SMTP id 5a478bee46e88-35177712b66mr2416825eec.8.1791456201448;
        Thu, 08 Oct 2026 03:43:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:20 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 17/24] ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:24 +0700
Message-ID: <20261008103831.542533-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from wm8782_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as wm8782_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8782.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 3a2acdfa9b85..767251ac4f89 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -39,9 +39,14 @@ static int wm8782_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	struct snd_pcm_runtime *runtime = sub->runtime;
 	struct wm8782_priv *priv =
 		snd_soc_component_get_drvdata(dai->component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
 					   8000, priv->max_rate);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static const struct snd_soc_dapm_widget wm8782_dapm_widgets[] = {
-- 
2.43.0


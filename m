Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C43EE1F8
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456268; cv=none; b=gqFzGaBqCEI2ksAsywE/o4znN25qsZDYAlg7woXeG9ImF2cIMTRVHfFSDQo1a+Rtn+NB9dJB35Ujp5L20MoFSzUOzUC8ScASV6isobisTS8A5N4UkUGmlhCqsZShd1zntz9tq1OkvId+ifxbtSfWGjpfHkh3ckbBY4c4toI0WNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456268; c=relaxed/simple;
	bh=IeY1UCp2zv3XkIJvaFQJCH/Jamzhz2wdmHX15Fsk8cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQFNN5KNWl+PIZ0Qor8P2UGn0UifvQp9XWXvHpSpoXxXlVVNT20hCtDKunKPrINqvbAFSWwiEwvaT/8ii8avmXbu4/T7gSd3tiXl6twzcSuvKkMecX+vEqO2L+QaHohwdnc7nNmVGijY9pSk4/wS1e2uuvzkV3WhgerYqBOvAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8duAIVc; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8duAIVc"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-351767ef18cso1965712eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456266; x=1792061066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuLwPV5SkTfLeBmEQBHF5wyNVMglPos+3a2Ytz5Xtg0=;
        b=S8duAIVc8Z8sa/aokGIPBU8gRBveBRFs/zfuflWa7WmiSu9MPItolNTrEMn07uctuZ
         8xdCFgg3Aene+Oniv/UQWmC4Lp4uKiqOVwCBPLkhsm4IDinSHank6SEDK7YPZc3kaWSa
         ct4H4929XRbLk/WBg4ZMtHxykzwq7WsLAwxqgRuQgdyKYGq2341Vi3hJ/P7C6r2zT6jA
         rDptzognPDoJTrVYx6fa6FsnZMBeKeXM5uiOzQOWFPAhscL+27UvBvVJCLR4Th/rxqOy
         gcNC3JH4+FUAGj/fuP3FwDfP0dVnUHiivMO7JjH5us7uXBrHkTD+gncRqbfsLgJFZ4iU
         UCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456266; x=1792061066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuLwPV5SkTfLeBmEQBHF5wyNVMglPos+3a2Ytz5Xtg0=;
        b=KXizMcu78ejDBwAANtOVl+IvziPQ4T6QKN15Ixn2SliR1I2kygZsXZMlAdx64f5HjU
         +DMhHnSSYx20xpvmYb4pnGsDS+OVeLn1w4OIcfmQs5FtIKaa3Vr0DxAFt2nULw4TeN5B
         hTMl0O5f1LLFtH2gwA38O8j2D3VJOx8ZrXNAOFDHwffPdotJfnsfiGGwPHDXy8c77Vaq
         EDyV270vO7aUN9THPqNK1YrNlGzYi+007j47oU5/BZsQ/+6irmydcf84gvSwTmnZ3DJg
         mtq+4D9jFmCencvk33M9LLR1GWJLPVDQZwJ8I1AI+WXd56jikX/bNsDxQD0kmhMzfoks
         882g==
X-Forwarded-Encrypted: i=1; AKwUvBxklZf0CML7V1JZvnE8xK4BX4TcqvJlB47yXfgH0TSkINw7XqViQ2l9d6iQzZfp5cKHeF0=@lists.linux.dev
X-Gm-Message-State: AFuF++nBqOa2Wd84faTA0TZ18TOa24imaYMpIf+k6yyssdv8HuY++ox6
	V+HwvA9VzVl0gxGck0sxKJhJDaJIBQV7idvhahfSS54AJgx3lQzB+Gi0
X-Gm-Gg: AYBFou1/chkZ1cHZUn79Ta97hOm2odkV+woITYhJLNvTOGchmMvZf4MlqfzO8kCD90/
	+JRM26ieiNeoWyr8nWTfdTu+YmBLV5/5EwKYHSN9HOQcSevggVZgHrR9kSJS9n5ErPOVgKFcUZu
	aaiK++ZRDS18Fxkk9MVsWOSjH3EQBHx3B9iNZVd+hjC/5Ka8ClokY7oVGUBZx0fr7NzXwmpcWlA
	geKzJcbXMzfP6tUkPbiyWJLgPSREqwjA6FOqPP8dFsTryTDdRgp+U3MekiHYxsMSWeFhzPlJKWr
	5Z9O8b3f6/Wm13W4DSfqgE7llCH/CVtv+4HuxHN1nL5b7W0nEuPoPeOAtxrNoeXJHKf/oH0VWXH
	qNKCRlv6Y3YVFjc3LhvUSqAoOJJRb5ftrOUjIpz0STZLuVfCPbKNBeWoyT5sZZWi6VrFsKMJNzO
	+jvbCBJfkAkKPzd/oeNAhUSFucdHFX4Edp1vJ5cd25gz58vv87d8To35G6/nhtFMSu3kcMazPtz
	wfsQOuQ3wKZwhMzEU7KfIWOzHG9e+PeGwyK1Kkh8JZ8y5eNca4jJ2jKwpswD16yBECMQNm9sN/M
	WaZLGzp/8kfJIw==
X-Received: by 2002:a05:7300:d408:b0:34a:e7ba:863c with SMTP id 5a478bee46e88-3515dde5512mr6327305eec.18.1791456265752;
        Thu, 08 Oct 2026 03:44:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:24 -0700 (PDT)
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
Subject: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:28 +0700
Message-ID: <20261008103831.542533-22-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from msiof_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: c61caec22820 ("ASoC: renesas: add MSIOF sound support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rcar/msiof.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 128543fc4fc9..9fead9a22cdc 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -427,10 +427,12 @@ static int msiof_open(struct snd_soc_component *component,
 	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 
 open_err_dma:
-	if (ret < 0)
+	if (ret < 0) {
 		dma_release_channel(chan);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int msiof_close(struct snd_soc_component *component,
-- 
2.43.0


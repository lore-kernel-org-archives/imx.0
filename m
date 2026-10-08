Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D5F492E2D
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456010; cv=none; b=MKqtTkSX+QeufLDUdAtbHrz6tjd+8d7Fm5uw6BfgQaKxTtNo0HNPCAvnT7oTs9jvFDALqGCE5+E4WMKRLaL879ddOnF23qX4GSqd6g2oWvKipkCFek9GYqtUjj2XmxGuV2omnxHyYCS2Cu3Xys2RNhvw01KDfT4eqKy2gQ7Frho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456010; c=relaxed/simple;
	bh=DQpdidc1ReLLfSxwfYnPC+Bi6IVnbVwubPbLgmRRb1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOZz/DyVzsYXaCwNv1uWtVWZqRJYYvS2W01nw6NA7xwCXqdxxALhbfwtNKsKdRrVIWqX8Ow7al73RKnOK6eoQWX3CkdYN9aPTLCTGI6MI2j7Sllz6ikUO4QwWSC+0uYNkLGZQc6+uZ2RJW8aDzyyvfqN00KzKYTMRPvvaWlwEvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTUSI9lV; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTUSI9lV"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35154cb9de2so4039640eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456008; x=1792060808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9nxhJUopT9Lxb0IcO/P1HkSQbbENhmHQ1cr6x4IK+g=;
        b=oTUSI9lVQ2z1uwU36aJ9YqZN9LoId9kyunbS8B1Aq9hMiRvUtD14bhsskXQrK1PpWZ
         klUQUGpBAeJZzxW1o1L5T5x9XoaMTTj/IHXWtrrYO1nFASR7gY4glLDBm4HvsnV5Hwcj
         JxhGvJcv2Pivw1No/Vhmt6KDGacw1FwxWfzhr08kmO2rQAyCSyLpuhsuJDsLPHngH7r3
         jlcn7WNaDBRnt3BmbVWn4z9Xk0Nk/gSO/PrJIyYpE4tomhRxtTkhvZ0c9XptXIDMFGEb
         Zw3aUTeRhPcDHjcbxhQALypunXosfmXjyta3enbQ9yUlQFtZax4W1EBYvi5P46K54oW2
         DfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456008; x=1792060808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l9nxhJUopT9Lxb0IcO/P1HkSQbbENhmHQ1cr6x4IK+g=;
        b=f/mxiZA1rPijDKCPg6MTlks/xEEar1a5vVT/gxGVoN3bu7ctfXC4kvudW4VMLkbCBQ
         JvGpZOtYYoaBfZ+GF2we2Bl/DaV4+pFZfKx+5LP2zIVjuMl1M1LHeKpTqkX3G8pQk2YT
         K8a5DKvUTfydwtUsdNRPoWyUzvukzZkjaU6ItNPAERIhR72QbGyTszg68PiyYofHaSiI
         xpmGgeH/OBkazdmdtLBmPzTV3Niuso/xKPn8CtXB8b+QieN/1sTvyYDL8axyIqYdo+vg
         lvu1/AEHQcYE5VCOklqjzcBY0rbiuAI7tRjpfJdRWHjMTIFWddTSXMH2DEF+LoGghhgy
         m8rg==
X-Forwarded-Encrypted: i=1; AKwUvBzl8TcK/zZo6JCgInRgze3xMuCJckJ8ShVhdd6pqISt3leq6BV8P7ENmaD+U+xWG9h+tKo=@lists.linux.dev
X-Gm-Message-State: AFq9FYILaZlsoZozAdi6sBVFQnEz87LRbiYeYza/tba184OvEVj/w5tn
	dtdevK67u5tBTzyhSVvZG9LqbMcYfkY+uIltoeIsb8UE2yrKkM0lqt+x
X-Gm-Gg: AYBFou0SRiVJ0KppxtZMdU4Frihmsh+eLlbwdSxID1k6fsM/hRw9aUazj072ipbMtMF
	BfXRPG5A0jbz1CPyMcMK/CDK5O8d5rpPLqWtMrCs4DN63PB2HL8ZGYrwb61KOsZE2trW6gGwvec
	QZoarIBMBQ3Xrqc8fqXy9nDWwr+HuqUEJRyy/1+NDkb3zKW4K7wceop9a2Ij8cljhHVLflt1UnB
	haCirDU95ugGaq1QPWHV5QamAZ4QMlkKOiqHv85fbs/z5xbXMK5Fzv4ico0HbGIpY0Ij3a+hIoM
	39SPZUcUY+caR89UPq+o/hhpo2AAkLb3jUYAcD9YVFSGVPK5Vw6M4Njlnz1Es6skdRSqiz0qM2C
	GTZR3eLP9NIALBjiWbjcw4cukzvf8ct++OhKLieIqX9iVoMI9MmxIF2O7cSjJTTc3P4ugcaCHyR
	E9/W3W8ZjQhHiLsugwlIjU6XsrhYB0IM0dCe1jtQbzZ958+TIJejYZAJ2vp39SwkAZ+gmYZBaUB
	Na57bPV0BtpcZujPlzSpk2vY3PiCO94u7a4vbtbFn3Linpj0R+SxDxWaWT+z5cdB5m3DtXHI3TT
	RBR8LK7+kD1oxA==
X-Received: by 2002:a05:7301:1e84:b0:350:89a8:5598 with SMTP id 5a478bee46e88-3515ddb2b12mr7233126eec.9.1791456007627;
        Thu, 08 Oct 2026 03:40:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:05 -0700 (PDT)
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
Subject: [PATCH 04/24] ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:11 +0700
Message-ID: <20261008103831.542533-5-phucduc.bui@gmail.com>
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
from acp3x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 703a6e22888b ("ASoC: amd: Enabling I2S instance in DMA and DAI")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 37ea5c572eb9..072f3dc35d40 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,7 +237,7 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+	return 0;
 }
 
 
-- 
2.43.0


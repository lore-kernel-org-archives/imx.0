Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCDF49364C
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455980; cv=none; b=JVtKQkYqxoU51YHZobmwbXT/mhVBF70sU9kVfx0okBWD1RXiycD0zqT5YP/hTiAE8U2sKF59xOt/T+Lo76TEENv03RBRMLnU80ORavw86tBWJe0Qc6B/8IFcl/bIUpg4Gh0eq8gabIJ+oTs73f+LKVohMcKyfttio404Dks//iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455980; c=relaxed/simple;
	bh=M5phZ5RgYLMwqgmoz0IyXZlTFh80R5DGK+A0fLhzSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWWGG5oPRm0MlRayj9223fsejdTXNW/vSgCcSJ3src7OPWD2etSd7W7VWSpkxV+k1TbXVRRJSXM/SdrvcwTAxpIa6WmZtMLYuSUY6og0t8F9NQpZgSRP66BRWOk+ra/xJJ1IdlRDjqRU4dRBsqrUT8oiuJ8z0ZU8KMDNWn+axU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwrsHqEl; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwrsHqEl"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35154cb9de2so4039013eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455978; x=1792060778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=mwrsHqElwX47BzILnMN4dUaoXNPDanvf11/+1rYVC1qfOiYmwd6sAeUFCtDzWr+PYO
         sN8DwCUS86eaH6ihotLCoTQaL0ODcs6WsB2T4jOo0sNXj0zKcDhOQV0aMJAH5+QO3t6C
         LiRBMHPxGL7aMjlLKa/x64TTSeWwXo47G9F12y76qKbRtmaJavGYnjQazLMomyWNXmxr
         VgHsj2Od27JfaBHcanAZ5zoyeiPlr4FPzJlsTWcS7ERaSs7790On3do45Tt5YAnHbrvx
         NEmz8ii0F17rVIWPFZmoKzzs3QE+Kcc5al/TtYhepz1lz4PDT8VKPlKQTwyL3sRtDLX3
         Ivtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455978; x=1792060778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=zuy0GxkPhnWbxEBNSyluXEGAuwfTi92pSIeJWQrrQvkE3A4J092kKsPGalhufeBLxn
         QQrwrd6vHg6GD1JvK1wKbpiwZYGLYiTxJfgpWBLef0erzkJpIhovYovm5NTs8HAgokA5
         kF5Lw39U9togOTExo+VrYjpAE+hYr4RQixC4E/UJA0VK4nI2xMdJrTR55PVEHJZ/FuK3
         PcEPbYtXrxJaW0y++npsVogJrvK6D8U5VQQLGsr0g+6AIW9FokxAU8sGZ42Yb5PS3p/w
         DB7dZFhn/EBZJK+b7VRfnTntksXr3sqizG6RKdLKwkZ1swBy+/xFkKMKv8DSWhTSMK3a
         TtBA==
X-Forwarded-Encrypted: i=1; AKwUvBy9sGXLiaa1JgwgcM9gPkeiWmDg7KZM/X6XgS7kALBdQYrISTSP7KQuVbvqUPDpZ0qcO00=@lists.linux.dev
X-Gm-Message-State: AFq9FYKP4hXZkopOKrk16QZIzAM7Xadkx95lG+LY5f5AFjofN0Ppxg2M
	QRMhsmtsgjGyPu5V6ESXRvHFZwyQq1fsSMUrM7L9XSYnjMjaKiweRIe8
X-Gm-Gg: AYBFou1dNoTg6Gd8I05SMx+2VrEH6j3pHZ7Eg10xp48qLX/iTyh0G+sZE8xoWZ6vvbH
	OZ4T5OfcT58CkDehVGCOhyiQqWQnCecwns3ZkevqHjEzm2+pfVUY9sl4jSyRA53pWmPm/SYZU7x
	SeT/6P2CuXK994osTuDeaENVfo1hz+S2nHhlzOBu1XvX4zlfAWpbQo9DuQbVEilWgdJxylPb7Vo
	+Cvrs3ckpgiKtbILNr6sun8UTsj1FBrp/SKoKbXUTgRUQfz6I9FeFPlF+pnHO/ot/58GjtZKsKw
	ETWFEBngmptQzQ0QpjqaZ8fFe3wA/IFcJJrvv9jDhnLXSz57jca5Yc8fZx1WJE8sC0m9hMLgF9/
	4XiKSLSjaANf3EVodVvPTOSADwrnZ815/6nMXWoDCW27SaBqlP6hL6yOgEGx8k9iVhtkaKKopcG
	HjRYrSvMf2/PwSuuSMaRC2G9Rx1DYtWsJqNzQDXi5sLPEzJiRDQsrunVr/L07mzefqQTkThaU4N
	BZOW+TAticHMjnFYt97uXxZSWegcMXOcXlz7kGg+2Oft7dEY4di/Nc8mdeR2BTxVh0bjqqI1K7l
	jf1xsQE/xWyal8552sczWCXH
X-Received: by 2002:a05:7301:1e84:b0:350:89a8:5598 with SMTP id 5a478bee46e88-3515ddb2b12mr7231654eec.9.1791455977867;
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
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
Subject: [PATCH 02/24] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:09 +0700
Message-ID: <20261008103831.542533-3-phucduc.bui@gmail.com>
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
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..28e0686e9373 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,7 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0


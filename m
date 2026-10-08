Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD64497B88
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456218; cv=none; b=rV7abcjQfIEP89oi0aCjoQQ2DQ+Q4qGOPpxGIKS980dsR4eEOk6d/mmjjLtZzG1kFFw7GkWhBY1ofl3Ffo3Ih2sUmbaUWVSN9OWNeWY8QnxYeUFVT4xoedXorPz2nvtJt6L+L4+jO1uEu62BaqpAfKNtvc02xwQJBruLgGKLFWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456218; c=relaxed/simple;
	bh=M6D9aaF9YzenOEQjSguQl07lda02HnO0SBENTFTDcdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddYcJDSc8zkD3bL215zeW0rgiB8I3HFtEyuu5bdxEBK8o5KxatYRWmi1cmUhsTNimJGNYjWfT7eIz/oI+8Vor3sc63oBV+kfE5pq0+cM1W/4VPZciyJzULUTUGCmDG/yEe+zclQdpufKPFrP/vJLweaYCryuhigvjFnrv/TlDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtFTeJuG; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtFTeJuG"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so798676eec.0
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456216; x=1792061016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=QtFTeJuG6A9lQrGjwOXz8ryIiPRYDpf0ThS7z9NB2s2t3wPTobCDNu3/PvZ+QqxQbE
         X5Os8Gb5VFXRfdXCR4hbgjVaIBEqWrv3xROH8N18yEQQ0q8Dykhxv8xHqaCmsvYpIDCZ
         vxPxb2kHRNvjhpUGH/+43/FeApDaeKlXSjR5AqD6YeekH4H9s/HJrX6JPxoL5u4IN+ep
         m0R/BVxx/Iy3I055NxIbtIqHd4G5YpmXVh+BRERL4ops6N6WfMGUZhuyVuDv0HNsxNce
         IuykeZYnqEgZDH/LSTEgDFGZh5w05S8r+fyGGvzL1+81b4/bjNeXaNV1DwEi2K2+bwjg
         ObEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456216; x=1792061016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=0r99q7vYYMokz2psLLnefvxykAihefbxvDgYDjCMKhiRJSOET5MaPvYMujlbtYxB6C
         tc9oCkPylw4oAz+2OFlZPthCO9ZrWxslTq4Twr/47VtCM3x3iksg9x03i9F731dYciyg
         OYvEpgEFWBFxHAEr69BhAwoehMf40sEUsnG0JQ3FCFUDqeePyMtZvAhvWL2i9hbfm6mS
         6LMVWxNu4bc2Jmvb7rp3dFrEmMmnrB+PH8E22xeXM7Ri/fc01SLq9/JJ8kp8dbfgBxD6
         7blQZ6i8uxj7fBya+sbRGhltDnyLt4BKo/Q/2PwuqR2/YBp69uhb3hGgTkdkfSgUlMvd
         1gLw==
X-Forwarded-Encrypted: i=1; AKwUvBzeST/562HlbjINRo1kpmlqY907mzbv1pFNz/ufqAMbgRX25F9sUeY6MymAOF+oR4xJL6E=@lists.linux.dev
X-Gm-Message-State: AFuF++mQbkZM33nZoEru1c3/GiFHI3SFcfFHVWjs8LN4pVGolU6sA9KH
	MAZqwVJW9GiieJQyKSeQ608FeioV6Lad510DXbAcMHalqTNgHz+oUOgV
X-Gm-Gg: AYBFou24M0AaP/n07T0A/jomfamRvsnalhEFBPOdYbVR8V8fBqJh1YGpD8JXJ0U4/MB
	dGMRugAKxQi0TNobpyUD8XkCFu5aXV9UMJLoODtCInAd6tEQGGruEouM8LSFEZJFwPTOkwDCg+E
	HT9cq0F44RJTVupHQQp4b3jv8RfTHwdeGQ/7mGHQGpVmTlbFE/71Lsc3hjAruXlcaAnCW0pcrd0
	6BhfhGtuChJ5S8CzR1F1xyq8Eitx+IEtM1iW2gg0Yf7C0U3pG+1rybH7VM22TXeOycbykMfoXa5
	jItekbeS5yP7jZWNbSbPswPmCE/cMM7DzSRcd4IFtGysqXopL0CI0g61yoziNqlW3vZujJGCcGd
	gWf4B/lwt59jYykGQYrJ+PQX3gqbt9AY+chpJXieVfcUr2jtWHckelupHgrr2CGkMwtSmbGNYPn
	P6RMvbYjo4Klm+E7dFsS3YkFSNoGaw7JtvLR0TlX0nS5dKEmxCy5Nm/PyHkjv6/2CUvXj9EkWNh
	kkFl8WDQKEykGklRGBj6jbsgD59Ujxn3Iga4hRMxIjgTzXozk+aVIMDhXn/CT1/AaeWLVlJbcbu
	ribaZXbNHx1696rdBzuIvEkD
X-Received: by 2002:a05:693c:2402:b0:34c:e77c:f92d with SMTP id 5a478bee46e88-3515de8cbfemr6349033eec.33.1791456216244;
        Thu, 08 Oct 2026 03:43:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:35 -0700 (PDT)
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
Subject: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:25 +0700
Message-ID: <20261008103831.542533-19-phucduc.bui@gmail.com>
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
from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 7086fb7fc1eb..30e75fee5175 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,7 +269,7 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
-	return ret;
+	return 0;
 }
 
 static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
-- 
2.43.0


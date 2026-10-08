Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D93DD521
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456314; cv=none; b=F17oCDCy6Dqal+AgsaAuC72+rV0pzPOVNlrUNUH1FoltzJwkja0XmZ8Uyu1KxS5F9LCbglblmkw/yRBEdLRJQ4QIZrpjGG4xy8+53VT5fSNbVuYDw7BQI74yQPV3CTQm4xeslMar9cTynq/q7iNUdz9HL3A56lQmcqLtvSVhtZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456314; c=relaxed/simple;
	bh=M7h07h5+dP8rjX/g2P5EgQzQZW5pCcmiayOZWTe/ZUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l77h6IjcD8NODJY8FBxEV7b+ZtbH/EV5bio0kTsR4+glJTX5Fe+vTDngsEtjq7qFcpuBa8gl5Qbvpr2M5M5bNtH1PNsXVunFkJOqAcEGw5cp/qS1yOfocWB5Al0eLQltkamQLlR+SuaqyRSJE7Bpg5F9fynMDbHCp4rFwSWdlUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvOP8TWN; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvOP8TWN"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3115c4451c8so4256421eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456313; x=1792061113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ew3yWeVvT9O5tBkIFDkvF2j0W+vU1/CnrAg2Miccmy4=;
        b=bvOP8TWNqnp2otx6BXwDh+114Ks0gEHACRsnESCW8rIWxNsEutKtfJMCTcGVI2MUGF
         Jyaj9eb4v35NgFQtEoKsYjvUVGALEV7KkZr+JrCLgEVcMGzKa6/4p4p7yTLbfuIWsqnf
         RQ4AMar45lnxUSrzxv4tf5xW2WVq1L8jxOt/UvQCJFsc/ukc0wr0G135mWJdPn75UpLC
         lp7kwYpEazlnq3+DdwrpvRfoLU/iyyUNrhC98pQ/UIG6zs165nYlgxByheiQflTcs8S9
         x7yyguZGeKGIXBhD7/2pdtQ+TUMoPzegobh+Xhv3tBSVmFlr1+WBYHznPcQhDnx+UDxh
         AnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456313; x=1792061113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ew3yWeVvT9O5tBkIFDkvF2j0W+vU1/CnrAg2Miccmy4=;
        b=u+VstcA1MKbK28n84dsiPoMTLdcvJ+Si69b/92x81CZkBfKSEzBONHT8QBphXCkPpx
         eDJraIlQS5cg+bCqI6EAm9mbmCbxIDiZoVwvEkX0AwXcYdNBauj6vupnLMqakDKkVaYD
         Z+HWAQJA2rtk8QMZWEo7loa5AS6ImNloUFH7fIF959wHbt5kTCtIqleK+7w8TXCwU4T6
         CCRiTN7V1estfzibZfYZfOCbiVsBVagzJ/WVH4xJZWnlJ/n52AiIZPP6/Iq4K6WEe1fb
         eZIXBoknwhGm5rW6wgwaA1kdJFBfen27E6DdrdQ3pZlnJg+dsY4jenll6UnCZiOUqBYE
         a85g==
X-Forwarded-Encrypted: i=1; AKwUvBwXAK8zLoFM8KbZAgybTbnJREfKGsca3q8F8RUAZRpWRHoayDWZzCVn6uEUi8/sfxuNA90=@lists.linux.dev
X-Gm-Message-State: AFuF++kaK8DS7Ff/CdWKwfb8XfDKZ74FaOvRHGqsio3Fb0gjEGPmnkv0
	0CKokPMW2/lWSICrHQAE8IveVIsZzGeQO5lZe+xXoGyk5bIVk72BRETM
X-Gm-Gg: AYBFou3gPdgmeU4576k4NCJ8BB5QlEtmQH80NzxOAbq5vc0opB8RDpJuaZvwScJMxVk
	DtcZZuyH4qacAS8u2ec1BNdxvUhRO0eD1jDJ5wYjwMjo8dINSFQIHw7k65h/A5bhltJYOqCPvnN
	YlSaCT/bX7ZsNKsj3r+u5QggSp/VFsaxu9e3a0fhOV4Ex2yibUQGiId/CUfWuF4oSzDC8bPV9Er
	TPVg4kzSsl5n5sqCZVfmZCoFn4XRtFZ8j8sQQU6nkEUEmYC4LVLUgHitBXOjInGEk5u8ruX15SQ
	mIvOoPUpTfPn32QTgOoqAViUlrIZ/n50U9Ibhwb3ICwq3ecGLVtXAqLApLz0TXeuSs0Mm+zYzG6
	9rQ7sFrcf1AzOf52wDo4/O87oZ0lACWOCRJVWDQTkhOZIDpM+mO0dacOFzZX6JE84hY1ggvusSK
	ta/SZhm5s37bUPphRuuzfGqDnvUxw9Os+QIX0THRPCyEn7oT/fRf4DDbuS4Tr4lVPp7CfJoAd/E
	X68BMDXmsvZf2RfhO+6l182FPcrbJtuMZnebvpd8X8NNyV9Rb3FpA5doB0SSoSyt81gpI3MPgzs
	IGgRpQ4m5gYAog==
X-Received: by 2002:a05:7300:e9cf:20b0:339:851c:4c1 with SMTP id 5a478bee46e88-3517788c303mr2800571eec.18.1791456312416;
        Thu, 08 Oct 2026 03:45:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:45:11 -0700 (PDT)
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
Subject: [PATCH 24/24] ASoC: rockchip: rockchip_max98090: Mark the link as started on success
Date: Thu,  8 Oct 2026 17:38:31 +0700
Message-ID: <20261008103831.542533-25-phucduc.bui@gmail.com>
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
from rk_aif1_startup(). ASoC only marks the DAI link as started
when .startup() returns 0.

This currently has no functional impact, as there is no .shutdown()
callback in the relevant snd_soc_ops. Still, return 0 explicitly on
success to match what ASoC expects and ensure the DAI link is correctly
marked as started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_max98090.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 426506a8e18e..d54c36682415 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -191,12 +191,18 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 
 static int rk_aif1_startup(struct snd_pcm_substream *substream)
 {
+	int ret;
 	/*
 	 * Set period size to 240 because pl330 has issue
 	 * dealing with larger period in stress testing.
 	 */
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-			SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 240, 240);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   240, 240);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static const struct snd_soc_ops rk_aif1_ops = {
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760051;
	b=NeKjIrZRyXGgJD5rAILOh+lYEjJQAf4TSpFOh5uriW2OVn5op+ryztKn4YGoS/SFSM6P
	 i5vF0v+dK2TKG64EiYHMxA94ZjpP6HS1WBNLtiSnwYMlnkDyB4rY3tC5lggjJD5b73oOv
	 e2BjlpWMHuDNgW5W2WGIIdr9hSGvz3pxR5HL4tC2jb2sBvEpwYvDCHzbyMWszNt/mDBBc
	 afdhJg0ao/WjOS+bfd1fi1gsA0/qmIR22wdRltflQ1UCtzdxBYw4Z/nHRtc7ymOdW/XQ+
	 L8tCX5Clej7jYS0s8TkeSNlOtjJ+mGGaaHgnu6tmyCcSuttNL0UYfAVPgfaTus1zCHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760051;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=/PdInXeoLPfTpC/LtImjkWnQ8tt1zhMzi7BSQUDXKlw=;
	b=W12QMlJrGtZLbOnC61nux59oFBieMR1icNPjtmVxpLrkdm83+AyFiftT5BYhb5ciA2ON
	 915xx5MOYGFfhEI4Vem1UcX1uI194Z82aq0pDF0E9gvo7YDQ1ey8jVV5GZw/LkW5ce0Do
	 aNb651utGuDBNTyYrrFpMCkqCyE6LlWGVsWj3uhNjXcO7ezV10MFf+XyWjcQPb8Hgky2+
	 BGPqfbI0oAjmM9/aLlBiIQkfJdrHW9RxzjMeNbxQGDkguwzF0FPk7Q08hTaCWy6JIXlD9
	 lXTrKY0i2A3CTAmFtT4Afg/p2qRAURMjWPKj3Pq50Kdbqon5N6jIpL8taS4kWul/pog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0191606A32C
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 02:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0191606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABXf_kwm+pq3rk+AA--.27666S2;
	Wed, 04 Nov 2026 10:40:48 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: fsl: imx-card: fix DT node reference leak on unbind
Date: Wed,  4 Nov 2026 02:40:57 +0000
Message-Id: <20261104024057.1508822-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABXf_kwm+pq3rk+AA--.27666S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rGF1UCryUtF1xJF1rXrb_yoW8AF48pF
	sFqFZ0kr98AF4Sv3WSqrn5ZF1ak34xuay2kw4xK3s3trn8Jr95W3sYqr18ZFyYyrykKF1U
	uF1UKw1xCayfZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
	AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7IU5ENtDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQBA2rqY-nVhAABsV

imx_card_parse_of() takes references on the CPU and codec device nodes
with snd_soc_of_get_dlc() and snd_soc_of_get_dai_link_codecs() and
stores them in the link's component arrays. The driver has no remove
callback and the ASoC core does not drop these references when the card
is unregistered, so unbinding the platform device or unloading the
module leaks one device node reference per CPU and codec.

Add a remove callback that releases the references of all links, in the
same way as other machine drivers do.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/fsl/imx-card.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index e3cb1438e837..242c5eaff6f9 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -927,6 +927,18 @@ static int imx_card_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void imx_card_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
+	struct snd_soc_dai_link *link;
+	int i;
+
+	for_each_card_prelinks(card, i, link) {
+		snd_soc_of_put_dai_link_cpus(link);
+		snd_soc_of_put_dai_link_codecs(link);
+	}
+}
+
 static const struct of_device_id imx_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-card", },
 	{ },
@@ -940,6 +952,7 @@ static struct platform_driver imx_card_driver = {
 		.of_match_table = imx_card_dt_ids,
 	},
 	.probe = imx_card_probe,
+	.remove = imx_card_remove,
 };
 module_platform_driver(imx_card_driver);
 
-- 
2.34.1


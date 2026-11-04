Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760042;
	b=mm4fNwuYyt2+cj7/7wUydt0xanPUbl9JLrHT48oZZznQVmB1+0q77Ugd89KO0gOC1OsL
	 pP0Y2kvgei42e+O2fxHcf0D4QoJtWx05tiTSHpLQp4cGEIrpeyMWT4Ob3w7yC/uFrSR2U
	 X8dPqoXZvmIQauPec37vjJs6s26IcGNTk8dwoHbUD+mDZ22x8+mJBm6uGe1T+AOIB0DfT
	 G0WVNiQnjMajqzyYi7xfLM4ZIzrSrHmrwhnmnclXci9s7bBzDNLMGExEUdEmUY3jEY5qj
	 5GNi4+Aa86lBY3mvd1KlXZhgqmA2N/48zcJqA6egZq/XQi6xrey51sueVOh+tIvtGew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760042;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=36Y5pL4NdH8kDIXYo87U2fescr4cMGf2b+Jv2gOIdXM=;
	b=1ygEKY5Vzq3tBZtGVIUxGtAOnmuIELtQSDH0St6gLxybT7o5csUHp74UgJXpPwrOW6c9
	 I5KA4kZsGEycKE4LC9tPGvGkGVcLEs7ctA6qMzwBdIi15TXqwdIE4+1OvYwU1s7DRx82U
	 kgQhBFgMf0iw/3QyF7u/rde2dzjP8AlpwFhu30vApUXJaialVvNMwbkTymmbJvQuocnDT
	 2a+bp1OB++yyWREu/Wr5vyJQkVlYoQrg1+V/IQ+Gyj7mFsuv7ukZKIUITnXo3CypPQMdV
	 R04iwVxfPtOXnj5tZfWo5u4pwLcUMQsuavVYJU7vbcdC9EdMD3KJvaXPXC1Bh7l2+4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C2606A338
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 02:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635C2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABXg_0nm+pqT7k+AA--.27763S2;
	Wed, 04 Nov 2026 10:40:39 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: mxs-saif: unregister the mclk if adding the provider fails
Date: Wed,  4 Nov 2026 02:40:48 +0000
Message-Id: <20261104024048.1508618-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowABXg_0nm+pqT7k+AA--.27763S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1rZF48tFykGrWDXw4ruFg_yoWDtrg_ta
	yv93yqvryDCF1Fkw1DCws8ZryIgasrCw1rW34UKr43tFyxJFsIva4qyrZ8u3s8Zr1IgFy5
	XryUZryfJ3y2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8YjsxI4VWkCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0c6pPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMBA2rqY-nVXwAAsI

clk_register_divider() registers the mclk, while of_clk_add_provider() only
stores it as the provider data. If of_clk_add_provider() fails, the clock
stays registered but no provider refers to it, and the driver has no remove
callback to release it, so the clock is leaked.

Unregister the clock on this error path before returning.

Fixes: 7c9e6150f2e7 ("ASoC: mxs: register saif mclk to clock framework")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/mxs/mxs-saif.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index e46896ac9669..aaf62f081b32 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -783,8 +783,10 @@ static int mxs_saif_mclk_init(struct platform_device *pdev)
 	}
 
 	ret = of_clk_add_provider(np, of_clk_src_simple_get, clk);
-	if (ret)
+	if (ret) {
+		clk_unregister(clk);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


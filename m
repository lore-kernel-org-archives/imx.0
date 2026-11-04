Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758467;
	b=pZ7TMzrC8Xbzf6CXMjHVW4DjVlEugzz8AB0cx7S56iG9yl8oo+dviBjG96w1rj9Bi40S
	 5D2qebB0pvZhsKGxMa21QJldaY8K86ymNDl1cWHo9aZR/8SAYqG9Ygb4oBrpcnE7fvfhK
	 mcDwRocxrQdCXRfdgNbXZt48kYkjpAQOFQZRElKkUnLeaiZTwz6CzTUQ4loo2VRgbdOr7
	 Rop+CLWaN9mgsX3H4LhNS6I5hiN86wcskS9LLQMgHIcZLiH8h2H6KUQq1fQUIEXli0PRW
	 9K9bCwo/BfQz3vCYLeFe2s64Q/iCXxRC2++9JVQg+J64YPx6vjYMVEr4kyEi9gGVpIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758467;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=zoUNnayjtOPtesxZ8Rfcihs6HYJ3wIxzbIkFPcUKSGg=;
	b=lybB9AqnGHXOVIHgI/vrlPH8KDoyW69hbdBp7KzF65OQ2WDoa7KayNQLPKhLyxqBEQEY
	 QYbF+Z8s1SCXZV1XlIpKQn++tGvsCdj6MIijsg7B8huURz5F8JBeR/D2c2A+pgJVtf1B/
	 4sSJTrjujTAdZ/V27KzFtKELEv1XXTsR6WPxg4oa7zHeRXfRz8gZ8F01tPpE3WGx+vZBi
	 34d3TrNXzks9aUenvaA6mfzOW/sVj1yIADFO7csUWPYSsLOdE2Fe8FlE+hWkgqpzdfm3e
	 rAeHHMp6YijQ/+0hHqvzt+jKSBPWzwrntnh3NQ62PfgPvjaDOXHw2SBwqmfWeBa/Fbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504E606A335
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 02:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2504E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHsvz_lOpqDnU+AA--.5027S2;
	Wed, 04 Nov 2026 10:14:23 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: imx8m: unregister the soc and cpufreq devices if action setup fails
Date: Wed,  4 Nov 2026 02:14:32 +0000
Message-Id: <20261104021432.1468280-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACHsvz_lOpqDnU+AA--.5027S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1DAr1kWry5KF4rJry8AFb_yoW8Ww4UpF
	1vgay5Gry0yr4DWw45Ja1UGFy5G3ZxCw48Cr18J3savw13JFWFq3WIqa4Ut3W5tFykur4a
	vr1jg3y7uayYyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5gZ2DUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQBA2rqY-m34AAAsS

imx8m_soc_probe() registers the soc device and the imx-cpufreq-dt
platform device and then installs a devm action to unregister each of
them.  With plain devm_add_action() a failure to install the action
returns the error without unregistering the device that was just
registered, so the device is leaked and its sysfs name stays occupied.

Use devm_add_action_or_reset(), which runs the unregister callback when
the action cannot be added.

Fixes: cf7139aac463 ("soc: imx8m: Unregister cpufreq and soc dev in cleanup path")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/soc/imx/soc-imx8m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 70b281927c4b..ffca59c3b6c8 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -290,7 +290,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = devm_add_action(dev, imx8m_unregister_soc, soc_dev);
+	ret = devm_add_action_or_reset(dev, imx8m_unregister_soc, soc_dev);
 	if (ret)
 		return ret;
 
@@ -302,7 +302,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 		if (IS_ERR(cpufreq_dev))
 			return dev_err_probe(dev, PTR_ERR(cpufreq_dev),
 					     "Failed to register imx-cpufreq-dev device\n");
-		ret = devm_add_action(dev, imx8m_unregister_cpufreq, cpufreq_dev);
+		ret = devm_add_action_or_reset(dev, imx8m_unregister_cpufreq, cpufreq_dev);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1


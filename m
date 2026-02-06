Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB412459C9
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 05:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770354152; cv=none; b=ootw4kQerNb1YfgIPJl7scYLfE2hHowPSiRxtvzy1mxiZjcsrlmoNV1UWQuQg1M5Sk1jjon2tqMrPwPL35SlZMjn7wiQUslDs03MYiBEZ8JpDzZyib3DBqzNZSb6eHQZru8CPPnyVnM+utcurpppdEASxUWGV3/yNH/XzA8XhO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770354152; c=relaxed/simple;
	bh=hlLyLuPeDGvYMQm7RknXoThvZijWpqrvYu3vffr0cFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KdRHqBcqsFvhF48NkgDZN1OhtogTAONUtIpgcZT2kooeUrJdNCBVyhVZk4q6Ryshhw40A2q8DxIAP6Zs11J2X6WZ39AGVn7CGkkED+T6prY/OBkQ9czyl4qYzb7jAjkXF8QeTWUWJk3fvkhjnlijde2yWV6yMeOOLX+I5pwEUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACXKAzedYVpLGOWBw--.8810S2;
	Fri, 06 Feb 2026 13:02:22 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v2] reset: imx7: Check return value of regmap_attach_dev() in imx7_reset_probe()
Date: Fri,  6 Feb 2026 13:01:09 +0800
Message-Id: <20260206050109.119348-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACXKAzedYVpLGOWBw--.8810S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW8Cw17JrW3CryDJryxZrb_yoW8GrW7pr
	s8CF1jk3y3X3yfWan7t3ykZF13tw1fKa17CrW8X393Zw45tryDJFyayFW7JF95JF98WFWY
	qas7WF48ZF4jyw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUYE_MDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add error checking for regmap_attach_dev() call in imx7_reset_probe()
function to ensure proper error propagation.

Return the value of regmap_attach_dev() if it fails to prevent
proceeding with an incomplete regmap setup.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
Changes in v2:
- Simplify error handling
---
 drivers/reset/reset-imx7.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index dd01fe11c5cb..a1cca926085b 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -364,6 +364,7 @@ static int imx7_reset_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct regmap_config config = { .name = "src" };
 	const struct imx7_src_variant *variant = of_device_get_match_data(dev);
+	int ret;
 
 	imx7src = devm_kzalloc(dev, sizeof(*imx7src), GFP_KERNEL);
 	if (!imx7src)
@@ -375,7 +376,9 @@ static int imx7_reset_probe(struct platform_device *pdev)
 		dev_err(dev, "Unable to get imx7-src regmap");
 		return PTR_ERR(imx7src->regmap);
 	}
-	regmap_attach_dev(dev, imx7src->regmap, &config);
+	ret = regmap_attach_dev(dev, imx7src->regmap, &config);
+	if (ret)
+		return ret;
 
 	imx7src->rcdev.owner     = THIS_MODULE;
 	imx7src->rcdev.nr_resets = variant->signals_num;
-- 
2.25.1


Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B25C2D4B40
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770262966; cv=none; b=aLXgc04VEeNIT0xKeoYnMNVQtvS0UFL0BFcr8yzEGTLvO7v4I9ErTFelAwC/OdpQufOwcs3RN3LrAbWEB0JvLEAHHyE0WeULlMWR99uis6VUff5LnqnfZV0ngUabA8nKS66iBUB6SPI8NvSfl2uuy+4mzLZfmQ3WDpGYvHP/nqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770262966; c=relaxed/simple;
	bh=V1FGHpcBiMuhuQ8wUSU5P2jVvBudCcWzGbVg7MsYDDs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xz7QqJcNwfFmDvlCwOA2NE5wmZUi0BHG4eBlepeWEOCT/FZUyRFGtbcWKSIfvT7k4ymLjRvWYuD3bre6p4nUCFcvQHT1XMR6gnwouccM+Hr3sFy03ZJXafG7/jX5uaTMMeOJ1EkUboVj5h61BhZI0TDAny7UIKwHJEJmRqYwT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADnjWmsEYRppiAsBw--.11100S2;
	Thu, 05 Feb 2026 11:42:36 +0800 (CST)
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
Subject: [PATCH] reset: imx7: Check return value of regmap_attach_dev() in imx7_reset_probe()
Date: Thu,  5 Feb 2026 11:42:19 +0800
Message-Id: <20260205034219.2531280-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADnjWmsEYRppiAsBw--.11100S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW8Cw17JrW3CryDJryxZrb_yoW8GrWkpF
	s8uF1jkw13X3yfWws2q3ykZF17tw1fKa13CrW8Xws3Zan8tryDtFW3tFW7AF95JFy5WayY
	qa4kWay8ZF47tw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
	IFyTuYvjfUYb10UUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add error checking for regmap_attach_dev() call in imx7_reset_probe()
function to ensure proper error propagation.

Return the value of regmap_attach_dev() if it fails to prevent
proceeding with an incomplete regmap setup.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/reset/reset-imx7.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index dd01fe11c5cb..59d0435302bb 100644
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
+		return dev_err_probe(dev, ret, "regmap attach failed\n");
 
 	imx7src->rcdev.owner     = THIS_MODULE;
 	imx7src->rcdev.nr_resets = variant->signals_num;
-- 
2.25.1


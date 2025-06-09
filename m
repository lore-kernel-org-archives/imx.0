Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A8221717
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 20:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501544; cv=none; b=iZ2uNIgbuDcPAOLMc06rn7F7l8qLxgJux8aQsCNmtL95u6LMhCCwkcp2AIcIY2bFbAQ1MvswLkn+qvxeZXphL+z1YOFe0WQNU6gA6XPhKBYzpO+NNO6G85nZGJuHEy3X2HSOajVl6OMxIcIfxJHRp9QDj1WIl5hXkHCa6aYSOAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501544; c=relaxed/simple;
	bh=G5wPqDXS58NnrzSV5vgw2JHG+OHUUSaZGYOXaC8tXy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NjwNFLQAtcBVo/VyhKuECjmEVId4ehcyNW9VEzlk1qhEN1Wxb5/FPew+vwUIWbnHgKOvPyXmIMGsSymUgpW132jCPCB9EkremtaSl+2U1ziOziCS0Lai3G4FUpdrE1rTFwdVsRkMUvu16qlI6x4Qxf+qUUtl1TSJCV/mQqUBTq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=AfQ6FJ5f; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="AfQ6FJ5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1749501539;
	bh=G5wPqDXS58NnrzSV5vgw2JHG+OHUUSaZGYOXaC8tXy0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AfQ6FJ5ffdnEG9K0pTjGqAbq21xj9jXoU57iahPD5Nx9r9BeTroAB90BDT8QdQWVy
	 oKkI1UIY6PSUHgSJBDEkMLFxrUEXq+mh0P2aIaANH10FOJEDCsbeXDzZ79aGdG09Xk
	 4xOXl8lAhjRk6MW8nnuorQNmrRmgwdMe9bto8fJM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 09 Jun 2025 22:38:38 +0200
Subject: [PATCH v6 2/3] leds: lp8860: Check return value of
 devm_mutex_init()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250609-must_check-devm_mutex_init-v6-2-9540d5df9704@weissschuh.net>
References: <20250609-must_check-devm_mutex_init-v6-0-9540d5df9704@weissschuh.net>
In-Reply-To: <20250609-must_check-devm_mutex_init-v6-0-9540d5df9704@weissschuh.net>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>, 
 Will Deacon <will@kernel.org>, Han Xu <han.xu@nxp.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Andrew Davis <afd@ti.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-leds@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749501538; l=1160;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=G5wPqDXS58NnrzSV5vgw2JHG+OHUUSaZGYOXaC8tXy0=;
 b=JOy/hussvTbGS4IAwYip3ZRXXIumOP1ljb9PL4bWOiKX3BAwcYeQ/qv6YgJV1rmGIiioleS6f
 6tDWP2BK4uGBiOFZPjS/EGPQVt7jiSfjg0p+AAahpkM40NyDHkO4eES
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using devm
variant of it. Tomorrow it may even leak something.

Add the missed check.

Fixes: 87a59548af95 ("leds: lp8860: Use new mutex guards to cleanup function exits")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/leds-lp8860.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 52b97c9f2a03567aa12d4f63a951593a5e7017d5..0962c00c215a11f555a7878a3b65824b5219a1fa 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -307,7 +307,9 @@ static int lp8860_probe(struct i2c_client *client)
 	led->client = client;
 	led->led_dev.brightness_set_blocking = lp8860_brightness_set;
 
-	devm_mutex_init(&client->dev, &led->lock);
+	ret = devm_mutex_init(&client->dev, &led->lock);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to initialize lock\n");
 
 	led->regmap = devm_regmap_init_i2c(client, &lp8860_regmap_config);
 	if (IS_ERR(led->regmap)) {

-- 
2.49.0


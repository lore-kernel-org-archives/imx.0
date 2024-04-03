Received: from mail-108-mta168.mxroute.com (mail-108-mta168.mxroute.com [136.175.108.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858D414E2F0
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712157203; cv=none; b=f15kiDVmXW65lyCEqw2RCaDHPmjNLD5FQy+daBUwNQFxnH5DZ1CZhHjFYYpQwzH03qAm3Npfokz7hlRs+grkIkVnACbRG74ei6141n5leqbzclN0jG0GzVkICUhKc5SSUqwEYyVDne2aXatSOAcWvppXy3sACNcqKiqAXqWB4Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712157203; c=relaxed/simple;
	bh=+vxCaqhpYUz4B3FGkuIBCQcJuaRcfN8mST5iCA4cSts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwvTi4RSc5ambaD9qAvfh5KXfaSwSIyI4d22UzmLEt8OCyZhRtlmHIdebmY/EPQbTW3lZGVXBX01GPIPuX3SUNCqsI5s12lxLcP+c46Uf21ZO6wE21ujnUHDR5cHGIgZ3DEmOns3AlMzJ3SaZGD/sJ+Rms+U4pTaFKz9ntV0S9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=hzRF9p17; arc=none smtp.client-ip=136.175.108.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="hzRF9p17"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta168.mxroute.com (ZoneMTA) with ESMTPSA id 18ea480cf250003bea.00a
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:08:08 +0000
X-Zone-Loop: 791bf8b397a6309a68ab4a590dcc7cb2533d3559b447
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VYOIOtA06rrhHKEkkVTvSuwBswDW7njXYjZqzK9f8oA=; b=hzRF9p174w+rysInUpCkyCEor+
	28/1Q++gJbbLCySptKAOW/2CtX5LPY/AwqwlTZlI8wwqhlUf8AO5EQPdJZuMHd5MO6izwZg5bycWW
	OCVkEO80i3/TZKudmprXaUZS+NZHLA1NjGsNAu69xS7266iiO9F46M5of1XlTAwpJGyWCi+HXADiB
	BywIKEuRqe6Hp78L/IIRu0VzaY+jvQXkcb0vhHW/plqwrTNwUN9LHvM0J3r7SElOq6Yjl1X2eHDDa
	h73nAhrSyhWlJN/A0Nae7RH74cLk8SGiBWnfgQ61DpmyA8GfEqYLhUFSs5X/kS8yFr93FwnZ2wetY
	s7ZJPnbA==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>,
	Ondrej Jirman <megous@megous.com>
Subject: [PATCH v3 24/25] drivers: media: i2c: imx258: Add support for reset gpio
Date: Wed,  3 Apr 2024 09:03:53 -0600
Message-ID: <20240403150355.189229-25-git@luigi311.com>
In-Reply-To: <20240403150355.189229-1-git@luigi311.com>
References: <20240403150355.189229-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Luis Garcia <git@luigi311.com>

It was documented in DT, but not implemented.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 163f04f6f954..4c117c4829f1 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -680,6 +680,7 @@ struct imx258 {
 	unsigned int csi2_flags;
 
 	struct gpio_desc *powerdown_gpio;
+	struct gpio_desc *reset_gpio;
 
 	/*
 	 * Mutex for serialized access:
@@ -1232,7 +1233,11 @@ static int imx258_power_on(struct device *dev)
 		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 	}
 
-	return ret;
+	gpiod_set_value_cansleep(imx258->reset_gpio, 0);
+
+	usleep_range(400, 500);
+
+	return 0;
 }
 
 static int imx258_power_off(struct device *dev)
@@ -1243,6 +1248,7 @@ static int imx258_power_off(struct device *dev)
 	clk_disable_unprepare(imx258->clk);
 	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 
+	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
 	gpiod_set_value_cansleep(imx258->powerdown_gpio, 1);
 
 	return 0;
@@ -1554,6 +1560,12 @@ static int imx258_probe(struct i2c_client *client)
 	if (IS_ERR(imx258->powerdown_gpio))
 		return PTR_ERR(imx258->powerdown_gpio);
 
+	/* request optional reset pin */
+	imx258->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(imx258->reset_gpio))
+		return PTR_ERR(imx258->reset_gpio);
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
 
-- 
2.42.0


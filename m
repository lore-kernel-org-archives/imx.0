Received: from mail-108-mta217.mxroute.com (mail-108-mta217.mxroute.com [136.175.108.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1649914A0AA
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712157157; cv=none; b=c4l2mw+jRdU9HbRTr7c/59S7Hx+asoBq1FpKiJ/gB/4ykZG8thi1pztQyTCWIoS30f2xPheigYYiW4dFrKsjn3AkSXq5AhIsXO/sjj4rpREWUlMB+SJ+aRcKApNg21qnablDfHLtgNL64E0rCgl+ADKyhxF11GEurZGnSaThMII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712157157; c=relaxed/simple;
	bh=bRAYH9QE/cuXAqF5e9BZTvXHCvtrXC8TfkxqG8fmEiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHxCr3xyXPnF+ClasXbwF4qqeLUa7uFGN4i7dx2T7Zh7htvF+pbs/5LUgCpYr6MAdSmqkaLReyAwXnG6/txRTZeU1cQ+fdhHIiOrp502i6uvdwmnOfEY7l/VDD157RTUhlX54fEFkd95qF2CCz32SUQbigoywjC7hJRzhW7rFU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=QNffR63+; arc=none smtp.client-ip=136.175.108.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="QNffR63+"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta217.mxroute.com (ZoneMTA) with ESMTPSA id 18ea48023580003bea.00a
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:07:24 +0000
X-Zone-Loop: 75673c8584939ad6680ba2f6fbb689d341e90c735350
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jcEy6JTsTNcC5WMNVRo7tFLU+IzlSrhTpLw2CHMaeGs=; b=QNffR63+U9KV4Bp06mhYIBBMoU
	etwMwn66lpT+pXdj1Lr9Wyf3gLYdoHTjB3s1oKEGNFUsUBSc9DFEx0X+niq34BMZ+wX9rilbhcU56
	IKDtjlFja0E+uOoZbZsNXjFB8gNxy7D5VGbRBlajxT1gbkqU/dA2cZAmP+ooKUIY8jn3MaH7E3R6N
	LduoEiXAFT8jXUd02x6vI2PuR9FPNl6t+3hCr/L9Byy1cPTNHnwdIUABLhjx00y3EGobv7sgOfVw+
	eiZqwus+B2+gJbnbqiz0e4yRjQaxlA40K2ssOLbvUzxOlb7obxFpWaeKzwr3Kfv7Ac4FNZXkbMoD2
	/kY13xWQ==;
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
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v3 04/25] media: i2c: imx258: Remove redundant I2C writes.
Date: Wed,  3 Apr 2024 09:03:33 -0600
Message-ID: <20240403150355.189229-5-git@luigi311.com>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Registers 0x0202 and 0x0203 are written via the control handler
for V4L2_CID_EXPOSURE, so are not needed from the mode lists.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 0ae4371940ca..df7ed4716762 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -237,8 +237,6 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
 	{ 0x034E, 0x0C },
 	{ 0x034F, 0x30 },
 	{ 0x0350, 0x01 },
-	{ 0x0202, 0x0C },
-	{ 0x0203, 0x46 },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
@@ -356,8 +354,6 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
 	{ 0x034E, 0x06 },
 	{ 0x034F, 0x18 },
 	{ 0x0350, 0x01 },
-	{ 0x0202, 0x06 },
-	{ 0x0203, 0x2E },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
@@ -475,8 +471,6 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x034E, 0x03 },
 	{ 0x034F, 0x0C },
 	{ 0x0350, 0x01 },
-	{ 0x0202, 0x03 },
-	{ 0x0203, 0x42 },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
-- 
2.42.0


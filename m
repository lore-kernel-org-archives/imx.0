Received: from mail-108-mta102.mxroute.com (mail-108-mta102.mxroute.com [136.175.108.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B3B12FB03
	for <imx@lists.linux.dev>; Wed,  1 May 2024 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714577433; cv=none; b=dFpdnijud66LiXNFTDRq34EE372iYY1w6EgHjM7vV4aRD2rvoDHfgMHMq3WGqDjEgAUfLeGlC5CDwUZ6PR1iza3yp7tof7cLCTtl4ndl+HSOmtrXW+aVyKB1KELZ9drK+h1V1GVD5RN1h6C3uYoqRrAvJ6+LBEPEBqI0VXFBsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714577433; c=relaxed/simple;
	bh=oCSJBQE3aiwqbmfu1EJ9a36gJDCKL6HMUjBrjCIJ3ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJMqh5z7QW0XuYs42xb0aVDa42rPmxH2sDPvoHqu35U6BOUGfICsbmimd5eMCAfKuF6V6FMbQ748bURhf2KnSUHQEqc8ug0m/97K5gC1qIBDWVU4W8keUz69ushY/t0EVXhqto8jWN4kT4eHM1ZExa+3/537B5O3jraFW2+UNvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=VmfsULTz; arc=none smtp.client-ip=136.175.108.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="VmfsULTz"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta102.mxroute.com (ZoneMTA) with ESMTPSA id 18f34c297490008ca2.00a
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 May 2024 15:25:19 +0000
X-Zone-Loop: 3cadc301c428ed483e017a8e675bcd31b86c4d9ed0fe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eDZZF6N9fGs2w7erh1JS+Jobb378vgl6f0WBmuxrApM=; b=VmfsULTzZSgWjRfex6s/0UXQkK
	A0mXPz406NMcxufm3/bvA89O8S8oIhYTlIFlU3+Y+asSKDJou0B/7AocPHqUs4xD9LId5EPxTgG8e
	u1VlSwuRbCtbzwOpIIcIBkTrPBw5Tbu1CGtx6EbATHFtywF5cmoGIBX9sbkAJhV9fQjap/cE/9uMi
	R/hioynezuiU4iN8I0oe99sD3KldIdgRRpnL3DtL257O+Too2f0yF5UEdklGFgWLhyNOGBjIg5zkm
	woq44QzYONOAmz0KN+ATRekC4anIiZUhACs0d9jM70vsI1BmK4oAEQyzXcOOwsqY4XuzACTeqe9pZ
	10gHzNyA==;
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
Subject: [PATCH v5 13/25] media: i2c: imx258: Correct max FRM_LENGTH_LINES value
Date: Wed,  1 May 2024 09:24:30 -0600
Message-ID: <20240501152442.1072627-14-git@luigi311.com>
In-Reply-To: <20240501152442.1072627-1-git@luigi311.com>
References: <20240501152442.1072627-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The data sheet states that the maximum value for registers
0x0340/0x0341 FRM_LENGTH_LINES is 65525(decimal), not the
0xFFFF defined in this driver. Correct this limit.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/media/i2c/imx258.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 2429eb7b55c6..c1a2c2406aaa 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -28,7 +28,7 @@
 #define IMX258_VTS_30FPS		0x0c50
 #define IMX258_VTS_30FPS_2K		0x0638
 #define IMX258_VTS_30FPS_VGA		0x034c
-#define IMX258_VTS_MAX			0xffff
+#define IMX258_VTS_MAX			65525
 
 #define IMX258_REG_VTS			0x0340
 
-- 
2.44.0


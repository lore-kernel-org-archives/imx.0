Received: from mail-108-mta113.mxroute.com (mail-108-mta113.mxroute.com [136.175.108.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0E5155393
	for <imx@lists.linux.dev>; Wed, 27 Mar 2024 23:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581757; cv=none; b=KVDpU2bOx1r/oleB1xjedK5Rna+ET7tof5RlrWj7eWJV7AYpgTsllIKkDAkjMVX1gT6mfTI8JoRV4LM+R4Gxr9FncKzSHt0DAzBgB/OR159+I3m/Z4nCbVDgDe0bV+2qwBciXPX8AZLVhFe9mpoU3SNYdXPeg1Co1xvTsDg40H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581757; c=relaxed/simple;
	bh=3Os/T7XYPPuIQ9wkr2Su5Kx7M9odE7Rv2QP5TKP3BkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmlAGlXmG2LjYJtIyf60mcy9vFsIE76aFRp/4ZfycENkILpjp7G9w+LaprsoXRQCuxjtVn7VltcyPW8r+NxWI6Z8WfWo88bfxQKI+byPSxeRvzzy5HNDfoAr4UXXBsEcUX1Np2g0b/+vwaeScNZ2VwLNbuqRh3gn1VCKDly95qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=e3TgpllE; arc=none smtp.client-ip=136.175.108.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="e3TgpllE"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta113.mxroute.com (ZoneMTA) with ESMTPSA id 18e8234379a0003bea.00a
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 23:17:23 +0000
X-Zone-Loop: 07c8432a64294419e55473c0ce60ba46410407b8281c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KW1mmB+UsQBWu80vviFCvkS83K6yY9xI4ffO4IjmdFk=; b=e3TgpllE3g2X0HiQXdM/8QW772
	1t0TMuZgesQ1YdxNmIxqKAh1EC+kU+Z/Fn6zlhPFgBVBz17PYrhlj4UJ9f5xxJ1WyGN7PpZHsAwOO
	+DRr84wnuj7ZP3I3CBPsbo0rdi1zGvJjEDsA7c/G7M1R21RoA6KEnlL4Af6QrdonKypUgJ83XKZUz
	8IVw5mn++whmXqrHP647oYQEjSSf0REYv7Zj0+LTdHnXQVGeo8yx5e+8Hz09rdaeCvWDkpEJVc5cZ
	EfG0TSdDfub2hoSdRFYONofdu+Ld++Ny2m7wJQx0BqThWfcUyOzFk1WpziRQvkunQZ7htLpFaRzQg
	gw9M25qg==;
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/23] media: i2c: imx258: Disable digital cropping on binned modes
Date: Wed, 27 Mar 2024 17:16:49 -0600
Message-ID: <20240327231710.53188-4-git@luigi311.com>
In-Reply-To: <20240327231710.53188-1-git@luigi311.com>
References: <20240327231710.53188-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The binned modes set DIG_CROP_X_OFFSET and DIG_CROP_IMAGE_WIDTH
to less than the full image, even though the image being captured
is meant to be a scaled version of the full array size.

Reduce X_OFFSET to 0, and increase IMAGE_WIDTH to the full array.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 4a7048d834c6..0ae4371940ca 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -340,11 +340,11 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
 	{ 0x0404, 0x00 },
 	{ 0x0405, 0x20 },
 	{ 0x0408, 0x00 },
-	{ 0x0409, 0x02 },
+	{ 0x0409, 0x00 },
 	{ 0x040A, 0x00 },
 	{ 0x040B, 0x00 },
 	{ 0x040C, 0x10 },
-	{ 0x040D, 0x6A },
+	{ 0x040D, 0x70 },
 	{ 0x040E, 0x06 },
 	{ 0x040F, 0x18 },
 	{ 0x3038, 0x00 },
@@ -459,11 +459,11 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x0404, 0x00 },
 	{ 0x0405, 0x40 },
 	{ 0x0408, 0x00 },
-	{ 0x0409, 0x06 },
+	{ 0x0409, 0x00 },
 	{ 0x040A, 0x00 },
 	{ 0x040B, 0x00 },
 	{ 0x040C, 0x10 },
-	{ 0x040D, 0x64 },
+	{ 0x040D, 0x70 },
 	{ 0x040E, 0x03 },
 	{ 0x040F, 0x0C },
 	{ 0x3038, 0x00 },
-- 
2.42.0


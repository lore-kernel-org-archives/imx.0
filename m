Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E87825D918
	for <imx@lists.linux.dev>; Fri,  2 May 2025 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198436; cv=none; b=Jds+rtPbv0cMbON5cV7Yj6B2fZDeZqhmdlIZDBBbs1e96VaGNXHH3dazHMPUvxCMLkW5KHEiOAO6TJNX5YMowyNilE+TanHKIQnMa9WLONJGZMLs3j2oDxreZFY0Qqb3nAMt+579u3sh5j58xNXHz0BV5w1rDkPlRMDhzyjYIp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198436; c=relaxed/simple;
	bh=C/bY5yF/nN6J79ZtAT+oJKuULGGt3tVAogRCy21zHtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ga7e/pjyDEjuDq6rrxc1ZND5C9om9LDRLsR/jOZPJaOVQFSiOSyzYyRCaRAdHPRnkTWef4ZGB6NpGyBaGMRZN8ZXtHu1qN3eov1egEXHwPHrO641rehcXML78Pyh/CloVeKBvCobD67qovc4BMKywv8UwEptH+Cw+GaT86PVDV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uAryb-0004HG-HC; Fri, 02 May 2025 17:06:57 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paulk@sys-base.io,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com,
	ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 09/11] media: verisilicon: add H264 encoder support
Date: Fri,  2 May 2025 17:05:12 +0200
Message-Id: <20250502150513.4169098-10-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add the required HANTRO_MODE_H264_ENC enum to handle Hantro H264
stateless encoders.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index edc217eed293..e464bec47b11 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -107,6 +107,7 @@ struct hantro_variant {
  * enum hantro_codec_mode - codec operating mode.
  * @HANTRO_MODE_NONE:  No operating mode. Used for RAW video formats.
  * @HANTRO_MODE_JPEG_ENC: JPEG encoder.
+ * @HANTRO_MODE_H264_ENC: H264 encoder.
  * @HANTRO_MODE_H264_DEC: H264 decoder.
  * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
  * @HANTRO_MODE_VP8_DEC: VP8 decoder.
@@ -117,6 +118,7 @@ struct hantro_variant {
 enum hantro_codec_mode {
 	HANTRO_MODE_NONE = -1,
 	HANTRO_MODE_JPEG_ENC,
+	HANTRO_MODE_H264_ENC,
 	HANTRO_MODE_H264_DEC,
 	HANTRO_MODE_MPEG2_DEC,
 	HANTRO_MODE_VP8_DEC,
-- 
2.39.5


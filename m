Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A6E3D45E6
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445119; cv=none; b=Yl4vDxqWIDeE4tFiazDypIx9gWtRhXUPpUv9wQ9Ts5glKsXOlKcbJG+cxKUXhBcpPifNCiUWNJ838zXRtQG4W5j5lA9ZPzVMdkRePWKLvLFH7+9x3ERmyN9rOFGGh0BvfsfNxPZ2eIFMyMuPyPtjx0BrBfOTGKqDyzeXFk0NEgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445119; c=relaxed/simple;
	bh=rXg8LTkAKTJ8UbCnuC7jLvsrhh3AX1TUruXRYOQqzbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sl1mgsskJOXXW6ZMH6eknAz2C/I3CcJqlTSg+RRjbn8o6amfBXSZNFrED5coo3RD+x5wLxc5b+LPjO9VUv1V8Ug3SGYrKiDiaYjkCeFJIgfXu3U/hguafAh6afsKKhBMPsyJqr/VaTdkj4SQIeUlsP09rw+TXcQEU4/6unX1Vto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 628863700298
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:18:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C5CA1B408D4; Fri, 22 May 2026 10:18:18 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id BBEE9B408D6;
	Fri, 22 May 2026 10:17:18 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 13/14] media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP
Date: Fri, 22 May 2026 12:16:52 +0200
Message-ID: <20260522101653.2565125-14-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required platform-specific bits for driving the VC8000E found
on the NXP i.MX8MP SoC.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Co-authored-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../media/platform/verisilicon/hantro_drv.c   |   1 +
 .../media/platform/verisilicon/hantro_hw.h    |   1 +
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 113 ++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2de27f0a2be0..540e3b647fe4 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -874,6 +874,7 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
+	{ .compatible = "nxp,imx8mp-vpu-vc8000e", .data = &imx8mp_vpu_vc8000e_variant, },
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
 	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
 	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index a0c752ef44dd..5f79fb401da5 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -420,6 +420,7 @@ enum hantro_enc_fmt {
 	ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
 };
 
+extern const struct hantro_variant imx8mp_vpu_vc8000e_variant;
 extern const struct hantro_variant imx8mm_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g2_variant;
diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index f9f276385c11..50ce4a5f979d 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -234,6 +234,96 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	},
 };
 
+static const struct hantro_fmt imx8mp_vc8000e_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUV420M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420P,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			/* TODO: implement dummy reads to relax size restrictions */
+			.step_height = 64,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV420,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420P,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			/* TODO: implement dummy reads to relax size restrictions */
+			.step_height = 64,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUYV422,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_UYVY422,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_ENC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
@@ -305,6 +395,15 @@ static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
 	},
 };
 
+static const struct hantro_codec_ops imx8mp_vpu_vc8000e_codec_ops[] = {
+	[HANTRO_MODE_H264_ENC] = {
+		.run = hantro_vc8000e_h264_enc_run,
+		.done = hantro_vc8000e_h264_enc_done,
+		.init = hantro_vc8000e_h264_enc_init,
+		.exit = hantro_vc8000e_h264_enc_exit,
+	},
+};
+
 /*
  * VPU variants.
  */
@@ -317,6 +416,10 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
 	{ "g2", hantro_g2_irq },
 };
 
+static const struct hantro_irq imx8mp_vc8000e_irqs[] = {
+	{ "vc8000e", hantro_vc8000e_irq },
+};
+
 static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
 static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
 static const char * const imx8mq_g1_clk_names[] = { "g1" };
@@ -382,3 +485,13 @@ const struct hantro_variant imx8mm_vpu_g1_variant = {
 	.clk_names = imx8mq_g1_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_g1_clk_names),
 };
+
+const struct hantro_variant imx8mp_vpu_vc8000e_variant = {
+	.enc_fmts = imx8mp_vc8000e_fmts,
+	.num_enc_fmts = ARRAY_SIZE(imx8mp_vc8000e_fmts),
+	.codec = HANTRO_H264_ENCODER,
+	.codec_ops = imx8mp_vpu_vc8000e_codec_ops,
+	.irqs = imx8mp_vc8000e_irqs,
+	.num_irqs = ARRAY_SIZE(imx8mp_vc8000e_irqs),
+	.num_clocks = 1,
+};
-- 
2.53.0


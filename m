Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795082879;
	b=zaKD54IGM1873cov/WCP1eM0XVS6WjpogKfavqR6UB+u5a2zJs7p6N3svLv8YjFdOsxP
	 MC5jsFEC5Vaq/LsnB13pDMDiCIQAqMwhaUGQ+nVSZz2roYPAgjw27Az/dbF2r/yXECaYP
	 C7SkijEEUIvBQ6ltmceXkrVxX8cEhZUTddsA8QEuoB42zjWi17C9fCg8XHSQIB+HBQbVc
	 FvKrE5PBDzNtj2eQ/6K8S+OKnTFVNvGOk+oVSiYb46h4fRXsKb1YLYifwJhfzQCxUm/+u
	 NB4HVjPKdWiqVJFKXFDp+EoX44u16MmaMLDbOOzWv0nkIx+onNPUAE6sixV9DJx8X6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082879;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gYAYrLCOGgg/07L+LDhGF2bUCvhFzYdBrR2yq0ZLqyw=;
	b=AwWawW0YOlUF2NdnqSaDpv6z/P3Kl6pkNHW3wq5qDsYnMnUJRa825tvtiFtpmU7sYHd+
	 pdqAAUaUvT24PZJ6Zl6pNOggVud4U0ooZB4WtGLQbQiQNRZPI9fIJZZGV4lXy37+mUhyt
	 Kgf9Jut00p8uiqNBdl1RufmQUXhfKq5Ub4ut8UpoG//iTcb/Y7dkHGZAKoylbiDbERhAp
	 vFOFYkvz6lJTq8PNpgYRjxqgsbznOv2Frx8v2eww2ClehmWZwyOP2GYCL8x2/dQOVYs31
	 M+xtLKu5NBGLKqE5+13/H3Cu52pOcd1LzScJEKLsQY0Txf5sf6Qz443EDIGBwjAQWrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8t+X2ah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CB2606A320;
	Thu, 19 Nov 2026 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8t+X2ah
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795082879;
	b=Cf2/qBq34dLnxUZDWbMpiT2mkrxuoIP73tlM77n7U59vctV02TAXJCvVYAnASGLFO5Tf
	 zDK+CLu0jcPbZLC36gS/Be9s/f0LJjxoEYf3c7AhTvLbXRaozDoi5HGgyKD2KPA0wRi49
	 xeJQLarQe+nkIOi1XFWO9JlivLaSwcVT856Rac/lz9ahDYh6OkNRiiv+0VW/QOUWaI8+f
	 iMXGJ8OrEWaLxo8HbCxPyMKmmMoK1zk00MUex75ZhHWWgP3TR9Gjyxr/Z7b+aYWtdFsrK
	 +4ky1m3OYBjA18roJ8dt9PIkg2MW9moj6LT7QZV5GkSD4UM5jdyVVkP00lc4smNDdPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082879;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gYAYrLCOGgg/07L+LDhGF2bUCvhFzYdBrR2yq0ZLqyw=;
	b=LPLXfaA0ju6jXbtzUMQ3lFreqj7ms+4QR6P5vcNAuC0F5FPNJdEE4k0V+nIL+d2kB+dY
	 YLYKblzj43bJgKrnLVIZcDDwc1aYYQsAOZWE5usQSQD1wAWY+t+9WYxOytBLRFcPv3XGl
	 o5zyMhoVmiW+zbNzbgUzSLmTftZT2MhDFJWfbbRub7j2RgqsxcJvQ7m+zUm3P16EAtLQ9
	 QOg3IC1UoXbw6D8bHHxAUDkcrOrexmlDA+ufpx/K03jXiCPGZp6M0Fe/+Sq4upRc3Bip6
	 hp8BKFNiqNFW14zO2+tRJgjMbaidNnW2bj7VRBnmp2vQAMlY8UXRUInTl3pDv+2O3yA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E1A81F000C5;
	Thu, 19 Nov 2026 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082879;
	bh=gYAYrLCOGgg/07L+LDhGF2bUCvhFzYdBrR2yq0ZLqyw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=T8t+X2ah2gHvrkFQ3W2yMPBC+uL/144J9JzCFJUzPZfef0zDYFEHFE963tH1OE+T1
	 mzxdKJXffY0sebIWXn0UCBPVFWPOsLs8EXshu07vGxsJJ367e/W1h2vnaSVHe6k49G
	 4y5D9wTCToF+CEJUwqBQ6XUmcJ4aaF8eRGcT1byEd3loo7ApaR/GW2BfoTWU8egpBV
	 QldPZ9qs6StAtRmp6ztGoNaJq3idERLcyN7Lu8QuRRHRCnTgVzWbgXxnjdPavqbTx/
	 W0OcckyJcfLljWTX/vH8lwvuwqrltz+6aix3FSCWAAD91ANAkKkJRaQo+kAX6wuifI
	 WNyjtCPS6LImQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 92AA04B1FE;
	Thu, 19 Nov 2026 10:07:57 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 10:07:58 +0000
Subject: [PATCH] media: verisilicon: Limit the i.MX8MM G1 decoder to 1920
 pixel wide pictures
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-hantro-imx8mm-vp8-v1-1-835dd9b5382c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0Q5EMBCF4VeRuTaJ6Qrtvoq4sEwZSZEWkYh3V
 +vyO8n5TwjshQN8kxM87xJkniIoTaAdmqlnlC4aVKYKIjIYx9XPKO7QzuG+aFQfy7q0ZLrcQPw
 tnq0c/2ZVvw7bb+R2fUJwXTfIrYPTdQAAAA==
X-Change-ID: 20261119-hantro-imx8mm-vp8-23fe87f19d49
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082877; l=3675;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ttabhbq6HX9n6LkD9lfDtGqujWqiEJqLK1Woo7amLA4=;
 b=+G5/+KW2AA45IYVMYGsAK031f3/0CCyalGQ+9VZaUy/I1qNSEut0kIdVEsvlPABpwv/SV97aN
 by0MkGaTorGCX58eERoTDkfsA1sJAYMPiaiCNQwfVdOyBtXjalc1cP+
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The i.MX8MM G1 uses the i.MX8MQ format table, which allows H.264, VP8
and NV12 up to 3840x2160. The i.MX 8M Mini data sheet rates the decoder
at 1080p60, and NXP's hantro_v4l2 driver offers a decoder of that size
1920 pixels wide and up to 4096 high.

Give it its own table with these formats limited to 1920 pixels wide.
Heights are kept so that portrait pictures such as 1080x1920 are still
accepted, as in NXP's driver.

Fixes: cf1abc501a5c ("media: hantro: Add support for i.MX8MM Hantro-G1")
Reported-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Closes: https://lore.kernel.org/r/f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Not tested on hardware: I have no i.MX8MM board, so the limit is from the
data sheet and NXP's driver, not from the decoder's configuration
register. Build-tested only (W=1 arm64). The i.MX8MQ table is unchanged:
NXP's driver gives VP8 the same 4096x4096 as H.264 there.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.
---
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 58 ++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index fa4224de4b99..805c57a4adcb 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -148,6 +148,60 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 	},
 };
 
+static const struct hantro_fmt imx8mm_vpu_g1_dec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
+		.codec_mode = HANTRO_MODE_MPEG2_DEC,
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
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
 static const struct hantro_fmt imx8m_vpu_g2_postproc_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
@@ -382,8 +436,8 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 };
 
 const struct hantro_variant imx8mm_vpu_g1_variant = {
-	.dec_fmts = imx8m_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
+	.dec_fmts = imx8mm_vpu_g1_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(imx8mm_vpu_g1_dec_fmts),
 	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
 		 HANTRO_H264_DECODER,
 	.codec_ops = imx8mq_vpu_g1_codec_ops,

---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261119-hantro-imx8mm-vp8-23fe87f19d49

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



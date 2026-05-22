Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4B3C9897
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445038; cv=none; b=bov1nYef9CeU8EJ1TVbrIi2ELoipSheqjH4OggthUWvFRnI533fs9BVVar4yjWemo8zJtRNzgDiFwj09OutNeEIgzHOTmdSsIaIDgMbT2sh4M8v7JvsUh0RSxUlMgc1TWwTaSYjNPp48NGFf+rGYd+LdAaC2US49u89niQbC0wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445038; c=relaxed/simple;
	bh=s9dmwcwZ71kKCbbcMh+MDPbYaPsMCeOL+9L4hEaBbjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F32sGchQCYAnp7ReJMz3w7fvQ/QMfYCYbCRrE1yX5y7p8eXv2DLDs4ngMtsAg3gOnzl4OcLEyXv1YTa7uuUGGaMuFn8VZM/y5UufZejWl1mSz5YeYldvjXYW1afIvsKGFglhLOaL3q1O5XTpmeSmlF+9DUIYaH9tJISdq3MV19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id AF78A3700294
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:17:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 86BB2B408D0; Fri, 22 May 2026 10:16:58 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 311CAB408C8;
	Fri, 22 May 2026 10:16:56 +0000 (UTC)
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
Subject: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
Date: Fri, 22 May 2026 12:16:39 +0200
Message-ID: <20260522101653.2565125-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces support for the V4L2 H.264 stateless encode uAPI,
core and support in the hantro driver for the Verisilicon VC8000E.

While this is a first version that will likely need some level of rework,
it is already usable for most common use-cases and supports constant
bitrate rate-control.

A GStreamer tree can be used to test the series at:
https://github.com/paulkocialkowski/gstreamer/tree/v4l2codecs/h264enc
And an example pipeline would look like:
gst-launch-1.0 videotestsrc pattern=smpte num-buffers=25 ! video/x-raw,width=640,height=480 ! v4l2slh264enc rate-control=cbr bitrate=8000000 qp-min=8 qp-max=42 ! h264parse ! matroskamux ! filesink location=encode.mkv

Note that documentation for the new uAPI is intentionally left out of
this series since it has not yet received approval.

Marco Felsch (2):
  media: hantro: use hantro_decoded_buffer only for dst_vq
  arm64: dts: imx8mp: add VC8000E encoder node

Paul Kocialkowski (12):
  media: h264: Add a more generic reflist builder init
  media: uapi: Add H.264 stateless encode support
  media: h264: Add SPS video definitions
  media: h264: Add stateless encode core
  media: h264: Add stateless encode rbsp
  media: h264: Add stateless encode reference management
  media: h264: Add stateless encode rate control
  media: verisilicon: Report default pixel coding for non-JPEG and fix
    JPEG case
  media: verisilicon: Cancel job with runtime pm put/clk disable on
    failure
  media: verisilicon: Add common encoder parm and frameintervals ioctls
  media: verisilicon: Add support for the VC8000E H.264 encoder
  media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP

 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   11 +
 drivers/media/platform/verisilicon/Kconfig    |    1 +
 drivers/media/platform/verisilicon/Makefile   |    2 +
 drivers/media/platform/verisilicon/hantro.h   |   17 +
 .../media/platform/verisilicon/hantro_drv.c   |  180 +-
 .../media/platform/verisilicon/hantro_h264.c  |    6 +-
 .../media/platform/verisilicon/hantro_hw.h    |   28 +
 .../media/platform/verisilicon/hantro_v4l2.c  |  123 +-
 .../platform/verisilicon/hantro_vc8000e.c     |   68 +
 .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
 .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c |  113 +
 drivers/media/v4l2-core/Kconfig               |    4 +
 drivers/media/v4l2-core/Makefile              |    2 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   62 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    4 +
 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c  | 1173 +++++++++
 drivers/media/v4l2-core/v4l2-h264-enc-rc.c    |  558 +++++
 drivers/media/v4l2-core/v4l2-h264-enc.c       | 1322 ++++++++++
 drivers/media/v4l2-core/v4l2-h264.c           |   69 +
 include/media/v4l2-ctrls.h                    |    2 +
 include/media/v4l2-h264-enc-rbsp.h            |   72 +
 include/media/v4l2-h264-enc-rc.h              |  108 +
 include/media/v4l2-h264-enc.h                 |  135 ++
 include/media/v4l2-h264.h                     |  146 ++
 include/uapi/linux/v4l2-controls.h            |   33 +
 include/uapi/linux/videodev2.h                |    1 +
 27 files changed, 7231 insertions(+), 21 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_regs.h
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
 create mode 100644 include/media/v4l2-h264-enc-rbsp.h
 create mode 100644 include/media/v4l2-h264-enc-rc.h
 create mode 100644 include/media/v4l2-h264-enc.h

-- 
2.53.0


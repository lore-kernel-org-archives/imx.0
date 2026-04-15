Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3CD31326B;
	Wed, 15 Apr 2026 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261875; cv=none; b=MnSmSr2pCa2eMxLpBdLLhLFcbcWaZMEU5BwkrLIvL8F6d3ZxyIVFaFI+8usqBwqR3+Um16ZHQwbQsMx6E2O8MJc8Z6IA3b5Qy9z6qfwnEYTd0R1609qE/UCrLxx8z/5EIlD9IL0Wo+g485m5sMLAWlyOCNI/RKrB9i6Vx4WQj/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261875; c=relaxed/simple;
	bh=21h7NyivpOz74ue2rg11pkknE/jlHCT9nP2kf9C1szg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1sf6MmErrxCWdHRZZYTNYUj2RDT+7HqyPdOvxfACyfCzn/SS5ewaxgdYY/IxwuOIPkZiI4VJqp44O5ld1yAJcYJJp9JpRjW5Z+a2MaP3P0iEoNCqG8Wk2lJhyyI+fD/STJNo3eyIjk81nQyD+9O1ygvRXiO69lwMO/MGb+bRHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kHZJQv3g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kHZJQv3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776261871;
	bh=21h7NyivpOz74ue2rg11pkknE/jlHCT9nP2kf9C1szg=;
	h=From:To:Cc:Subject:Date:From;
	b=kHZJQv3gSr7mjPUiqA8xXytY0Z+tkDFhaHfXBo1GFIUOLFZ2KrSN/Im66qkCUl3f0
	 ZzBAeWAbyeH4khO07hzYGdOv5nU5Pg4iX6IQaZ4xlMZqV2fG+H3UG9xGcJMngW9vdO
	 zeL/uHl5iAWvHylAwiLvTM5rarVkUJVmkQPZNAnfCN4Z9f+MJmHhP3HfFL9cvWc5hC
	 SRh9raw5SnPHfaimcZttFQLSwhVNiTwiffBJOWtjGjT5+E2zwPUZm+XSx9T44iT/Tc
	 I44azkb8/vTXvFVD+uPwjxoOvxPdpUg3ocaKAHDjfoXx8PyLR3mynZTUPzzgAqJL3+
	 TGWIJYRytGgpg==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FE1117E1276;
	Wed, 15 Apr 2026 16:04:30 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 0/2] media: verisilicon: Simplification and clean up
Date: Wed, 15 Apr 2026 16:04:18 +0200
Message-ID: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify motion vectors and reference allocation with common helpers.
Since it requires to move some of codecs specific functions and
structure in codecs header files add a patch to finish the clean up.

Benjamin Gaignard (2):
  media: verisilicon: Simplify motion vectors and rfc buffers allocation
  media: verisilicon: Clean up messy include

 drivers/media/platform/verisilicon/hantro.h   |  31 +-
 .../media/platform/verisilicon/hantro_av1.c   |   7 -
 .../media/platform/verisilicon/hantro_av1.h   | 100 +++-
 .../platform/verisilicon/hantro_g1_h264_dec.c |   1 +
 .../verisilicon/hantro_g1_mpeg2_dec.c         |   2 +-
 .../platform/verisilicon/hantro_g1_vp8_dec.c  |   2 +-
 .../media/platform/verisilicon/hantro_g2.c    |  36 --
 .../platform/verisilicon/hantro_g2_hevc_dec.c |  26 +-
 .../platform/verisilicon/hantro_g2_vp9_dec.c  |  12 +-
 .../media/platform/verisilicon/hantro_h264.c  |   2 +-
 .../media/platform/verisilicon/hantro_h264.h  |  98 ++++
 .../media/platform/verisilicon/hantro_hevc.c  |  37 +-
 .../media/platform/verisilicon/hantro_hevc.h  |  82 ++++
 .../media/platform/verisilicon/hantro_hw.h    | 446 +-----------------
 .../media/platform/verisilicon/hantro_mpeg2.c |   1 +
 .../media/platform/verisilicon/hantro_mpeg2.h |  27 ++
 .../platform/verisilicon/hantro_postproc.c    |  29 +-
 .../media/platform/verisilicon/hantro_v4l2.c  | 262 +++++++++-
 .../media/platform/verisilicon/hantro_vp8.c   |   1 +
 .../media/platform/verisilicon/hantro_vp8.h   |  29 ++
 .../media/platform/verisilicon/hantro_vp9.h   | 104 ++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c |   5 +
 .../verisilicon/rockchip_vpu2_hw_h264_dec.c   |   2 +-
 .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c  |   2 +-
 .../verisilicon/rockchip_vpu2_hw_vp8_dec.c    |   2 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  16 +-
 .../platform/verisilicon/rockchip_vpu_hw.c    |   3 +
 .../platform/verisilicon/stm32mp25_vpu_hw.c   |   2 +
 .../media/platform/verisilicon/sunxi_vpu_hw.c |   1 +
 29 files changed, 796 insertions(+), 572 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_h264.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_hevc.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_mpeg2.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_vp8.h

-- 
2.43.0


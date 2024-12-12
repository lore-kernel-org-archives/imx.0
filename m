Received: from a7-44.smtp-out.eu-west-1.amazonses.com (a7-44.smtp-out.eu-west-1.amazonses.com [54.240.7.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB3D21B91D
	for <imx@lists.linux.dev>; Thu, 12 Dec 2024 15:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018216; cv=none; b=KohdWmSp7ZH42l7DXdTwzu2DuVm0bWARa1Cb8nMdyqlshCLdC2HS0rtIY1Ac98/+i36lqdD/ps53XqfcBEudnTZoFs05B5u3BId8vlOPT22/SbAH3ogfCMaQl4XCmJ0Ho71zpEe4LPlOchf/LTJz2NzbF8GjkEFWFac9p0GsKNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018216; c=relaxed/simple;
	bh=ltUDALF8WtRUBRtQU/ZvlBBXaB0jB77q/PnuMmcP0BA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3FHY5NLXJbH/7tFZDdeozyap40FpPmjcHBxCFNi6qglhORDYYy5d2v+vwt9DkVABH7H7WFoOxQXncVDgh8ZJ3YmdZv73WWIkz9gLvdMthNqhmE9lY7BCe8/OPEgnm28MHHJi/n1j4yezXfkfKEP1S+RwdqAn9KuX9yW3jiWfm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U1wQpTr3; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=hfVElm0g; arc=none smtp.client-ip=54.240.7.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U1wQpTr3";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="hfVElm0g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1734018213;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=ltUDALF8WtRUBRtQU/ZvlBBXaB0jB77q/PnuMmcP0BA=;
	b=U1wQpTr3k8eLSbyCBCHyrpP+wbs1XpZS9hsaqkvPRaoxq25BZr/dM6k1xQAk267h
	RA5aOEbkc8rqk9RtQaIX+xl4oRR/h3CotlGUAvrd6J05OlHZTwauyYcdE+yjcn5hhew
	6v2FVSJ/8hzUTRFdtt7IpFFG/5dfHZgHK11x+SyBo/p4RksDDs6W02B6shK1uB9xJ3K
	tyfyd9N5rUU4WeK+EA+4SPx8BgFBzG5tjKntqL3LAcum9J3xETUWBWqxyDDOejpNpnU
	bsRefvfbI/j9XGZEV68GLxyyXkrwfSssvjRaGNia40a+5TV2mTyNEdyec8jvOrlnRmP
	sMO4u7KNAw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1734018213;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=ltUDALF8WtRUBRtQU/ZvlBBXaB0jB77q/PnuMmcP0BA=;
	b=hfVElm0gkL4Grt7PQrESSMWpcfKYEgyVVCSfM2oBuEj4LnmE7/FKiGmRp5KC6fNY
	hW1Sk8gIv52BHGqp5Ak2Z3dd5PdFzQ9mmnXWAfBvv7m1np5iAJRzjjQs9l5Zh1OlTvq
	k2sYNA/KDD0SzebN6C92B88egzp1dsvD1taccRNM=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 0/2] media: verisilicon: fix reference padding issue
Date: Thu, 12 Dec 2024 15:43:33 +0000
Message-ID: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.12-54.240.7.44

Hantro hardware is splited into two parts: the decoder which produce
tiled pixels formats and the post-processor which produce raster pixels
formats.
When post-processor is used the selected pixels format may not have the
some padding/stride than the decoder output pixels format. This led to
miscomputing chroma and motion vectors offsets so data are overlapping.
This series introduce a reference pixels format that decoder use to
compute the various needed offsets and size.

With this series Fluster for VP9 tests is now 207/305 vs 145/305.
HEVC test score isn't impacted by these patches (still 141/147).

Version 2:
- rebased on top of media-commiter/next
- Add reviewed-by tags

Benjamin Gaignard (2):
  media: verisilicon: Store reference frames pixels format
  media: verisilicon: Fix IMX8 native pixels format steps values

 drivers/media/platform/verisilicon/hantro.h   |  2 ++
 .../media/platform/verisilicon/hantro_g2.c    |  2 +-
 .../platform/verisilicon/hantro_postproc.c    | 32 +++++++------------
 .../media/platform/verisilicon/hantro_v4l2.c  | 21 ++++++++++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 10 +++---
 5 files changed, 40 insertions(+), 27 deletions(-)

-- 
2.43.0


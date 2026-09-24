Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40601472061
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248115; cv=none; b=bgzwFa9JwCjPKNZhN0yxPZzDaV/JQtjsQVZ6Vuj3Hioig4tJ/TubnDSH1wDr2wPDpOX6xXKwqZL4WLwLriFeamvr+TO5iFmy5so9OJRTyNHzGj9MDQBP/WC7alsb0DJBhKsJreC+851i6of7YkN9OmUIVLyA4cJDqlxXHDWirfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248115; c=relaxed/simple;
	bh=Mtojtg2W6FyqJ5AJ/ZxpFW1x6w9Yz/ywA++HVXDlACM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V061IszE+7W/+GY0L9zHdIYZZl6hn2hQC9n85AI/eRlSnSGgQROAWB82w4rZK9cRVXr8wpGXyDuY9EWkMYcMirzv5B3egoIJMAyR2WyjReUe9gB9WKnGP5BXkAaYvh5iVs5oKiqe6JUyQ1GtVbIkJgv/EQS+1kNJpFoVyLZlSRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ocQyk7Db; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ocQyk7Db"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790248111;
	bh=Mtojtg2W6FyqJ5AJ/ZxpFW1x6w9Yz/ywA++HVXDlACM=;
	h=From:To:Cc:Subject:Date:From;
	b=ocQyk7DbaikGw0zgzuelLathBbin++rYWY6niIWlI/zGqBFZ5Va3m/nazybK/Zeyj
	 3LcFBGya6804bUX9znjrdxeWV1GQGIJNMSg19qyhc2JYGmV33VO77VV2OlG3kQfzzP
	 G868lC2jBOQXWru9za1D6itTrwhvEzFLoc0A+OXtysoQYceIAxDsNyay8l71NrfBZY
	 nFxExuMF+uA9u2IY4+Uel7k8/1k+xYhqtuvJbttE7qoHVUntug5IXaLWPvj4attWRi
	 a8hIQlFa+RnpxBQsup1C1cBsQZLEnkE/+JtdX7RxvMTWrLcvUnU/XPOHH4pgyI1G9q
	 I4Tp98py3QtbQ==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E278C17E00A9;
	Thu, 24 Sep 2026 13:08:30 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 0/3] Remove unused variant and code clean up
Date: Thu, 24 Sep 2026 13:08:22 +0200
Message-ID: <20260924110825.166238-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"nxp,imx8mq-vpu" variant has been tagged as deprecated since 4 years
now. This series remove it and make some context's fields useless so
remove them too.

changes in v2:
- have a separate patch for documentation
- fix dt-bindings
- rebased on v7.3-rc1

Benjamin Gaignard (3):
  media: verisilicon: Remove deprecated variant
  media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        | 10 ++--
 drivers/media/platform/verisilicon/hantro.h   |  8 +--
 .../media/platform/verisilicon/hantro_drv.c   | 21 ++-----
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 60 -------------------
 4 files changed, 11 insertions(+), 88 deletions(-)

-- 
2.53.0


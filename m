Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72552149C4D
	for <imx@lists.linux.dev>; Fri, 18 Jul 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846184; cv=none; b=FhlGt+WXM8q892kvQPxFnTtlIpx/4oK3EDTBFSEkPQ80rngFnLeLpIVAGZY1uKB5ZS+BNRe9nQmidgXX1UMAJ8kYcjQmX6XmWEJbvCX4H885Ggdj7emUJB/AKrf6yLCUi061OCN2pSV4AWiJKwzPMKz0lAmzmf06AHHZF3qvi68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846184; c=relaxed/simple;
	bh=otTGygr7TVGTYqcr0fX9VequzUeg+oyf0nTBNcNXdAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oxvtG1ceDcz1GDnsezvShsJdaT4R6sYYXwMscPa6SKoSBVz/DudMJjlnf+E+x6UJ8Lb/OkgsYsgWsaq3ucB6nKKo0q6lxcUadIHorg44T6OszSvg5NL2834+GzTJ4RQF4Cok8oTKi1LYCSltbE3So5xqGky923qVtxvp+T8z2qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=u+5twy+G; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="u+5twy+G"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DB6B01FBBB;
	Fri, 18 Jul 2025 15:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1752845682;
	bh=MzOMyIV68qHQ0Kt7SHQ+0I+blgrtc5hfOPRGbkCaOXw=; h=From:To:Subject;
	b=u+5twy+GcjC/2I6RtkO5b91F9NkV42c6eu1+N4v8XBtVuWd2u44uSNSfeEpTlzqol
	 P2krDTV4T4ozRlh0UxoHkIS8o0E9SaGlGtB7U18vh8nTDdBCbhSSFWC5Hu6/sG0R6+
	 x/PVztIBIzhWcj4tPx4AOSpNngR3RlY1bhdQRQWI4ocr0x/RN/KJeZoW3Di4E7ZI0R
	 bn8ph+yymT5vJr2p+vtks3c3qWPqRePFLcuJHvMCFYvulIarz4Kay7P2jF4nFOOSN2
	 /cWCtnQ4pCwYIk0RFzrpq0lARzB8V4acIaUmyzV2+9DddvdhTXv3Xd37hfCDcu8e3S
	 imOGSNF4fAIlQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] i2c: lpi2c: implement master_xfer_atomic callback
Date: Fri, 18 Jul 2025 15:34:27 +0200
Message-Id: <20250718133429.67219-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds atomic operations support to the imx-lpi2c driver and split
the previous v3 patch into two separate patches.

The first patch replaces the open-coded polling loops with readl_poll_timeout.
This improves readability and consistency, and prepares the code for
integration of the second patch, while maintaining the same functionality.

The second patch implements the .master_xfer_atomic() callback, enabling
support for atomic I2C transfers.

Emanuele Ghidoli (2):
  i2c: lpi2c: use readl_poll_timeout() for register polling
  i2c: lpi2c: implement xfer_atomic callback

 drivers/i2c/busses/i2c-imx-lpi2c.c | 254 +++++++++++++++++++----------
 1 file changed, 172 insertions(+), 82 deletions(-)

-- 
2.39.5


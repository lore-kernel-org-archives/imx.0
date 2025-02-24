Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC79250C1A
	for <imx@lists.linux.dev>; Mon, 24 Feb 2025 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407331; cv=none; b=r5PFJtfK/2cyzivzLIzeE+ewZIWI5DCGBO+tTd4xcFUIFIAuwhwhKQvqZFCih3qMX712Jzg5aT4ow+SHuT6AEiNRZrFECH0x7s73rFw47xz5zlXtNhK5lOFE1mugonKoHpbYRQF51xSo8EvOiIZGjZCRXcuUIPcRZl+Rf0v/FCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407331; c=relaxed/simple;
	bh=uC8ooAZOuxZ24bwG14fjyP7ju5vNeMcEAefku0l3oMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJt0p1916e8as7oWXhhbbMH8TO754rEun8WNbYS30lMxL8vdgdTDPjQbJzsgzpxl6wi/rgOxDJgxwGi/Z4qAdGNmjdC4eeGNM2iHZosJJlqrP/gQSxuvz8qaz1BZJgyHWXNRECp1fSxGLyUbt0CLS2Qncnvb2MIvVb+3CWS1hs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=EhyBE5ix; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Bm7iv9Qe reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="EhyBE5ix";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Bm7iv9Qe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740407328; x=1771943328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KLDKoEHmBNZru20DMSxS9Pw3dDW9jMuSmbZS8x5oymU=;
  b=EhyBE5ix9J6oqkP4fI/ZpUW+/3x2tPOWoSrNHpPlUT08SWr0/H8WmGYF
   7XpH5+a+42G/BIpCtHZnWotrPMyyuPqtXO1Q/HeqxWo7HAieTORXW4+lE
   8bXVNa4YmFBQut5Mri3+crx4r1E5FkjVc60d7/FE9zP/b7ccAMq4VJyPt
   av+Ckw5SiOi4rfBGdE3r2Xf3TTcjWqXolXNlCJFAtu9pQPavVt6z8b6Yy
   2+r7VwPFDHC6W1dAk1hRk0hdkrQ251xFp33bwntsx7nJEM5IjO1TWScfm
   /TSBK9QajSkjhUnOdTv4FeVl85C10QBYA0+I/5lEUTu8D8+z0D5jQE1Qo
   g==;
X-CSE-ConnectionGUID: jNuVcmjMQdu/XzMNYCrMEw==
X-CSE-MsgGUID: +pIsMXW4QX68UZLFm3DBOw==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42042104"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 15:28:46 +0100
X-CheckPoint: {67BC821E-1B-F75C4246-F0BD6D90}
X-MAIL-CPID: 791E6579507C17192F024A34A370D616_3
X-Control-Analysis: str=0001.0A002103.67BC821D.00DE,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87012167930;
	Mon, 24 Feb 2025 15:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740407322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KLDKoEHmBNZru20DMSxS9Pw3dDW9jMuSmbZS8x5oymU=;
	b=Bm7iv9QeP09ZvQ0CG8V6YnlSJwXWQ066UmYdvl7P0n29NR06EVQMgL5AIqra9lqP966b/E
	8zztU7NQzepM/2g4fPceO99tcpZBatawxa0IHjY7RDc2Xp7nMqtJNowt+ZvBj0HUvQD9HS
	hBOt5irKjh1gMIrcp0jLrxV0sLd6uYEXD81i3wNtvwlGs5R4mPMQGfNgsyTm3azQuUwf9V
	nL1dfYBhwqjEmtyOZDCyTby6HAv074VfZ5Qa+jrkDY3ipcZ5NHg3lvZDpXDuC1QmR55VGG
	8toWUwbVCrMrSVdy02l16l6pruNpM98ZSYmWMc5kdNpWWR0cA8z4S+HkHxgpYg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/6] clk: imx: clk-fracn-gppll: Add 477.4MHz config for video pll
Date: Mon, 24 Feb 2025 15:28:22 +0100
Message-ID: <20250224142831.485159-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
References: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add the 477.4MHz frequency support that will be used by video subsystem
on imx93.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 85771afd4698a..f0c34a02acac3 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -85,6 +85,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(519750000U, 173, 25, 100, 1, 8),
 	PLL_FRACN_GP(498000000U, 166, 0, 1, 0, 8),
 	PLL_FRACN_GP(484000000U, 121, 0, 1, 0, 6),
+	PLL_FRACN_GP(477400000U, 119, 35, 100, 0, 6),
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
-- 
2.43.0


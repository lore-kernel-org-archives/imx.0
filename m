Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1E27BF9D
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741103389; cv=none; b=RJ3Q3DqJJvhwWt5Gzf9l8YWK8hZvmkRJSZHhexv+AJuDgqtUH8LAbZsSFZ/xFvnUrYby3mIvpVxdxZX1mpL5KUFR5+DqItQ8CQ0BB9D2UnujjeGiNlNQCdiHLZC69UPhY48VJqPcJJzD1vdfCUiWzTfJks9VhmIYpkzPlTAJy9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741103389; c=relaxed/simple;
	bh=KpOBBY6WRXLagv8RIY0lnTlBIQOQa93BHXs62YUgAlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwBhhkm+1W0Jt+d7KuX4LWYJJVECK5cuucPp7/4u9+WGT5+PDpcTzQkBgRMwnFCgjjdLugxocnzgYJAxF7H0OMHUFkH/OeJQPM4IltMZ4k6RYGOpWsPswQ2fJkGrjZWL1eLw2hQiukA65omUDoi/AV3BM76UFcsL+T8xP6MFB4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=NZaaRfC7; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jDSKMzdK reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="NZaaRfC7";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jDSKMzdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741103386; x=1772639386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RxjLY+dO2+M6dAPP4O5C2TYlQAkIEGVFn+LqzUU56xk=;
  b=NZaaRfC7kBtwYe+hWrfmFZ8fGnOeDRwW8PRX8WGdQYXbLlKtusL1wvZy
   WSEdA1vZiA+lMoSCqN7Nbr0fv3ulIegmcXnqoM4mJRmYVP5XgIzNGHOST
   QnIWKGW1iTGs+LB8UHDgLlsEb61F30UQ53KL0+9mrZdoEeZlzCLsXYYQp
   RwpR9zytfT18Kqn6gyMjO4Mb1MOIiGf2pIiDvbmv7afG5U051OWqEGo1c
   gA9P9yz5AUrUE+087Jwows7M23bvItKYUDfZRots8M3PYn+S6YsdOYjcx
   x3b3mUQ5FHNyJwygddGq3z9BPIBsNFjlgXTq1upfqW3TvMI77gQ0agmcD
   w==;
X-CSE-ConnectionGUID: srgkOrVoSMGCzSHkE6t96A==
X-CSE-MsgGUID: VITbaLT5S6KiMjEaQghCIg==
X-IronPort-AV: E=Sophos;i="6.14,220,1736809200"; 
   d="scan'208";a="42272731"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Mar 2025 16:49:44 +0100
X-CheckPoint: {67C72118-1B-B1D34AC3-DEA5B19F}
X-MAIL-CPID: E0D2B10078B4CA83A8D18B3CD17988BB_4
X-Control-Analysis: str=0001.0A00636B.67C72119.00E4,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6641016190F;
	Tue,  4 Mar 2025 16:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741103380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxjLY+dO2+M6dAPP4O5C2TYlQAkIEGVFn+LqzUU56xk=;
	b=jDSKMzdKu3rSdQ/LMNCBayk1t2v+VAGcA84zQfLZTsPYgCv+uM4h2jjqV1CHbwe7nS8b26
	kHic7Upuv68wa80OQKIcbUzoL0ErVV2yLyqaZWWTL53rbUP9hlhwWBmY/5HmMiABrdD9pG
	E2qb6RydzNlSYreRljFVZuvIR2osQ1fCo+xtOnW6qlLRAK/iqQtOb+rKnL6eudhTlWsfpd
	FsmfhLZURQJFvoopeZXjKGU0vXKWU4fMsvCVTssJ5YMhMNSM/z5+Lq0DMASoPr8ul9bRj8
	VKxr1Qcu9OeFmbO+knq3/8+7VoGqcY81LtAnkEI2mmj/XGzj5v0JLS+w6n4IIA==
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
Subject: [PATCH v3 1/6] clk: imx: clk-fracn-gppll: Add 477.4MHz config for video pll
Date: Tue,  4 Mar 2025 16:49:20 +0100
Message-ID: <20250304154929.1785200-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
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


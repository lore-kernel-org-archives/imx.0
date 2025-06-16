Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4D61A3142
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 01:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036306; cv=none; b=V7DFlhX5uyvkCe5QxMVaNxL/C1a+WPT0IxpmZLXEq8tY9VOYU874GlPc2QTyplCLbA1DxJbvv5Dls8wWONyiOYzB+Y0skMKYRv4l1vwajCB9AOnsubD/uhM+5HC5Uq+c8LCMGbfiaG/LMlEYJ7/w3DPTYdihiDTGTCUKiGn6pog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036306; c=relaxed/simple;
	bh=seaDCRt9MNCpR1O3rvdMcCihgHrzEDigpNfhP6z5VK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/iEYC1OXEV8lQIcX/fcHmTqZ9NIXw765ZygpkoRogyug9J/1gjsujbKLMTl7SREvNRqEY1noBEfLt356oLy2NxXVNSFzo340D6IPyRA810eUwKEOu4S6hrqcYwIPkVOdJffDW3pG9iSpthIp6tj2/AG+AUJ2hz0UHpc3QqVntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uCyuwNxb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uCyuwNxb"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C7F916B8;
	Mon, 16 Jun 2025 03:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750036285;
	bh=seaDCRt9MNCpR1O3rvdMcCihgHrzEDigpNfhP6z5VK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uCyuwNxbXY3h7hCZ6ZUij07c9Yvyt0YBjqez9sMbd6fTCkmSnduh8vvqJapAVSMW8
	 F1bpzBhnFSEwMXYq5h/fHv9dTLKPjMz9QO4PVc/9hDrSliOpqxmwJ615wJ1W6tHk6B
	 5M9pRpVWQ4tDyrdC8Zf68y/wlAtVxlVan8fwnMfM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 4/6] media: rkisp1: Acquire pclk clock on i.MX8MP
Date: Mon, 16 Jun 2025 04:11:13 +0300
Message-ID: <20250616011115.19515-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP instances in the NXP i.MX8MP need the input pixel clock to be
enabled in order to access the HDR stitching registers. The clock should
ideally be mandatory, but that would break backward compatibility with
old DT. Try to acquire it as an optional clock instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 0788b7a64ae9..fb4ccf497bad 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -584,6 +584,24 @@ static int rkisp1_init_clocks(struct rkisp1_device *rkisp1)
 		return ret;
 
 	rkisp1->clk_size = info->num_clocks;
+
+	/*
+	 * On i.MX8MP the pclk clock is needed to access the HDR stitching
+	 * registers, but wasn't required by DT bindings. Try to acquire it as
+	 * an optional clock to avoid breaking backward compatibility.
+	 */
+	if (info->isp_ver == RKISP1_V_IMX8MP) {
+		struct clk *clk;
+
+		clk = devm_clk_get_optional(rkisp1->dev, "pclk");
+		if (IS_ERR(clk))
+			return dev_err_probe(rkisp1->dev, PTR_ERR(clk),
+					     "Failed to acquire pclk clock\n");
+
+		if (clk)
+			rkisp1->clks[rkisp1->clk_size++].clk = clk;
+	}
+
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart


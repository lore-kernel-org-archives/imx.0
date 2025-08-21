Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC719C54F
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 00:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735023; cv=none; b=NtXw9RtKMSJky4TYdK6Kv6vGPNpy9HH8qccpEFa4ki1uqlOCWLpIS15qqdg6seR07gN64xYI5ZoU1uPkyhoAm/1YjX2kRKOZDs/+DlIkMXKdXm/poHIW4auHB+5GIevD7aDfHNMDnOmHJWlmDmPReYRshysQ8D0fEWSr6WI1LIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735023; c=relaxed/simple;
	bh=5GTnZ8GI/LCO2lbazWCZNo9OqvmOaKGvaG7HiKlN76U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYPOvdCT4oY1HB3V93XCnWAwkZy4hjuR/AkbjYx3NXtIkMgG+M4J8nPOZ43uK/J/A3v/IyJU7eTj26BhveE9TTt/5+PiIUTHWJRmD4LXzqVqBywm1kLfXIQVpGCzGz6sredCW5SNo6Yo1iWWhu1A3z3Zey9PMcZPU+b5ii6/Pqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q6d5eRac; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q6d5eRac"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9545E19E7;
	Thu, 21 Aug 2025 02:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734960;
	bh=5GTnZ8GI/LCO2lbazWCZNo9OqvmOaKGvaG7HiKlN76U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q6d5eRacel1tQtTHP9O+Jlwps3O6hOQTQTM9RjhrVqLkR4h0uH6QLoz214xTS4XJl
	 pY5tHB1mU81/9qgiX8+D2NIyQvqYN7cpd2eKd7MWPxbQ5JqYKxyhp8JYrovL4ZD1Kd
	 CoyaoeEFaI5lDDZDMV8F3PSP5WcD0nK4zOLKhaco=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/12] media: imx-mipi-csis: Log per-lane start of transmission errors
Date: Thu, 21 Aug 2025 03:09:39 +0300
Message-ID: <20250821000944.27849-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSIS has per-line start of transmission error interrupts. Log them
all, instead of only the first data lane.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 35c8d5309424..67da8326540b 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -100,7 +100,7 @@
 #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
 #define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
 #define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
-#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
+#define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
 #define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
@@ -241,7 +241,10 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),	"SOT 0 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),	"SOT 1 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),	"SOT 2 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),	"SOT 3 Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
-- 
Regards,

Laurent Pinchart


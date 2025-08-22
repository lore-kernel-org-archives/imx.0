Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B33170826
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 00:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822494; cv=none; b=NrQE/GIgA6OWhcSEj5PuSVHi6TMCSqd5Z9zEn/nH/6Nhu5jfbFu13t4VQbwxjiZhpTOKEHOvCDBpcRUw4AlCV+5ATIEWdrFgxbhon/+dyRhF3grIAXHt2E2CtpKJ8tKWdylwwcyEAWJUe5tYW7B2e1er43nhm2iklO2tkh1SJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822494; c=relaxed/simple;
	bh=VRTtx5007Mrf2c/UANrM//Z4d9wC/+So/3DGJzjRBKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdZcQ3POlCtsZuo0FjuVVAmlbuxG9QTuDHlI2Qd5rx3F8TjJBJZZMzvMf6K23gaxCQLOxEmG3R3NWSeY6g74lZ7aJfRJUkrSofl9hKGFBDctgVkTSLfHfgYZo7b7X+GlEKua2PNHNFR6DEWNQ60RvPDMiFjr+72GBH3J9lx0SMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dMogZGY/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dMogZGY/"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 203891F17;
	Fri, 22 Aug 2025 02:27:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822431;
	bh=VRTtx5007Mrf2c/UANrM//Z4d9wC/+So/3DGJzjRBKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dMogZGY/nZUOaEsCRcqbzClbt8PkYZKH3PJ9WyTUDPolbwpr59ihsqHXRfmi6px3p
	 GQp5oeySG/5RViiRA7s7fqVW0GOm3q+AD0G2RHih+L2z/KhZ51P0l1eWgSK3+tC11t
	 gfXTl9LVG5H8oLoA1Ciu0K8+nnIH+kgUk8NGgP7E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 08/13] media: imx-mipi-csis: Log per-lane start of transmission errors
Date: Fri, 22 Aug 2025 03:27:28 +0300
Message-ID: <20250822002734.23516-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 346599b7a517..77f1bf05b520 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -99,7 +99,7 @@
 #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
 #define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
 #define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
-#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
+#define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
 #define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
@@ -240,7 +240,10 @@ struct mipi_csis_event {
 
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


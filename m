Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DE7407576
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157308; cv=none; b=dBBACdTSD03+Kfy7ztp7FeBrxMmxu4jQL7h9tqCtBNfwnJXfuM10P2ihEgyVXx9joFbvsL9Z9hCgneesTW3HPXLOBonlsCCmKZuIRj8U8ER6qgQdCwMzulvHxcqgOhoPKKP6M4liElXEQgJlhMhJhaaq3iEw84gnB56QtFmgKlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157308; c=relaxed/simple;
	bh=UZnOInwEGoVgpNBqq3Tztf3mf2B9K8wVmmfkFh/0KSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhQHwJmJ2/GTwu8ptXBOVWMnlLIwdn0ixXhSUBqxtTs2jc4aP4XaqwRqT104ZQgocOIAWpneO/Jp4ILi13ku7dXJCH9DcQwR14Il+S94QFhK1D4FfrWENf876t3/uZ1JFObKBueVlZMGhKvdb9H4jEm9ZNRKmFnBArANF1b8RH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=JU2gCUAy; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="JU2gCUAy"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXqjLQdB/CoMuRR1aOwLEfFv4t1NiYQCsuxpxSLoiQc=;
	b=JU2gCUAyZLswPkZjz3z6MojL4NXqMm2iSbAanFi6YhGdJXc99QB2SkJIT0odHpw34phy6j
	cI/gLUHmdCDp5aS4VvbNCrGnaC5X32GQc8NC1o6L3eRV+mrSsf9FSSVR3Tj8sKbfUVcTFx
	IHTGxu33yJHPUj7Z39Xqb3hQrubkRZAqxqDVcb41f6HomaTV2p+2guWMwBudyvbFrTZY+F
	y1IawElwjDCFOjAiZioJdU0AYtVstA/PVzP5iTjKKMaw7EmCaBzevySjjv+ooCLZAeIWoK
	BUp7AtPxYUwoIHw1Kqtb+VXMHevd0xN67TFaJG+wgyw5GfiBvd9JoO5pu2Yy4A==
Date: Mon, 27 Jul 2026 15:00:45 +0200
Subject: [PATCH v4 02/11] firmware: imx: ele: Fix indentation in
 ele_base_msg.h
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-2-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=DGqUdZlhyphs8hR0tjgBUY5tl6ldZ12TestuLL1xzXU=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bJVn/JfNyV+msTx7fPDk3+w/L99MkTy2eXbPItXbj
 NXyPYL6HaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABMxUGf4X+ufNVMyIHbeq+13
 eKZP6Js6y+rIrszwPwmyXK9qSo2z6xj+yhRkrXzuM3fRhbhz9bxGL5eX2v9P9Y/x2ylstcaT83c
 GLwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The file uses mixed indentation characters. Use tabs everywhere.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index 475074580dd7..5c128bf56e88 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -28,19 +28,19 @@
 #define ELE_GEN_KEY_BLOB_REQ		0xaf
 #define ELE_GET_FW_STATUS_REQ		0xc5
 #define ELE_XIP_DECRYPT_REQ		0xc6
-#define ELE_WRITE_FUSE                  0xd6
-#define ELE_DEV_ATTEST_REQ              0xdb
-#define ELE_WRITE_SHADOW_FUSE_REQ       0xf2
-#define ELE_READ_SHADOW_FUSE_REQ        0xf3
+#define ELE_WRITE_FUSE			0xd6
+#define ELE_DEV_ATTEST_REQ		0xdb
+#define ELE_WRITE_SHADOW_FUSE_REQ	0xf2
+#define ELE_READ_SHADOW_FUSE_REQ	0xf3
 
 #define ELE_GET_INFO_REQ		0xda
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
 
-#define MAX_UID_SIZE                     (16)
-#define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
-#define DEV_GETINFO_FW_SHA_SZ            (32)
-#define DEV_GETINFO_OEM_SRKH_SZ          (64)
+#define MAX_UID_SIZE			(16)
+#define DEV_GETINFO_ROM_PATCH_SHA_SZ	(32)
+#define DEV_GETINFO_FW_SHA_SZ		(32)
+#define DEV_GETINFO_OEM_SRKH_SZ		(64)
 #define DEV_GETINFO_MIN_VER_MASK	0xff
 #define DEV_GETINFO_MAJ_VER_MASK	0xff00
 #define ELE_DEV_INFO_EXTRA_SZ		0x60

-- 
2.55.0


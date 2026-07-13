Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A39342524
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955091; cv=none; b=oCW8KfuzDAmwniR4RTJsE1ALtDHCAn6TVPATBHrasVx3+lOO00RNCIv3PeK9o/o2pYJTMx7lwkg5gEaxPNbNHampBy7sBLZf+AWEJTd1CW667PACnhiGSpJc9MeFBby8er+VmGLYt2ni9/WvxrZ28nMMXMtrvRDa4g58UusPlnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955091; c=relaxed/simple;
	bh=jiQwK8y1yhLUjo4j7t5N6iCSymryvu3If63SnojuyR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WB8mPuHAZaf96HMqz5owm+B15BgQeKarqrSNfluxJR9RaaBARwprEoWrcb2r4pcNwVXPIaLU4ZgsBMCU1/Ye5bCK7QIIV/VyMG1IcNjMwQr9OceLuLu9eYjGQ2xhhnTrUQLuBsZEJ2OoqJhbQcFwVTj7hUkyAbLa5HTt5ZpmUYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=q/sqPrGE; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="q/sqPrGE"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3WRQgH3u5bb1sg/UIkuyiCQpHZzLzXfUoy8toBIe7A=;
	b=q/sqPrGE22EwiScsb94tifwGXslrOiY09SzqQ+/yTlNlvHB7Y/7sxpxgzeuYRBMAd7GKFb
	jjykGZetSHE80D7azgr+BNR+Q+Jy0d3K7qUeEVv3luDEFpU7BbBvkg9T6Wrts4U3Kwf3/7
	ocXBlpKvShIbEwgVifflaYGp7LiEP7iDbUCH7KxZVKoZ99skQLt2A2NoH5aNgXTQ6oEhd2
	JhQabnGoE7O+pa8dX30Qq26Bg9t7+eV4nZmpJqKWsqYh+tzGTdo1e8Qt1N7khhJ6ORKBRi
	Ng5eePFw9cP+Nn8RnA3oYfysdCHV7gNpxN/rBg5rHijU4+riWuIDsU8BAmmoRg==
Date: Mon, 13 Jul 2026 16:53:38 +0200
Subject: [PATCH v2 02/10] firmware: imx: ele: Fix indentation in
 ele_base_msg.h
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-2-b8266d93514b@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=64Z8RnfUiT82ClmtKrj06sc+zV8FVPoGFC47Pu8B+Ek=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT2DjPaXQXRdvHrCKFHi4OkKR111mx98EqVPdAiJHp
 JqDKiQ6SlkYxLgYZMUUWaT4LV7bmsX6yB+rjoKZw8oEMoSBi1MAJhLdy/DfW2Bt+KuMIH5dbTGn
 KVce5f7zvVxunV388XbA1HOrxM/9Z/hfcHHH8+MHGffGvnspHi4Yv1/8iZfY7duMR9+HCU7Z/86
 dHwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The file uses mixed indentation characters. Use tabs everywhere.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index 75e65e279193..1c5d6791b323 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -27,19 +27,19 @@
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


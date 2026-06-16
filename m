Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D343C063
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610842; cv=none; b=tWYMUtxPmzO9IhmmDv9j+cdYZ50bNPTZ4c1tfuYdbfN7AfB4cKRZ8wxxMr3nmbSikzh1j47kmCYIbsZkiQQs390nSaFbT9CvZdrGXXZVX2BxKmOICrogw9pBoheGnzAR0ranxmKm/t6tKNEy87MjryTCJgzxT4Ct2G85Q3iy1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610842; c=relaxed/simple;
	bh=jqkPdWeQfFtaagx/2jGcVuuF0/sZMe0PHDnaqZc4tXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgrhiaLovqzgBq9RWJSSAjEUtyWAs6sR4raaEhgGlaCtu9NrZvaT76Tfpi45VvQ2cEKYTzmoEvCrxWAoMZqJd4aAKnkAbKrxpsMThmT5Ue0D36HePCjKJk+Neb64wgR3ABo2tnEM4Shh5D8iddR6c5wNwTL+LKAi5APpaBWirVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Qxyzka9Z; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Qxyzka9Z"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNVJXmnbo2ErI8XUBjroeAaAGQ/OI0+FqeSb9lvbJmo=;
	b=Qxyzka9Z2/BfResNZYKxeAS+6gSafg+yztGnXQMcHZo9Dr6y0qa9ci+UVp/FK/QcoZ2UYI
	c4u+n/DEcnVFu+P/UytMaYIdU78CxlcI9A+dbnoL1cxpQYxxCUqyrxddTvTLtwpe3kBHUK
	RgZWBkpfg+XJLq/SCe44g9Xgqi6lzb8fTI6+QVNtMx+yzrAan8UepJV8FeCkLF+8dt2U1g
	MsfxFvNjVvBIjrF7MGIpR2+7VhS22IVFOK6hfc8IkvoLakNiqZTHhoOQMZYJcpFryOpRzM
	LYvxPB9EIAybY1c2oUj8IjdvNo3KtAqyCU8NjjixSd5oLLbIT2175aFxysrd4w==
Date: Tue, 16 Jun 2026 13:52:17 +0200
Subject: [PATCH 2/9] firmware: imx: ele: Fix indentation in ele_base_msg.h
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-2-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=9BlIi1Wa2vPpEtoll5ZFZen/fKfIAcvcQG9oPp3xYGQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQMnSl9XSvuvQF+jypDx44fXb3E6xwrjS8mSqq8Un8d
 OeuprMdpSwMYlwMsmKKLFL8Fq9tzWJ95I9VR8HMYWUCGcLAxSkAEznZyMhw/2I5e9annUfSq4vM
 zCztzzCl3A9hepe3QHjNd/9ZMk0nGP4KSSdW32C7GmpmxSp38NZZtr0/W1/uUy5nN9x+/2SyoBM
 vAA==
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
2.54.0


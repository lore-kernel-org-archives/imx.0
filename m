Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9670140A945
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157315; cv=none; b=Q6rc47Wjqm5+TSBBTpysVYJ5jynPcf00qn06iDawAbaHKPms7dOHYnYlGBYc1sBbUCCV8N+cOkKZX8kERKaiTndZanS/iCWStUFYUTd3+dhk4ZYiVjEhye1vdNA3oQEW2+K6rD1Wrz98tV/9Qipcms63QPnIgpOTgoIdfgSElks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157315; c=relaxed/simple;
	bh=eU4lJ7dt54jgfXxvZDW1EFD+rf0Duqc1raLGPRpjid0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sREYUBuqZp7ZgRNUPtSuOIkzfm1jMLvpgIFPxoPK83rhZ9tswz3lwiut4/B053EKT13SRO0euPqlAyd7RGUr27wXMdZxt8t48rbI+onAr3f8dY2VRAfrUMGXR/9AahXvl9Df+ZZkTgXj8eZpXbqev0E+VohR3oMTdBNGJXCgOH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=lC33PrlZ; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="lC33PrlZ"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPGToe2khYkTL3Svcz6zEupnmAPpNugGEfUWxXk3tYs=;
	b=lC33PrlZ9DSLmy8NFGvXbxau9Y3wV4c73T4Fe8SzokmDuGnYSyUGA280AIeRF+ruaiCsnS
	w9GN25H+sJnc7hDjLMdw9CQdhalxynqG7fX6Sk3PjIQ/alIqDDFFJWzjYMceK/vVKoSmHj
	8cbIFx5SQo8C9c0NL77FI4IKNhW3HA+2K4i9ZqX8dK32UICLOLjqpxgAsawx5Pm242JEwN
	c7fu5wjzv2NwhRXQ7FKtgwFiEsrq4Ls0MRdxhIRptlui/Fy1Q+Kz656QkwcZxLs3erLt1K
	UUknJqevQ8Y9761laxzTXMd8fsSbyNhdb1bWs+Qm3zS445cMpSdkELTVqfx+ag==
Date: Mon, 27 Jul 2026 15:00:51 +0200
Subject: [PATCH v4 08/11] nvmem: imx-ocotp-ele: Remove the FUSE_ELE type
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-8-1a515de33093@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=VRuZKYzM4losAy2+ktkxwJxH6FIIrGyA4qs+o0vPijk=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bHW//mynqLclj24s2jvV12Czo9PjBZ4nNnBxnFnuf
 /ZCA/vejlIWBjEuBlkxRRYpfovXtmaxPvLHqqNg5rAygQxh4OIUgIl8smJkWNuw+E7GhAWZ/9/+
 NOW6+nhG9H+2xNoZYuZhuiz3uSI3JTH84Yh/Y/Yg1Dps+Ydqk9kzT6+fru9vfkiC315zs2rhG9k
 pXAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

There is no use in tracking the fuses that are only accessible via
ELE API and the current lists are incomplete. If the ELE API is
available it will be used as primary access method anyway, otherwise
the fuses not listed as accessible through the FSB can be considered
invalid.

No functional changes intended.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 23e91775be5d..f691ad0cd1a1 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -19,8 +19,7 @@
 
 enum fuse_type {
 	FUSE_FSB = BIT(0),
-	FUSE_ELE = BIT(1),
-	FUSE_ECC = BIT(2),
+	FUSE_ECC = BIT(1),
 	FUSE_INVALID = -1
 };
 
@@ -209,7 +208,7 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 		}
 
 		type = imx_ocotp_fuse_type(context, i);
-		if (type == FUSE_INVALID || type == FUSE_ELE) {
+		if (type == FUSE_INVALID) {
 			*buf++ = 0;
 			continue;
 		}
@@ -352,13 +351,9 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
 static const struct ocotp_devtype_data imx93_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 2048,
-	.num_entry = 6,
+	.num_entry = 2,
 	.entry = {
 		{ 0, 52, FUSE_FSB },
-		{ 63, 1, FUSE_ELE},
-		{ 128, 16, FUSE_ELE },
-		{ 182, 1, FUSE_ELE },
-		{ 188, 1, FUSE_ELE },
 		{ 312, 200, FUSE_FSB }
 	},
 	.keepout = imx93_ocotp_keepout,
@@ -368,7 +363,7 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 static const struct ocotp_devtype_data imx94_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 3296, /* 103 Banks */
-	.num_entry = 10,
+	.num_entry = 9,
 	.entry = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
@@ -376,7 +371,6 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 		{ 12, 24, FUSE_FSB },
 		{ 36, 2, FUSE_FSB  | FUSE_ECC },
 		{ 38, 14, FUSE_FSB },
-		{ 59, 1, FUSE_ELE },
 		{ 525, 2, FUSE_FSB | FUSE_ECC },
 		{ 528, 7, FUSE_FSB },
 		{ 536, 280, FUSE_FSB },
@@ -386,7 +380,7 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 static const struct ocotp_devtype_data imx95_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 2048,
-	.num_entry = 12,
+	.num_entry = 9,
 	.entry = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
@@ -394,9 +388,6 @@ static const struct ocotp_devtype_data imx95_ocotp_data = {
 		{ 12, 24, FUSE_FSB },
 		{ 36, 2, FUSE_FSB  | FUSE_ECC },
 		{ 38, 14, FUSE_FSB },
-		{ 63, 1, FUSE_ELE },
-		{ 128, 16, FUSE_ELE },
-		{ 188, 1, FUSE_ELE },
 		{ 317, 2, FUSE_FSB | FUSE_ECC },
 		{ 320, 7, FUSE_FSB },
 		{ 328, 184, FUSE_FSB }

-- 
2.55.0


Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C11A43B3CF
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954529; cv=none; b=fC8+XNPcjdbnb5EamCnC7iVIbUoPi10LO9CWFjFSuAGOOXcpTep/5Wsl5w3w7G5c6JX7MdzvbziHx/WYHH0Mc2/97bunu1z/eNKn1ObGtNHNvwHAGWlTZlmRP2HyTygeutVdD9mSfc/uy8i11Wf3SPcfSXHnYNsx80vYLU2eW3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954529; c=relaxed/simple;
	bh=ezOWvH/osRE6H/cXFkg9H9smMaW9rStaT6bb3eJPa3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WuHg8XavycexDOX/cHWije8+7MwmC89K3MpaTkPglYHuMV+/3ZhUoLuaUPvKrLi7jVzY9v5JDxGRRc9kyinzD53elp2Ix2e/NaZkmDRqxkfMe1FI9q+Z7/p1CljYltaWCE5DCq3NSy/TOzXINyGpxZyTe+J5UJ4feOrTUxrkWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=IAF9RlYR; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="IAF9RlYR"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hg5tW1Rb6Nt7cG6Ff89MFT0HTZsA91xkclD1Vy8H15c=;
	b=IAF9RlYRY32TgRdGT9RUVAxp8kZ+ISAA2djU9dBRkpEcG9FaNaKr9whnLDozCgy0seIGa6
	U5yICggsp6HBXPFGYOprdnY6FEQxihmgmE9Ti4KsqJpdc29NKTlePtZtUNfRzKACXWgKQ5
	M5GyPCZ6N2Q1JWDxYf1zcQRyAzSfLczT97j8wdS1RLQTkLZvfa31oD65V5nC0LofckDhHZ
	x2qLdC4AB5s5n6Y2oUzy3v8I4DV0re7fnhIoyBsrZ4toumES5fUP+EFGhg0uAPPPUuFNFo
	QvejdVnIiPIpu8ilBuKBmCvATk7MIubpoeXZGX6jZ2j7ODtkKIs5G3/cLTayGg==
Date: Mon, 13 Jul 2026 16:53:44 +0200
Subject: [PATCH v2 08/10] nvmem: imx-ocotp-ele: Remove the FUSE_ELE type
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-8-b8266d93514b@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=CqKbLWJEprAuY0A/3w0FIvWFGg+83f0jb6ih5HsLxAE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkTxCb6Ecx23P9bN8iv/GeaXfd3LRl4au9x4pMfkdJn
 dnI8+51RykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwESYPzEynLpcPIm37Jje82n8
 3BYJGe8vnVrXGmZg/O7I+9MOQRJrjzIy3LvEOKm3duX/KWKmKyd9X+ht4fumNF1noe+/228nuh4
 7zgMA
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
index 6ac7d588c4bd..f07565c0a02d 100644
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
 
@@ -215,7 +214,7 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 		}
 
 		type = imx_ocotp_fuse_type(context, i);
-		if (type == FUSE_INVALID || type == FUSE_ELE) {
+		if (type == FUSE_INVALID) {
 			*buf++ = 0;
 			continue;
 		}
@@ -365,13 +364,9 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
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
@@ -381,7 +376,7 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 static const struct ocotp_devtype_data imx94_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 3296, /* 103 Banks */
-	.num_entry = 10,
+	.num_entry = 9,
 	.entry = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
@@ -389,7 +384,6 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 		{ 12, 24, FUSE_FSB },
 		{ 36, 2, FUSE_FSB  | FUSE_ECC },
 		{ 38, 14, FUSE_FSB },
-		{ 59, 1, FUSE_ELE },
 		{ 525, 2, FUSE_FSB | FUSE_ECC },
 		{ 528, 7, FUSE_FSB },
 		{ 536, 280, FUSE_FSB },
@@ -399,7 +393,7 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 static const struct ocotp_devtype_data imx95_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 2048,
-	.num_entry = 12,
+	.num_entry = 9,
 	.entry = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
@@ -407,9 +401,6 @@ static const struct ocotp_devtype_data imx95_ocotp_data = {
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


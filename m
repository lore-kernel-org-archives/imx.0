Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBCB43E4A3
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610846; cv=none; b=As25Ag6GJ8600gSklZ+Un2XWF2EIDSfyMNyBjzyJHNdmzjoHNI1qtH2VfsxvVSj5Fpnheda4eR1x5mxlXtz40WFkoSkYY9rHAbvvAvz4GVxM2jfIZFpS5Qo3dAKefatPd8aMMqznV48kYf7YSY5QFs0/Frrm8GN1y+ZUZIQOJ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610846; c=relaxed/simple;
	bh=eA+WsGNq3+SD/MoB/RnFarEUy7TH9TdWiVb7VTOqQz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceSxI5rvpPO0nYsAd8nFNRKMoouMt4zXByYYIZwsoTyDXaAu7CeCzWEOceM/MutG8bnOrvlRqcki9WXL6tIp5IwjZLIkS42RJJkwyWnecYW0REUiYQasrWTohfjINfUj6H6KrKg8MH4quxpqly//8SGDe4bpw3X6Oe1b03U5TSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=OD0/Tv7B; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="OD0/Tv7B"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lz3BFOgimGh+U4Fzs9XXQPItFZyIG75AeiRmFd9/Mks=;
	b=OD0/Tv7Bn4cgGri0JEQ2ctPF+uYpwsMgEDdZ3vjFQihqlZLu0/gAqxTWJpqV2r43TGxMjV
	XsIHwXJaeA/zgCawEEp7XbIzEfyY4rul5N6A6W9obBh98xztp3MLn/gb2fXKtOl2t0sV5j
	HYytXfrUF2MPp6Ku31LRmyPLUROhbxfL0WuGY9CSPWTxv5cpTIcSdIQRt400h773GCoZAH
	+5NzzCYX2aQUxX8zAiD7lHTdEENYP5ifDhK2PxrPxEU9fSmyZzS5UG/m6n0AIVnlMwDzpY
	6TyjsmXayXl36Cy/Q+DgpAQar4jeAjgJu1kMo5UMoqT0CCRr3BlEkoW3JzdphQ==
Date: Tue, 16 Jun 2026 13:52:23 +0200
Subject: [PATCH 8/9] nvmem: imx-ocotp-ele: Rename FSB access map
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-8-cb7f3698c3e6@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2462;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=Wd5eCJlsF1JPDy+pYFEyJ8yPtL/vqi1kQOk1CZFzDNw=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQMpRd+tB94eM3J+9r2ft00t1Xq9Sb1XmcZFzWv4n/M
 f80w8PejlIWBjEuBlkxRRYpfovXtmaxPvLHqqNg5rAygQxh4OIUgIl0+zH8M6+ettJp8qx4kftG
 TXY6F2dKFmlqr7z4yuX9ol6BzoWJbgx/JdYFc1q91Sxmeetn5r7hjVDHlan3CoIKPXiyhbkDfug
 zAQA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The table is used to declare which fuse registers are accessible
through the FSB block. Name it accordingly to make this clearer for
the reader.

No functional changes intended.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 3d6fad149ed5..766b0d746f6c 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -32,11 +32,11 @@ struct ocotp_devtype_data {
 	u32 reg_off;
 	char *name;
 	u32 size;
-	u32 num_entry;
+	u32 num_fsb_map;
 	u32 flag;
 	const struct nvmem_keepout *keepout;
 	unsigned int nkeepout;
-	struct ocotp_map_entry entry[];
+	struct ocotp_map_entry fsb_map[];
 };
 
 struct imx_ocotp_priv {
@@ -56,12 +56,12 @@ static enum fuse_type imx_ocotp_fuse_type(void *context, u32 index)
 	u32 start, end;
 	int i;
 
-	for (i = 0; i < data->num_entry; i++) {
-		start = data->entry[i].start;
-		end = data->entry[i].start + data->entry[i].num;
+	for (i = 0; i < data->num_fsb_map; i++) {
+		start = data->fsb_map[i].start;
+		end = data->fsb_map[i].start + data->fsb_map[i].num;
 
 		if (index >= start && index < end)
-			return data->entry[i].type;
+			return data->fsb_map[i].type;
 	}
 
 	return FUSE_INVALID;
@@ -263,8 +263,8 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
 static const struct ocotp_devtype_data imx93_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 2048,
-	.num_entry = 2,
-	.entry = {
+	.num_fsb_map = 2,
+	.fsb_map = {
 		{ 0, 52, FUSE_FSB },
 		{ 312, 200, FUSE_FSB }
 	},
@@ -275,8 +275,8 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 static const struct ocotp_devtype_data imx94_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 3296, /* 103 Banks */
-	.num_entry = 9,
-	.entry = {
+	.num_fsb_map = 9,
+	.fsb_map = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
 		{ 9, 3, FUSE_FSB | FUSE_ECC },
@@ -292,8 +292,8 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 static const struct ocotp_devtype_data imx95_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 2048,
-	.num_entry = 9,
-	.entry = {
+	.num_fsb_map = 9,
+	.fsb_map = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
 		{ 9, 3, FUSE_FSB | FUSE_ECC },

-- 
2.54.0


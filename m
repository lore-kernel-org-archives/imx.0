Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1CC3FB077
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157315; cv=none; b=RafOUBbp5Anqm+h+drJos5C+YX3wrg3Pi1Zs77AKb4oz1T7DOMdpvr5gpzCLH/1lJUNK/X0MfqEhciJNuQ3VI7iANZ1oZ35DDzEkWU1d8mix8p4FZgS2wI4jDjMXzXPtaK5nsQ9ofgS844Mn76c0Dn1WwsTprq7ErbQFxlUj7AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157315; c=relaxed/simple;
	bh=0U6JS7tc5xanrGl32x2plbULO3/0fvjg8vVQRMF5T8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fz3OA7Woqry7sqzaawZjlRYFlzteaChvW2IyP/n0UIhy01d15xa7y9XxuEjgn8Ci0X+r4Z3wiWprxGFecb2Tz06j7GUKdLs9gqpyNbTdH8jl7Coj4Eq+qtjM+bqPZ+7SrcLy6DRi+rmha+DwKhKfi+JIaS2N40fD64N/UYqLy+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=GgvkYbho; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="GgvkYbho"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8ppdLZtCLjVPI4RaDBrwUdqdDgKZtV4FSC053+OAWk=;
	b=GgvkYbhoynX40X3V5FWSJbaotvFm11sraO+19uP0hsyP4gkZr+CMeDuKZ5DR6ufpzSG9K6
	YJFowLVvSAnd05BK7BnnfZyMJ6wzXxtAB4HNlqgk2tIOvW3e8hhb70/zGl2pfbzpNiL7ja
	29KYyDC6/9ier4b+y9c9URGW8+F+v2ssDLuQuZYF8JcS3zFWM7GhC3jN5hgoby80w0liaW
	FG+SHQGue68HrHYuNiFsZPpXB/MDk372AzdQ8LGW7zxy4pmVEyBVo/goQou2JfdatsrHoD
	quP4T3CdRSrjKvFyKfcQ88jwBV9U2lJGrEnG9Rcz8AbWmK7KLYSbdOjWDDwbhg==
Date: Mon, 27 Jul 2026 15:00:52 +0200
Subject: [PATCH v4 09/11] nvmem: imx-ocotp-ele: Rename FSB access map
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-9-1a515de33093@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=kt1k3M6rIt/Nylyf9emvyw7oJdH44hrhkQwxDBoUJ/8=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bLX29gsTMr868GzfGCKe+yB22tJTm9qjTB/fZny07
 cq8LRo8HaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABNJ387w363jRF77in2ZlUvt
 7rOm7ec0qDpxdevZf6Ffmnbmm1kXXGFkWFNpsq9CVdLozKxlfyx2vE65ctfs7pm5DG+lxDctXMP
 nzgwA
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
index f691ad0cd1a1..e9b579753c78 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -33,11 +33,11 @@ struct ocotp_devtype_data {
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
@@ -156,12 +156,12 @@ static enum fuse_type imx_ocotp_fuse_type(void *context, u32 index)
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
@@ -351,8 +351,8 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
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
@@ -363,8 +363,8 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
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
@@ -380,8 +380,8 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
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
2.55.0


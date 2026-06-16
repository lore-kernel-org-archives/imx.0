Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC643E492
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610845; cv=none; b=Wfx2Qyw0M5U/wBR0DsTANUu5lAD3thVJrH4PHumX5VdYO4XJyFi0kDuOYJyFGTVhha/1ywDeu5viO4DGgZeBAbdnbqCzIMqz0bvA3+ZeNusCVHrG8qjhvYUPOhHqTTjNID2JtI82m/vOSfBAVRVAeHOX1ZxfgmYMDmkc08PGu1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610845; c=relaxed/simple;
	bh=PtpjvZklBhuvClplN14aRjByyxygWIra0uaYA7NL0Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djt4YUb5hyUrNmIzrtlIBA3Cmzz/BhMwLjm0lpvkT6ud2L1D32VZ7Imz8KvPXpEr9A0MqSgRgcv/XkC8wz6np7MVWyG498W98OxryZbORCVxjo0iSpmqt9Kk0M77G0ql66YbxQtLA2mXjKAmjYH+FXOIiib/8Lq7fuh5wOpZ3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=EimosjD6; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="EimosjD6"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T66RyhO6Abrm/JiL4F0gaG4GTabEp7JP+fNBjtPHAmw=;
	b=EimosjD6QcfRvLwuq2gKhrmzgKk4pWNhaG6QDDhbiMmE3xwBe07ggU8UjlJWKWR+91jE9y
	Wzet5vJ0oPIAh3aK6zwDsfkP3Abuye0MEL7SetpK4eZYRYyWyqg6OkfQ/S2qe1eV51AOJj
	7EaMlQCh0Pc+FL+Uws4LQbYqnHmbeaoOx6j5WqQj/MJHVquq2M+SWiq5OJ7hT8+ZuAufqj
	NypclxNMpxiCqtcyv5tJ1+Sd6O6YsykL7TZ0YScAZbn17r1a3tICurFGQwnIJ6SZHhoKtg
	HLB0M2WFtG2Fpl6gcTE1wv3GTeuaHbXqt8Yn67gsuxpx0WTl1B8670Nv4qRIOQ==
Date: Tue, 16 Jun 2026 13:52:20 +0200
Subject: [PATCH 5/9] nvmem: imx-ocotp-ele: Remove device-specific
 reg_read()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-5-cb7f3698c3e6@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=qHeDROtk+pvkrSPR9Yg3D12fXZZ1XEbJj/3tSOk51NE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQMlTl0ewuH/GHMUa735lP/pBQ7XLj3WSfnN5jb/L/X
 TXLf5PeUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMBGJfQz/jM6fye7N+pJfVP7/
 8QZ2fp9FN2SSAx7PeZmcW7Of2cj0CcN/D9tjGwKivgp7lR0VVzT9ISznktb26HDtx8j+RfP0gra
 yAAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

We only have a single implementation of the read hook. There is no
need to store it in the device data.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index dadec19ca252..9d3f94e35508 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -33,7 +33,6 @@ struct ocotp_devtype_data {
 	u32 size;
 	u32 num_entry;
 	u32 flag;
-	nvmem_reg_read_t reg_read;
 	const struct nvmem_keepout *keepout;
 	unsigned int nkeepout;
 	struct ocotp_map_entry entry[];
@@ -158,7 +157,7 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.id = NVMEM_DEVID_AUTO;
 	priv->config.owner = THIS_MODULE;
 	priv->config.size = priv->data->size;
-	priv->config.reg_read = priv->data->reg_read;
+	priv->config.reg_read = imx_ocotp_reg_read;
 	priv->config.word_size = 1;
 	priv->config.stride = 1;
 	priv->config.priv = priv;
@@ -190,7 +189,6 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
 
 static const struct ocotp_devtype_data imx93_ocotp_data = {
 	.reg_off = 0x8000,
-	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
 	.num_entry = 6,
 	.entry = {
@@ -207,7 +205,6 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 
 static const struct ocotp_devtype_data imx94_ocotp_data = {
 	.reg_off = 0x8000,
-	.reg_read = imx_ocotp_reg_read,
 	.size = 3296, /* 103 Banks */
 	.num_entry = 10,
 	.entry = {
@@ -226,7 +223,6 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 
 static const struct ocotp_devtype_data imx95_ocotp_data = {
 	.reg_off = 0x8000,
-	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
 	.num_entry = 12,
 	.entry = {

-- 
2.54.0


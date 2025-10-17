Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48F034AB0D
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700120; cv=none; b=bnmqhlwQ7REHkM01ZnRDYakjvXOTzSbp9Zg7SCNjEpNfW9PY5OfpVKJOGHQ7N9Ty+aI8UkYQoVBTyKAggxtCdYzouVtk4VMsdmJdExBQj+qZOmBmFD864Q5vcry+AqK6EPQE9TYm4AwGKm/07GZWTVlu2D6mYw9sdOl9GK27ENc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700120; c=relaxed/simple;
	bh=PNvlbSmiUvii0S6TXSvE0jwb+kfCR5BIL73WNeuBgrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haloxPJuDgyyjZ25t6Xg3vmbEc6egKP/dzfof6Iy/fnK6liZ1snh05Vkk4nG29QallLeNfmsGS1CGIpIbzIeBE3znh3nZQ2HXlKYmXbizNU1f41KYVIPftILAQsrUvD6FltMPAX3Ii1rBuh8fUCOTcMw/iXoMkK/+Tvz1LSKZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfQJd30P; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfQJd30P"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b4736e043f9so289859666b.0
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700117; x=1761304917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPdqo0alu4iQYdIv2XuXRfTnuhzF5tbpLw/kkpI0JfQ=;
        b=MfQJd30P1DtKmhguFf7s/RBbLZSWzFnqjZo8taGJ35FrM2hNOhEEqARSwydzfpC4HW
         yGo2VSQ09v06fp1kN8Q1F+2yB/24KAl/7ywLOaTsw45UjcQ5lLE53pmGTQOiWWmJhBJT
         feJs4CAmpdfca4RjB3r4n+V9zYeXuld5evIv32KZI+kJcH17GDZ2iRbJXUL7fdShVPHr
         9PXpBusRKDY+7JmVxMbtZrikxckUXD5TuqbTYM0DSFb6M7BLjPp0jMOga8NCLmFMNLF2
         QP1oj8bIEId+c/+/0mTcqZZpYIEQYq4JKMns6ByCLjeMHsxTYRzkxrMPIAutspmZ75OZ
         DaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700117; x=1761304917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPdqo0alu4iQYdIv2XuXRfTnuhzF5tbpLw/kkpI0JfQ=;
        b=Aswxl1S+t7S45zXNhbrSXDy7lmOTjyCc6PADuoolEaOG8k/PRBZRxf15FcUbVimVMm
         MZtI7wFrRrFk7Qemg6ezn+fwG90xeBMztvHl33clPVS1X6fOD4kHUcxDBXTxYLbV0u4C
         ZEEdQ8iZ5KI3mZa1sicRoh+mKwxlOyYs54GtHNnCsoQYcn4CqXNCRIYj7hwCJlfIGlNA
         Vc2ii/oMKiZJLIiVttgT8ncvlW7ld0Idm29XZ6dwBR6PJ1ZunQVnSj8KGkSUOjDd9tfv
         yvgQYM8pn0SVPCE3K5WET4bqF9a//0ThA8W4M45VJ3dbsg++YlN/BIPCOAJzPmSNZxoc
         hWWA==
X-Forwarded-Encrypted: i=1; AJvYcCXqnZOv4baCEUqVc3xCbgrQva1EyycXUIO5iUjUaS/bxPEPmhJYEWsGT+ZqrOqiKObIDJo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYHFYGPvHXuP9clEX2mnrJTTSJeyiXQ7PkFMpKBXEEKTaHIiMI
	QpuPBH9Au5gwVvfitVwdhmfXq1l8K52rYQjvy8f7oeIL7iTMe0SSPfIb
X-Gm-Gg: ASbGnctiHqwckaWc86lNbNdMGclVrCwAbRcfKBD7hXV0fQIGsFImmLIhxBWwPLt7FWh
	n9NrMRYShdlEURW/z3VOsNdVBd6NHhbzqDteN8x2+OovUf4Uj7gS10BjO9iMCB2WVBwVdysRB7+
	2OBxo19Az8/KUxbqbjyEm5Ytglh5O7gtc2N6s/zwtTKW1wjCc9MsF2VYbceMwwRaO7dduLuorJl
	rcyJ0Do04noTULp0gIyICmS/TeB1kBcFxOt5HYEBRh0yt4xd2RJ+sb7tDufa+PBAP5wkTXO40g1
	oLZUGlrvbwA0mHgMg0844gbNMGgfWKpH1yj9z/a8jD7KbBJflEKHQNzW+J+NkFOpefcz9Yc6iGe
	xQQ2byLGQZbA9VBx5FfZN/mIGik3+3cQxTGXMqThYEwLlZ0ZCvtmDqhE00HFzJ96CGuHCxoEGcW
	Qi1jhWU+yvZco3EvN+9yKxdwGM3D4=
X-Google-Smtp-Source: AGHT+IHVLr79Aj1wmFsQfBf8luDTxUDCNFd8nKuGaUsCgVTKbksjEKUTdzlfSjzx9IgrO6A4BqLrMw==
X-Received: by 2002:a17:906:f1c9:b0:b64:8464:68ca with SMTP id a640c23a62f3a-b64846468e0mr277225466b.19.1760700117100;
        Fri, 17 Oct 2025 04:21:57 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:56 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 6/8] reset: imx8mp-audiomix: Extend the driver usage
Date: Fri, 17 Oct 2025 04:20:23 -0700
Message-ID: <20251017112025.11997-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
which allow users to control the assertion and de-assertion of the
reset lines tied to some peripherals present in said subsystems. Some
examples of such SoCs include i.MX8MP with AUDIOMIX block control and
i.MX8ULP with SIM LPAV.

Some of the aformentioned block control IPs exhibit a common pattern with
respect to the assertion and de-assertion of the reset lines. Namely, the
user is able to control the state of the reset line by toggling a bit from
one of the IP's registers.

Linux can take advantage of this pattern and, instead of having one driver
for each block control IP, a single, more generic driver could be used.

To allow this to happen, the previous approach, in which a single reset
map is used, is replaced by a per-driver approach, in which each auxiliary
device driver holds a reference to a certain reset map.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index c74ce6e04177..c370913107f5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -24,7 +24,12 @@ struct imx8mp_reset_map {
 	bool active_low;
 };
 
-static const struct imx8mp_reset_map reset_map[] = {
+struct imx8mp_reset_info {
+	const struct imx8mp_reset_map *map;
+	int num_lines;
+};
+
+static const struct imx8mp_reset_map imx8mp_reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask = BIT(0),
@@ -45,10 +50,16 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	void __iomem *base;
 	struct regmap *regmap;
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -60,6 +71,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
@@ -144,7 +156,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (const struct imx8mp_reset_info *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -168,6 +181,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0


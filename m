Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078B831CA6A
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127509; cv=none; b=LQdecaR4ClI/a4U2r7gsmWpk+e7mKzsU//iv//E7E0iYTA9D8HmvtR1Gi/t4PJ01BXsKOorOxVgOoH0+v2J3uU+exFlMYnMfCczj6/5Kw9MPeqUpN13M/v8zUy8JgCz6WewuDLS9VVPM7ty2S0iz8ZGYEbqQJN/k/hWkpwYDPGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127509; c=relaxed/simple;
	bh=A0S5kP4AYnuMNEvsPn5dOXTGuDZ7ZyT/JuCLEXl0ePs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dY5GUDqd8XL2+vH5uSwNVGUCUylFj9Q1E6gCbJeOjXMbMBEi+Fhw9l7Pv4HMzxEo5kIKsVSMqu+E8OkUJ1WYBv6slGq9q/RCbP0Mcp6LOEkuZd43QecyclkwXt0LFv7xLfSM15FVtKDlJeEVPmEcFVR5sL8EMURY+yYJvjTXu1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aieobKkX; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aieobKkX"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b733707e0b5so299063866b.2
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 05:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127506; x=1763732306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdYV/UUUzK+g0y1e4n+KXhL1vj4mnn1p47TPyDwiegM=;
        b=aieobKkXpl1L5hxv2yAMynVaZYrYO3DxR5tu6TkRvrjIjjkYY5X0AEpwUGMiBnzqgX
         bmxKDaL7+G3Yhg+14bM2N77HjVxS+iKlNTJ/O91BjqVpMe5xHN3UlGr5pvnkRPXIjuAd
         Oxx5aTLCwVrKU4JF0QuYr6McK7Jr5SSpSQKrBsNouQ8lDv7KhX6abw5gM7IWQS5DaDEa
         xYl15fsV3GK+33Uh/8CWd/cjuu3fbKUGrWw4aTC3BMF130Ci+VAiMFxGKnK2MH9WT6mO
         wKYu8lz8YIqUA3dYDlR4CdTIJN3ZLyaxMc7HWkVa3sIlBvbMUdopPvYo22zzK2eOb3ie
         tEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127506; x=1763732306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hdYV/UUUzK+g0y1e4n+KXhL1vj4mnn1p47TPyDwiegM=;
        b=HkrIToUX0FesPW5zyoUbpMwJrNvd2h1FtgfgzxkRZU53jQ77Q71MIcxcmVO4/kjzrK
         OOCAIOTzFWWSMk3fhfv3VpH0HDfyxdzfubK5pQM8OHGtO+Ur+3JXnFxXY4SKPdlM2gJC
         tQ/jHt5FVnrC3V+HJ/tluO/dhgvq1gGuX1gemvkeIwakEYbkShgMkKDYxcd/MABmBVfB
         6bQCx8s7Eom3SaLoS5j5OpAUd6CRV93P/GFLb1GWubFre0F/Hc+cCQlLGNligN48oVOU
         P7kLPmm9dgFoDlp/0l+CbM7Cwm3LE918v/8kYLo7dYntbOXPxpD+dMz8DYaWALfDv+f/
         tAtg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Ug3hNm5uuNV1I6MieD91gHzZTBjfl9e994Vv1pjULkyOlvaKTyb23RLyqAkmZ7uaxcQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhfBHSlCV7z3+ogOZV7ekB0IdS6xynGX9F0BucnMRj+kdXvw5K
	0w9TeudQaI5g/kqrjHsOOwNef8f4DJqF+8H/lcx7Y1x7b9W6bLQXMlQa
X-Gm-Gg: ASbGncvknrVguwiLUoK3+PK5/+48yZGKRVwxnOkHITgUSQ/pD6KAlgVIfm/Eh/fRHMf
	vxgWl9dTfLAijUA82eV66gcbicwi8JKRBD5eUgVKi/SpO8y5LBHkNhKw/7rwKGpADxWauQxOS+8
	rg8dR+zFB/KZcMvXHZMIHyVnDPmSW8+GEnELDO41B9tSjMUafZ1RiJmoftofWPpID6LRKQqka5W
	wGlF+SJLuLNiAsbMZr1J7tk7qz4MMKtmDmu982w1yGjGCU2Q1iMNbv+qDdvwzFDGgrCLUUyeIpu
	815Ly6gTgcQ7Wxv4M5DSHyrCid9qSpmJXSLnSmMsrVjesOnwr1sJ1cE+5Mk2+bioaSuD5eewh5w
	1kWtB8BNl0kGclJBzf2tgbER+pWwOguv0hOoO4WwpnvWexZmrYoz7bYQDn5I2+sWEC7Ve2MMI0O
	0x/hu24F9Z2Vwg2F71uQVO5iL0lbvNAgOJ2MirbA==
X-Google-Smtp-Source: AGHT+IG+QplD5QTjYb8S9SqW056mSz7f0h/qlDXbebG1yGANMyx/wdTBv6PJc0hq4+iNYLCBHhHJcA==
X-Received: by 2002:a17:907:86a2:b0:b73:56a7:a36e with SMTP id a640c23a62f3a-b7367949692mr311064866b.50.1763127506289;
        Fri, 14 Nov 2025 05:38:26 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:25 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v5 4/6] reset: imx8mp-audiomix: Extend the driver usage
Date: Fri, 14 Nov 2025 05:37:36 -0800
Message-ID: <20251114133738.1762-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Switch to per-device reset map to allow reusing the driver for other NXP
block control IPs.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 35df9bd5f71a..d3396f37d1ff 100644
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
 		.bit = 0,
@@ -42,9 +47,15 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -56,6 +67,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, val;
 
 	mask = BIT(reset_map[id].bit);
@@ -141,7 +153,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (void *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -164,6 +177,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0


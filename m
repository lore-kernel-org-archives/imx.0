Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89372749F9
	for <imx@lists.linux.dev>; Mon,  4 Aug 2025 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322926; cv=none; b=IPZ559+gVTLeRr3jh8ApkTfvs703FxLsehBzVDr/04zBPwxQw67ya70OH0Qp4y/uncrHKC6Q3mOCAbppPWRY0KoquVJbrXh+AJTfr918twCCrk/N3wFQMePaf/oBDBqksuVvh+T/OW9+V8EKfQACbALRGxhw1bVWCU6U/+0Q3YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322926; c=relaxed/simple;
	bh=GXAHOtGKKmzH+pgZDyuFCzmMVltVa2uZmadjU2mvBFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MypMdsw/Ez3VQCOEDzhSbg1KaRyY7yWCD0fWp+Um3NJoUPh76WPBfQatip+bCStM8cOdt6VsAabplckt+Kgs+YcHjequy/4Lj651YbUIlK/JH7CvYmvPJK4GCeqUqvTd1+QzwfUKJeoEPbBJKqwTZfwI9mm985sU3KqUghGpdSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzsiS2XL; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzsiS2XL"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae3b336e936so715710766b.3
        for <imx@lists.linux.dev>; Mon, 04 Aug 2025 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322923; x=1754927723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8PNRT/I48ie0bRNz5r0+TyoGyzFa1yYHCMX5vHGvkU=;
        b=AzsiS2XL24Yn5qF1Q6VjXJeXiLoiuqbjYF0DB4Q+3LckqvUIn3iyuYumKBKW7FSgNl
         v/1zGuDLqdxqrqDE3bQC0cCfuchJ+/44Tzah010quIxftK/meALjzewXwcR4eP0Dza1F
         A/LPwU8734Sj1Wy2HX42Ss2tNBwwYbkpejbF8Zqhz1Xb2UbODajHHlVFTUv6W6lL879W
         0biuAzNlofp8hprpJRFAighVrQLbj64HPSVa78VkBUE9UptcdgIcYyEdn1ZrENdDaUxf
         Ok8v6RSXjWDxRlQe9lcekItf1U24W7cZVNagnQOVBY8pW/vEQqVN+zIKHx71pXp8nXxo
         r5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322923; x=1754927723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8PNRT/I48ie0bRNz5r0+TyoGyzFa1yYHCMX5vHGvkU=;
        b=UIkT8L+4r+YotPwvlJZdZz/P/NZTDRNBdm083Ir98qIfvXDwm0782z7dDReZnzWJwF
         gxxzhlLvHJsTRAnPK8rtx8CxPXiUa7FJNz65B4vg263OY1dou2oUbxk/RDWn2IpTrLk6
         4lL29DgDF6cfw6GuZrD1UggyXAWDSvHCtcEhJ1mkPtenf3CcU/9vzo7H9qP+cP+fubXp
         Gv412NSISsX+Xd3P/oKRT/rUUBv1py3eBk07COaM5c/tqjJA9Y5t0jcdlyS89x0u8nLP
         mGq3TSEBhtQr4x7PjYb3NCq7xe+tDzuelaLPJq2R/QLuZgyEete0wFO29ThHQecA0D7G
         qrZg==
X-Forwarded-Encrypted: i=1; AJvYcCXA9J50LqUB7sAN4P6G48f3olO4zfG1tWFe7fjHeMnP8Mi1VTwTTfteeGGkJG2oqqGZjZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRkuZk70oxniIyzOwzPZm/b0619oAXiR573+UQ+R/6goEQLIgs
	sOv4E/SUeznlWNA0nMRq3efTOrjbdMKVhBH/a+ky/kxdiKnEs+NBYLUB
X-Gm-Gg: ASbGncuU4xhsBH9n5cs6vkgX9w3kqXHsYWc5KFbauqkiQloQ0/fzKv2NYLZ5hpnbpc2
	PO1mrOWHNGpddiROJlka56UpO+4cBUVaay49Aahy/yS7l7hhRAhEvvLPk5ujMH5dlEB7lBfnzXQ
	76U99LRzi8lmC1P5hS+XJgq9EA/Bjx+bvhdADGgIL8goqgjza0mgr+3bKLqxUG2WGG/CMzSuWZb
	XC4ythvN4JOiBUoqeFDlnglS9dXbladTw5rgMB5RX0b+loI4BQeChMNf8JLNSC92F85DK5dYqiN
	2BHXKTQW6vyYy0w+uVzTMR+mBGk2Z/HWpy1fxhZxnTb4CEv9YB1Gt5CEJQxTJ4yyjTrAdV/KiqI
	Zvx+DyIsIO/XzMme2iwuecyv4qr4nsMoGHG94e0lpt8GY/tAoEGCGpKCCC4Y=
X-Google-Smtp-Source: AGHT+IFfDvdFyuA9ALAp4YUM+ddrT5rqMT7rYruobfsQVPiAjFL8ichJg94bEOG/da/SNG5DJlXzHA==
X-Received: by 2002:a17:907:7ea5:b0:ae0:b847:435 with SMTP id a640c23a62f3a-af94024cadbmr998008866b.49.1754322922814;
        Mon, 04 Aug 2025 08:55:22 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:22 -0700 (PDT)
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
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 5/7] reset: imx8mp-audiomix: Extend the driver usage
Date: Mon,  4 Aug 2025 11:54:05 -0400
Message-Id: <20250804155407.285353-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..a3d0bd823272 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -26,7 +26,12 @@ struct imx8mp_reset_map {
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
 		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
@@ -44,10 +49,16 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	spinlock_t lock; /* protect register read-modify-write cycle */
 	void __iomem *base;
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -59,6 +70,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	void __iomem *reg_addr = priv->base;
 	unsigned int mask, offset, active_low;
 	unsigned long reg, flags;
@@ -112,7 +124,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	spin_lock_init(&priv->lock);
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (const struct imx8mp_reset_info *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -144,6 +157,7 @@ static void imx8mp_audiomix_reset_remove(struct auxiliary_device *adev)
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.34.1


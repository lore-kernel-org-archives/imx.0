Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EEA3559DB
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746173; cv=none; b=gM8/db0aKFfxMecOy57heCC/KImG4XDCiIGZha1B2KIz8Fm+YsdoSyeBV/Cc1knAtaM65YdYVEuq3WDlySFWuEepXboiDNlb58BoAfRaJRunodjRXzXSiCzdSuxxwcfZdFo0PoVIft8Jptqu4qyiraZW3ao4Q+MDZxhzuiqFz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746173; c=relaxed/simple;
	bh=v5ahFBmmoGFzUch7/2SvprVd1+ErqpD5A4vWmS2SEcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmQwql3BkTt8JMBI6Xl/VnMoApIGJ5lFmB5BqeCwaaYQWPqJlM0fNCZMwXH7K1Vg6z6gH0rX4zhvjZS3wWav/y5toKXZVY+INaYsKaihqkpJXL2ze2y90NL6Lh4qUoXNSSC195cxX7oG8wA1q2ArL1AGugmpuZpD4p/R2hsiE7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFcYqHlQ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFcYqHlQ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7042e50899so165064366b.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746170; x=1762350970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWLsbyIMgrO4Anjvx4doEaIEZAGpDh1hvTWQGxqxKac=;
        b=aFcYqHlQjtpNM0tdxU+qFC9iuz5p3jUtJrsONWvbuMhQraycF1ZXHxnN8F/aJW8kqB
         UJMiYbmimWYYehOyZu+h5rcftwCWj3i4BuIjTQkbjk8jujJEuWpLgUP7ePjdcfkQy4MC
         Za5aqFmzFIViLT5v6bt04yJwvfi1eAeek7fgoHpub6uCt6E+4RS2HYI5rZn4JBahbxM/
         13PlkU1r7+sNQSmP+NVlVvaWsCVj88YIl8WpZhA1wzYTVQgCHeqwsfx6EJs+io8b6+0J
         ZXu+3cyl2QXpVJqkRbYG3RY1fW3F8NQuoYBq5q4Fy7PU/kc3fj0HyZeICBlKqlkhtKlj
         dpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746170; x=1762350970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWLsbyIMgrO4Anjvx4doEaIEZAGpDh1hvTWQGxqxKac=;
        b=REIK/SWIZkJnGCedBCK6ZvzJIFun0lDZ0dO3Jp78tFM5YVIuhZjCHJfSrsAOCp2t8u
         N3LvXMa3u8pz7wykDEFUWxU4hy/y5SYVvXKHxcdRTC5UP4HK7kTtPCZO5bHHJ+nddQVJ
         kwnmPmD6QoQ5bQaDWWrPmWp6DgCsg3GvXNnv2w3NJwWjbOIizpXIWi8hmp6l92VRzMr9
         3qSPmDprX2qLziS/cjJAKRd+yO2WX0Ek6iN8g2GDlJUrqGs0IQ5R1nc5LFfcEpd79lmr
         a2Zn7J432EV8nz4Y8XKMcpg2DvHP8Vd+Qdq4n3jxiX4axUGztB0/PM0T405LOmuTFvnn
         kjUA==
X-Forwarded-Encrypted: i=1; AJvYcCUE6hI7G2XFaFiufnoZbg57TftTq9ZkR8Xl38aTWZUkB+43LK5xs0V/daKAnsQhzPPJmzs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw9wo4/2BBlIPa3Mi8cjP78iVCnnpnrRLIFQwPTTIxbccbcxrE
	OGG9hC5h4//h0TWYbv/G1zLjgUY2F21ed6vY9TzD1dLCN+cKstT8p1ZE
X-Gm-Gg: ASbGnctxNkNNXx/Cdf1FS1R5/sZyAEpUq6oBNEbN1O6K+uct0dSHPJd+Q6aq2dKTnIm
	FG2BNq+2yzkFQuaDaZWvB3vAUHFKGDq5L3hZD2DzaaE3c5CDVPWx255/MLb9FP6c7TxFWvQxUnZ
	mc7k2EQ5nGrVVGwcQXGpMfD25sGDEZcb07wHcVyKxrlPlPRNmAKkAATs8TOX6C9GBq/tfjNImnS
	wGr+LcT2IZr5gIrBbP9PjlYynwxch9IwoAye++PbFp9laf1ay+66bQxdf/ZGgiKgH9BuU8ETt42
	Ac/bcVTG8fmYrU1ivgEq+so9QvPvsPQKxbV4FJi/rcevRPPpzJ01VotGUNN4ZQP0kyY3l4rpvD+
	+uTVHAp5lRmS7mUDyVCM39WXhNNghcuXQC4FUMLOF3BOemeh77Eq6UIo1qFhdpYiT7Z/Nu0GW0L
	ppFsW8hsIW5prLe795thjrFA1RsQ==
X-Google-Smtp-Source: AGHT+IHsIhczBnvh9jDdmQP7dI7sF9RIy0mdsWyOBSP3lJT3RdO+FroC0QNH4bBEw0VRWYxAQ/wuNg==
X-Received: by 2002:a17:907:1c93:b0:b55:e023:5e79 with SMTP id a640c23a62f3a-b703d55cd84mr342463066b.51.1761746170153;
        Wed, 29 Oct 2025 06:56:10 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:09 -0700 (PDT)
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
Subject: [PATCH v3 4/8] reset: imx8mp-audiomix: Drop unneeded macros
Date: Wed, 29 Oct 2025 06:52:25 -0700
Message-ID: <20251029135229.890-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The macros defining the mask values for the EARC, EARC PHY resets,
and the DSP RUN_STALL signal can be dropped as they are not and will
not be used anywhere else except to set the value of the "mask" field
from "struct imx8mp_reset_map". In this particular case, based on the
name of the "mask" field, you can already deduce what these values are
for, which is why defining macros for them doesn't offer any new
information, nor does it help with the code readability.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index eceb37ff5dc5..e9643365a62c 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,11 +14,7 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
-
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
-#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
 
 struct imx8mp_reset_map {
 	unsigned int offset;
@@ -29,17 +25,17 @@ struct imx8mp_reset_map {
 static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.mask = BIT(0),
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+		.mask = BIT(1),
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
 		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
+		.mask = BIT(5),
 		.active_low = false,
 	},
 };
-- 
2.43.0


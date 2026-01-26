Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5362133A9E7
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444542; cv=none; b=pJt/3vJg++aNwb6GLMR3rveUUzV7db8OcxbXlTzweEi8hE/J9WKkt/bHTGxn/6r3NiKzR5oJsYg85DgpqrZk2gUyHh0o9iuB8FtZ4Q40pNfMoh8eAYbvRy53ImtIdKGLhndZo8R6LO0xv1K4I6noxcVUnjXZT7NnY/lVE0VE7QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444542; c=relaxed/simple;
	bh=P4KbKmbPhXi4RmHw2WF/7i/9QfzpSSQ4syTVF74JXOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MctMPOXGsQ3m7FpqCh7as6Y/aH40++Px1HeV8DDYQGV/Qm8GshJMijH7WjhYQE17Rsrq9Qq5+qVeiqwvJYnZBPS3X510AZiGieTIK3tS4Q4enkvSNI5QL1woyqI48MTgXg23r10sF1+QwABTFEY+wJ7a6qXkiHLNtimMYS0DzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgD13r5z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgD13r5z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso37297805e9.1
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444538; x=1770049338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=;
        b=DgD13r5zEipzm+rWzf0U7SWkVcw/s/3ad2JDhcUR5ytsCp9xN80b2gKp/Ik30I88Vp
         P1JT9IFwIKijZjfDAwEFFCfeMnIsMPsW3CoIcREJpz1r0pjx6qg2qp8DC0Ww9RqdMidS
         VJTfkuZRknJP5YT/BiB2NmHrCm7V41pWyF49keVGljvmt7ReAVlsA3G+hSmh5EJVqzi2
         aq4SeqboATKiyUsDodHmgY21jmgbVe/pI/7u9GduXma4vch5I3b7PVSjJcDUGNAHYCqc
         EAHJoKXEWbgbIbuLQznP6NyAoZwZwVqpAeTyt9cV3mkD/UN1XgH9ZXq9NRNwP85iv3sh
         irRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444538; x=1770049338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=;
        b=H71dAH3clhr26Vfz62wSflxG3IoQwTQ1I1H9WHbCKr0h1BTclNmKWqyQIXd0RaELTO
         H5QlgqMLbwJd9I/q0A+F24IcJvcYdQOEEqNo+nnykHmu0+gfjO5fQlP6YhOyuWA11mdA
         Or/1JUk3ewTzuNbCo/YhRo/ehEFVoAudZX65MiRNmEtv2zB4bGgfSzW1K1KMB37MUFm3
         18LdY7GCW9uYdTQESHcWikea+nBBIqxQ26/An/l6qhw/+QCgfbv/PKsNnupTNDF/CaVN
         v82KU6wrzUQE0uDyYpXFkBQAWXBvd3h6Q/0+K/cGED6c4XG37TFv40cEbWYFeP1y71AN
         ifEw==
X-Gm-Message-State: AOJu0YzikPm4CQucHseuPHbTwoamKgQWMpZFBEdjo4kmjDmwsvNxW62T
	gODhyDf/lsaZ41Ps5Evj8Rn49TRrFRdZtfjvsLxQfkQDNxyKuQbdmj/B
X-Gm-Gg: AZuq6aIT1tvkyuIcmSPiNF6x13cLAXBee1xp/2hOmgJP3mauXOf1rrd0zWv/14Gh3MO
	1CyOoxx5ioDMMhMF7InomJePNgV1cvpmjiKECvZPPBxxuyZawETd0lBxBvZwRs6lVmyecAmVFE9
	cCySuCyAfcUg7XqgUrEPNQZc92tJvcEMJMptGXemjufBaPUp0/2QyxA8fOKkSCjIq8/BboKU71w
	kS3k5B83ogRk0v3+N+XKQ55vWlLGh/Nq+3qfO6Z41jP+3MHOJsQc6q9q/xoA7SaWKJU8fmXi58u
	AjfNZyxG5Dc2JJ+dzBVxB6hE/xGJyc1wbCVDg1Sy/OCWyD/0c1OpMK1KkW3h3+FfW6WMrCJToMB
	HCG1x/+A0bdu7QlAVHCc+W/uFYpV99IvocSqDLQYg+JzvV0m6rdnzKEO+2ZfD2IflOzaPNbCN1n
	v1P4TXpKjCeiRw0cBGY6ea1bbzYLllYV8lMO64pg==
X-Received: by 2002:a05:600c:c0d5:b0:480:4c20:6a06 with SMTP id 5b1f17b1804b1-4805f66ce22mr49700305e9.17.1769444537616;
        Mon, 26 Jan 2026 08:22:17 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:17 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v7 4/4] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Mon, 26 Jan 2026 08:22:03 -0800
Message-ID: <20260126162203.708-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
References: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Support i.MX8ULP's SIM LPAV by adding its reset map definition.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 00eee528a2d2..b7fa3110f282 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
@@ -18,6 +19,8 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -52,6 +55,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
 	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
 };
 
+static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(25),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(16),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(13),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(5),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(4),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(3),
+		.active_low = true,
+	},
+};
+
+static const struct imx8mp_reset_info imx8ulp_reset_info = {
+	.map = imx8ulp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
@@ -182,6 +223,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 		.name = "clk_imx8mp_audiomix.reset",
 		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
+	{
+		.name = "clk_imx8ulp_sim_lpav.reset",
+		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
-- 
2.43.0


Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CD234DCDE
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700122; cv=none; b=Z06DUUZ0CU8W2/fJnbXO68BBeM2/u8CR1IYaB50FuNRlqVrKwEJhVYB10SN5RJaU8JpbA1uG2DWbEIoJ6f+6BZkdTFSclhy5L37ssL4nkx0e/fAD5e/I4VR+TnEX5ec5L10aNIX4Ab22cIbEB7hg56EimjkOWbakMxhjDC9ApgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700122; c=relaxed/simple;
	bh=+Ey9SbmZcpxONfuufQWjoq8uULlUbxrUUaDZu5U2L78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFW5L4m7tFWuopqfPfrtXCjtVe/oWWFtSPZhcmhHkx7PZPLdFFzj17OsUoqELGHED0eyhCo/6k11Mf21/GHlMH7vZrdXMOWd6Ox/dZ+OyHMNuL4xma7PZhLEtLk9nOJpvSD6wg2E7Co1Fi+qClU6F8ixd+9XLJyEeg8n6rxKrgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbC7cth/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbC7cth/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b50206773adso550534466b.0
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700119; x=1761304919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUV6qtcx4rMTHA9YbDeCb7EleNNSZvqvmp58IK55HCg=;
        b=ZbC7cth/Nh+5ycZDdqgPsj+FuR56nWwBQPsYMgMLJJGouR9N+zTPQYGjftgBK962fl
         glfSeTwaUpgN1PUGo7rIWZsRyzHN+dZNK2PvkYZug1ArjRXitViPVqo9wBfrZDHa089z
         ndlyTuh51z6ZKx3Xg6RsDox18Op0Eap/lrrqEz9hGE1Nx9q/sX2dt4YsizEFxMi+bYf0
         KWlwlr//uzuMcq4W6bSE5I7DAdOt6qM4Sc4YZGDI8x2WAQF/jxVJEHUqtkDl1L3+0lYo
         ateIadWnXzUH1OVVWqM8yrmfSlmN2vz1Khe6rNvAJUc6AtT9hwzvEFXoMHRs57oLtz4b
         qRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700119; x=1761304919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUV6qtcx4rMTHA9YbDeCb7EleNNSZvqvmp58IK55HCg=;
        b=Pg6xkZe22rqarCrBfujrMCZxiQl7iBbGEUmWfE4upAdcI4EJKlk/76pq0/zj0qDK3U
         7FTfwgokg0YFXZT7gk+KZocztqY+Au3QIjiqSXO6w/CcaXuM9XoOrXyMDqDW9tYKK5Vm
         vWF6rMwSFPW8N+eW30ngsPG7LmOKubcNiG9Y2mDhQivx2IzN+qB4dNJ88+EiZYFJuUmS
         QC4BeSvsV93BXXI/qpMVrZZ7bFJGTAyoion4AlPxlQ1cotFAKVgcjRLFOXjtMK/BH2ls
         rEXAsgVi2D5EvA7aRUvJ/9VistBFUyjU7WNij6b7ocfs3X1CwIdX3OETUkOD0UZszYfi
         xH5w==
X-Forwarded-Encrypted: i=1; AJvYcCUXOE1iSRMxP08jhOJYCjhTmHIffiDxDdJR0ujkVFoRQ39EJu4p+SxX5Fvo/TvOPiM/SeI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpd7ZfqYEA4c7An270mOM/PEqutnH7tWCvYBPg2QBwgSFSZvf3
	8ukUJxxwL2VWR42swxMy8HB9bEZf7FVGIMAZBrJqdmsou4iNM7xQBMbC
X-Gm-Gg: ASbGncvJeKLXBVAqn1yxtD2UQTO5Px+2f+x7pzBjJd3pDt53XQ8rr4jGo9rHVxWOpi2
	+i9YpuAllHdTz0KkbW3YdphwLjUK/hgTOW0QcmM1sJDdMxC07lHOO0AI+Qwoo5tOMgWkqMLZC/c
	St5RTVDz4wcF8u7PzFkpaKgnMgrVoHWgn3jE3w6uLGrmo0Ra276Kvcz325USocngw4kZBeIDuTv
	066NhvxsmSgo/lZeEMkvoRif13nnZth5T0FVSTaDFTrL4YB6+40VmV5G6a5OuvicsdBJnSJVDLW
	ntBrfTViEPx6ZEnb50ehDirwpZvIccvGOUQK5mUmkV5jVikSd/5Et2zAptLWnQHNPZ9Mq0QvDXQ
	hchc5rlhKDBJsYn2ZrRD2z/jkmqdKiTHEqTka3Avksqi+ONf6iaCVWlbGmbeaJVaWRE0cb7HziB
	9yIFHZ8d+V2pLNvOYYWT6N2X3PJwnYShkAWc49Iw==
X-Google-Smtp-Source: AGHT+IGBmOLlRjgaTi3Dp0i7n6ywhQoBAle46tY4Ru1l6tF04+Mf45lE3lTlEpkDb4XkYETG5Xjxmw==
X-Received: by 2002:a17:907:a0b:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b645d20ef0fmr390859366b.9.1760700119091;
        Fri, 17 Oct 2025 04:21:59 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:58 -0700 (PDT)
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
Subject: [PATCH v2 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Fri, 17 Oct 2025 04:20:24 -0700
Message-ID: <20251017112025.11997-8-laurentiumihalcea111@gmail.com>
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

Support i.MX8ULP's SIM LPAV by adding its reset map definition.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index c370913107f5..b333d7c1442a 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
@@ -17,6 +18,8 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -55,6 +58,50 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
 	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
 };
 
+static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(25),
+		.shift = 25,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(16),
+		.shift = 16,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(13),
+		.shift = 13,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(5),
+		.shift = 5,
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(4),
+		.shift = 4,
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(3),
+		.shift = 3,
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
 	void __iomem *base;
@@ -183,6 +230,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
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


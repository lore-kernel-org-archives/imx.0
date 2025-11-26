Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CAD329366
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160991; cv=none; b=Prta/IJm0Alo53DV5bqO0+cibOiP4zn9Qs0S9ih2Kgze8ZUwLovz+EWi/SnIBWxXpwwz5eKWWRjzS8GiwHGgHykW4eLiqJPTwHvHQJgclz9kZO2RZ2vlK20YH8aoh/Tnd4H6KVMQIPKZT9fjoi5hno4jYgrfMsgu1DYJes/31Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160991; c=relaxed/simple;
	bh=P4KbKmbPhXi4RmHw2WF/7i/9QfzpSSQ4syTVF74JXOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fli4OAyN7DCSXqGt3THPb8aTzQcelF5ruYIHOSHVF2Ko/E9fkH+wKBXOe+muqjoS2LhOZlbMEdY6uHfCSkmRCEizN1vWIBLA6wTIRpivXteDo1uZs/AnrFhJhjbWKhXweePYaWd55AM354+OKxJdf4edHWL7cwMDRtjXwCJ4ruY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIHYuFza; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIHYuFza"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso11893775a12.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 04:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160988; x=1764765788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=;
        b=jIHYuFzatKa7v++HUavWBHJAgjupwDw7VTMZ/aW05Ka03zo56yNb/oUxGRKkVC+pOQ
         mIzpvQzkavDNZgl/TbEuePRRjWBGsQQxjlF06b8H0M4j1d375Z1YPnD2ZgpNvwJ2dAhT
         sP7B94zM13CWW7f+R0PN4/s2rXKlj9MEDEkWjMKvWmGwFcgstcc0YTKZRFPwjjIdyjO6
         7gyJjc85XK7vzZVIrEAqvNMXDCku8bDkL+UbDTnSstw+7UBY8fwFwk5LlFTsXVNDfRPX
         T4kqyR9+sdAkV40MSWo0t3iLmxmlWu/l/i7/tccA6dk/6zXCNlq2Mw31wRkpi0ZeuRaF
         X4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160988; x=1764765788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MS47VPO6RNZssHSPn4CeLg1VobQSQVVSULTdfhTMk9Y=;
        b=ol6v4gzuk2lmxAD8Z1G9ZWemJBYj2fLagekfCpRx0PPIyBuOKfCY5xEM0USkesNLGK
         KwnyFU2J/gtJmeQWvDMMHpe+R25zgqIxUYdd/6smA3bk4YzesRKV4mIUXMnxswSgFY57
         H1HWfz3osLIUKYSO81/V0JMwYkbeBp8BrM4yzqEAhLdcbvkcAt40/kW8b6gx2pRApfbK
         8IBgGV+n0FUbH7AvWwGRb0EIWbcBZVyCNOmota4P0dlDuQQcAAItIGrikJ8lrGR8JxZg
         kyCdilbhuTxs+vYuDApFpy5Acqw1LIgX4A0kKNmfaYr/sJ4Pke/lGCSLPDFFHYebmQ0B
         CUSg==
X-Forwarded-Encrypted: i=1; AJvYcCU/98PXptwAENDLhUiSt1I1pbWgs+XdmznQx4ZasBLuH9XNKvdEbbOFTqiNOFIZzAIjVL4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/r0acc3dtQtLDvgcrvW9y0Qh0FcpHmEKou8SlwGRJIVaSOwIA
	UvHRr1LO/c3kHI7OHqTxrqu19LCB6gJRVzyiKhXUG2FX/jp1RjIYlhJv
X-Gm-Gg: ASbGncu5HZEgk/i3q9e7SeUMScpfEAyIUFEuyTyMaIh75c6GmXXdi5yTmE0S9wFqzec
	UQslofClb/GZaUUJqF1WpilgopjSN2V4FJtk9M3Vs8eo5CfSlOTrzMCw0IsJ5kG4OYM9FTcFFCs
	mQd8WtnCbM+VvERGfYdcs1k59ZTysrWjNa5BqrwfPUXeC+jlzYmzFOjraUDNX/OzWWl6KMr1Yx5
	a41obJn4EV2dNijFX/xgzqn/47WFBgW5H/AtdCRDz96YJBhxvsjveR0rQmydE5B8KMlEUrCqvim
	1zuCGuhAqEk0lNG7K5KgKj1PR0A6eE/q+dqRiC21Hbq9APrkd0xts4I5x9qQuv4dd0xz7eXcHf/
	ex1HezJ+Q5ZmSNU7P++FVMlGvEP+0PUqOQ73MXEif1zlg9a5X9Eaib5/KmnmROZMES2Mvn0RS2L
	p2eeTkiSHRjEvfxXqNukDtCjgM7BoPWTfkYyVz
X-Google-Smtp-Source: AGHT+IGKniOPsuMqLGWG0SkLA1Zky3npjxWYZzJjefGtqxfKracate5d7l4F20Qx0HfNwyP4Of2daA==
X-Received: by 2002:a05:6402:26d2:b0:640:b808:75f8 with SMTP id 4fb4d7f45d1cf-64554339a47mr16014476a12.7.1764160988003;
        Wed, 26 Nov 2025 04:43:08 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:07 -0800 (PST)
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
Subject: [PATCH v6 4/5] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Wed, 26 Nov 2025 04:42:17 -0800
Message-ID: <20251126124218.803-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
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


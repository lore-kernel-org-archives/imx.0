Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9325A2580F1
	for <imx@lists.linux.dev>; Mon,  4 Aug 2025 15:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322914; cv=none; b=FQHQdn+r1aoRqgybMhSGqO+1B/fdDe2bdOze3axVutajKiECy9QaaLhJna5eI4XT3a6jolpzEGdXcspL/4Dizu86A9H9ngXyGXpfHhqI9J2TY6ZRcBlOKojlkOPWjxeP+Z5lH4EV6GKKKteyJr68+7f3kNzt95hUGbc2rAYAWLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322914; c=relaxed/simple;
	bh=wvwXgfJa4cdNsv4I8ZrN0NK4JINVjURvPKkWHLuWm84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ks+urJaIWRaY8WG+TaWkpZSbAwCJrO7cnddf99EzjI3dhqedkiuPNDvmgJRfoc/ci+2H4C6ctbog3+PTu3EAiLuvo26g+m9SEeTpA8caHWjhZIp7Qn4I44tF9iNlk6IrduDl4N4lSX6HPH4ovRY8Jkd4hXTstTipXtzR7u7Vxvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZK+Da4G; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZK+Da4G"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af93bcaf678so374609966b.0
        for <imx@lists.linux.dev>; Mon, 04 Aug 2025 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322910; x=1754927710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mk3OWYLSToLJRsWp5g/85e+rXfgSRMqYxnQ/kEoFIk=;
        b=BZK+Da4GV0jx+Owr94AGsy8IGCmt19lOUGtrSogjb+8odaGH0KoJ6CNnUdFES9MMCh
         x2rZOHrvZ6R4XG4fuISmlM6vfLcqX5pd2+LdufpUyfAyit9s+y/zSILHYpmsUJNC7g4S
         ATnoi04Pz0SBD6ojJTEvQvr8mDT2r/7WgdxDCmloz/f3SaM/UCxTv2nxZ+yzB7kKFVld
         PCp9jZ/C//MMimxQF2YoDGsEuyiFSPJX6U5EIGztLRod4ldiH4Ge3RG/+rnCZCEI7rK5
         T0hGZKfet9i4+x5XBJ8kybMlLhZDUylURna+/bLIvTZu0BziYKYn5UkXREoOOHmq9/mm
         Mbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322910; x=1754927710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mk3OWYLSToLJRsWp5g/85e+rXfgSRMqYxnQ/kEoFIk=;
        b=a4mIUnn6vrcEDR7sTUNiXyJ935eSWnkZf+i3UPlOIEHjJlRz0Jh0mWc7MPS2b+sUng
         BJZTbrlqn5SbJBHhiKZAIbRD0qXId9YESCgDykk8LNAej2A87eZVhWHY69pZ/Sxitzz6
         g75ZtN6iuGfyfcMryxA0fgb4ZbKZwYZVZigTFMfB4d1FGrdztwNmdIY8tNRTZ9NpKDvf
         U2OxkiybisaQHtRULbeCWWLApoUvHLjSZXvl+mf021rgWS1nUEOTm1oqlel3rLzoRbal
         hSJFBStjYcErukX11O/737YR360xatoQCZMCymfKhoWJSYx7dkNzR6f1820Top8gEyWY
         grdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyWuNLr0FsFIH60mjazvmG4ejqVQP0D4bYw3XCv/Znm/qPU2jCshSGNKjbzWl8ttxdMLs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZf3yPAwdpV0zFeaNh6OgwQ8So2pFBt7dHSy8ke9VzhDY87kJi
	25GNbwT7YCY5AyZH2/9PBT12qC2ey8EbdTC+FvSMVbUaI2DGwBKjETLf
X-Gm-Gg: ASbGncuB+9GBITk9kwxCo+x/yKyF7C48lO61UiqVXf0+dxN/MnOBzdOFthMeznGb9se
	IT4PTY/0kqejEdsUSCMFVe28nfIN0pNHB7az8VzX4gEHYxmOxeL73lZ9bBi+btI1LPkNCs1KgHg
	4ugrt+eInpA5ZH3qpRNTtFeQup6TxroZIT/pVI+KESETOzGpyNjG5VlSo4z7KJx/r7eW7DKUmqN
	9/CBEEoXyhgXtDK4e02YONHgBMlAOxXcj1c/9doQ3K7ho2eevt/91q4LrHvZwL7DOdXewsyx8rf
	kquLA3/VMDM5vv8kvHC26aA3RE3y//rpnX5O1ttlplz+wbHGOzJe/NeMcqiX9KFnL0TC19FYHv5
	jRRFHMxPqwB7RhAqIFx3lRoaxQ6n+GJAtEJFj5R9K2lAc9+yr7PtNTQeKzaSyn+yreWaHVw==
X-Google-Smtp-Source: AGHT+IEQLmBUuRK724RheZWkPG7lebmyIqAtsj6RhVLdLdz6uzzGZDzQSt+B/vMM6nmib8DWWyjlOg==
X-Received: by 2002:a17:907:3e87:b0:ae0:bee7:ad7c with SMTP id a640c23a62f3a-af94022bf6dmr1097053066b.46.1754322909632;
        Mon, 04 Aug 2025 08:55:09 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:09 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: reset: imx8ulp: add SIM LPAV reset ID definitions
Date: Mon,  4 Aug 2025 11:54:01 -0400
Message-Id: <20250804155407.285353-2-laurentiumihalcea111@gmail.com>
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

Add ID definitions for i.MX8ULP's SIM LPAV reset lines.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../dt-bindings/reset/imx8ulp-reset-sim-lpav.h   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h

diff --git a/include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h b/include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h
new file mode 100644
index 000000000000..adf95bb26d21
--- /dev/null
+++ b/include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+#define DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST	0
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_RST		1
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL	2
+#define IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N		3
+#define IMX8ULP_SIM_LPAV_DSI_RST_ESC_N		4
+#define IMX8ULP_SIM_LPAV_DSI_RST_DPI_N		5
+
+#endif /* DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H */
-- 
2.34.1


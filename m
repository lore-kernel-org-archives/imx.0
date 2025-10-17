Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068AC3469F3
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700116; cv=none; b=tHaSwGVFpbzVFczwPZQVBN5xppdTsldfAKmW30PpwAnvXpIH3HAJ+Rm2rmncNxn9UY/mo38rVN/UZQXPifbRxLI/Hu9Moe/mM3k+zcF2iOCi0LlkWYnT+cv/iMFjaDcV5ZUEQ/qc5GKcJXg/V8OXW1m32Uln4XZxtB1LWdK6p8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700116; c=relaxed/simple;
	bh=GfD23YPZ5xlI6Cvd3J36u5HvRuzKaxr5uePf59R3rfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pScNQrXWmlrC6y4WRYLhhURFP12YsB3zi7UX4vWEz4tlayBMYllnkfCHoJa+NI29PD/7dxFWFS+FTE7FTrJqSagMeMu/FQbLog/zUgCUgABaHnkcU0DfSLzR0fcGnL4vPDJ234mpJHlUBLNNtLPi5HkIOtWcoiGOM/gk83t/Rn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSwIE9FJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSwIE9FJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so253722a12.3
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 04:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700113; x=1761304913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szPuxr5/z40MS5Mlf+BY36YkQjXOaNb7HQ9L58rAhvk=;
        b=CSwIE9FJyKKqc0ZDXTw0AFTeu4fHaerhoh//N8mn/ZrUaDF0+OSrIRJxzjTa+/V8eR
         N6d1O3PcIXdK3u4WOiuZxcaBqsRNQux+W0DiLzkl02pmqquINXS7GMp8xt8wckjA5eUO
         zPhyM2bRN3pXrqGDBIWVD4tjtku2OvPHFrtnsD6P7ToZ9DQu58gsN4eOSMHAKwKH82Er
         TDt7BfV2v43j6roxY0R8HEriewV6lUER/4XtHR/D+3pVulDgmdzic5I88tO3QVPlhZVU
         5O4wk5bCf9gLpPJDXAu6LgEatjCzHCrsKGAc6AVhzjqmZa3LfMIaw2+rlELaGRl6ySS1
         awkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700113; x=1761304913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szPuxr5/z40MS5Mlf+BY36YkQjXOaNb7HQ9L58rAhvk=;
        b=wmVTFMjzgDHdj1cDUyyKenVZcGJ336i7mYTHvOB2vUNs8feF5dskDEvKwFU3SR2lLQ
         EYlHEVlOQWqxEoMYwmlvNFzyIAwgd0xy1A1vSVMFizurnfMzqkBxzzMqxK2r4vXw3eqF
         zIqpMtO9DEyWO2lqoph20BPextRN1DiTrkmOYIDwWM/y29X9synfyF6/9WZPnKMAYcv6
         zRPjPF+9bg3R09dDeNYIlaMs/gE9GxwBC+4sv6MCSTA7lsyiDI5IqQR0jkc3fSiUIqLI
         Fiza7IcQeEI6mF5nL7kkFki+E5dOVsqLNyULIoTteX37G5+26T5dzHx0G43RrtqTQNpg
         3dww==
X-Forwarded-Encrypted: i=1; AJvYcCVji7+V5fpB1uLhN5fgpdBC/8aZoNDz4zJ1MlcPIj3YN6T+fSDng3gQjij453T8h7LFt24=@lists.linux.dev
X-Gm-Message-State: AOJu0YySqxnkXDz6E5gkpNZIOzcnZW8nkLvz7vhRGquUEuh+0Ft0RAOH
	km3WEJKOipOFrvm4ypEqqYff3rf/IP7zK06h8DdKBL79MZMEmPZ3czIE
X-Gm-Gg: ASbGnctY+oZIdTUtXg5CVsnFpSjicW9QXZAjc3h8DwXLw9LM1pP9GIxtucnyjw6quI1
	WEMCP0EXeV+2wEYxQUwALtBacll5hqJ6AERstRQ+Ps/bhkM/xNvw/NtDIuqFq3MYuFpaGwCoBrK
	3WuD3LR3m/5drh0gMjAt5WcGng/zkedh26raIgiZu+9EOtz4SauUsJ/z0dmDX8PC78FuD4xG7St
	CA6Aq6l4oG76ktHcLpzdzRJWzHK6zPTpU5wosOzbQbv6epemcIHznME4ZUaZDM6TB0r/s0ZrwcQ
	vBFtt5fS2EXLQgktoemJDTVXs6Uu94550foJGTniVdtUo5OK0hx38QLAsHI9PCWI5pFgTipawH6
	gLHiSh1VX3ij+Y8j3Brh8fy5UDM5ygLwdiQlydSlyP07bXpd8RfUfinmFrCvRqFJVDiseK1u6cn
	JShYQRRgEdWffw+4Uogp+NNEM4fSU=
X-Google-Smtp-Source: AGHT+IFNwxALXcNX0FiT0aapuBu2Z9QWfQyDyDhYXyKBSinI4TH4m3Od7Om7Ykt8jQkZG5S9C0wOAQ==
X-Received: by 2002:a17:907:86a2:b0:b40:f7dd:f8ee with SMTP id a640c23a62f3a-b6473732c83mr382329766b.28.1760700113139;
        Fri, 17 Oct 2025 04:21:53 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:52 -0700 (PDT)
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
Subject: [PATCH v2 4/8] reset: imx8mp-audiomix: Drop unneeded macros
Date: Fri, 17 Oct 2025 04:20:21 -0700
Message-ID: <20251017112025.11997-5-laurentiumihalcea111@gmail.com>
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

The macros defining the mask values for the EARC, EARC PHY resets,
and the DSP RUN_STALL signal can be dropped as they are not and will
not be used anywhere else except to set the value of the "mask" field
from "struct imx8mp_reset_map". In this particular case, based on the
name of the "mask" field, you can already deduce what these values are
for, which is why defining macros for them doesn't offer any new
information, nor does it help with the code readability.

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


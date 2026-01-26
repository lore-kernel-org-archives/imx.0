Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31B3358B5
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444534; cv=none; b=MQCGtI5kEEWKnvpG1HjgrThBmtPNTCgHUJdsM6kmeYLRpjtie6DTFfB7l6R0EurAJWfae8SeUoELDfonJoI9BKLH7jSAebDdVg5F9zbZ4r83WURfdylrJ32gx6BvSVfXTWourn/biRR16bvw4xxhDC98vtPKhbmcBZS1ER5uGGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444534; c=relaxed/simple;
	bh=x0VpZkifpmsZOeiUeKRVj5l01SHfLNEX+dBjXy+hSXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uf2jj5rlpuZ7fQCbVKdSWcB5rFJY4gCpYxVhdodZj0wPQjXX0KSdwUR4OexMsbtDVECgEVZBE3HsqnO3fVN6rbOVBA8MgLpyDvo4ucqZ3wxWDLQg8sjNd0i74JpvfEuAFJ8dvuyHXoEowesTn2izEgztTuLyOa8Q6sHhJzk0dFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2pRW0xL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2pRW0xL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so69059355e9.0
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444532; x=1770049332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=;
        b=N2pRW0xL0riWcrxMFdIYjJZOdk1fPDne05lP/Jbj/RppXm1jPbqq3kTLqd1f7cSC0T
         ruFx4YCldQjNe6iD0a/AiBJI2vgdhGuTpmj9yISL8GuVq06OYYUwDu8LsGbebiOB7+lb
         UqH+FZk4Cy313saHBKTaYaRQjxLo7Xgb2Z5uP8PQfvnx8W8FEKTH6rrYgq4e3fshFWwU
         0a0cuiFojJ1w2QACWqRspBKt7m5NfzeQTmIFz+yeT16ZO0fvtViuCl49wNN2r/CouhIW
         u6InUEz+vlhXc53lot+Fd0jwY0FlSE5T/oQh7JGGLz9+LqdcRFhkNttor2YBeqpYpnIj
         A+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444532; x=1770049332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=;
        b=TVpHXUrYnY96GReOSf3XfKOBgLh4FdyjqFOx4RFJegVcLZGFNITH5npyh/tMEOMAiN
         gGeAX4AnFXlueM94gLzS399xL40VRqB0UiKjiFcUGw34BKXkTpcNjiiOQ2NWU1OQHUgO
         YlkSFL26Df5lC1G45a5gNugnUhOHKCSSpOtHJptFHivF/VpZ2esjmLAcgcWtwcK6btbn
         1oSALWQWwJUqk4pZ0xsT4OkNB29ziSFxPvpUN7jpZBTYqSx9EXVE4wThByGaU+KHep/X
         o0nOD59n7CqF3IV/BXL45P5TduMEq8+GKeZpp41wOLzZYFoskLsbv2WuyskVbwtxmJgM
         YLBg==
X-Gm-Message-State: AOJu0YzG1lhJMfsfHM7pUw4kA624cBbLlJ5JH/C7lyDXSFmHm0fM/Lut
	AKizc+V7fkIjCO1M9sI9F9MW2q+sMUP4mUk3ewlGI54rOk37OZ+YKa6B
X-Gm-Gg: AZuq6aJ3Op9saEFF5OLk5yXJYHbBaWXBsHha6AG5ORl/nXiHkKzPwiSAa0Cz9rNV7iQ
	2yA/BZ+Jqo6+HidZ0HmYZJvdhLAYjmsrnzzpoPh/QKNp44coPRQMTiWTFgZDm3+3BOryshYcZi8
	+fz+AWc5SQqzHu8rbsMuedifHnNNRvlcECNuNvk8XmRTYpgwk7vz33BPCgSGuUzTFQh8Dhr9BCB
	rJXyXW2w4cZNzjSm7rLn1gNVLmJSJ3qzRdgXCYssblpfrbnwX7QPEeLDgbf2iDR8PvGVeaomB5U
	ASmiYyYEpDomQpHNn+uvWIEgkcluHZR1TN/GQf8Td34P14hMtv1TCux/zp/bJWDySfRQzCHF0v3
	qzqolRSHx5cQ55ebOC1Jt6EKVViuyb4nup1m2Tl8wnnjSBvobvEojRJlWXaFjyUKh9n7/vprI+Y
	i273yl96B92/DNsKMudUgsu/OX5ilbM8O4+zTAxg==
X-Received: by 2002:a05:600c:35c2:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4805cf66771mr88446235e9.23.1769444531205;
        Mon, 26 Jan 2026 08:22:11 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:10 -0800 (PST)
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
Subject: [PATCH v7 1/4] reset: imx8mp-audiomix: Drop unneeded macros
Date: Mon, 26 Jan 2026 08:22:00 -0800
Message-ID: <20260126162203.708-2-laurentiumihalcea111@gmail.com>
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

The macros defining the mask values for the EARC, EARC PHY resets,
and the DSP RUN_STALL signal can be dropped as they are not and will
not be used anywhere else except to set the value of the "mask" field
from "struct imx8mp_reset_map". In this particular case, based on the
name of the "mask" field, you can already deduce what these values are
for, which is why defining macros for them doesn't offer any new
information, nor does it help with the code readability.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index eceb37ff5dc5..acfa92b15329 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -6,6 +6,7 @@
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -14,11 +15,7 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
-
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
-#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
 
 struct imx8mp_reset_map {
 	unsigned int offset;
@@ -29,17 +26,17 @@ struct imx8mp_reset_map {
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


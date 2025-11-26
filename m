Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD8B328B52
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160989; cv=none; b=I4hjALqoLo/FPm2qNw1yO4isRUmo1ASAUNYGFBPjRtB/U4ncuRF79z6NV89rIPuMIDOcB7qw2+FEiEHuoJNg5D/lugkvJ1tY5oBw5fCWLTLSauvj0dEFqIlkeQcGcQSXlLjniYbDw6cJGtdLsLak8DAoFp/vr3xHeqao0iQcPcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160989; c=relaxed/simple;
	bh=x0VpZkifpmsZOeiUeKRVj5l01SHfLNEX+dBjXy+hSXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYGwYPcCfXIRNPFTWV1Ng9Y8mdV5giXaHCAoOkHF5fEALbFRVDJEwpfU0zyShOeDD/Ds3XEshWqqj28AYx0u5qZ4aoXFjURzoDpbXC2RtutM+17Q2y6+QC+3LDHtqJmCO++qCGLiqiCKtmIaUkf9GVX90npVBnQgcJDdujyxBmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7yci4fc; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7yci4fc"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so11302247a12.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 04:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160983; x=1764765783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=;
        b=C7yci4fc4WyY/CNjAY+go7tFJ2hImQv5OSxCeGWhxiRfS6YlLTnmkPNbJlL0LQtNzd
         DdUI7RoGaqFJoRjKohltcEuHYhUFUtqvjNqyeslF1jvKHk3+aZ5TJCxCDQlOIFe+t3Ko
         /SwaKlekXu7rYY41NncTPWc0BKek6SSb+cLajNTfVfQUxQ+bS3CIb0ixqU/2lUiBrioL
         +3l8fJT1IqMWawd/JXq32MWLDsOUhaWzj1PTv1pgKtA+PrSr7hY+nXjvtXYcKZH+J+Ae
         Uj3qToAjCJB7CKkr1PLYWPgHI5pjoYBz/bfiRrMbaP4ub1oP9AwoKsqH9P7w0gqTjFgG
         trkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160983; x=1764765783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=;
        b=NqfcF05wWTWD+NX8nOEDybvcwN30TCubkC1a+I/P+ApO8O88bEuisMarDKhY+5zNu9
         fW62VL8XGTmyaIOYjg6ahZ6KkbUTt0vYcPCaYxGArhXrCFADC+WPb9BxAFaley40Bv6W
         aN8yZcsgslztWfdd7gyeI/KrFGaonbJDtsxbuAcmxTQxPULNK0GcDFn2V9Mt7MeEOISk
         EeM4LBkiLJHnTcuofA5SpjnUbwW8jwiLJN+YA9PXPeq/WFHM7V1i+xP7aDU0omrWmDv7
         4ziPQodxpdfvVR2ufZj7V6IyfDpWfRv+fn8yBXX7j3wwmU5pyQnuq1YdodmLd+iQ60fX
         u8ew==
X-Forwarded-Encrypted: i=1; AJvYcCVEbzAJRQZ3Kr8ZL2bCkxrFvPYFOlOuIzE8XfjVGpDF4Qy/zywEnBlBIqcMMuJ4YYmHIHE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGg+bCYrXYH/BxgT+6AdeTlwH5CCGfvFJGpbC474lPJkGaNvdK
	JvaNUaFZkIRs75ZXQqEwqzApuc4PXbb9bSDzGVvD4PLd2VsQ7G1/JfaW
X-Gm-Gg: ASbGncsh9ItpcZPx7/hbUS5Nif/IXA7fNSBMEWTig+NqgtTK3DaELI+ru99UH5t4DK3
	kMVOlBtzRHcFgH8gxhRqGOzGuKH+ltj9XqDGb9ywdPfIHfHTkbhFxWFGXhzeJwrIxevLANHcR0h
	PObWxYO2ttzJviT3JeTiHCJmASv9N0GDAN+Ny/Z9WT4n4DoJO70Qzij+PkY6OyZr08KP8iWcR+f
	DhNQJ99+Zh0UShZfpwtd/Pp8mYv7sAGqOm5MiofXgZUZUB3Dz0whYkgYiPWu8j7bCnPGSAMmI4K
	irb9tSPASLW+8/KWKWyikgq2MgiF6qbLgl4QEM4EoY4tBSK4mxQiu04gni7+qSkAvA0Y/18Cp5o
	xL7VugQs6hdE+l1N5SEd2u42QO9i6i7Bf4gPnnbaGA2u9NaqlAxTtEZKpfK9OBFSnI5xKLH/Ln2
	0sDgP26Pp3LyIQ28MuDVWF1DHhKldSisUNTcRljd5BIxzy20M=
X-Google-Smtp-Source: AGHT+IFZ3jJn6ZtuPHP8d1zHAviRf2Hf5JxHWcSBJlcuwsyLTvUvL+Ag9uQmMJeg0bd+BjS0LWB2ew==
X-Received: by 2002:a17:907:a893:b0:b76:3548:cdef with SMTP id a640c23a62f3a-b76715af3bbmr2271548866b.25.1764160982366;
        Wed, 26 Nov 2025 04:43:02 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:02 -0800 (PST)
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
Subject: [PATCH v6 1/5] reset: imx8mp-audiomix: Drop unneeded macros
Date: Wed, 26 Nov 2025 04:42:14 -0800
Message-ID: <20251126124218.803-2-laurentiumihalcea111@gmail.com>
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


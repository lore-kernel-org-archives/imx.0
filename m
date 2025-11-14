Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B1431A7EF
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 13:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127502; cv=none; b=EKZLWAMcpoHV25GNy2syURwPja4sDorViaHQnuB8txBFZYaNcmY3RAUyXDpfwx6Aj6OwZDmWYozpaGqwA/1Sca7wf6RYb7Xxdjqu0E5uOpFwWrA1ECamc+jQ2vJyzK7VkO8VOtp83mtEfnZ+ddOxEcdMtFAjxRYAncEdoeRxjcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127502; c=relaxed/simple;
	bh=foEwrfkVJlHKAY4hAyD7v8BZiF7HCnetDgamuS4Q2n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/IJkPUy/vXYtCb60KwbEAj/Z51AbJJgewmFD7JzKVf0hoZ6GYI402dCnbZJqDAj0vLmuHGhviIM1012ziAJsZVK9HSo038GPizlRQbakud3YLZc+vTfAiNCLkrE8txIu2GunNd7Op0ytDZOUGXc3AQxcvPTYK196yszmBxr3kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeT6z4SD; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeT6z4SD"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so3109332a12.2
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 05:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127499; x=1763732299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSTuk6bpUxNwcbGpcQuPugEknybGUY3HH6kETf+pWJA=;
        b=WeT6z4SDtSNJo4WFGA8xsCITLlJ0W9lFgwal45HEdPlQsC598Yv72lLpmWSZEAaj/f
         srv3GWA1V+AJA2X3zZUK4GnaEsesD3sIgAEqK7gjNw+ybWYYJqJdWNXZ4cgW4HQdxceN
         b90FgKkEMk9UoQ6727Dn6WbmgJ3qGtYGAFwB0ESZSRMB3gvk0xayPBHn+Ra4rvXNFW9J
         1cTazvN/O1uPpxcQtWIsdQBeGTHlEgpz/IMTbhMrxrdajM0qEe/FoUIB16Cb7lIV2EP/
         MM/mGGGi2X4HK58ERI0Yi5+NTZFPaw9xV1EOXpc+w/0jAf726ICIr0dOHtHov/KFirin
         YGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127499; x=1763732299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSTuk6bpUxNwcbGpcQuPugEknybGUY3HH6kETf+pWJA=;
        b=iIubJqaugEgjaSMy6AxIzeM1zwHh28qOFEgNN+tryyOwF60WtN0OlZOjwBpE/ov+VZ
         aCvt4T6/59nIF52m+hJuQuxH3ZeiR+eSE6Lard7d3Nj9pmTOI/33q+yfL9aWB4IP29bq
         gy39qj1snv6RdwHpqr15JLINC4wgPogAja+j/SLr/LYtBzZO25euAftCQbequ5Eg3HFQ
         B9jVGj73qiPqAwlgiAtEe/C2P7d5vU/oqpz4jRKBRYqSRShD0T+LDtN0e9bp+oo/Rynf
         8OpaZkpEqYZs8bz547dsLMxZzrR4btBK9+TJmVLSg/JPWW977JoIq67qhv3RlRTrV85N
         2/rA==
X-Forwarded-Encrypted: i=1; AJvYcCWKhTQpHRy0TFI/CFa+qSnar6TvD+HZNpSfd7/vqfGem9ksDW/0TgCUk7cWy81ekLqI+ac=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdhy1sOPdfwh9NwGb3AQIcSnWgCCC2wWqZaDaP9hOOZdgRKwfi
	2h9wdpkUGoD3odMcT1dM7ncn3CHxaAC7DH21hSmRnhLf3zCEQZuQGj/w
X-Gm-Gg: ASbGnct3BTjYxoGBXXOp7NrclKXsQnuWKRjesW+eXdAtiFmMG3OtOVFALeuj4UHiOi9
	2efFjzoakwwEI4SCnvQJ0xt3Fv15BwxtlfXfmWqXClFB8CnJr0JJx8jA47++14iS5D0bH1X9iNf
	s/GYvtdKcGvpunjOZzMylrLXD2CCUE//L+m1z++45JJi1EPOjJS133etksmTSJSpJVNdFFxdooe
	8AoKlwAiuhzZCBWIaePsDHTJyJzatB5UN6MWJq5rifLinDt9nQ04AfoM7jjO1GZCGKg+dD85zFL
	nte+uO3p47I7IpVEkGGILrd/QDM1efk3a5GMR+aMyagscPilC1hLInv9tDCXngkdsxdqqIvCT7C
	o/xNl/S70WxdBpv2/SwV1EbnE7pPzf2ggVOemOYFWVBJalhx/PhdpdcCDoXEouBJeyd9aZnKgad
	dcpDVAlUOCu7OsUnSFeL8Lx0m/Ab8=
X-Google-Smtp-Source: AGHT+IFvKA1+gNZSHXPhDg9R10UrD3Zf0H4eUhPkX/HS+B9nFWrGe5Hu0zKQ0XEyBpiDpJBP1vknUg==
X-Received: by 2002:a17:906:fe05:b0:b72:de4f:cea6 with SMTP id a640c23a62f3a-b736793de61mr322529466b.48.1763127498389;
        Fri, 14 Nov 2025 05:38:18 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:18 -0800 (PST)
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
Subject: [PATCH v5 1/6] reset: imx8mp-audiomix: Drop unneeded macros
Date: Fri, 14 Nov 2025 05:37:33 -0800
Message-ID: <20251114133738.1762-2-laurentiumihalcea111@gmail.com>
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

The macros defining the mask values for the EARC, EARC PHY resets,
and the DSP RUN_STALL signal can be dropped as they are not and will
not be used anywhere else except to set the value of the "mask" field
from "struct imx8mp_reset_map". In this particular case, based on the
name of the "mask" field, you can already deduce what these values are
for, which is why defining macros for them doesn't offer any new
information, nor does it help with the code readability.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


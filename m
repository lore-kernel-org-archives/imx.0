Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA5C2F39AF
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257847; cv=none; b=VvmrmroqElqaMVKx8Iy03onpJclEm1zSaAKKnasePyivY91DM1MJ9km0BLeqfdZv0HZYiiUJbWqfvYiv+Y0j7/IZ+vaz4h2zdjHAq1vhUENW1Azb8R1GQuwWe16YDWjdV838E9oc2z4rfvCC7U6pML5+7RbjmouUS4N596Ozg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257847; c=relaxed/simple;
	bh=TgTd1HpIl/XZJoNIxl/sF6YycwPbOWbZcWt7SX51N6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGj66COdKOsz/kaE8gCXWb+Hgf4T2/xH+pidDfODhTf83fyBv/BI1iFItCM0Evu/VWbtkzmYvq9kD/1BecMOMNt8rF85hgVbuOb0oVVrj3Si5+YmVAARboxBKJu3hecILbFvJ1LohWkQVQlNmeH9i7jCFdN69VzxL82gyMPC0aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiJV0dQR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiJV0dQR"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b4f323cf89bso210325566b.2
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 04:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257844; x=1762862644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MONqpZUeZWIIjN6d114EqSMuX3Td/c118reK/5knf7I=;
        b=iiJV0dQRKe8l2wTcFleXQMUF/KVVWt7adJGQOd5yKcQ6dmYy8Xb5iPgaRaUmjiHHMB
         85S2h6VeoW4xsUDlDqAZN0HNZY7sEfP6Ny0xK6fA8OvYJxLF6OJGvdycxp5DiKvxnfTN
         ynfr0sT7pkZ/QeNgY+qsYbPIVCrjPacE8NPC/2PFDJ1NI/7qXqdsT76sHN1iUCpWcb27
         gJIT6hMF923z9ReVuFzgpK3a5eRs9jUhpfTTSfML/RTLE0uDbNjJIR4Pk5iSPN8BWg0n
         dCUVe6jxLpnbVODO+B6C/xRl+lVncfrUx9LdOUbYJzsFSp8Xa0ngNPQ56fjRU1JApQmG
         KYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257844; x=1762862644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MONqpZUeZWIIjN6d114EqSMuX3Td/c118reK/5knf7I=;
        b=HFE7gNQzSt9330NuRB/YojBA/YjmJzKwRiMm9ga0AdTl6P0wqAPqhWhXm4L9oW9ig7
         jHOPbQON6g1WlKCQ3oYq2B7EsjHBDiPS6gW7qGaUL2hOkduATGdI6tpSityNcL9oS8DB
         yd5s7iGJ+TxxkM8SYgKsjGDWC0HVCKCNpAiuOr+6cNm/SE22T8hP86IapEPEijapnKA5
         eZPb+WRqwtkF8yoHNrhCNWK0VHcSg5IBOjDcUadN2Gh2X/ArQnvfK7dpywaHUd8D1akL
         wWX2sE9P5mnDE73y931WEjqnUx602UirKDybrayMWcmBxiJunlNAPOmogchs/7eEEB03
         jBPg==
X-Forwarded-Encrypted: i=1; AJvYcCWB3sdKmifRoKnHJk5gJwQjYUXEi6ATvNBK96swhqia9oO8Od7xPK9jgsKgOKHIzOzFPgA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpmwygLjiUDu8tQB26LTFyyBBuel29mm5groHFt3ogIs4l8cTT
	ghiRUFppxnbc2yuUl2WjhP2nZ8ILNoJyloIAXI2EVOViyLXoNwpMTc3S
X-Gm-Gg: ASbGncsj0y7LZdYOIVSWgCS0MmaJc0G/2oserLqwCrRXbe6zOKA1BXb84YKbkr6WwIG
	kM0YxQQwIuOFf9SOWmODiSvvC1Hq9GeTkSCfAglPDurjDBRL8CRIoEZmqZ/wAM1rd54x8hj65gy
	TIf/5CKZzf0oLFLNLbuN+BXGbTInW/A6ysd4zXjGk5av+ncRclfYRrenOQfWVLvxTrHqSaD5BTu
	kc2z6qO42klA/nTnaIqOgQY/+GAvRKokXQcd7s5FQIklzU1IcOfRg3/5GCprD55ZW/jk0u3K2Ui
	B4LYcET531LCbeooB1xgyn+P1rHjlkBG+wbQCT/1zBO1eIoVFcEAb1f4kn219WwfGCnzawVO1DX
	Kt48i92euupTjqgvJu0X02E0+aoxTLsvq8nv4EdFaRv8ibx+eYaQb9oANpB646puY4ZvVRZmkKC
	S//+Ls2Zio0mtgQ14fh8YLRfe5ZA==
X-Google-Smtp-Source: AGHT+IHRrE0o2sdiIAqRFi5TYM4KHbBFm9RA/54j9UR13Jtqc+5S0hJxSBlIU42MxJbJO58DHC9lVA==
X-Received: by 2002:a17:907:3da7:b0:b4b:e419:9af9 with SMTP id a640c23a62f3a-b707018cfa3mr1722945866b.23.1762257843561;
        Tue, 04 Nov 2025 04:04:03 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:03 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 4/8] reset: imx8mp-audiomix: Drop unneeded macros
Date: Tue,  4 Nov 2025 04:02:57 -0800
Message-ID: <20251104120301.913-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
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


Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDB74D8DAF
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659487; cv=none; b=W+aR+Rasg7FVeq55TuHlyHofwGcPfgCwnbKFWYCxy6a4i/YhLxTxlYGo2Bqm3wjbmB9wc4qk8frOV/SuqWjhsj3soGEIdsmKLF8FjFajrX43uM0eKxPeXjP+ofaYPT8VXC2bR9gIuC/GUwhrWaIVkW1ddVpxmjJP5raXkKaXTp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659487; c=relaxed/simple;
	bh=7+PuTcFr4lv1Emq9smWBnZ+5CR1n6JckIWsQMdS8GdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1BMBWr1ZapiTl4ShTRIZ9qCtTrGfBWNivToaI28ShoYfkGaM/kU3xAvjgSncfje8ANigPe/aPt97DT9q4jLE8rOTfbrM/bdES4vhDkZoUlBTAlXRxMsPRIQpJJA/U8ZVfA028P5pvU7+uD1lxq4lLTnY+HOW5MjZCJiz4X+0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwtHXCJd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwtHXCJd"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eedc94d37so957454f8f.3
        for <imx@lists.linux.dev>; Fri, 05 Jun 2026 04:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659484; x=1781264284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFbJYflDDV02dtarv4YB5PHu3EiVcrVU9/w1VgU1PjM=;
        b=HwtHXCJdhQTWy/uv/mPdDzpzJjaROR9RLjLQvAPSwRb1shN9AKhAoaroZYsfl1hPq1
         yzSbJY/1RVqDis063ji+MVIFmuG6etP/fXhEdVDg8rIhwR9QzNX6le4aw+n3WTPdKT6f
         Fr9n++jLdH3BkEXWUBR4Vp0Hhh76PeH1aAD0DQkPRH/X55NyxH19Sr0sDQaqmb5u4X10
         2bizaVKiQ80Rp7Yp0UtyJiBa4fbh0coHPo7Atwr3CrNgmc4QpI/6DjMhccJ02fBYQ7GL
         T56ZCXf5X1jlkfHrGFx+Bm9XlEmdGQi0Udab+XFnV0XHZtrMHKrwNV2tDPUKMR0pSBCt
         Cjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659484; x=1781264284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFbJYflDDV02dtarv4YB5PHu3EiVcrVU9/w1VgU1PjM=;
        b=aOEkBZplsZaG0lMlnQMdWtj2OLBCKFv+3C/AalDDsUVEp+U5PMg0UpHnJYFLBfelLr
         U4SY4A+byqcAPRUc6B938JhjivkwC5ooSA5cXhW2Zz3I2GGQjvY/hwwEqof7/uLM39z2
         L82DwjAnz9vRbu0xL7OZHFDIl1Vm/IE4hO3FH0l9uE9FdjffUkowMYqdzZTCfWhbtNRU
         6fiGdhFYNksgwhAsjVpUUTOov7fraciujd46Pd2OqZ8I6FsQox5ASsfvK7ciyV7/2lXW
         YGLjpMu3lx8AbXs25Vd9zHgvq447t6cfJIYUli8AdNze1IF+Tyr8OgbnhX9yIb6Dm8VS
         hqwg==
X-Forwarded-Encrypted: i=1; AFNElJ9rpcUv8DB9uxlHfg1tboggrDLzaJz9V93e28aI64DdiSmk6uoTCwu5z/5JVR63YpnpH/M=@lists.linux.dev
X-Gm-Message-State: AOJu0YznZX1shpN6bb89xvw8vfWy7ds/59WMufuxDvc5/7wY4Up+pbyF
	QVWCSSZZDVFqCl06fMZ5qeuwjfQMYWzoG6v8+gv17QzC7lziyLH1s9A8
X-Gm-Gg: Acq92OHLeqYO7LP1yxdvrhpzVVG3AdD4rHLy3L7ghD/A/zT4RxTVZjmp7KUXavWi4Li
	6fscdl5qDNcTXqmaTiMjmN4lSy5ApyllPXqeV8Di9xYtvQ5TBI8Qsht0aE0Gz0wJSNrD8Wks0FF
	alHiG4pT6Qv0A6LnufYy+POHXA8xF2z02dMb7mi6RwyvmptwC0w3gLSgXuxZ54OqfLgyGlJ054n
	8nNJ56MyDdmRBYNIDdNPcn67sRcxxsXEn5quym7yCFtKU0BilTNIe8wP9Zna868PXMy97b1Wb+a
	OAHQgnnNadglLbRwxLJQifZZ9GV3bW7qeW71eTyo3tn5FDf0IHCIy4d2mudRRLQrJ2Y54OSpdNE
	TCCf6r5rVP+Ey2R+TD5nPyRMy7JSuDcc+Ga4GTeoGhdscu2dSBwjy2RuVAJf+0ZjCgtb+m3oSPZ
	HKACrZeOBm51VL8FHUFHEfk8aO8YyfSPa33FdaG91QsKzj1LetuqsUUcB0cGw8
X-Received: by 2002:a05:6000:a91:b0:460:1755:160e with SMTP id ffacd0b85a97d-46030757dd4mr3877576f8f.33.1780659484157;
        Fri, 05 Jun 2026 04:38:04 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
Date: Fri,  5 Jun 2026 04:36:20 -0700
Message-ID: <20260605113621.1479-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Remove some of the remoteproc reserved memory regions, which are currently
not being used for anything. These will be added in the DT overlay
enabling remoteproc support for this board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..f9b0e266754d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
-- 
2.43.0


Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9570823DE8F
	for <imx@lists.linux.dev>; Tue, 10 Dec 2024 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828242; cv=none; b=Kp1j7RSsstb2RlvDcKGZ6hBgToPnAgCnv2rVjCPZjSEhCFqzvA1W4VBw+sfhPReG3CXzyHtxF9duKvUlSliGvc27KW0CNul96eMoLfMTq6i9JoqaWP+qMxaGvXBvug7uwgbAzcsikdxhbI+45E4SQrKA5R+E1dgvfo03BueKYEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828242; c=relaxed/simple;
	bh=5xuJv86INUped5uDGlXBGi7TMcuhOLOC/aMff07MUzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JR/3WPC4u/XakUmOMcip2z97teiz7uAaTC6qsQJEHuKg1oWmUA2dBBF8N3kY+eDtTFga5xfwD8JRFzlNnNDIH3Ia83ydDi9yPd/QR35sObfkZc5sJCi8nw48DNsUyHNRPwo/Tn/22ZxTHeQ4HTTSiV+8KpFFXdewUWN2OYGi9Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0tgtfFq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0tgtfFq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2161eb95317so34823015ad.1
        for <imx@lists.linux.dev>; Tue, 10 Dec 2024 02:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733828240; x=1734433040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAzIOGNvVkOkwBb1FvOdH3YrtXy61Q+UrPzyrwYWppg=;
        b=B0tgtfFqrtzWkaXDn7zcZ2OUhT51JDTWXLQWkoUoZWQEmV2Tugi1aghm4UvMwg3B17
         +6LjtV5WdqP2OU8RN0DTExLU4ktD9SyV+6x+/QX61IDjSAmispe87w/PTt+ImZ8XEdOk
         fP2f0qXgMIUzEn2QDURjjtOHEZr6k3WW0pVNBpwcTEwHRdWaFQxSRmOpWJ3P69N8dOzR
         CU+W2T08DzQICuHyXW6Cj/ABD/jgVryR1Gl8H3XKokkSTPojWT5UPQ3iJog6r+Nk7omD
         5CNKKq96EyKj/l9rAnJpbWe5SRg/Qe/H5ynz8ykZYGTq+oVDPEB/aZWvC6f/qN/EWdQp
         krKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828240; x=1734433040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAzIOGNvVkOkwBb1FvOdH3YrtXy61Q+UrPzyrwYWppg=;
        b=qBH03CE/19nPTAnKP0/48xWzt62r9JroxfPSfwJlUuDUvM2WVku/LHf8fov6bI37J7
         24gaWYab1sZyif+PrDu4REkAClXEUhEcZB3fCmxaL0e+6wky/G1P8qtiYrSYsdHymlkj
         eDPx/TadArJumB3HtMYShMGNAGErNReSlLvohdz+r6tp+GD7FRr7+UL2u/YCxaLcUxan
         /6bM9ovc53vgw0qYpSnfG2rkr1lHiV16BjPzh2jLkThI+tEZfWcxbq/Hg73tcIpjaVmJ
         ncTQg5qEj9BkRA89dwm4Z199cmFn7GVteUaLVt1uR4QoAs61ZVDx4ecWsHVx5BHk77de
         B+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHF9oJcgeAmBZXoG+YqGuKcHe2ETjepqsNvsVazjL3GSfv/OaBqWGN0cDdwmOaZPhI3tU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJErvqk9WfDJE36boYmx/IeNUGVqTd+Ui0pe6woLstCmX6dsTr
	18wnyoj1OtmQseyOybpE2mlgsztGGM0y/0Ib+4YPa5710Cvn2FTc
X-Gm-Gg: ASbGncv21Ha1QL1fBgP/5fHU1LEgdl4PNCm2QtjBDEv7AQwG8sbGuhHCzsC/GGzXh3P
	FkbBFLpM3a7cKAs9JwVbC6PIszODPuavKdVXGjRCGVc5tyzT16oOUo31uibPyHIH/GOYrfDtRKv
	16pgsVSrMJOzvscoM9Kc+bMnZfRUiZZWvKHxF7OHlbAQa4knXQf+FUSqqetmrxiSBZ2EGB1Qkye
	omAYG+kBbOA+de/ac6+iEu6fv/qUUSSfbc9xDe3IrwW6cd1E1IbE8IuurnNMYVw52on
X-Google-Smtp-Source: AGHT+IHSsGLpcfdmpEL4Mg999asmKbIgDSP7cOPD03IZvcIVz1bYQgiRC4EJz7gHrP9fENJbgq0a8w==
X-Received: by 2002:a17:902:ce88:b0:215:4a31:47d8 with SMTP id d9443c01a7336-21669fa3baamr61082485ad.9.1733828239875;
        Tue, 10 Dec 2024 02:57:19 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:23ed:f795:ef82:746f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21615b1e6d6sm71068955ad.104.2024.12.10.02.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:57:19 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/2] arm64: dts: imx8mm-phg: Add LVDS compatible string
Date: Tue, 10 Dec 2024 07:57:05 -0300
Message-Id: <20241210105705.116116-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210105705.116116-1-festevam@gmail.com>
References: <20241210105705.116116-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The imx8mm-phg board has an AUO G084SN05 V9 8.4" 800x600 LVDS panel.

Improve the devicetree description by passing the LVDS compatible
string to fix the following dt-schema warning:

imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of
['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05',
'chunghwa,claa070wp03xg','edt,etml0700z9ndha', 'hannstar,hsd101pww2',
'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Added devicetree@vger.kernel.org on Cc.

 arch/arm64/boot/dts/freescale/imx8mm-phg.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
index 75bbedc6164c..a134b1833649 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
@@ -82,7 +82,7 @@ reg_usdhc2_vmmc: regulator-vmmc {
 	};
 
 	panel {
-		compatible = "panel-lvds";
+		compatible = "auo,g084sn05", "panel-lvds";
 		width-mm = <170>;
 		height-mm = <28>;
 		data-mapping = "jeida-18";
-- 
2.34.1


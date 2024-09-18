Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE371CA69A
	for <imx@lists.linux.dev>; Wed, 18 Sep 2024 18:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726683747; cv=none; b=dVZd9BHCRWDWRAniSBXmcToSGMdGtcWi4CzJXuZclyHlHX1XIFELJij9Zhhrwk33C7n49h0rNqqnC+wjzZvPuYFqe0/54xdzouRHILrw61oCIfbPnhGB6zGCWTtU9EUjesWrRvrHlVr0zDA8RZK8YNWrtF3FpOanIhlMRPE83h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726683747; c=relaxed/simple;
	bh=DCbRa/f6lAB68JZc/cfg6LOcGdUSng0Pa8LcCred/Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UfWMeK2DKjGzk9EOD3qUkW2468S1KrT+Qr3ph1SseG7jXZU40GwiFuhh29MOro9Hypd20Sg4kXIASLFe6W0MUvc4z9V/VZfT3alFlKwQYR0ELpmkBvaNc0Sl04ZQwsmJBL6ZATRbMsocF76vJTP2cxjWHBLlhrCbhdPX1euSBoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rf6YPo8W; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rf6YPo8W"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso70132595e9.0
        for <imx@lists.linux.dev>; Wed, 18 Sep 2024 11:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726683744; x=1727288544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vwtyPA2l11CJb7SVjnOfGfynXGLzK7+CceW4ZxmWwQ=;
        b=Rf6YPo8WtXG9HV3jREtQtEOZCJ2u1XX2089VeGu2q0Beu/FtjSBHlnx0YddC1cHqDN
         UvqATTG1j5+C6gapj2LHW+IFgESq80DBAC/aEGDZy0zwdOzMWBkAuiIS6BLGIaVXL6fV
         LaHDBLQXF4G5SGWJ/kF0lOJD3BhaGRrQM/jKDtErQ1taMNrfQuCaziUJj5nUokL/Zb2a
         0hqWnN+4pwAxc6DXQXZ8c9ZsQ9bHBJGnbL5t3TbWZFAHQCbQhijU+vf+oqOxBfUFDaO/
         UIhDG80A20p9L9Gl3LzbYXaPrSo7Ma0mX3WxpLKe95rGYqAMpRTeUp9PQcAkbZoaaygJ
         7bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726683744; x=1727288544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vwtyPA2l11CJb7SVjnOfGfynXGLzK7+CceW4ZxmWwQ=;
        b=j+sQZSm7g02RrSam4tbRT73js0Bv7xr5WLI4JR6tkpZwDMDqZhqbmPU6bvOt3A3Smb
         JxK0y9KCbRFswv7gOH+bozNXS6SAwv0OPabR6MPZku2PahIXu7xykDD1urqlsGrjPQ2G
         DBBWvTw/A5qGEpY9CmFfcJaPIevWcFLKHWg6uACxX76Bm/ydQ3OGsW4Gwxa8yf/HOldd
         6qsuNbDPncVZ+Ir/apnRMxmhmn+/Ly92zEOLyAeJyOXJGkDR+FbgiIUiGmSe2eP4CGTV
         jZllVcopD8Dm22qJWm61/WNJlMd4shqV5n9psRfny3ODbz49YRel3B/OjmzSzomD4ONH
         bRog==
X-Forwarded-Encrypted: i=1; AJvYcCX9XlswOZWtv/isVxu1tYXq5kwQ5QSf/z0A0QDUWYXlBNPQuPD4vpFwn4AYoNbwWQSLOAQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbair+5uEFi650kG9HOd9ClysBlnTeUaE1cZ3Yf/aOYCdYT7cy
	zNJH4IlowU/UCn0mFc9f7BsplfAweiyJ74zQCo7ksAk+ihGGyVIP
X-Google-Smtp-Source: AGHT+IFrPlkg7pCSWwwa+h63rcteR1uLcfkEtFxNrvhuLVGMph3cB8EcAFzN/c5f2X/C6FPmS+VNbg==
X-Received: by 2002:a5d:5c88:0:b0:378:fe6e:50ef with SMTP id ffacd0b85a97d-378fe6e51c7mr3605756f8f.5.1726683744042;
        Wed, 18 Sep 2024 11:22:24 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb5312dsm5200146a12.23.2024.09.18.11.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 11:22:22 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: imx8qm: add node for VPU dsp
Date: Wed, 18 Sep 2024 14:21:16 -0400
Message-Id: <20240918182117.86221-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
References: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for i.MX8QM's DSP, which is found in
the VPU subsystem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index f8b577ebdbef..ae0165a44dcd 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -581,6 +581,33 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 		clock-output-names = "mipi_pll_div2_clk";
 	};
 
+	vpu_subsys_dsp: bus@55000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x55000000 0x0 0x55000000 0x1000000>;
+
+		vpu_dsp: dsp@556e8000 {
+			compatible = "fsl,imx8qm-hifi4";
+			reg = <0x556e8000 0x88000>;
+			clocks = <&clk_dummy>,
+				 <&clk_dummy>,
+				 <&clk_dummy>;
+			clock-names = "ipg", "ocram", "core";
+			power-domains = <&pd IMX_SC_R_MU_13B>,
+					<&pd IMX_SC_R_DSP>,
+					<&pd IMX_SC_R_DSP_RAM>,
+					<&pd IMX_SC_R_IRQSTR_DSP>,
+					<&pd IMX_SC_R_MU_2A>;
+			mbox-names = "tx", "rx", "rxdb";
+			mboxes = <&lsio_mu13 0 0>,
+				 <&lsio_mu13 1 0>,
+				 <&lsio_mu13 3 0>;
+			firmware-name = "imx/dsp/hifi4.bin";
+			status = "disabled";
+		};
+	};
+
 	/* sorted in register address */
 	#include "imx8-ss-cm41.dtsi"
 	#include "imx8-ss-audio.dtsi"
-- 
2.34.1


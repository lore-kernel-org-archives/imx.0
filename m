Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A06214238
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260661; cv=none; b=SuSM7cNOQ/TpFAxs9iusDAxohKYZ56chBBL5Zxnlu/766/qOaGfWR21gpkZHCk2VZaXabcqHRZ7yCx2D4OVmL1xXxgCspkKNOSQC2O1z0qf0WZp1rkmsVu40rIVHCPjZuT6h9NH2DFlG5RTISxD4IgYHycW+Ib5hdOmOn9cA1XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260661; c=relaxed/simple;
	bh=4aSgsjIeYzWkwkuOR/AWYX7fuYgXedeF//2piBL0Gzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4WnFPLmqlhcxfEMTATnp9rd/r4cNDruzrMn8KPIOL7mT2r9NDDB2HK99yprUFcOTLteH+Uc2q+iQh4RAWeVoTGqeKJp6ga0haVUOhGW5UcHJk0j7hX2NMe3PzdgiDNfkY/iOo0YsiN22wFoBsRp66cITuuNLIChCrHNhDNQb0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RUv/ZdFW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RUv/ZdFW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43690d4605dso3334395e9.0
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260657; x=1741865457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOVqMOdoYgDbI3s4q2wNweWZOHmBh2nVQMXWQXaXjpc=;
        b=RUv/ZdFWjBcM//Y1ab7CRP0OkTLSC9sTTW+w5Rxeozx17jML8w9Yu7BYukd84iMRj4
         aevFqju8nUlZkxqStbg/QZVGHRlnbiDRC+uIqBDsjMlP6a2TCsALE3t8mMzRZazOj4uV
         1iJijfQZQ2qx9L0Re0QukpatPDSwB1kfoXNm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260657; x=1741865457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOVqMOdoYgDbI3s4q2wNweWZOHmBh2nVQMXWQXaXjpc=;
        b=CUDXJF1jKeVdv3bNuaUChYwctei96HFFklhDnmSnEHtU6oIzjhPl9EOoxNVhciA3DO
         ge6EUt+ohKAlsXYp+1Pew/gBsEZtaB1O+WTmKHRDferkuTags0+cZnWzJYGyrXHSqXkg
         VDpPcQ0NEetKN47VHEZXdsO4DOKsgnPHEIr9m0D9d0g0lDA2TM4ueUcKAf4sbTKgtk1J
         2APMddjOU0s/i4Dp3RrLWElPVU1TON20HYUrhlKS7uAz6VIpEdiIuu/0yF0q4CccpKWA
         3Xh1kzMNhoQraoO+zxH9V7LPpU39II2aqSI1Pbh0b8rRluRZJ1nzLwrbUuNIBgmLovVQ
         LmXA==
X-Forwarded-Encrypted: i=1; AJvYcCW2O+YcJyCeFTzN1JKzouqaruQlEqpsTQqJgLWYp24f/AOQVW0U2lRyuK4PHpGX4x63038=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUtO0fWL31oAuEgJ/bDjCu/olFdWhq9w+ZoPkEKOLtIS1ly+yY
	PPNNRBNhp+y5oGanw/jqEcZTLaJE+oQhQIdlOtbppmj42qhb5T04/Qrc9Ihaefs=
X-Gm-Gg: ASbGncvakFxPyOpECa1PcWiEN8JQzYuWKfUQJkCesOsx34XTUqSkhqznu0O3Hk+VSQC
	nfM0g4h6NYJU3wdpKfEOg14x6AKiEHeJfnpv2f0fmevlV4NFHRlL5TzQeXvAjdJrbNY0vzIOM2k
	tzY+uIqAo91b/uaVEYFoogW6owS9W6MgBHQmqzOlikVdNcDRGH5SUAVrKR9K+sOvzqgJHVJYaMw
	M7+umq6Z+N1drttfZbM4RGSZeQwcGZx2tGWaMUFJwT7qt4PFHq9BVSXIe2pcpUxUInYI24365+E
	xt8cdYErTQDJO880W1LGqoDSECRpHJGtGCH/aHSPjvzRIk72qaveXHjHI5x8t8VLfTu0ZB7bJ8m
	NMZcpdw==
X-Google-Smtp-Source: AGHT+IFgPl8ZKMnUf3wGRInXWeZOMK2GwX9o32ww5mgLwS3armZaCHWO1p7ddK+A7zbcx0o2y6edHA==
X-Received: by 2002:a05:600c:1c09:b0:439:9946:af60 with SMTP id 5b1f17b1804b1-43bd2ae76c6mr47045825e9.25.1741260657417;
        Thu, 06 Mar 2025 03:30:57 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 18/18] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Thu,  6 Mar 2025 12:28:07 +0100
Message-ID: <20250306112959.242131-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v10:
- Drop the v9 patches:
  16/23 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  17/23 clk: imx: pll14xx: support spread spectrum clock generation
  17/23 clk: imx8mn: support spread spectrum clock generation
  21/23 clk: imx8mp: support spread spectrum clock generation
  23/23 clk: imx8mm: support spread spectrum clock generation

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings
- New

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..eab05170442d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0


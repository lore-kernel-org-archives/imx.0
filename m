Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BF626A0D1
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388209; cv=none; b=oSOrLBxQXZjERcJfRlCLjxNjA1RavIZVxmShBeKE/e33ZrgiJj9W0/uzY9p6O3L2C3kdbSgOHa4PheO/loI8avfB2cMFCSnOc8LpHfm8cFRRRFqcJ9EAqrD83rtW1oSaU12O66/sHuKf3a8miIneLuXk9eMWbERiEupz6ztjTXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388209; c=relaxed/simple;
	bh=6KSGxPUnS1mPNRJ96C4CkAbWKnuWJ5Byr6T4Z3L2c0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdG1Mh8O5qQh+2Ufk/gJ7RHSEmeqyUYyEgEjjgQ9nv6GaE/WhMVWm/ZcWJhN81MhjCOJa7/JJ6TFNcq3C70tKkmCrvgnkCiIqQgQg4e/nEi1AnTEakNBTuX/j5/BYa8sHfyPhs51W0cv4SERk5AiIyOBjz2jHhrB8Njy5XKrmi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NdO6Jcqd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NdO6Jcqd"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2c663a3daso980261466b.2
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388205; x=1745993005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwnDSUvK6FGHCaa/OUJvqxFp0aKtITa+jYSMw/i6jvs=;
        b=NdO6JcqdQZlEhXHTI1M9rd7FKtAYIFtfAz9hT+GHMSvM5b7yAPyMvS6mCySCeTKL49
         h3pbDqnQ4r3Tdgcv1+hT7XvS7Jvxh0GPTcgaDZz8bN2uEQcILhzDCD5Adl6Jdh13eDiD
         PwOkZvCfIG5I3H7zmWJqSd1tMtghoMUsRnVAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388205; x=1745993005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwnDSUvK6FGHCaa/OUJvqxFp0aKtITa+jYSMw/i6jvs=;
        b=H5J373QZ++PF4ir1qqZ4el9OFEv3HK1iFkbNHyrHwd4XfL16RDS7KGh2ELh+AIQM6t
         MuRqef4F7FJAntchVW0RGekIQpkhZ6DXRpoI9YdFSwXmWB6xLRYPYFyM8zAEEf8Vnbn+
         h6g8/YPgalPx+1TLLhhQ/uy1A16+IuME5YQCm81ZaEEbqAi2dPNtcynzq1I6D3NtFna9
         E4RrNfF2RM+V5+XJnsyDWspVAZkOABltGoLi4eRRVXy6De2H7uAu7JeWAMzWVlzdx4+S
         4xPlgK+4HK3r+iqVzEV+rRInKSBHbbbqIiIzFxWGx0oN4sE9Nu4znGn6eZnCvg0Bex+1
         qMhw==
X-Forwarded-Encrypted: i=1; AJvYcCWeahmOw8exeAmmq365PmfbThND/4GOD7Ydl8aWTAMUrW96IBIFK+JgaA4egKjfCg7ZMls=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyRUaYB5vLzFoEyJFoz7MuUYVzmory3tHc956nto+KyFhEUaXW
	Fh5GQmDw4SX4HpORRoDxZs1Ou0YqvYAkgqTecHCE3KCNt4OkOl1QW2L7LvqcQHc=
X-Gm-Gg: ASbGnctQfzmzasCDWMoL8aIbkIZ18wzxsy3vfeeGhCdOytVIO2+BejiAEaFt+GNooE9
	VRNZwaW1x03wRyZNlkM3fM50WuMfmUEiPOiOratXw/BKXsAaL8s8XZRUmO16lAZRD9Nnj+MbSUC
	a9Tj/g1fKw1BHTYshS1iTNlCKm3nejEJNXJ0uOC3OHvDFsdjIw2dcHpTvCVt82phL7yntxNT6vU
	0V8rRIp+k1YM+2b7udLg5/r6l9sK0PDMG+MjihBt42DwfUPuwDTl2Dvd8pUOhSmn0q3cjkRdy/Y
	ahqgEqEmJfdbSHuWaJtou5kOOWsx/rXqL0uQ8iBNsnqknXCbR1ipwHGEL7jAwDWPt7sJqXRWzn6
	A8ZOqhkr4chLKOhA=
X-Google-Smtp-Source: AGHT+IGsUxDaV1VG5VEFOK4UELVg2Pwf+4jwnx9ulQMNovrjSuWKEHY8T3Kxuf+EnYLtMT72UxcKgQ==
X-Received: by 2002:a17:906:7c43:b0:acb:b381:c28b with SMTP id a640c23a62f3a-acbb381cc4dmr568952866b.47.1745388205316;
        Tue, 22 Apr 2025 23:03:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 18/18] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Wed, 23 Apr 2025 08:02:35 +0200
Message-ID: <20250423060241.95521-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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

Changes in v11:
- Fix conflict while rebasing on master for patches:
  13/18 clk: imx: add support for i.MX8MP anatop clock driver
  14/18 clk: imx8mp: rename ccm_base to base
  15/18 dt-bindings: clock: imx8m-clock: add PLLs
- Add 'Reviewed-by' tag of Peng Fan for patches:
  11/18 clk: imx: add support for i.MX8MM anatop clock driver
  13/18 clk: imx: add support for i.MX8MP anatop clock driver
  14/18 clk: imx8mp: rename ccm_base to base

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
index 78d71aacd0a5..212596927f0a 100644
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


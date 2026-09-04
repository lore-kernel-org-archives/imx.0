Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B6453A29
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516773; cv=none; b=ZupbRAwaZKgeAigJGCzAKqsueUp7rZlF8XNueVPKtojeDC923yJEmrAsRDThugmJyutqU56cwHF4M8xEk1p9xHScccS1MUVLwKXoZJ3xZdnbF9MSnHFdF0b1XEGJqDTGCjlRcPI6NpdHC6IFg0Qi3jzJqgs4N9ePULrryaARoCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516773; c=relaxed/simple;
	bh=iguEiGcH/ezFs4Bo4isq1Q5LN9dy7pu9TwwJTw0C/qY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eqrNU0fMP4rbjbeSizkMppCVGacsk7bw1i8/OjsAKty7uF5oN4dPVZwCnCYFAEZM7fVI4Prm7Z1+a4/dbwNGdr8EOZMzJd3OwJXqmbRr+L2Hn7OZ1TEIB2aS2JPzbhjfAZiUmJysjwJ/WV1WAbyGDFfjKYjkvDNGjGC43Asw2r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=b9HA7x+y; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="b9HA7x+y"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48436216a98so514144f8f.0
        for <imx@lists.linux.dev>; Fri, 04 Sep 2026 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516770; x=1789121570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GlZLcOq/1TKQQu2gibplQv4pt4AVLjA4QI65SUIoMs=;
        b=b9HA7x+yOAEYWHGPTpxVEdsNf1V/bcZOxTHQW22/hfNGk/ykkEo1d+LcuQhrYr/48m
         3nc13d4G51FZR+5aEabg4RXA/s1qUxQxond0WuGGQluYXUanta6xmkoiJndzGts73Fnd
         91qIpTmk1prFiwz2ftrR68XljfFgfEizsFnWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516770; x=1789121570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GlZLcOq/1TKQQu2gibplQv4pt4AVLjA4QI65SUIoMs=;
        b=M5EYuh+/qmfBLdQr/zJmtvxyjovK/NpiB9U5dPfVxINcFLpJE6hxfYoPj6RzfVgFvR
         BBCc//3s5B3FqQ1w2FT3cs9wlgVx/mw8TQsEzQplPhAIsVJhOuINDUQrAlo2hzJWyyGP
         mAOQ5r9u/jYH+GtZamYfanfFFjfjsAlTY7s2sE4v/jfbC/LiluySDdb9M0Z7RI98Dk7x
         c2u1425+dFwr56wOq3Km4PcQKPO7Gp1t5e7urpCYcCua0MuMe9Upao8sP+vvogM9dT0K
         9/9GiA6a+f5DAPWYuDJBA7DhhfoAgYkjIG0ity73/V1N+sGNfugg1rNVb6d8i0j1CIwS
         oFNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMJTdMyA8xHlYXSryrWi/Ow4dreGTnBxJusCTi+ewrQwfbzrV2TB72UBCpeQUb/YXyFlU=@lists.linux.dev
X-Gm-Message-State: AFuF++mMULwz3/jPSVDQLmk+1QwFfxe9VkW13iCDde+BZSXcFUcZPGjy
	W8N7QDvvs0+XiWQHQ25nO/wTtOY07v0o0PjULNdS+6aR0kGFN0tmRrxkDyZQeSM92KI=
X-Gm-Gg: AYBFou1oYotT6ch9pwn2ac+d2BDKQw82eVYW3P/rv87UHbyCQ/OQHteHN2nCptdqoJs
	ctxpNJb6TXvW/JJG5W+43qezxkxeGH3xq67OWtUDUGPh9l7rNY7wbdNkmxdRqr2Yas6I0sdGZId
	tj/w8mSNc9NipO2N18PoNXXg+xhANbs2xBYoMxxIzEukab91+Yg9PfImazXOhC7kTP3WS5aa1wp
	I0eLbrZATbiFCD6Op9M3XdHkezBf7lSavqJJ3bYirTyFjOQW0dbIK5+JqWybyCCb0LQiUTeO9s/
	ZhGKj2FgrgTIOi0OwxGA0xt8sfRNFXy4fo8DE4wG6EdTkO+hdk7c/d5oGjs3Vx/8yU5vlJRSKjo
	wZ02GQDF6+6daxSowNLyb7UcQpcPJA+uYuEkpzNaqQGHeIDJobVy1RdpLtIcSKGk3R9miIY1mJ9
	vbkkj51akxmQ656OnCg2xTDKredXN84g7e6VEQbBP0zmhJ/CTuP7sGOt1cv+mPEwWU7MXiuEskY
	zHBzHGewY/ok1/bQrRwKdpvbgjWW+HdeJ/VDfoaVIeUJISjIxhRFm+XwyfhqNUzeuz08pPczZ1Z
	MHWBSZjZPjWZfbBOMz25HsFzaKyr947+/nN90qC9Abs6s/6C1XZJuWU=
X-Received: by 2002:a05:6000:46c8:b0:483:ca4a:530c with SMTP id ffacd0b85a97d-485872a5523mr6326417f8f.18.1788516769126;
        Fri, 04 Sep 2026 03:12:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v14 0/4] Support spread spectrum clocking for i.MX8M PLLs
Date: Fri,  4 Sep 2026 12:06:29 +0200
Message-ID: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

While at it, it validates the spread spectrum configuration in the clk
core before it reaches the providers, and fixes the i.MX SCMI OEM
extension, which converted the spread to the wrong unit.

Patches 1 and 2 are fixes for 7.3 with Peng's Reviewed-by and do not
depend on the rest of the series, so they can be picked up separately.
Patches 3 and 4 are new material for the next merge window.

Changes in v14:
 - Move the fixes first, so that they can be picked up separately from
   the new patches.

Changes in v13:
 - Add patch "clk: scmi: reject SSC configuration out of the OEM field
   range".
 - Rename patch "clk: scmi: fix SSC permyriad conversion" to "clk: scmi:
   fix SSC spread conversion".

Changes in v12:
 - Add patch "clk: scmi: fix SSC permyriad conversion" to fix the
   permyriad to percent conversion in clk-scmi-oem.c, reported by
   Sashiko AI review.
 - Fix issues claimed by Sashiko for patch "clk: imx: pll14xx: support
   spread spectrum clock". See the details in the patch changelog.

Changes in v11:
 - Add patch "clk: validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.
 - Fix issues claimed by Sashiko for patch "clk: imx: pll14xx: support
   spread spectrum clock". See the details in the patch changelog.
 
Changes in v10:
 - Drop patches 1-22, superseded by the generic spread spectrum clocking
   support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
   is no longer needed. This patch is now based on the following commits:
    - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
    - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
    - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
    - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
    https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

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

Dario Binacchi (4):
  clk: scmi: fix SSC spread conversion
  clk: validate spread spectrum configuration
  clk: scmi: reject SSC configuration out of the OEM field range
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk-scmi-oem.c             |  27 ++++++-
 drivers/clk/clk.c                      |  14 ++++
 drivers/clk/clk_test.c                 |  12 +--
 drivers/clk/imx/clk-pll14xx.c          | 103 +++++++++++++++++++++++++
 drivers/clk/kunit_clk_assigned_rates.h |   4 +-
 5 files changed, 148 insertions(+), 12 deletions(-)

---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


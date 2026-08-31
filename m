Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BFE429CE8
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191293; cv=none; b=gX9CqVOCX0sY9AsdW4PuBHHAHh12ykGBu5vGcla/lo1i5RfmY6wER08T+f9xDFR2afsU2YcVkpet1X3oG/t/MK+tp2/5OKpCyr42ttVVJjRbi6nTRcpn5pXxq+16IrLolPTltxKkPBR1cMmjhRA61h73WQqLUOVYq4GlD4UYABc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191293; c=relaxed/simple;
	bh=mDc/wOCeEkqkQbOiB0yuDBTvbbSjVfGhwobrCDJ6veg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gp/Pn2pC+vYXKhnt/ov3zmi9oGe+G3lW8G41SH78LTxe6aQ/H9H1/p6uKPgUDgDAQ3h8DrC3z1BZsyloMouS5SPo6B6jGXI/Ih8Q0DOQDtXoTkf6lQTwftBtT19k3xsthgmhK7aHpF0Ydl5Jyd9RQ5UTnehJDQ4taHeUAFQkqRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=I6PFYIUc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="I6PFYIUc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49954b88fffso25305185e9.0
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788191290; x=1788796090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvbNBLloRSv8ElrT72fx3PwVc7bEOOXc32Z9sS23w5s=;
        b=I6PFYIUc/oTzk2gfSB/qLbdmNIYjroeQJ+CGJ7A088PxWfbhAQIerptxAF4gcuhrKe
         cpvF1kLg0OCAMOafzvICBQCWw/7rWWhrh3Q1rflb6pS6ZqG0Omr2qpSlroMjENUctox/
         g3iNTPusT27z36eJafhmSLsP+qiuoLuzScF8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191290; x=1788796090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvbNBLloRSv8ElrT72fx3PwVc7bEOOXc32Z9sS23w5s=;
        b=RYzePGQFiO3kMYWY3AnM9XJOeErq263jQzldaL8IKIy2QHYsyXjiIGZiLVNe2E32uQ
         53JODOx/z9MOCvR0VKQ4S1Xh+jMYb4f/XvINIcaNoz9yrR/gYiKrEx7FN8Ym5lhXuygX
         JuhQlYcQJOrzn8G36L872b9MkAaD1jCWos0OfT+XUktjCJEFj6PIS/lN7Kq4YNvpDcMw
         puR2OSoGWHppKKZ+kljJhja808QBsEwDdRkGRzJq7JgysJYFXomd0LR2lHdzVtXfonYc
         uzl+Z0Gfip85Q59VHE/MOZULT1243KVazq3nxvre5w99nCq9X+14fILTdtoJjbeZiCkY
         KXvw==
X-Forwarded-Encrypted: i=1; AHgh+RrWid6VxlLCSBu6c1MQIhKDy7YLrxVG3mbICsmnqINKh6CaTxwBAKUmnX/g5oUuwdNWVEA=@lists.linux.dev
X-Gm-Message-State: AFuF++m9xxiwoK9yCXECY9KaMcwT5KAHMr7Bza266dx2r69RBcT7WPcf
	mf3IrjYmPWnXARsUGqnG6TKAmN0xllKMc6OxKudjhXYGEDlIAmi7fekGsXuKrhybQT8=
X-Gm-Gg: AR+sD12HcdCicDoJ7Cq38sUtmBOaVf/08zyw7u+cmIXAkGZqMxqLWLVNvrYsY2Av2BK
	j9Qcny+5IsPZotYKjpnvSxg0Hj7XvNk24zFe8xZN93Syypxv3vsI6MGPBOCrjEb3Cx65ynB6mPC
	O8ukTyjYW02Ba2Bfexh8GoCaeseaUXr0r8rWar5z9Iq/bdwnXF97FIKCKvOUvEG3h40l5blFVGL
	LD9EgY5V29CUhIleOKep/oDNIEaqzkUtS2o6H3VOVuu2iSsU+1Mf0JXQBF3OMkEbp2P5mhJmD1j
	++wdAtbkfiEp5GbaEwqwcd+zWWc2TnpeuyyVSSaljNYrRecHp1Y05QqBn9TM+1nszugKf/sWwyB
	S0kOJ1CmzWgK9ponvwF0YVX5CofeZK55ghLDsCw4tm4DEvvTLsBS7ZO99zWdKhOIADvbJiG5HPs
	e98+kbZkoHzfhbVq6mMgFT5n9sPl48iWcNFwtrX8rlhrmCOR5D3P6N3KyoajSZwDzEUYl1f4eGg
	LutrQmEwjQpk5Vs4FO07s4ay1p9NwWj7Ngu+mKEmG5QhqT2PbV11ZJ8y41fZ3O2GXZkku7RUWsz
	4NkQAnyYbjqsc4qw7fC10EYFgJkmQpnheAsF/AxwhWbehoJGooUI7rnl2hkW
X-Received: by 2002:a05:600c:c490:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49b91c17294mr422161085e9.1.1788191289687;
        Mon, 31 Aug 2026 08:48:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm220191845e9.4.2026.08.31.08.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:48:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 0/1] Support spread spectrum clocking for i.MX8M PLLs
Date: Mon, 31 Aug 2026 17:27:00 +0200
Message-ID: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
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

Dario Binacchi (1):
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/imx/clk-pll14xx.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


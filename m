Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B5C477286
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253784; cv=none; b=LGuCNHtrEGeY3CiY+854drZvLi09FsupA3hAI4DcHd0WLhWiDS40hkZM0rg5EInc4BkP1DCoNi3dqk4wRRPukLu2mW3UnaL/quscLUKMdr6Nd2h+7JZVatZbDZ/kgwP7kGLH60x8xvTzyJZL1Gg2DBgqpQOkZRh9Lrh2jW3ykAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253784; c=relaxed/simple;
	bh=s7OwmMd7z/CvhHqL8SqrmB96oUwRDyMihyU61UF48Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q317lE05oLLlM7tqNQKbLTLmHHSG68KKEcaD3g5tdUeu+FOP4VsFUe4HyKHa1lUgkFczQsM8kiIISoIQf8FPWNVALLm/p0djFPCrz5nfCZAUs0QLrz53yfV4BHdBKugjCnBT41wbzgJaT0P5qcNsElECAxhFlkgGr2wE4BKppD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=S+UtY6y8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="S+UtY6y8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so31976485e9.1
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788253774; x=1788858574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9TiGLOlBJPaa6ACMJt76ajLLQMGHpzZnyu3DaDv9wI=;
        b=S+UtY6y8PUNfH4HtWleADEBWBBJKjaCKaDzVrTTIAAScY6izyZfloShKx7+ynAKxyb
         jVIfFpeL+etvg1RZNqG4p2TlTEVvELg3SV5YflVWG7HaEFzhQ7vRmYvFBSuBX4jonSCA
         npQPgmtX4jFeCTXWpQJwkNibuclvsL0ZUNu3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253774; x=1788858574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9TiGLOlBJPaa6ACMJt76ajLLQMGHpzZnyu3DaDv9wI=;
        b=Y9aCpx16QeM3K07Gn3gR6ZE1Rj8CkajwTOdiB5K+LWEADBWGQ4+E6/bsygts/C5j7K
         ckBGeFdn35AW85rI6UZbjrAdLAVyj29t3vpf7Uj81BM9+lqeaLQ0yMr7IyimZKLfn45U
         m+HKHjzYqlF9yhw3wKX0arQC8Gi/Qc3Ag/UZyN4UyUWv/lnqjyFMEkWtryfiYSyj2gZo
         Mpaf2lz5hOou/aZZ9k5/nlHq2BDd+sxlpfm9YAotJ+4ojwvVn9rqVKgJDQGEiQ8+Qee+
         rJ85KCtG1d/CQFr60fVGK4ckI84zqsasJDFWwTZ/UZXBYv5Dem7sFcskPGjJNEZjeYj9
         YQxw==
X-Forwarded-Encrypted: i=1; AHgh+RoAFKFgxmWvjTZwP7nTTup6jX0gDiEYTnnmm3dCsKzeRlVtTDTvwg/eF6zDdrnCpqWgX+I=@lists.linux.dev
X-Gm-Message-State: AFuF++lhD0iT0bYC3eoMVQ+sT7ncQgdwwXlb8oPAYYa62CtU7tKPkWjI
	SQRilOLWdUE+6qdJ+ROGL7zH66hsXMdW0wmV9E6WqHpMKLU1pot9Bw0kJDxyyXfRxfw=
X-Gm-Gg: AR+sD11ZyRWIxdnv62WNORdA292xTadgGTc0WGmWSbDwWe6rSP/keS3dALtTNce66Hx
	9c3CYg2iVDpVw/y5xB8g3d/it+GgG5bbi4YScZXcykrI584RtxadxacuDijSXJOylOPeVeBhby2
	r2D4/eOA/4/7YKNCUuxZD0BcfccEmC7Dy5HeiV2PgVW8kdRwst3EFBqYEGdsdQeV+UYiyiWTn9S
	XyRcT0jtAws14/yoZAIV+tD2kRxPgVeZqme10hCjo71EzDW23tnKMeB4fdEl05WilydGvZIX5FY
	6H5v9MpxAP+KX4QaAxEjrjc7T8iYCHLfAOoD1ME9DXn4+YH9Q7xQ+XWPigVC61deici8WTweCOI
	HglAOSY0iacAzCe20vyxMdUuwUjmAzDAbj9OUWdsuvHH1CEjjLzcViSRbe4QRzSoRP0EPEfs6Tp
	qYGMX5ERrX2Vg+FuglLRXLl4rkJzP6BkF1iFaH74wLUjFbj9y4hmKQfB6MFA7fyfdYCiq1j7jKA
	m8pqDd6YzdjM14uIgb5hC4cY5UPKrR4X29meDUkpSe1Bluvazr4D6q7qwso4RMnnIPsagMFFRr2
	G+QRfWoyElvxgBSkqdjvkZRIgZCkyIosleAcNz3tyqOlPYlHO9bxxiCORNgm/SqQBw==
X-Received: by 2002:a05:600c:190a:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49ce1f13dd6mr5345715e9.4.1788253767752;
        Tue, 01 Sep 2026 02:09:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c425cesm3825273f8f.6.2026.09.01.02.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:09:27 -0700 (PDT)
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
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 0/2] Support spread spectrum clocking for i.MX8M PLLs
Date: Tue,  1 Sep 2026 11:05:16 +0200
Message-ID: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
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

Changes in v11:
 - Add patch "clk: validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.
 - Fix issues claimed by Sashiko. See the details in the patch changelog.
 
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

Dario Binacchi (2):
  clk: validate spread spectrum configuration
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk.c             | 14 +++++++
 drivers/clk/imx/clk-pll14xx.c | 79 +++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

---
base-commit: 786262be6048deab760f68c8acc2c85607165894
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


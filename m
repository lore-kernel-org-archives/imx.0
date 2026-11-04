Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788586;
	b=moJ1hxP1/xP37/i64LHNutJGx0MqzKIPn1Zw7yViTqQ+DIwSB0q1aZrulr1BvZYZ0bXH
	 TkCqqWmSZJN54a0j2WViOkyUbdka8Dwfwl/amN9PTrcRAcIIFcfblvDJGXerhykKF69mk
	 j1ZO32+LuhX1NjTAXD2WKi8Din3wrSlQ5U1gywOSiU1YhdrkSNF7BmAe/3/0wTBAfM/lf
	 s5wXTO1R6qE43AcWVna4RPOzqQK3Gxodf0xZkoQ8pj1YulONI0xwpqwmQ2RLk/A0dbT91
	 kOEoddSeN/hNid9fvzJEwCkDLXZipRYqTxmgY/EeM50i2tDim9gChzNPNzDKg9GRvCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IT2ld2hEUrh1U4ufhHP01T3lVawATcj2VlDSAq4lmcU=;
	b=jPBfK6RwJa9jCEbGdESiGaCvpn1ROjTnPB6RJS67sYDiyokGQKuwuKA/4iJP3LXFFu23
	 0jmvO03kBF6gsLqEvmMBRIOWbBvN0sDMecne0QzXpryv0I4z4StXj6+5D65gh5X7ew2q8
	 DdBcH3soGf6kgv5JysCnsgefAgPBpDwSRaxhLD29KN4gN13o7kq80OBSZbOslKJ/5r31Q
	 MYc0IUUjnBa7Pjrc027hk0d8Z5rRiDxuuPWKGYKZeeEJMqTAtOIz4F21ZVx8/bhrnZfZ4
	 VduKv6AdqQfqhOQAWSOEFLLNYo4DY9V8Vr4lFHnRjDQoJb3YIG+0XdhTWd36TQ0qlAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=B6iAYY15;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10889606A334
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 10:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10889606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=B6iAYY15
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so3335955e9.0
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 02:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788584; x=1794393384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IT2ld2hEUrh1U4ufhHP01T3lVawATcj2VlDSAq4lmcU=;
        b=B6iAYY15y+8/zZDgW7W9G69vF1zaxjpDeRNp4GHsm73+BbG6PcsCSDru7xWllLACMF
         BES4iGESKgziPNFooCBTTGw+yr2egmMM0AJb8b8Sc0JMuh7cGaOwK2BAIC3//p8hGQOi
         f+Sy/8IJcowEgHf8D5bb7kR4nIZHugH/8aRW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788584; x=1794393384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IT2ld2hEUrh1U4ufhHP01T3lVawATcj2VlDSAq4lmcU=;
        b=x32RUXVVPqmLK/yBr2q+G6JA1GEoE7Rjqt56Iz2D54hVCaOkUb1WPqljHLFtkmGT61
         gFSl63glkNYCHxuWlBz2GuAJUSs6bRuFf00VRrMNrmG3Vdm/QyzmGtqSp/4lXCrlM1dM
         Opqa5sPEsUDYe8Y0+ebc8BPTCSVnXzN8yWokh/bxRyIOa8cUQoHmLXU8US933B2yBJ+A
         q2MEYvbiGRcj016c64QNJGV5muwVemCV6GnepdH1hZAbC+lNo0tgfKZcqLnRT5OraoT9
         cvxDQ2yixVUHY4HoVJq66rgM9oy90hCkShdK3vUthStGDOCkrk6kPa0pHIorf4UOyreg
         CW9g==
X-Gm-Message-State: APuU4Z8V+oGXIg9s5wHtd7+Kqbu2461ree2VOMiXMlNfKIs3j002hpdm
	zMWNYTPjGRHez1+eT6qdNA/AsV/NWuyTtLWNlpbosStHaUJyQ4XHT/G1BsQFsKqdNIU=
X-Gm-Gg: AYBFou0JTGC1hb9/TlGhQggHrjJGNZq0z6k5D2AveU4QHwqvT8jRxeQxe+knc3WqF/b
	77BKLLCB6lj5/DWFk60stytpleSZwHe3qS+D92701IBcEcMbFuvBlRTjenGSmv+oa/M5qJtsbHe
	x4EzE4d8LCj92azeM1OZcKLQpGgcTzBnl4jRjk7wFMaeSjeT1Vz46orlZOB2a7/88ikqDpTjpy9
	EsKVPHc3joaiRYwcFS9lUAs9WUDlXGeV0Hy7xYPf3IOgUPSkWyRvfIAWCJKBec0gUnMsyfzfHe4
	i8xiLisS5GoLyMkQwdm6XpOLYrD2TF/mMzwYrdNvdEhmBNT+sprPtpe7y3DPBVGuARq/ZIwKsAi
	MPVgqghq+Qsc9BUJFiuXytoAxz/rNZDKSsSSPjhR9Xqe+JxckO02/VPj8UZTOIa2nAFVELHHv2n
	9b7V7gkObOG18EupdtFgCQqnssHIgBxJ2o0Mo6xkyCDHM3gTZgJ7QR+3N91Bn4xGUpc8WG8CnLo
	SIgZAv9LC+YoahFkDx4QbBvfrO25+a5T0OhA57NCglC3fBjUVq4bjDV1aDiHXyVPBKxMZB+iSQg
	CShnL/nJQgnxbuSwBENGMqPgDMpUX9Ja/RBhfgar5IKzACMLQGgjHV/7Jf03GNtxk/Ow1swo0pP
	/Zrht73ks9XhunONJvVbsTduvt4GP99S/bpO/for0mZLRGgQF/fE=
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr353454585e9.17.1793788584219;
        Wed, 04 Nov 2026 02:36:24 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 0/2] clk: scmi: fix the i.MX OEM spread spectrum configuration
Date: Wed,  4 Nov 2026 11:36:01 +0100
Message-ID: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the two patches of the v14 series [1] still pending, as
patches 2/4 and 4/4 have been merged in 7.4-rc1.

The first one is a fix for 7.3: the i.MX SCMI OEM extension converts
the spread to the wrong unit, so the hardware is programmed with no
spread at all for any valid configuration. The second one rejects the
configurations that do not fit in the OEM fields, instead of silently
truncating them.

Brian is waiting for an ack from the SCMI side on both patches.
Sudeep and the arm-scmi list were not Cc'ed on v14, as
get_maintainer.pl does not list them for clk-scmi-oem.c.

[1] https://lore.kernel.org/all/20260904101243.412006-1-dario.binacchi@amarulasolutions.com/

Changes in v15:
 - Drop patches 2/4 and 4/4, merged in 7.4-rc1.
 - Rebase on v7.4-rc1.

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

Changes in v11:
 - Add patch "clk: Validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.

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
  clk: scmi: fix SSC spread conversion
  clk: scmi: reject SSC configuration out of the OEM field range

 drivers/clk/clk-scmi-oem.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


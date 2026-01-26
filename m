Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883A28DB54
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444532; cv=none; b=qYElN6AS4VAWMrnQv3rZnQqo7CkPHn/3UzFfy3gEaFL9ANFS8tfMlE/B5Z4m2CcUklennkkO1hJPCTZ4Yb+7MTe7dOvl0/Kx9YHLJWNQNK3c0GaD92m4Pa+1C6Oh8T1nJZkkwtxgDORXTYxhCfuez+KFMoLeNtdenlA56P44rfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444532; c=relaxed/simple;
	bh=Fd9GQuehxbj9j2DTeWqb+eSdlxbgxasHE7nVHCXXnQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OuMNOWqvAnEHiRbZKa9cGNiLnDvNojyE2rJ1tQFcdEeiPqWN1IsfZExsnZcy9mQ1JfTpt3hOoBpXnYPYvoCgsNtEX/RX64ugZ4i6OE8swdb0eC6sgT9s0U42P0EuK3+JER1v28NmV3Pg4Bk8tQsrQP6hZw3exvqTiVvgJn6102w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAEy4c3h; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAEy4c3h"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee2715254so24212455e9.3
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444529; x=1770049329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WzBUc5N1uABfKTBaSkUrbtG7cZ34SqM6HHCoVrUSUaA=;
        b=EAEy4c3hQsk/C/4UsObvY1kaxXBp3GBXhf4Vo4n0sU8rP9u8lusU7XE8liZMpzqUcA
         me7XWo3HRTFV8PWjnaIGFLVb7oF6phfd0xjdA0/gopKvWpY1HOJYWncSYPupRoflQqCs
         uctigvn5ktC6F3e9ISdAYgDnlAHaEB5fSkaVW2PtD1y2DsXwxDIh/bprbXGQZC7+gYBL
         VyFVvTQy//glIxeqCMOF6o7ceVBTUyxjJ7Q9vnLKUh0YJ5gl2KogoC9UOTXwC/hm4l3j
         lqCKHyfLPc6C5Jc3Ja+/xhzaRJzIMApY4rUSKKzDAd/aIZDRfvFWyUmRh3Y0+xGcDrje
         sRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444529; x=1770049329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzBUc5N1uABfKTBaSkUrbtG7cZ34SqM6HHCoVrUSUaA=;
        b=i+Vug4teDNGX6YWlZWLEWGm1sQezt61m4haNMcmsXKlpCKI771fxgRQPyMGerMgZ69
         bYE9LPkBnWlRjMl+C1Hyl0/fK8hlkXeAcwmJAEJSrCMgu5dS0NvkXL90ep+2T5KRrDvT
         VzHWm6SZe752KMiwiBF/yvENL59S3i+Ax+m2N6OZRSuD5il+Ja7el36Hh50lxOm5DH4l
         ONvv91wIFbIeqY4w/HztVqlA2Ku/BCi/tx7UQofuGAtDwYn4Gig3Ie3tvivvpnguZxwF
         yjrOI9Qeuu/q7AORjC3WdQTVCiF1CR4tdFHxPap/27WQ756TFd/SQj5QHbOfafVKDQLu
         I/kg==
X-Gm-Message-State: AOJu0YwksaSskABGuwvolSIVMoq53O5uq/eHGwx9Z7HZRbFm8Cv/SUpN
	3iPmsACvtfNLSbAxYdLpSfIL/P+h4nJaPPKUF+88diLHCsmqH/aw+1wv
X-Gm-Gg: AZuq6aICLQEeXILUayQhwvxUMlRnGrLcEoLFTHVdzTRx3bPep6gKUz53p4oyvvJgEab
	QLjjjzwIdJloQB3tn6KsoHHLLBxSytBzYE3TxAj975M8+EcT93A6QKmuRHyDH9+puswFAXhLUrX
	l+YqNZkQGOdTEhF9c8pY+5BS4YxTtgBMxh72td8eT1YeUVoN3QpxOV9EMRXGB8gXrgLiGDgohIo
	hZs/mTc5/f+vLU/+xpialtC68jl5WAjhqQ05lUWlwgFSWvkLVYITNdYGjIqLj6BwfAEb7WGoZyj
	anOQvk3n92Yjmde9IYsWibzkWPHEGj9xHHhb4v2zp3m0qN2JBMLV7gQTA/bipo8F/GM15njQU+C
	QXJnka7Tse2v2hXS/L4+7/jYBp+TdCB+xnQYR3LGNcPIDHQlDxyMP0zsQ9EKuTQtjnzu5PzL1b4
	NMroo9MQjGIvy+Um9MozU7EXcDX4LE7Qywu5UJpA==
X-Received: by 2002:a05:600c:3e1a:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-4805ce4e55dmr88548785e9.10.1769444528753;
        Mon, 26 Jan 2026 08:22:08 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:08 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v7 0/4] Add support for i.MX8ULP's SIM LPAV
Date: Mon, 26 Jan 2026 08:21:59 -0800
Message-ID: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
LPAV subsystem, which offers clock gating, reset line
assertion/de-assertion, and various other misc. options.

This series adds support for the IP by introducing a new clock HW provider
driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
allow it to be used for i.MX8ULP's SIM LPAV as well.

This series is a spin-off from [1].

[1]: https://lore.kernel.org/lkml/20240922174225.75948-1-laurentiumihalcea111@gmail.com/

---
Changes in v7:

* drop the DTS-related patch, which was already picked up by Shawn.
* link to v6: https://lore.kernel.org/lkml/20251126124218.803-1-laurentiumihalcea111@gmail.com/

Changes in v6:

* store a "const struct imx8mp_reset_map" pointer instead of
  a "const struct imx8mp_reset_info" pointer in
  "struct imx8mp_audiomix_reset"
* switch back to the mask-based approach
* link to v5: https://lore.kernel.org/lkml/20251114133738.1762-1-laurentiumihalcea111@gmail.com/

Changes in v5:

* drop patches that were already picked up by Philipp/Abel.
* include the "bits.h" header.
* replace mask with bit index.
* link to v4: https://lore.kernel.org/lkml/20251104120301.913-1-laurentiumihalcea111@gmail.com/

Changes in v4:

* shorten commit message for patch 5
* drop base from "struct imx8mp_audiomix_reset" and use local variable
* imx8mp_audiomix_reset_get_regmap() now takes "struct imx8mp_audiomix_reset *"
  as its argument instead of a "struct device *"
* use base pointer as the data argument for devm_add_action_or_reset()
* shorten commit message for patch 6
* drop regmap field from "struct clk_imx8ulp_sim_lpav_data", use local
  variable and let devres manage it
* drop base field from "struct clk_imx8ulp_sim_lpav_data", use local
  variable and let devres manage it.
* CONFIG_CLK_IMX8ULP now selects CONFIG_AUXILIARY_BUS, which is needed
  for devm_auxiliary_device_create().
* drop static definition of "struct regmap_config" and change to using
  local one in the clock driver.
* link to v3: https://lore.kernel.org/lkml/20251029135229.890-1-laurentiumihalcea111@gmail.com/

Changes in v3:

* rename "lpav_bus", "hifi_core", and "hifi_plat" to "bus", "core", "plat"
* don't assign the "name" field of "struct clk_parent_data". Previously, we
  were assigning the local parent name to this field, which wouldn't have
  worked anyways if, for whatever reason, the fallback mechanism would kick in.
* replace the whole auxiliary reset driver creation chunk by
  a single devm_auxiliary_device_create() call.
* replace the "shift" field from "struct imx8mp_reset_map" with the usage of
  ffs()
* shorten commit description for patch 6
* cast "id->driver_data" to "void *" instead of the previous
  "const struct imx8mp_reset_info *", which makes the line shorter.
* open question resulting from Peng Fan's comment on V2: how to access
  interconnect QoS registers? do we need to model the sim_lpav as an
  interconnect provider as well or is it fine to have another interconnect
  provider that references the sim_lpav node and accesses its registers
  via regmap (dev_get_regmap(), specifically, NOT syscon).
* link to v2: https://lore.kernel.org/lkml/20251017112025.11997-1-laurentiumihalcea111@gmail.com/

Changes in v2:

* drop redundant description for "#clock-cells"/"#reset-cells" properties
  from binding
* make "mux-controller" and "#reset-cells" properties mandatory
* add "mux-controller" child to binding example node
* drop the compatiblity with syscon - this was never actually needed and
  it was done to allow using "mmio-mux", which requires a syscon parent
* modify the auxiliary reset driver to use regmap - this will allow the
  mux controller, clock control and reset control APIs to use the same
  spinlock.
* rename "imx8ulp-reset-sim-lpav.h" to "fsl,imx8ulp-sim-lpav.h"
* drop the "IMX8ULP_CLK_SIM_LPAV_END" macro, which doesn't belong to the
  binding headers
* fix the values of "IMX8MP_AUDIOMIX_EARC_RESET_MASK" and
  "IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK", which were previously incorrect
* drop redundant macros from auxiliary reset driver - replace their
  occurrences with their values
* squash the binding-related macro additions into the binding patch
* add mux-controller child node to the sim_lpav node
* make the "gates" array static
* link to v1: https://lore.kernel.org/lkml/20250804155407.285353-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (4):
  reset: imx8mp-audiomix: Drop unneeded macros
  reset: imx8mp-audiomix: Switch to using regmap API
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV

 drivers/reset/reset-imx8mp-audiomix.c | 169 +++++++++++++++++++-------
 1 file changed, 125 insertions(+), 44 deletions(-)

-- 
2.43.0


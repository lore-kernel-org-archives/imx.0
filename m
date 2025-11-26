Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A1730DD01
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160982; cv=none; b=G/D4EAt+QsHWHbNv0YhRYNivzlQz3LOiCnj1YA15mJ9ddC3hqS+sEo3Sem9TGqaZH0qYUjAyjFuF4Dy374Jrl06VrRSmfd0JhLjlNez84BAdP/w5cCj6u+bksyHNm2eRx7CRR/KF5G++lGioWzjNX9J44XAChZRZScWtDAUzVVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160982; c=relaxed/simple;
	bh=QMVHQHi0Zrm4GrHMGPBW2tQL6A/vxzVLomF+KFQ+vyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W73BLxQiE2EbWd18UQC2a4Hj9NU49Rawk+JKPfwBLNYHzt2k5lWMwBLpBxUKRAcQOUmXdcDrngkxcRvSDAeb7RD8Z2By+TfiOEvIChPOUtWWvmcULKk3tlnInKWOZApcEaGwk1HQme1VRfOAtDO9jysXeDX4B7a/JD3Xf1oyQoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMsF1RbL; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMsF1RbL"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so11183304a12.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 04:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160978; x=1764765778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wyKInZW9vOOeMqe71nBxJ7HXJ/bNznUlqhwyoDm1B3s=;
        b=RMsF1RbLHWf+GX+Kxt4vN1KIN5LkPEWWb1N0rr70ePkFkmGgWwcgXAOVn+IwDD2QbG
         U8WvbuUqWCC8vbE/8wT+uhvX7gRlc6AZacSLhRqxalhwxmJjnY1+fKsNwGiDfEOINDFp
         q2H0J/8M+Jo0xQnb5qeCOaRbN+pklQ9x8dUNlI9jtJxJ642pzvdKCE8YxEiIVcRxMmlz
         d8dibHsMjti4CFxuX5b+8+/spQH6bLuXDQT+ixwEGPpc07RKHf97xrB+ipacVrm9lQJ9
         03ldda7K5NeY6Fl+TtPKy+qiNp00aNiOPhmna0Hx9+tq6uwB7O9m751gwS7PWouEaNxN
         xJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160978; x=1764765778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyKInZW9vOOeMqe71nBxJ7HXJ/bNznUlqhwyoDm1B3s=;
        b=v7BJvOCFn1KzT1EgnJYOqaMJufdC8SqqFsxIqJmFxjwYRpSqtUh2mrlmYZmjXkQdt3
         s+7bjgXnyCTVg8wvsEr/OgFmltI719HPNWFVDNsrt8HSsw1rJ/LEOaCE7RFtjvgQ2YH0
         YaK57AWMlt9O373lCPHIpaIlXuEeCadKkNYPr/0aoxdTiFuz1vJVkUj+8Bk7gs5TuvT2
         pIHPrCp4no8udPy8eHpczqSJ2EOI3od7/wgUhHgNxFT0+mh9gwAsE8CxbHEAl8q7Vcxl
         P02IqOG6J4Np/2VbdUA9Z/ee5elGzt6k5EyMnbQ+yluj18PUrKAWqPFW8hnjCO49o/E+
         V3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzXSVbwAoAeg1HOdH+fSllPJdl+MmXyDDxY6smBNIvHPW3H897+2yF8gMYcZTLEz2EB+g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqhqH7QaBEBoGr6SIKUpCB/Qb83jGV9abZRlpgwEnEpoEqSSfl
	DBmbSrI+BqDEacykE3u8SZLcOXt9w3R4N8fFlD9C8xN54bBVcVIZeTnA
X-Gm-Gg: ASbGncsx5xhAO3kr0gjaCfeaFZ7WDw9lAqwTVLvTvxFv1Pyoi3qS87CWX2Bf3g8vhja
	9CvqHU4skeOAWemwnrPpWCD4iyJ2h8nQ8hKUJDq9MeGeV2revhH34Zi3wn4kKRN4D8K+PBvt+cJ
	uDzKNFnbMq5nlanp3sqmbsu2TK6evoxtVW2o9wyP5tz0cWyJ/pcs3sk3RBqrflo1+Uy+baiSaTn
	f/mluaZknGBg+x86J9RT+4s9E/AeEssB4NcIzjNfKlGkvbcvc6G7I3FDWshgCDJ+LVetOBQjQN+
	6cmA9CRiLIvhwNSe78ryXqpp1OhKHhNfr2yxlItBpltE8M0/DNJ1RGaIiTwyQL1CWmCO/SXalff
	zpweLPywHIlkznV4eXNuZEXG77ZOxjbagsCEsuuY+Ter+E+CwYy33kzZrLzhXgqKhF2uyMcWFzw
	l5fuz1N3g3zpMWidk90in9e64634OT8VKYIW07
X-Google-Smtp-Source: AGHT+IElqG7jPteIbIhzrUyHVFQTvghK+ylGI6dlqjj76G/QOs8gr0LlFJkvAARUAUVCGYrcNiuMVQ==
X-Received: by 2002:a05:6402:2787:b0:641:2a61:7da2 with SMTP id 4fb4d7f45d1cf-64555be1db0mr17215942a12.17.1764160978101;
        Wed, 26 Nov 2025 04:42:58 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:42:57 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v6 0/5] Add support for i.MX8ULP's SIM LPAV
Date: Wed, 26 Nov 2025 04:42:13 -0800
Message-ID: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
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

Laurentiu Mihalcea (5):
  reset: imx8mp-audiomix: Drop unneeded macros
  reset: imx8mp-audiomix: Switch to using regmap API
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
  arm64: dts: imx8ulp: add sim lpav node

 arch/arm64/boot/dts/freescale/imx8ulp.dtsi |  17 +++
 drivers/reset/reset-imx8mp-audiomix.c      | 169 +++++++++++++++------
 2 files changed, 142 insertions(+), 44 deletions(-)

-- 
2.43.0


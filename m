Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423859;
	b=Ot8ZGQ65nA7/ShrSq2W1jSvDzgwtkjTf7BgjNXNVj7fmErUaaO9VW86rU/rpgim1A7K2
	 YC4fU7++XpFXoIiF5fmFuPM9U37IgXxGXCeDAVNYqrEUIlCTJsKdjm7RYx+yuhNbBE9PV
	 f/uSh0MerYed3ghpA3CMgiQZ+27blsXIWWnrAzEbdpoCeD0YCSwQLTfgueMoodceHQGeE
	 BIbr8Rk1ja0sasAjCtLcBHE7z9CFWebbIqeR1W75pLyiZ5pN/DjZd95PcuJhiyWBSRorC
	 XqcOs6vMPUSP17pSIvikh4NR6C2ZT7Kkng8QBWJgH2PTWJWWqnownWzogftYz0YRigg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
	b=Sw0jr1n1nZc3N97jUVEObCZrCaDl+Me/X/T7Uzbvvom44UDdXTlDcGSQcQTrtoeWVq+J
	 BQq1MmU67S+onE1wbzrwXUKImLN5KS+QCsGJWSTnQB0QTE4obwRrZIqSxDHRdoEWMz+ZN
	 vgxJyPPTzS61zyILutz4sKSmEt39mHq2bz8dLPOvlJEn0moPae/qloqFFqMqcRAQkrivw
	 FGtTe+liiJRf4GRs8L8TJ51NQCajSlUzvCa1c7VXP45XUNA0q+DmPazVvlzTRgRPTz/Vf
	 ldQU4XCHpRZhQp0l8Ze0PHH0iJumL5luAML5mPVtbLRr9sZHENNAMv05cTQFPHmGwjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLjCt3Si;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E737A606A31C
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 19:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E737A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLjCt3Si
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so2062111a91.0
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 11:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423858; x=1795028658; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
        b=jLjCt3SiUiJb0UP9WTU770bWOP8sz5U2vKprl2eViy/xbkEj8mhHyc8gtLoqXPrDMn
         iyvDjnLRmCpiTrXQMsaaeKmSIRHv5nZbiyzDIg1NcSqj4u57YKmdE0lbsFujst2Uu3x4
         Lp4k5Dqp9oYgqz221gTtD0IDcxsK6TAZxy0xrqawTnpwaWFqBwUYK0PQR2x0QP11gF5C
         0CdENXj1RQTS+sUayEmu8dFaLjeqMEszb3t8vCwPmcXYgOtqjYhZqIvqitVj41TO/J+G
         gGJCIWOm23aRKVQb7Be6foDWj/MJcu5DTeTFmP3XWFbpkPKYnM0v1N6L6OCwfBj4Lw4O
         jeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423858; x=1795028658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
        b=VRQYcYkL5JhMNLVjR09UjAe+rzcnOmjnNjMpNYtAGDRraRPTJ7xF3crvhcmqQ5ux1f
         qzxTkpq1/6fd81eGXjlUxktvNqBbGYsuLrhThWDpNiQXNVXkYrpsa9zKK1bLlkkLMbV4
         MW5Bb7RwAs93WD2vMfKQrjdwzQc39YnwMR+qzay1BkJ97YNyOm/9qKmbnD7ZJZKoxV67
         LhNlSYN7Ixtncc3X5U7YYf33Je4ILVcQSGEuWahpcxsIj6663OmBWcQi26KjzXvYxKTQ
         if4Wpqi8kyvgpK7G+QnaocFjJ8SgoJ1rTdWYK4kvAx6JN/pcV7gkPUHUcprXkqCn4W7a
         tgTw==
X-Forwarded-Encrypted: i=1; AL+hErHtwO4MXbc2ihBWyQmPjXYCGxcd2mbZsMh1ky5e5MEnTVvROKfSBjJbMdoxbeJQga6vyO8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/JRk1C1tVye0/oDAeCtlVhxP2zmHDxSpdu/WY69vDx1AT1a1fq
	n6N/4vzbfXseP4y+p2vkCYfzlpsN8oPXTUJeoq6c6lERrDQVllOwchJ6
X-Gm-Gg: AYBFou09w/qGJ+uCxCdPjb+nEL2uF6pcB+JJxzE4T1VRTVV+8DvpTzhQlfqF9IKHesF
	ReRQJzbXqY614mpstwfPt+9NC+zF9rfdgZONV7SQ9azc5HI8QlMooAJInqhTz1CKzFjNKlhU/as
	k+GDIOBWh9fs+JwO53Ghvl/mH/QxnesC9jT5iDGSXCBi23qZDvfb0yqzwJ4bVxyC2NohS/y7aKw
	XtXr5miO0UrtfeEhQBaIy+vW6RO+i3F+6BQ/TlpivhxGw3rNlB6H/8WQ5g6SAFmZ2ZypEhEYPAz
	kEIWoCXaFmwN4PlWoBKAlxeAAG6KwLDa7xFfaeQiyVdBsLJ47hqbYHaWlNiiSeqq2UBabDsmcSz
	Uov0C6m2LEC68cnbru0WDJBedLtfdLjtCW9llYyeO2zBMt8IsR2UECB3Fa/t8avAvd4aFjqIp7r
	rU8m2/JyTAh7ARIWmlTyiIyvbFjwtDcqdYMluUNZPwo2x02hc05sCXH9s55gF6G2ikDjW0EYzFL
	QXPDN2kiIPhS+/D2i4cn2XOG6UYxtDvJt9DG/Yr13Px7LemFDaU24SLbWlyPcZLtmaiMefWgSoc
	BzhyMtS0UI51YDgaNoCEYXX+o7jBXVkOeg==
X-Received: by 2002:a17:90a:e7d1:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b182e9415emr3092987a91.17.1794423857979;
        Wed, 11 Nov 2026 11:04:17 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/7] ARM: dts: Add Apalis iMX6 overlays
Date: Wed, 11 Nov 2026 16:03:56 -0300
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABy89GoC/x3MOwqAMAwA0KtIZgO2SkGvIg5RUw34o4GiFO9uc
 XzLS6AchBW6IkHgKCrnkWHLAqaVjoVR5mywlXXGVDWODUaLdNEmirLfDs/IYaNHkV0zeTKtm72
 BHFyBvdx/3g/v+wFShYHwbAAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3193;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=sVz8tk9YnISmAo/N9+CFSdVkyiddkfKtwMakiw1SLiQ=;
 b=iPp0AI/CNJytJkCqQIgPV7xNs61v8TcBmtBWw+K1Uoo3T28/y54J1tqQNkUc+ZpeI1xvQtBp8
 d7H6Vw5IRyyDwnIc7j+fwu4AJ77hmdeIA+mh1XJ2ufCJZOi1z3BW9NU
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds device tree overlays for the Apalis iMX6 SoM. The
overlays cover parallel and LVDS displays, audio configuration and
OV5640 CSI camera modules.

The series adds support for:

- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation Board V1.2
- Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage. Additionally, this series adds
ready-to-use DTBs with HDMI enabled, combining the carrier board device
trees with the common imx-hdmi.dtso.

This series depends on another patch series and should be applied after it:

    - https://lore.kernel.org/imx/20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com/T/#t

    Adds the HDMI overlay common to i.MX SoCs, imx-hdmi.dtso. This is
    necessary to add the HDMI-enabled ready-to-use DTBs, and for the
    patches to apply cleanly.

Changes in v2:
  - Don't add the imx6q-apalis-hdmi.dtso overlay, and instead rely on
    the recently proposed common imx-hdmi.dtso.
  - Include 'tdx' in the display panel overlay names, to make it clear that
    these are Toradex products. Add 'v1' in the Toradex Capacitive Touch
    Display 10.1" LVDS display overlay, to make the product version explicit.
  - Link to v1: https://lore.kernel.org/all/20261001155412.3177428-1-leoreis.costa@gmail.com/T/#u

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (7):
      ARM: dts: imx6q-apalis: Add ready-to-use DTBs with HDMI enabled
      ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
      ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1" LVDS
      ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
      ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras

 arch/arm/boot/dts/nxp/imx/Makefile                 | 86 ++++++++++++++++++++++
 .../imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso    | 15 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts   |  7 ++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts   |  7 ++
 .../dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso     | 17 +++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
 ...-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 53 +++++++++++++
 ...-apalis-tdx-panel-cap-touch-7inch-parallel.dtso | 34 +++++++++
 ...-apalis-tdx-panel-res-touch-7inch-parallel.dtso | 30 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 86 ----------------------
 11 files changed, 335 insertions(+), 86 deletions(-)
---
base-commit: c260ba495ecd8dc5639be9a45a70cb56391078a6
change-id: 20261103-b4-v2-apalis-imx6-overlays-e64cfa196df1

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>


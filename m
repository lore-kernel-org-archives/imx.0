Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E63A0EB3
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432242; cv=none; b=sIA8IxV3p6ZyeWabbUteR0MdqXvpoEhAPavWzLoj8ElU5jeMqxqzpdPVs/XFCsK+++Gc/Kyz5sjTCtjU7EOLpAt0Zu6TPi6l4kp3AFHYob5UuzqTI7/YyZ2fgBwULfWuvg4i+J3eNtcwOBkfE+wZessbX541/YH3m0DlKTgbdlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432242; c=relaxed/simple;
	bh=BtU/1FlmpGpeVuq2O50FZAVFbmjaQJruHeTie0Nm7GM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q9evzHYSKsQTy60KwKODdZyAPYg+qPLsExtCwX/q9uu17CmIVazCViLHJ9hxNUDLF/gJ8jZhdF5ayWW+Iaik8gi0HQjlJCquNkBN7DdykAfyzSSjuQtOy5ipFNH1UWAHPe/8FuaA/i8fq5F9QkdAIAh2TUyNfElk7h3VHdSdJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLpsAY3/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLpsAY3/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb14227cso23629575e9.3
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432238; x=1775037038; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPn24ee3Ut3if8Ncvi7vY0xSmV1MlIqacbWnXs0wBFE=;
        b=rLpsAY3/WT5rdYJhro1YTU4bynAh5J4MrRpxVoggAw3nEvoXBeqyd1rTs2awrgOmW8
         neNybwm/1haZHCfw6OfNMeXk1X+cjswYV9R3SZfzpVBp6I70Iy7RGbFe5+2yJ1A2CuSS
         hamxjQOtDp82+D98Z5ShKhV/xqVohreTLUMTwYIXz9T5cOEX4mxCrdj8SmDYIrumVr23
         M2XmI07fBw0RBl2gnPHxjPDiOO3FcrhIAnKfthcnp9zFaNFTjPKUa35alIkstisT2GZd
         zjZ+TufHyYCnSx4iwwkGVoNnCVKgO2DaGWXNGGZSuhsDhMNhW44wiQUGouGt4SBFSPNk
         gnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432238; x=1775037038;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPn24ee3Ut3if8Ncvi7vY0xSmV1MlIqacbWnXs0wBFE=;
        b=ot5HL/dlAb3OWl2x+oSJowG/B3XveeDhRN9eVy3f207qbZGSVfBNwpGcSCh7lkH55M
         Iius5khgzezMOvEPpxXnsAFNfobAKPQl8FBgftVKCzNdaDLOC7VEGtJQerpcXifFBuHP
         DyVPgmJ3v7/bOXgysvlAuaf7Q77luYV5aiwqzoe3PYKEt18oI3sL1BqKaqPWS9/V6iTh
         eClWnwcdjxqg2UdX0GdCREmaVqi4AUmnRSOvQsGTPFeNj2AapFXMrN/CduvIPtjuJdRw
         nvbzSKFKXrc/MmrqXn8F2Wm6xr3Upt0hOdJ7T+gwj2KGIiOp0d3BsUsFTu4w7vz4lHho
         HR0A==
X-Forwarded-Encrypted: i=1; AJvYcCXx/0duw2V2nhidQ944UdDJNsquar2ImYUCB3deU6KdRBTXnpd9KoqoO2bpFbJ2M+f5ViM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFgTpB66FDILOUXGGmWaxRPUk0fKKN0fv1OUB4tZt0YkZjbYRk
	NOPRxOd+rzKAVHplqPVfvxCIFnnguWr/DKKWbk6a+oi8YifMTOMEdHF9
X-Gm-Gg: ATEYQzyA+crssFWTuK1zr2rjvG3P0Y3F1fTBA88sNE9mIbT3nf8twE0Tsggh7963NED
	57wUIfIQZpfwVWzO32PmvzZdr7u826FsaJph+SzzJFyRgZSNbKLhfED7EgSvGn/ews9LT6tU+I2
	40NHzFpRJIi1KCo5nXtMTAmam0lWyWIwmKz1mO/xW5RKQiGR6LooyqS5hGkyh/vmnGEbt5vEFvD
	V/ves4WajY2D2JLjbs1KZl2a3SpGMCEcwUy4HLwSCqI9xZkTKIMA30xuRmsV0qTkbGIUSDWlo0Q
	SIPGbFUDIzhmLfeR2uzqqO2aekKLZwNYn23zUSCo98eDPqU6SWkYBuDmElWOjSJcYeziU86Rk/2
	h1EVgEyknp58muZLyabuE66swrmhv7d2Mq+NYx8e1cP1V/1Dcq6DntRLIzMW+CKxqvDOqV7EjRN
	msZBRQRx8CQjf5Nm7VXhe1Fwk+dIwAC1mqioRfsdKHykor5SC4BgBu1v+UW5mA2dQlI3Fg5XdSi
	fkIUe8ATKv6uT3KIe8pUWZVa25R466ZEWitcVk/aPouma161e9sNusQJ5PCuN0QC4L3VlubqLlv
X-Received: by 2002:a05:600c:c490:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-48715fd526cmr41004935e9.8.1774432237393;
        Wed, 25 Mar 2026 02:50:37 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm111397755e9.14.2026.03.25.02.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:36 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/3] arm64: dts: freescale: imx95-toradex-smarc: Add
 Bluetooth and SER2
Date: Wed, 25 Mar 2026 10:50:19 +0100
Message-Id: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANuvw2kC/x2MQQqAIBAAvxJ7TtishPpKdLDcaqFMtCIQ/550H
 IaZCIE8U4C+iODp4cCnzVCVBcybtisJNplBolRYy0Ycmu3OlsTtjL6yPt6uFYiTWdTcNpNGyK3
 ztPD7f4cxpQ9kZqivZwAAAA==
X-Change-ID: 20260324-mainline-update-imx95-00bdf6c54ba0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3

This patch series adds support for missing interfaces on the Toradex 
SMARC i.MX95 SoM.

It adds:
- SER2 interface
- UART interface for Bluetooth
- WIFI_UART_EN as a gpio-hog to select the UART function by default,  
  as the MAYA-W260 UART signals are shared with the JTAG.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (3):
      arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
      arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5
      arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN

 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 44 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
---
base-commit: efc6947b672d449d6b4560a55ad3589a6bee746c
change-id: 20260324-mainline-update-imx95-00bdf6c54ba0

Best regards,
-- 
Franz Schnyder <franz.schnyder@toradex.com>


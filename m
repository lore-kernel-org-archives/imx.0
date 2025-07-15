Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5418BBB9
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588809; cv=none; b=ueQp09Mqo8MWO936VEVse87vHupxM0f4EywkL1F1IZC2PjhcfHC48PodU6zASJEIjpyIJmiQwupz+i5WcB93h1uBRfO5eipxHajzDQmHb8m7oIUD+9FpSPPcng7n0Rw9SOfYz2gUTYVft7Pobb8FcZcaVFzneaQTpEmBcNap0CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588809; c=relaxed/simple;
	bh=eL0AhDlee/MEyBRhhKvb8McO2I7FRVBhy3aB9A/Fb9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bzwUOtHcGMKe8Xoe2RvLtCRviv5YiPIcY1KunuK6JHVIMag6gyjG81fjbXspWb4iA1h0oY0IgsPUacjVK3ln4e4vaxCdVbH4XbpPppA5I10k3ezizvcUQS/egS1N8MLYMiFxn3CISv/x7NAWdRgiaft8bUBdj3cU6Wff9QdHvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RWjoQT2i; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RWjoQT2i"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a575a988f9so3198140f8f.0
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1752588806; x=1753193606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EyhYMDLqwXgcBfbbxVXjHy0ZVk3xruqBs+IQYUNqyDE=;
        b=RWjoQT2ix5aFhCl5GnQ5oZkMn+E602LNyPfx1EP5LnzmBH/J/Hb5U+jgx3kHAKZOiH
         MHKkUBOgZR4v8vTrCJmRYsQbmmugrFHvDXbGZpdbaPNcgw9a3eUReI3kNdCeqQCwVH2g
         /zSLigm17xejOTnNoOEYSLE4St3/iZxP0cdBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752588806; x=1753193606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyhYMDLqwXgcBfbbxVXjHy0ZVk3xruqBs+IQYUNqyDE=;
        b=FwU7YJk72hgXTO51FpH1ZmeOX2rQBToIMZpo2ZDBL9paZtD7tKb7nzbFwjrtMEIFHI
         8wt1M8sc/RqgQ3LdmIey7wUqRTeDE4EdKZ93ZX6qumw5W/Mnqrs8wBGkD/seuwyRj8HJ
         M7yDcG7O55s6rZ24Z+dlEVlwd4uHA2fUkomibzYSFfGw8GtrtG4GFIzWrNZGUilDJvA1
         gPOaSbM7AXsR0InXsNFjw/L67PiNhM3gD8cu9a4TG9aaujF8M7C/VbJLG4QGk3v1KUhE
         ZYWh/aiwre/AQfHJOlq7h6+UFIJfkmPZL5ruD1j48N7MP7XigfhdeHODKmjm1BO2y0LV
         9H6A==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6fyfBHYxnyuTvDFgCunWxILiW6THNKhZyW6YNInoagDLddejcslXAkRdpLC7gw7UZ2w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrcU8WXZoF0KmroJWY81hpg5/2rCkMYG8QDhWaaBHMJYME9+PT
	Ej2/j53zvAZTs9wjaXPcKg873bZKyVJ5HHpRitnqRF2KLCkiNLiaGfyuTPySXn6qoZE=
X-Gm-Gg: ASbGncvq7E1jelvVf1AhSN1e1USJ+OHFWdXoLGcW4jWCHA8kfDAF5k4dO4bbSpwUD/Z
	SpFYagQDefrb5GOQSOdG/9goWxXnowyVDjS/LDvaI4MYRadPQ42GakrIsDe0Q5yt9zLw5RAI3C4
	uMW7YoZuCmilCFJ+Y2ZFnC++7v3A05wTXAQREbTgoKgC6Hr08sq4QbrfjU39SxLOnzE9Ju1mBkm
	fkRYNpY/p479m9j6olQernfICJUOOhaVQnmjrn68fXZAuWvyfXgeJ4cPEBKrIIWy0ALq2gmOimw
	38qcq40ioH2l+d3/EAoDGQ7Tx3JRrXmExZItK7yVsiyaFrU84k7AW4p05Uvnddpe4Fy4lnPLzMv
	E0rm5QvKhynNUZ78tMQelvN8HK7B76oN1g+heNc2r8hVPBidBtvWQgnEvF/h8X6CuYA0vNcbJDs
	PlLjsLAfDI1RT3
X-Google-Smtp-Source: AGHT+IFxM20bqobvrOmTpeuI6kCK6N804fuZxfrBaPXGOvFhMW/WLgasuyeSoviyvYEo3idTS5/aaw==
X-Received: by 2002:a05:6000:24c6:b0:3a3:6991:dcbb with SMTP id ffacd0b85a97d-3b5f187a48cmr12925840f8f.12.1752588805687;
        Tue, 15 Jul 2025 07:13:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26daasm15579557f8f.91.2025.07.15.07.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 07:13:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
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
Subject: [PATCH v2] ARM: dts: imx6ulz-bsh-smm-m2: fix resume via console
Date: Tue, 15 Jul 2025 16:13:10 +0200
Message-ID: <20250715141322.1305512-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

Despite the current configuration being compliant with the technical
reference manual (TRM), testing on the system showed that resuming from
suspend via UART4 (used as the console) fails unless any other UART
is also enabled.

In our use case, UART2 is enabled to ensure reliable resume when UART4
is used as the console.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Improve commit message
- Drop patches:
  - 1/3 ARM: dts: imx6ulz-bsh-smm-m2: Enable hardware rng
  - 3/3 ARM: dts: imx6ulz-bsh-smm-m2: Update wifi/bluetooth pinctrl

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 6159ed70d966..2d9f495660c9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -33,6 +33,10 @@ &snvs_poweroff {
 	status = "okay";
 };
 
+&uart2 {
+	status = "okay";
+};
+
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-- 
2.43.0


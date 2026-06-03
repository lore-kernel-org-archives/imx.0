Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9502748AE19
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497461; cv=none; b=KGFl4mReaEpSXakFrsCSP5m7J6UF6KpCYs1bLr4fJsVubciY5UgcOeI9RQDSoH5B7SJ/XRiaR1mZc4SfQV+3KnTeUXU8jPLHkeMF+Fk0m1YKr85e8jUSeeJxBCU2Gwzs14P2HYM7de+hchvKV3MTvcTF2X649DPKCThdCsVC35Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497461; c=relaxed/simple;
	bh=JQWYc/4fLffUjNA3wNIOzQv6+iqCyIBB6K7GqVimTcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuzSt4IXCjZ5BmC9/av5BXQjZQ5uoQPN55KyJlVze3mUKqiWE24H3SU2cag40vTXVjFNkEZtr4NmqTfiasf+Lv3yFWr0rcB75xaNuvTdAnHxvIwn6C29jqWrWogJIvOhfIpXcBQY6OSEPf9TEtLahRuAM1EU4Mfg6cVwdoOr1pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CT3ze5lP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CT3ze5lP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso5501425e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497458; x=1781102258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hljhn7F62l056w1LsgMyS3YqsFiEWlqkEOExxjIDOMQ=;
        b=CT3ze5lP9EIqxHKmRybDnH5Gt9mZY4Y3jpEUiX9yBkychnycYQ4UhjgmQM1Bc4NXEL
         HOQls+nkCgzTlX2sKt/N8Jpt9CCJXwBd3zEnY6i5tEo+9YVEInY57sHTiNK4TtKVmKXR
         FFcQZ+SdHwufZ7l0wudusyoqgpUsZIsEb7anK2LBSHfnBJqgIk1Odk1jamCdhVcmu+R+
         WwIBeah64S11NAQiG/5v4aAct5X7sFQx5iFYZzFumsJl71bFT+iyXPEUYv72bPfAZ956
         vP2dKrKtZgmfYUZqHRViV+xl1fg2b6tjZ0ytq3rfeGwoFoHQ+cJFIQ2ZLIJ1d0KogAq8
         HryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497458; x=1781102258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hljhn7F62l056w1LsgMyS3YqsFiEWlqkEOExxjIDOMQ=;
        b=JWYMtdryfcAL0RPIOr0+LfD4mFzj5xKZPIcC/lxq0K5jTWX7PieUAk15HES+aOAcW3
         YeVbc4WGdB8DBokHgGpA3cq3dTAA4McfDO312H2hTV49BhveKLym2VwYw5FbNh+Y5+59
         YrQVcDpr4s5+KyUYubfJZAsWwSt/LKV4GBduiF5q/G70yk7JVW5Y+Xo+OXS3y50nB1T2
         bdFae9rpF5IwpvIVn30SWHF9lIACdOj8CDD/9s6WXONW05ntt37oVnq+TlkL2AoxKsTq
         p8ACnXcxCTfyIyB+OsTVW2pJj/fjnwGIRzrVi/ZtRC+6A8PE10NmdjLjMb/7f+VaAV4t
         PrZA==
X-Forwarded-Encrypted: i=1; AFNElJ8CgRPjRdX/iQfDBc55b7mdpVu2eUI+sfrn6fTQ/lzHLOLQjGrc0B/MPHszPRK3QMwrlAM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxyy2kxU4aQFXz/RwzsVH87Za3UreT1vHYHxuU7TJZAYzVjrjhs
	REIzbtKdu4QXnnqjJ2qYNqf8LHYj0Ut3wdMFSAYwWkbp34un+vAulugy
X-Gm-Gg: Acq92OGn/5vrGqAD4ij+FM+TdbG1j7JgaHJHI/PTk8BDK75Wb91pRW6wLHAeWMKcKzA
	J7fXtIfm7KzqCLp2qnyBQhJ2reqMN2qfUfyqnhVX9diQ7MQsrQLriPob6Ce/3TWZXMiLuahkHXc
	5MyBU9LV7WHc/oJmdvTBxW3uYOm8FUIBovQwglZ6IM9J6g3pdGrku3RkxhRPXIe+CoFmhl8Z4Vo
	mjnrozoUgT3ha4l9VM9vEiXVXbs/3EkDGxi0nAAQmJN/6ccLZttd7vviqm0Rdnx+IfpWJLIX4KL
	C9IivkfIVGypUBNaGlziSggXkKsymhOc5u+2sPkyn/hyJjysRtyuw+DRzaj2YEL+COzo+D8xfx1
	O9fZX3TrdIggmtATKqCnVYkUnesr36UKScGvi96FMx3b3LacUXJQ6DrZxDkz06bEuuJlHSr9i2g
	XY3YI8c7HvvBBsLKIari7QE4QBuD8XTeYXb4lXIJruPMhxhFkXuhT2V+u0YzB7oJYsUWTyXLHYr
	0MRolzClDnn0yekwbnyM87iMaE03Eokrqzwq0fRCGmHrdb3lTPkje9WLV0=
X-Received: by 2002:a05:600c:5308:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-490b6121745mr51329715e9.6.1780497457614;
        Wed, 03 Jun 2026 07:37:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 10/14] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 16:37:17 +0200
Message-ID: <3ab5aacc561dc9bdea882a3babd39ba871eda023.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9d08785cdae8..06d8dd7a5b54 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3


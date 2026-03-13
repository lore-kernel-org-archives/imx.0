Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6583CF671
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 17:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424060; cv=none; b=FQgdgZkfdwQqWxmQ6LYZesYHmt3X7/zyzQXYvCm5SZrMxwoi93voUiqjiX0wJaG3bMmgasnawWuOsK4YGOx79wKs5FBg1wscLCQZQs9xIBCRzkJgZ21ycqJS4M7k3KUaVr6lWV49xe987ahO7tIJo6jNzO7URPmSU2+HNtDHH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424060; c=relaxed/simple;
	bh=MIASq2CvrmBj6tKCFzLwLnKidbL7xiykDblgZxQ8niw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3EYPIDeU6wMaCP6YlczHDVj6C760rWlCEBoMXe6Jq+v/WWQjg/C+UceE+4o/F0pRllvUuctQJSSifCg7TIUJhtU0XR9GlSZBT5u/dfNFp/Gcx83n9fpV0gOOT0zPwrHe/FXW4hDaX49F2T4P7xvtmXPzfKlnsMiqdDwBpioMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVgqigzN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVgqigzN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so20500005e9.3
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773424058; x=1774028858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tStJn4LBdNSDPTkcJ9F6SyDC95zUtjG8M5+cKBjWoxQ=;
        b=GVgqigzNwRUzrNbCkXi/+osn0nhlZXh4sqI9N95nsTMof0MPt/f5H+WWIBgtzdSbrT
         ZF3qqLyj7kb5EkqTDL1ccu/pODAslgqrQg9sd84Cn+obHgoEDiyfIu0FBIUPPYi6NSm3
         90p9JH9Qa1Y/E0ptzmVemn3WFppXYLPrAB4Sk3xiHKu7Mk/yIfxi4RuJN59uOJj3547P
         4WT716LGnHmcZ/RdLF6RIqXOTDTTohAFVEerPyq3imy8E2Kusl0afVhvTxhOShNFveMB
         /dFDSnFiNFm1LDJZqwt9wj4wGkOl2i/LC16Rq0yF7V5wMqemkn8BWQv/RIIVv4RwR21p
         EHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424058; x=1774028858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tStJn4LBdNSDPTkcJ9F6SyDC95zUtjG8M5+cKBjWoxQ=;
        b=BWnPmAOhBp8wg8xcJndIELmDwD7idd9UOLSR8tc+b8yzyDG8+6vytz/SZCjqPGuJHy
         4OVBvF8RAtfKtsLuZwtW0CehHrOYep5kz29oLlAu3y3FJb493fX+oDvo32whuLuQoAAK
         df1xd3sI+9zcdzaJQ/T/JVRVbrye+5pfzEdo+gfLcyyzGIzlpnv4T1rrMryFWhJsW9du
         WWEL3Ec7cwTH91q9fklqrLcQTA+bGu9CJcajiEI8k+j3rSP/cNwRXPSbeO9pHBeJs4PR
         d8q/vPBiAudIcGRsu7VDND3cTCZ42cWydxolGeIut+0GSMpKvv7Cr+qzYscqD3T20LOi
         g9iA==
X-Forwarded-Encrypted: i=1; AJvYcCWQZruaD23RbBNJQTbq3OBv4yD3ntGUefe///KyGEPWaNZ65w06pxrANry0f+RnfWa5/ak=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkaBi3Xik5Vpj25x0VnUk1oodAU3mJ9r9Dssoy521WxHYCQKCm
	2dPaFIsVseGG6Imd0CnWcW2ybnsPKXuaFmC8gFAG/7lf5AMnmWy7gZUu
X-Gm-Gg: ATEYQzwF9YT/uFIY2pxQqa3Ckkz4ZQHm9hv1hMHo/BlNUKfeshiz3fTpoQQblfu2SZT
	xE+VwuRVYPGqsc5NU0J3pPz/KDNtnRbN2tzgNh6xFCh8RWuMrtFPcyoWai/fYiCRJsPWzf9Y5zO
	5w7EN1x3OmbPOwGkqQMrzlYI2K3CkWjsOBk07VWIz2Nb/fEgebJ/o1502bEOEuoG4zvXZX1VNP1
	CpbyXf/RFVHWCVrXtSkT8aCYWPJBJKjOx8s5kMoHXL9VMQAyE707/zWpSFWB2sodN1ppZVmyI7k
	S5cPlrbM/qCWDoQqsBXtNrTSlMB9JyCSKL92hMGL4uHN5MKCwYVC6MDyVQ8X+sBY9KGbXY+1nVZ
	h7iDXflglzWCuKCksXktkxlaAa4u2xpRrnGhzYoifaVlzcuwafpUkOgxNHxXjS+dh+ViSel3oYX
	4R7cGwN0KQmHSAjU1bwe44snv1acowUAfo2F/EB0uaQvDxz4GdfFuS+qW2R8NBUsjWHwd4TE7nV
	x2wdc0tG/6PKi0eK7u6oxtbNiFJxmCA2vqFfVI=
X-Received: by 2002:a05:600c:4f8f:b0:485:4371:539a with SMTP id 5b1f17b1804b1-4855670f7admr60093835e9.31.1773424057534;
        Fri, 13 Mar 2026 10:47:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6756e4sm257213575e9.15.2026.03.13.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:47:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata board
Date: Fri, 13 Mar 2026 18:47:01 +0100
Message-ID: <20260313174707.26902-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX95 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v7:
- Order nodes in symphony dts
v6:
- Order by node name instead of by label
v5:
- Fix newlines and nodes order
v4:
- Fix typo in spacing
- Remove vpu and cm7 reserved memory
- Add GPIO_OPEN_DRAIN to i2c gpios
- Move pinmux to eof
v3:
- Fix specific node names with generic ones
- Remove fixed-link property for SFP
- Audio regulator cleanup
v2:
- Add SFP cage node for enetc_port2 following sff,sfp.yaml binding

Stefano Radaelli (2):
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
 3 files changed, 1017 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
prerequisite-patch-id: 7ed0e453f554c70d0fafd5147d4d9b62cac6c10f
-- 
2.47.3


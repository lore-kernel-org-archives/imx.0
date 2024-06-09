Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45D71FDD
	for <imx@lists.linux.dev>; Sun,  9 Jun 2024 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717937996; cv=none; b=HZEdc0hNfHIK//KE+Vxzi8tYPt/XCc8U2lUPbdsVEcJrAMf4lG0tfZ1YIEfv2s0nkVWwFaTmAPmydKlPVlV9DBwXcA5p7BkDB/Ut/OKLDLtkT9zhpHYoyAv19FXjD72lZrcBzIUrAWzM7OB4hZgbZZroMItUiBy2G01igCKFO/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717937996; c=relaxed/simple;
	bh=ZBEzRfn+mFCbyufKXc/4c7RplCyGr6rZvxeGQzawPT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GAD3ZT+xqj+G0ARGEX6Qt3my5UV5DQfjSYkum23gpOpuZcdlAu+saYP6N999rFWKeun9PiVzu7qSQnn1ccB0aGjYxgwhKidtR8ltFNSzHsyi2d/YQpswA77Ew68HZSjfFg49F6L/PhSunkWr9OdLV2moGIlBmRoYbZO8FqsZvgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bqu+kBWo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bqu+kBWo"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5295e488248so4019877e87.2
        for <imx@lists.linux.dev>; Sun, 09 Jun 2024 05:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717937993; x=1718542793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zvgraGsdwP8qNq0CbLRpBxfSdVjyK/qpe06H5/qHpTM=;
        b=Bqu+kBWoCiTcQ5Xtu1Qs4ItCiznbBWpRfhOjeefOkdwMNPhvGz3KcP/+g7mvvhrLvG
         gCewo13GcYRiFswmYv4JJf+gF/mKheC7raBoVBlSUFB/tyF5XpBdZPJWBMcNSFjrNpfN
         r8GFu8+UG2jxcYZIZ/9tc94QXb8/sCxr1/rroWPIet+URF4vIDh6laHEI6J3Mh3RL2Tq
         PuHrbuH4ufNST7zDzL3Ecf2O8kRldxR9vdibujwT7sgfCBYej5Cj+JNe3+jK1A7XYkRw
         NX808bhGNzTcb4vfV8dhvUmS00nyWOWaVnpiArmZn0O2CkR4kVNMj6+1UY/HJ+EixoEw
         t2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717937993; x=1718542793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvgraGsdwP8qNq0CbLRpBxfSdVjyK/qpe06H5/qHpTM=;
        b=HRHiBMb5ZDH7yQU9PpQ1qku4FjkTL5lplS+mi0RXtom7XSZoqYGpnRbzNHuvTsFNTE
         ER148Gpa5vOwrrsGrYyiLq5dTE/Nhhd7dlwZ72fjLsBglGX1/DgxyotoFPB5828zPlo0
         vyK04SyqxF5gKLcz8q9E+eyM6C5/+rb/gp4byH+XFawTnH5M0g2hZuQ3Sa5cENXJvH3S
         rSqVvjBAbgFqP3I8N/i8RC16mtT/hMoj3/0/DqiT5vaHXfl0qmFDU9yPghQZt4KioCoO
         iOc8O/5q7LeP9UOn1CCL3Uxy2ibuxugvSo3fSOHFjhKjvxg9fsrISkY3QqgQqBX/vjQL
         1AJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3W5URHizuTvsj/k69f38tzR7BWL8f3/g5zpWeDTRa2Y4LVgZpFQ7MfR97kt3terMZALGBBMHC2T/Jo+yT7JrM/F9B
X-Gm-Message-State: AOJu0YzzrDVJcpW/Y2WFtdK73eKbqlWSLX5/wf6zGv1zgrFCE4n7tSAL
	2/5YsURHA2bYMMQ0ybNdK4w9V/knDtaxVLr0oPNf6ZTVPjE4dbo+
X-Google-Smtp-Source: AGHT+IH0kfJd+mvMseVa+3hYIyeisA8ltLtAHrUOGBmoHFRBwQJplxengofSYzowRy3u69oYOatzLw==
X-Received: by 2002:ac2:4989:0:b0:52c:7fc9:954e with SMTP id 2adb3069b0e04-52c7fc9976fmr1948585e87.41.1717937992741;
        Sun, 09 Jun 2024 05:59:52 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f1841fceasm85961266b.70.2024.06.09.05.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 05:59:52 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: laurentiu.mihalcea@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add support for imx8ulp's SIM
Date: Sun,  9 Jun 2024 15:58:58 +0300
Message-Id: <20240609125901.76274-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

i.MX8ULP's SIM (System Integration Module) allows
control and configuration of certain components
form the domain it's assigned to. Add DT node
and schema for it. Its child shall also be
included.

---
Changes in v2:
- Reset controller is now also a syscon provider.
- Changed vendor prefix to nxp.
- Link to v1: https://lore.kernel.org/all/20240516204031.171920-1-laurentiumihalcea111@gmail.com/

---
Laurentiu Mihalcea (3):
  dt-bindings: reset: add schema for imx8ulp SIM reset
  reset: add driver for imx8ulp SIM reset controller
  arm64: dts: imx8ulp: add AVD-SIM node

 .../bindings/reset/nxp,imx8ulp-sim-reset.yaml |  68 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  13 +++
 drivers/reset/Kconfig                         |   7 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-imx8ulp-sim.c             | 103 ++++++++++++++++++
 include/dt-bindings/reset/imx8ulp-sim-reset.h |  16 +++
 6 files changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml
 create mode 100644 drivers/reset/reset-imx8ulp-sim.c
 create mode 100644 include/dt-bindings/reset/imx8ulp-sim-reset.h

---
base-commit: fec32ea96dd90bf0af97e001f380d4a240013aa0

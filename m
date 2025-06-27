Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1162E2E266E
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034439; cv=none; b=HuGkC9opvy8M5vlKHpR91/4VB/upkdsq0k6MH248BRbibrqpaUxAL9xXbM8+2JhJGM0D4Qyz2nyT71oI//zVG2+G1ffe7dHbNjseovP99YxF/C5YfT+X0Lpip1Sirm6/heVnZMu90+Pf/BLRa6pa0oHv/3btO5x/i8/uYaJ3Vo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034439; c=relaxed/simple;
	bh=UUD2v7sWedyU2gnLxtaB2m34SShvvw+yP0HmJhuO/WE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PZnYm9d03S7vhqgiduQEefZauMtpvy+YnRfCdm2zrzlvYqFk2cu7eypuYrJM8wXyo4k87ih1Ht81i4PuZIbeKlU4hDqqfH7dR1QM6NSQ4kdK1uNft0C8Wk3EHPQ9Re5PPy2H1CzDMRT8w+LN3aRUBGVLGF7iCKLbY8NwzSDLds4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1ZLugr0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1ZLugr0"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so329866466b.2
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034436; x=1751639236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcSBhyw9Yhzx7r6sZ8IGYEHAbj7bfuO5frJAgYAC6fc=;
        b=W1ZLugr0CFygpia/zHNMIAV3x7kKqVEJdSdLLA4Fs2zuHlG6Et4XS9WoXt3O40nP01
         D4C+TniBLjYzeDH0kDWlO+jvcnbrlcv5ojsYMw5ZhyWHVEK1e8hPPAVsOb6CZuBOziJi
         DXORR+DWIJIat68xO++Bhrm5lG85ptzwHNoszjTo2b6Y5YKpQYgrNk54SrnfsEfkQbRL
         eJ6C/0ZCE9JODfi8F3C8yf84I8dlVTPANFEuxRRYyiA0X/vV0prIWTG8P04lkSk994Ce
         Djchpo8xZWLZkOpj5f4EnyxTks1B7sAoSKW+nEOAzB6kcvSazgRflOTTWoher8Wt023T
         jnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034436; x=1751639236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcSBhyw9Yhzx7r6sZ8IGYEHAbj7bfuO5frJAgYAC6fc=;
        b=BBdPYhHRaDIJ+CTdRWC0EXFYpElNAD44rGb0jjzMh25U8yA+Fm1WK9qfc9E+vPkvun
         1VZl1dUFnLNtIM5AzebRyh+mOoCRgLelLXYMuAB+73KH/BNl62oMTOrr8lPkdCPKt80T
         wCEY93pbSer9VIq7mFNummlWPBHxK308yPfiYliUMQsHuwkYHaj1F0PQSIRGLWf/vlWs
         tWrTFCyv/4bBGyFhGkk8WLIUinogKHXLnWjDJWZ1vfIduB8d09e63ugQvClCvl2HZbzB
         rlTc5zVuLE4qzZ9iIeU/mKz/wi+VlvlMBQv4ag+GyAYxcoMEY1Q3/xXkqpstuoNV6ucR
         Qevw==
X-Forwarded-Encrypted: i=1; AJvYcCUkIFV2gK69uz+5wNFJlkKCemE3NATJ/C8wr1oBqhwqDhsLcJTNxfMrr5POK6xhgTXjMv0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzIuAkOnkC0tYsOuWfzu9FegkvzC6tuw+eiGzV0WYepKvshxr7
	ez3UMtyA7kcI3pCS4DZMC9/X8e1f7HJ+8FbyBOuxPJd6/65a81CwOPvJ
X-Gm-Gg: ASbGnctZ44qIEZo2NJeZb3KfWM08BUH/8vC9yqyg5/dNWrkUPofMZgXwz+vgF+4PE44
	T3Gq7r6Tjg17l5Y+1X7744h49yA6PGpRAcglkmz/DeM5s8W7iopUkM1V4QM2DbeBRq9Ho6DUeK4
	82Ovrkjnb/N38U8LCr/1lC02OUHvxwQOrK3+z5fZS6pvW3eK/KjvhxrCDrtd+S384+qf/RLW20N
	sq4xpDTgwwnq1EPBl9peWUiTKi1rli0HbUzJzZ/vUDhvV7UN3MTeEwO4ehfmCr6sYrM5+jdC86Q
	gTxKmC2VBLB1CIQRfD8Fzo4usBY4YoPpIMHv/A422iSMS4tdtNDGIG/llrRwwFG5T77NpG/OFNW
	X6laLi9V/V8PnHdoph3g00U8=
X-Google-Smtp-Source: AGHT+IG0h3kcfUrRnkezRjAYnSPlB8QkmdyUPOhCB89bzaJlmd0l883sazC5bhUvRYXEgDVePtMgsA==
X-Received: by 2002:a17:907:7e95:b0:adb:469d:2246 with SMTP id a640c23a62f3a-ae34fd89929mr296454566b.17.1751034435962;
        Fri, 27 Jun 2025 07:27:15 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35e2dafcbsm98925366b.116.2025.06.27.07.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:27:15 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: support the i.MX8ULP EVK9 board
Date: Fri, 27 Jun 2025 10:26:43 -0400
Message-Id: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for the i.MX8ULP EVK9 board by introducing a new DTS and
a new compatible string.

---
Changes in v2:
* introduced a new compatible string for the board.
* aligned the pin configurations to the same column.
* link to v1: https://lore.kernel.org/lkml/20250623150146.1398044-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
  arm64: dts: imx: add dts for the imx8ulp evk9 board

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

-- 
2.34.1


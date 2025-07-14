Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4525F96B
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506085; cv=none; b=I1jOotJO5HlYoIkUzuXp5vITQGfvFdXjjhvyCp1vp+mDStvFaylbKlaDzIKe/ljOhCd1DKLeIikgYl+H97wSign2c+bAmLHu8cV1r0n3RVufIoykJVslOKXvvPNvf+8X/vRK1PHAIfanRXGTg3V1WjlMZgnUDOYH7hKOofzsp/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506085; c=relaxed/simple;
	bh=Faq1HQYeYBBRhYPs/kei74Rmgh+zrtNBTqw2764xXe0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eGqpGtrrFK6p3f2BEuUczJxnj5zYSN+e/Wz9jK11UD1MnL4+MH6OYv7bUmSLPluao/HZPdCn/QIxEXz8Jhw9VJatH2YaVJqVug4CZxi5fdI+mLGy2uBz8IH1WaC6g29nFtcym/yojgh8P7MOMw7TJq+C0Wk4wbivP5uFLHzZQFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWPek5xW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWPek5xW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae360b6249fso718649466b.1
        for <imx@lists.linux.dev>; Mon, 14 Jul 2025 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752506081; x=1753110881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oO7945/t9P7Yv5GgXToznrDjdBL9oYYRyLkZLH/Q9U=;
        b=dWPek5xWFKMR9G/4mzrZ4tPMINUuC3CKvYvWvETYCUcZV9zDSm5364jsP4tlymH4DM
         B1hnHVy95qo0sWMCRhJCO/CmxQ8JiQ7CU6ey7JQeRfGnknNGDJ/xcmHnB2Xcy4FFC8nr
         444xLVSopfhr7/ZSpNYBJ07P5EJRGWIEbDgOvAr9xk7nZtWaGjs6d6EqF3hjb7uxPBf3
         kdpL/g7tbRNZbA6RWojANDqNtMKI4Ii69Z1G9fYCROUVrV7WPFo369gp8lKfOlA8dv7x
         KmPihFFMtCafQ94F7K4ODpKtKnJ9vB0YhdIQCmxHlrLQy7wUAOsOdSiVv8QOiIR7wlZ5
         1d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506081; x=1753110881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oO7945/t9P7Yv5GgXToznrDjdBL9oYYRyLkZLH/Q9U=;
        b=K0oRwpGCuswXB3dUz40LZApd0y5OJtFgsXDjKSa6TGLWrszsamXK5t2HaryeEGuixc
         8nln84p6INNUPx1cUWvsLQHFnshh6jOEyWLik/6TIqQ1R8rU0KnSKKXGey1qtrIFl0NY
         W+xCO6wlejFvbfslvkhF6XsRnsjhx5Pxx0gdbNsRXBrtQe/3hYS7Qf889a64o4yPeYxT
         q7bENWiuyjuy4eP1u+6CZvNBMkddWcjv6+BY5jnHjtopIqxDAoNek0PYhtARZRfC23UD
         P0dGjzTwidFdh3GlXq+SaaeacOdhKgH6y5hNvdSBoGo0xnGWqLHmwhA8YCXxs373rA+V
         FU5g==
X-Forwarded-Encrypted: i=1; AJvYcCXTibToLEYn6NUT9jR/K0zrfhRTzCP1UcXQs4QNDk9c/wOpp8vhuVtWGFGwDQO03Jku0lA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOPz0XBRS4I7eyF7EDk+C1MPhNb/frxwDhFaJl6eZNLZ0XnwX9
	NkUGW+7NWRMpnjDAD01unwPEslOCvQ9v+qgHB7ZTVXatHRsUbpswrwy9
X-Gm-Gg: ASbGncu/SsFGrOWf2Y3k/Kl8vquKNFkdBvK+AMdv9OGKODI6bCAJ68YpGw+Xz6fRqyC
	EiM7PvXBfTx9yXDEZR1xPRXlQJrk21CkGhd6mKz/XxM+cHmX3COa81Pl1IqOC+kimUQ1dgidFUp
	NbWuwVLDPQ6NdhcTUp4WzG6GPXzOiOEV7lb3jaGL4cpPXuRnWAf+mVtr3CB26wRn0cRFPQCAy9c
	3TIpXOQI94V7MEabLrHubi4bRo+f9/XRDGY1vlzSUejFnGFRvzU0g0cHV5HOkSbPeBVnpEa/lQV
	G2nPxdZIqPoJklCtCTAmbjQ1h9BOW1dWhuKGu+63lS+wBw9Eg25x6ucCVvCZFmtNXUo6mv9aT62
	6XI6MPhAQkYsfxzQQn7f9mdXXtiSySp0eXq/VRDPH9wQJrWE6sdY2mhoP
X-Google-Smtp-Source: AGHT+IEMNMeFdovEOmEthHb3M9tQaXoDWJrcRpQpeLn2iZQAxWGug2pLJleD3OWWgryplxNKxQSfuQ==
X-Received: by 2002:a17:907:60d1:b0:ae3:6cc8:e431 with SMTP id a640c23a62f3a-ae6fc162659mr1523065966b.57.1752506080769;
        Mon, 14 Jul 2025 08:14:40 -0700 (PDT)
Received: from playground.localdomain ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eec2b1sm847701266b.68.2025.07.14.08.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:14:40 -0700 (PDT)
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
Subject: [PATCH v4 0/2] arm64: dts: support the i.MX8ULP EVK9 board
Date: Mon, 14 Jul 2025 11:13:44 -0400
Message-Id: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
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
Changes in v4:
* fix ordering in the Makefile
* highlighted a few differences between the EVK and EVK9 board in the
commit message as requested by Shawn
* link to v3: https://lore.kernel.org/lkml/20250701002239.972090-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* change order of the board DT compatible inside the binding.
"fsl,imx8ulp-9x9-evk" now comes before "fsl,imx8ulp-evk".
* link to v2: https://lore.kernel.org/lkml/20250627142645.134256-1-laurentiumihalcea111@gmail.com/

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


Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787032DE1F0
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171977; cv=none; b=sPAKd6hW6ctZynbCoWRboALRQCZO1jC8+WUIJ85Dr6SrfO9fAQwffnH5eaBndH6kV+b3Qs6fRi43YzJ8Kg5jQkv3gU+Xbo8YdKQ5I4EPzEePGmkjkwyEXlF/U7ZSnBz7rM9bc65v3Wf+3ZO58sZr010n8yG4aBZ3mB/OoYKQ/eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171977; c=relaxed/simple;
	bh=RsSnc8fq55PDetMqXaYJHXP75tx6bTmlZEkJDoQ45sw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OIgHJmxgv4+sFbtoiQtBHJzIydGMgxxyXETBCpz1sULpDXO5IzTKK20CGSwN/l87t9HNVl5fCeO2oZsNNUptb9C7Zb9yulPCZZy14D4TSNN1+JSJW3Z3fU8z3LpHXd2MqFckt9CQRgizS7AH+SmzAFK9BSBckEMwPYBOCJ/wCDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUOCSoLK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUOCSoLK"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-addcea380eeso934730166b.0
        for <imx@lists.linux.dev>; Tue, 17 Jun 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171974; x=1750776774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5puOQiTV+dMcJIN5xrLM/KYjgCTI9s0l+XPT4hDsmLc=;
        b=IUOCSoLKBt0IvH7uhyU+aH6lj05HC2hI9S1QIfTCovf6NDK6FJ2JGv8iYyN8JsyL6E
         pthGcY4OXwJQXHZ7EikFwO3XvNCXNBnWZYjkjui3MAXxvDYWxVAnyYjcqiCcU0hhmjSX
         hZizJgFcHl7Lmeq0fTN5rnkCFw3xsBEj/n+CmpOEZxSQa1pNtqrAnD4yRsIqOOnv+L6A
         QkqYmdIcBswpXF1XNyEJMJASMH9s2vi/iV+y+U6836eozL7dv14ocMxV9+btS2xw2KSb
         usuR/XI2IL1I7lOsgXU+d9DlAX0KcNRarwawzCqJiprqeSE8rmVKlU99TVoVXhj474CO
         ZyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171974; x=1750776774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5puOQiTV+dMcJIN5xrLM/KYjgCTI9s0l+XPT4hDsmLc=;
        b=SCermotpOvXLIeOCN69ECbA9SuDmY4VAAJ3Qahd5GR5x3SUGFHy+GVM8+bN17NRRVr
         38fBJ+UBV2vTteijI/FJRawYyK3dA9HsXC6w2GX8smd032nmP5i6Z50k0eoAzIpibn7G
         JENECnmmpI22QRrzjX9sx9HPEl1s/HXRdXqYd6VtC7KGcYZmyH4uEMjw2nAD2cPWvHGA
         WHpQmLQ+z20bhKauPNPoDkvqMOmjx3SkunKZLxZRXsnuufZuBLqXjVAoM0cX7PNZPo7h
         auw7PBISxUEmtjlPcQ457yskcpWJh7zsGCyLE9nDJeqE9C3PmrregnAxZi24u6+CDAdT
         Kclw==
X-Forwarded-Encrypted: i=1; AJvYcCV7AyzYmEL2JZJNlnLvVQoQ0FfH6QHVGyfvnVxTGbpmW7uNA0dHZtRbIeWFU8pcRLhWB68=@lists.linux.dev
X-Gm-Message-State: AOJu0YyW/r3QQ2BYptN9W2jwDG3wn21llKE0baZfbXVNkakmb4YYcN13
	4YupmlyWHqgOdw8hvU3pK3OAw9c2w0GGXmpih9AMzg/H9T0Tp/mZKzQX
X-Gm-Gg: ASbGnctFCp803n3CVkYg5nhxTsVw2CaG6M+Cyv/o/E9n/N5UFNPKVuGXX/2SClMbfmi
	hGqq39RqD3oyrzBZY2oTyaDa7mamOkaqmC+3zivQaJ+k205j6QmHQBGqEEMHuBmZK+GDDTFRltl
	zpzhiwdM9kRc9WcQjGEDFoQ+MCkTBllfh0eZUU1fW124G9mKbNbWi3hj4T8kk6sfL2AWYs9HQ1M
	PMblduxWgpct/xeadj6vj46Cg9w7559TpnZX6KOJEt6zn1w5endskoV+186VEtCIEie/Jslyi5z
	ZtLjWFCdemCu+lDwoEomu8AyUl18ob+d3QHx0MPdUa4k0s17SyeRcstVBes6p9BnCG5eBXmJpQU
	rVYm4h4nskVHsc70iHJzWquc=
X-Google-Smtp-Source: AGHT+IH772Vr7ziQrhMcxd6rpBnuGlcNRLhAme87+SagE+LcRuwRz2XSrdK5bdCJnsIm5faeH4Mv+Q==
X-Received: by 2002:a17:907:72c4:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-adfad320f66mr1474816166b.18.1750171973381;
        Tue, 17 Jun 2025 07:52:53 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8153573sm869775666b.21.2025.06.17.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:52:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: imx8qm(qxp)-mek: support the wm8962 codec
Date: Tue, 17 Jun 2025 10:52:18 -0400
Message-Id: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series adds DT support for the WM8962 codec found on the i.MX8QM MEK
RevD and i.MX8QXP WCPU MEK boards. The WM8962 codec comes as a replacement
for the WM8960 codec found on the i.MX8QM MEK and i.MX8QXP MEK boards.

Laurentiu Mihalcea (2):
  arm64: dts: imx8qxp-mek: support wcpu board's wm8962 codec
  arm64: dts: imx8qm-mek: support revd board's wm8962 codec

 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 101 +++++++++++++----
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 103 ++++++++++++++----
 2 files changed, 161 insertions(+), 43 deletions(-)

-- 
2.34.1


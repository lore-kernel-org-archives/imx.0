Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EB98C0B
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 00:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329447; cv=none; b=ijiU0+pHZIDC/2xLS40lfXtlHxL9M89Wa+dCeLKW/s0cmdm6syk3hHRrL2dGK2fCjhS3eXpIqkrh0Eshz4oaFliwVBRjiq62698+ZagCmXNHPzihp7VodqKXYzHlkflQMnkph0Ba3442+Urvtaze1wTjzEaK7hgOdnClRugF2UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329447; c=relaxed/simple;
	bh=uiBymXwretaOUkf5o53rSII7Fx9D4PtdT/XgeocguoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lNoPCUYwFVDx+umxEtfLCwxJ54E5yix8mPXu8JjodbmSnWyzjrRVv4Nq4Yr8h13wAjh+5pRgii+L72/5OfNanfBKevm8xrhAfzywenwKPbOPMeCOxOVhYv5n7gXMXTSopRt/2SwE4GakZ0tIgU8UydpVfXlQGSPIWjRBDtivAPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzEKg65g; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzEKg65g"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so4878465a12.1
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 17:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329444; x=1751934244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjbfLs8DH6SSSqq8mb1Ox4C8jBDdt+sgOqlePr+W3eM=;
        b=RzEKg65grR73BWDgZQ28UaoKH8cdsf4YNqX/xQD8splMWAjRiS7JD5T6tZv81nBJid
         sSQFovP5d2L/IJdY13EGqoLVZCBzI/Cj9pXGz8kdfBLKvxB1Ea06yva63QN2rNoNhV27
         sByw3CEfaLNbExWoORHy8qW3kqs5JTU2zHoBnMIHQ/Vg+eMx+/sxay8DjF4qGBu8/i1p
         9T7H7VAwbO9zFNXqKq9Zk2EpVvIiI0OqPZgNZ6LGJnT1xrc32+ebyVVE2mzSXo3LXClY
         w+GlNvF/bgz5cQlf6HbyQ6jcwnP+dR20k8XA7ZceHj1n6VDJecs9mTMQtRXmYR4bKEP1
         R3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329444; x=1751934244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjbfLs8DH6SSSqq8mb1Ox4C8jBDdt+sgOqlePr+W3eM=;
        b=fp1c0Wn3qC5MvLEQLEsqPGwr2CuN4JQ5Te0G1yDTJPlrTYtJcL9IsS2Im6c9Zj7j9z
         MzsdKab8+7xdnRsnkKBssEfKit59tb5hTR1p5WMRka8eQY2PBvN3HcW9DDz//1lAc3ex
         xXZkNXcmag6sSuzFlz9HIjkAi0hYqMqr5OUTQgFFE7x9AlwwOfFD+tWv7PWZRKCcRjQw
         nL3FuAu/oKAOOFk6KLCh1B2cqUzTWG9L2FYurO9RQZ8zPvScKUeO4XE94gz6gqFjXDZ7
         vTH+cAgEweT8VdiRlPYIVjMDJwpAiv7M94INo+NpvyQFONm4Ha/ieXWHvvkewmJEOZA1
         2lkw==
X-Forwarded-Encrypted: i=1; AJvYcCXMeBYQjEuJ5fE4oPd6xbb0vgolc1AjFiHUgmDsjKJ5rUm19/gJdVFf9XfcCfm8fwHS0TI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfMlDBJzOFiIK1UeaaY04UqwVkKVja/Ouzi4djy/N55Pm1QxKK
	zA0vLAtXfVKwiUr41MYmc/FZfRAHL7DyQmYVBLcTNr5vo/QUmlXq0oFe
X-Gm-Gg: ASbGncurn5dsG/ATikvEMUCAfd3pW1YMN+0vT4tWQ+33Q9XnYKKhXEvlKWhbOKqJdXj
	po1kxZuLMLQIErWqJ2/pIybFkIG7nH9mb4XjCxT+o5uzs3V6lBNLmZjHJtzu7L0Tn7yyoY3sKOq
	ZJj4oTGG+cu3AqDP4J4NGBfesYhVev+5rfTytAFI+1hStAlsSSl4/PbEPGIe8tz2aCmffO4f8si
	YapAZlvxwn4fUpKLqdh5hMhA6jv3bAXDTicXCvAvI7y9ZrtjwfM7o9NKdQGLr6ErhSwFaXMUCTz
	HCvmXOOgkVU/lKqoBNvYBE041ivr1EB6qRExmTEujpASVefYcNc679bxD8jrN4YkJAUPe7r4IdB
	EkO3Meq+VGIhNidQNQdKCQ+4=
X-Google-Smtp-Source: AGHT+IFFo6r4Ry+EiPmDe/+U6PesB1h9GLgYS0w9pmNsWBBj4w9MeTRZATpmZ5/qgVzTD5pNQ/SjWw==
X-Received: by 2002:a05:6402:510b:b0:608:3f9c:c69d with SMTP id 4fb4d7f45d1cf-60c88e61654mr13152295a12.33.1751329444447;
        Mon, 30 Jun 2025 17:24:04 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e26b7ac4esm979532a12.7.2025.06.30.17.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:24:03 -0700 (PDT)
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
Subject: [PATCH v3 0/2] arm64: dts: support the i.MX8ULP EVK9 board
Date: Mon, 30 Jun 2025 20:22:37 -0400
Message-Id: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
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


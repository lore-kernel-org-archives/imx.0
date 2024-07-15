Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E23D3BD
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062000; cv=none; b=IRIaL1Aq6TNA8K3us+OVy7FyN2/BYQhkf9frsOfYMtxZrC9HvUy19Hyy1SUxdpw3Oz6EW31XnNuU3yAhyUDmV6otaemxipAFIyixCTj5ycqc0B0lExeI1MGqDJK+7kaRxM2662nBNCVu66Cdh733W4+MCgTmeVSsx6a/jd1hieA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062000; c=relaxed/simple;
	bh=HQDOhH7XAMOdNRYtmv99nO77pkyE+TiuqMXtUvMoQPw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PeiWyOo0D0nZE/KpZysoqrQ9bwwv0ICwJ/IWOl0+1U0Nz3hXjBud9vaKDEN3qf/KHIGFsJpw6Y9Zkx98DBbLPgVO7X9B8tLkqBBTmeAUiV2WlDUHdSJ49PP9sLJFSLJHhGGWwQ2+ZMEN7TRlwC+gT7YsO0ub5XGUlvzRt7sdmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2+2gs94; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2+2gs94"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e99060b41so4672321e87.2
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721061996; x=1721666796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eL/AZF0Nl9JOTvoaifBbGBBpS8fEo+MN57T3BTmyTWk=;
        b=T2+2gs94oKd67+u6mqiWtcKPPyusPNaBdV++p9sMdKLhdaJV26mp8E+chjmav9YJxQ
         5i7vEMLkd8vfoKUvWpxsEQRXp4ziVXuOiEjE/wzosbqUtv4J/SsJvxcNKy7g0IBoNB+G
         VCP7G636O92CzBlQN6M/MLN9+hT+RaYmmacd1xahjmMki55pq3b7chc+iJIoEg6MPyoj
         0IblUb9aW+dF2O5eV9/khp56PnLoIMXQ2VnRCnwb1p5gK1HBKrvKuUjrkq2BypWbSmBA
         bo2atve9yOaJFddHK81G5/tq3QkA0RzOSN5x/mIUxsDRjIyjoUR/nENZDq8ptX86Ap57
         9tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721061996; x=1721666796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eL/AZF0Nl9JOTvoaifBbGBBpS8fEo+MN57T3BTmyTWk=;
        b=jo9hbxjRv+Rf5glAQM2YKCqdsaI/WbDbPRJUaV8BkABqFprXaJI/r28ANRzSQCIBKB
         uKLDgGYeot94Hl2ArnX6eDfgwAAaNWBxh/pGK6k3EZr/loboy6jvbtwdgeOS2XEdvp5D
         jzEp873gIJPJYhHebTH/aWyxU5KZOXQUluMac0RmyiArr6uvaVA5FotvQGRxl9skhJNJ
         9kDehsm8Fzv3QduCUziTtxux1tYjtPUiX3plVfkbtQnOWAiqLtvGaqO9L1bmUrxOt0kG
         DxVWDTV3MLi4EbhAkvK4SzYwL/0PQM6zWBKmydXtyw48tg8YaUQmYjsa7IAZZ9y69II6
         YBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRWqX4MPxgbeHESBUtk7WQvVPpewf5FCcHF59JjDNHUsUgANz6KlUFDuAbqlhDiMVC+uTyhJ6vIvtK+eSqgylEmjKE
X-Gm-Message-State: AOJu0YzFSwdKMWGTUtQ2joVtPUuDZVzwQmuZz+Bkbw+i4BQU1w6/G97J
	gXA5arffFgl29UGgwt9min6mKS1rVMkXHpKvu8cfndTHFXkFL8Wb
X-Google-Smtp-Source: AGHT+IG8rnVQYsXD0i3Gs8pZTZ5c3cJcdn0hTvsIVtcTaVANdf0u4nlLOVSzLYvdx+l7EpEEqs2fuA==
X-Received: by 2002:a05:6512:304f:b0:52c:def3:44b with SMTP id 2adb3069b0e04-52ede1b6ed4mr57286e87.31.1721061996292;
        Mon, 15 Jul 2024 09:46:36 -0700 (PDT)
Received: from playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e7749esm94316975e9.2.2024.07.15.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:46:35 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Add support for imx8ulp's SIM
Date: Mon, 15 Jul 2024 12:45:11 -0400
Message-Id: <20240715164514.8718-1-laurentiumihalcea111@gmail.com>
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
Changes in v3:
- Addressed Krzysztof's comments
- The "reset: add driver for imx8ulp SIM reset controller" patch might generate conflict when
applied to Rob and Shawn Guo's trees (for-next branch). Tested all patches with linux-next,
next-20240715 tag and no conflicts.
- Link to v2: https://lore.kernel.org/all/20240609125901.76274-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- Reset controller is now also a syscon provider.
- Changed vendor prefix to nxp.
- Link to v1: https://lore.kernel.org/all/20240516204031.171920-1-laurentiumihalcea111@gmail.com/

---
Laurentiu Mihalcea (3):
  dt-bindings: reset: add schema for imx8ulp SIM reset
  reset: add driver for imx8ulp SIM reset controller
  arm64: dts: imx8ulp: add AVD-SIM node

 .../reset/nxp,imx8ulp-avd-sim-reset.yaml      |  59 ++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  13 +++
 drivers/reset/Kconfig                         |   7 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-imx8ulp-sim.c             | 106 ++++++++++++++++++
 5 files changed, 186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml
 create mode 100644 drivers/reset/reset-imx8ulp-sim.c

---
base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf

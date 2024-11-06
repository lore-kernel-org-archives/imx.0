Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4521D90AC
	for <imx@lists.linux.dev>; Wed,  6 Nov 2024 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883972; cv=none; b=SVr/Ja5hXYQntAc5LZ5towm/cH4r4Sr4umUWgvh6dh1hgBaUqEWavqbkjvoIx4u7WZDA4U+bvJNNBjbjBKmSaObZ6S9W3iD0FbUrB8iWXa0mEeWLAkKMTXmrPqINHFK0Rd8AIaGsF+WoIUowGcuPwl4rOzIscQ3NOZr8RemfwqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883972; c=relaxed/simple;
	bh=LtDcq5GNGdpLQi/gwT3VpDWdk4u/M9CX5RZIK3YonB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hT4EWOaK+EWB/fC2Y92npo6Fa/Zq/cb0twdbYUOwDsLn32i1sbBFmuhGDAftYbQDx+Zf/PjQJeh7jZtvIYfHucyeMuwOwUOp+YyV1Y/qp+pu2a1BUZkLGNWrDTZn3YW6bOmGq1KSPtFPi4+SqSzwOxSAbavuMr35Hdh5Fvbn1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Kj/9ZNaN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Kj/9ZNaN"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cedea84d77so3425788a12.1
        for <imx@lists.linux.dev>; Wed, 06 Nov 2024 01:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883968; x=1731488768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQGfCgtGxny3+etN5uPGt5VE9z/U2oT3XLy2KTaMLtM=;
        b=Kj/9ZNaNPVgIHKd/4gPnwwQu24FA4NQIWj0LAtBiFIljytDA1mYFN8ZnZtgzMhKkJZ
         M9j2gKOWWwfwmOF6gUqe2tN/zAcVerUddYLTGdQvG+022qzIfNHnwBGStue5fq+Nlqdu
         frogcunrUDJn1ZG9QlYCKtpomvPDBVy1MNhio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883968; x=1731488768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQGfCgtGxny3+etN5uPGt5VE9z/U2oT3XLy2KTaMLtM=;
        b=j0SMA01JLwzgPJ2/j0KQwCwMAujRKB88dLAx99Qr38WaOs5bdHiJk+YtRg9mK8jJwZ
         YLCj9ywBC66ssGgaaoCwrduAM0GSO+xjdzA7GIca3GSm6H+6vbr5ME30TlThG7vQhL9p
         t27/RfymE7G9EJWSSOsK2cxedBt+/2E3I3NXmC5j5v8Di1Jno7Y+JXGQ7b1Mx6m8Z+L9
         je1hGxP9oSOce0WQ63E4Mpj2qNaQb9abV+oSFpI0ETcwnVpKDTnwEtE+M6Hygb6NBblN
         r+KOdFUEITEFSTFSHdTNrRBzPzE6JnYSRBOoKwgfrLuFdccc3UoEaMNSViJItfoezjgm
         R5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4bllzyuDpJ+Qh3BGG3RIn3rLGSwGUk6NT925iutvzZnX8J5uU+zyF0jMXSmnSiYla96M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2HMqEO9QvtM6tw6RNW5a+KqDB2aYdx9siSGbCXDwXfBM8Vsv3
	u5y3b3aLfd104JlIG1vAX5hvJyqGTh/MdHHiAFLPGM45okkbgMASs5vC3GqXva4=
X-Google-Smtp-Source: AGHT+IHS33PWmczfWikAhpAdNlCU+a9+IAsnRCa7MMogy1tCzBHrZ2XtY5RmjifBnJRTUzSpIvQdoQ==
X-Received: by 2002:a17:907:724d:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-a9e50978806mr1335979766b.39.1730883968287;
        Wed, 06 Nov 2024 01:06:08 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/8] Support spread spectrum clocking for i.MX8{M,N,P} PLLs
Date: Wed,  6 Nov 2024 09:57:56 +0100
Message-ID: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8M{N,M,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (8):
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx: imx8mm: distinguish between ccm and anatop references
  clk: imx8mm: support spread spectrum clock generation
  clk: imx: imx8mn: distinguish between ccm and anatop references
  clk: imx8mn: support spread spectrum clock generation
  clk: imx8mp: don't lose the anatop device node
  clk: imx8mp: support spread spectrum clock generation

 .../bindings/clock/imx8m-clock.yaml           |  46 ++++++++
 drivers/clk/imx/clk-imx8mm.c                  |  99 +++++++++--------
 drivers/clk/imx/clk-imx8mn.c                  | 102 +++++++++---------
 drivers/clk/imx/clk-imx8mp-audiomix.c         |   2 +-
 drivers/clk/imx/clk-imx8mp.c                  |  21 ++--
 drivers/clk/imx/clk-pll14xx.c                 | 102 +++++++++++++++++-
 drivers/clk/imx/clk.h                         |  24 ++++-
 7 files changed, 289 insertions(+), 107 deletions(-)

-- 
2.43.0


Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799119DFB6
	for <imx@lists.linux.dev>; Sat, 28 Sep 2024 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512697; cv=none; b=D34VcATjc6PNfy+cQgcRLWj8PIMUp4EMmoyqZF5g1k5P65fLjQxNzLxCHPeXKtw6n4ERo3iTj1oKTqKFWKlvBof0djulZHj5IDezDJCDVW/W8zOAHkzjXEauwAC4H36ZraCVUgn5AMg0CJbTIaOBG0ntk/jHf8ZfYh+ebvlOHJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512697; c=relaxed/simple;
	bh=XBVcSsI6SfYZO2oZC/+zS6umDLhfmyLe2aIRpM+7vdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FpDQUwIZETcLW1yfXffMilipf+YREQ2DYU7NA+mQ8a3y3/W0pJ+vqumMXgs/VFVA9HDK0rHkmuLze/b/EO+dIzZ16NKZZfid4B0pufl5tcagNrPCExgh0aS86ImY2nXK23HylZErp48P7O9yX/qjn6Ewp7j5aWZRJuqlpmpqw9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KKJORgy/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KKJORgy/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d3cde1103so367102866b.2
        for <imx@lists.linux.dev>; Sat, 28 Sep 2024 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512694; x=1728117494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LrytHNZtSXo7AmRE+wgJFzGOYaJlj3QtdpLmr/8fPs=;
        b=KKJORgy/diuZF00ldwLJbvtJq7kIC58Gpt+dOrHtTZewN1cPt2qu7BsYuCwdRki8X8
         xSV0EG0Ap1eOc6sTM4C4+qg3pwKitwUnoqHDCJubPVwoZaa+Ew66lnXMSCwZ6m5MqTzw
         nvjU21AT3OfHtYbWanaxsRfIYqjPowyLZTo0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512694; x=1728117494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LrytHNZtSXo7AmRE+wgJFzGOYaJlj3QtdpLmr/8fPs=;
        b=YVAXTVjL9Q0e3fdeszc0ZEXM0IqG6zTUh1RvnS+jGAPne8LnoWECLjzp6iFBDgg7/l
         OGXAV1JzCClz3rJK3deOw0B7W/yBffHUeDPJ3fJkl3s/lo5zMb5d1juAe/UcTxuI/7YL
         n8NXnFnIwee8ki2KcVy9LJpUHKtwr4kv/VbThXmFkoZCoXdYQDNtdhPAzpKSjovBQCWR
         VdVswKZuHpq58QvykS6Ikd5uQefx7WIIgyUy1ckUPeVfkg8MmhcQhSHZ0KgJB3/GgT0a
         ZS8W28lLuDi82jAzHIiZZDJGY7ACYaLdqGR5F99rJ1wuX+xx+tm0uXiqhNaw4ueAKp3s
         ksOw==
X-Forwarded-Encrypted: i=1; AJvYcCXzdgDUqyGgHyDXNqagQ4E7TNER+oPSs/2BlcUOgkGL7A9Oa4uhZMu+NbpImVIwT0veBp0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz61bDDe7cDHQsXcHrPv+bBpJG1Rh5E/QDnESgJb3+f/JIkeMKZ
	xvG5yK6LwOAdKHnj0laIlNxguclLggHBN7g7My8gKBevwfeMltepbV4V8vrUrp0=
X-Google-Smtp-Source: AGHT+IEkHCCPklUKDrG/O+n08MGRKv6oRGKdMfRpXV+dG1tZEcS/RKgDqAfK93J9aJhrYzeMmU8vWA==
X-Received: by 2002:a17:907:7ea4:b0:a90:41a5:bb58 with SMTP id a640c23a62f3a-a93c4908b08mr674466466b.16.1727512693994;
        Sat, 28 Sep 2024 01:38:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:13 -0700 (PDT)
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
Subject: [PATCH 0/6] Support spread spectrum clocking for i.MX8{M,N,P} PLLs
Date: Sat, 28 Sep 2024 10:37:48 +0200
Message-ID: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
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
a board using the i.MX8MP.


Dario Binacchi (6):
  dt-bindings: clock: imx8m-anatop: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mm: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation
  clk: imx8mp: don't lose the anatop device node
  clk: imx8mp: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  41 +++++++
 drivers/clk/imx/clk-imx8mm.c                  |  13 ++-
 drivers/clk/imx/clk-imx8mn.c                  |  13 ++-
 drivers/clk/imx/clk-imx8mp-audiomix.c         |   2 +-
 drivers/clk/imx/clk-imx8mp.c                  |  21 ++--
 drivers/clk/imx/clk-pll14xx.c                 | 102 +++++++++++++++++-
 drivers/clk/imx/clk.h                         |  24 ++++-
 7 files changed, 196 insertions(+), 20 deletions(-)

-- 
2.43.0


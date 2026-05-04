Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46093A5E92
	for <imx@lists.linux.dev>; Mon,  4 May 2026 20:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777926134; cv=none; b=MZGaJUmdfnCf1ixoPgMxLDSUHcsTPDp89FghBlx1fzJuWRBuvBQPBeMEq8Tz5AvDD2ic5wj31lZ0ok83FryN1lKd81cj1xAuX4vKlaBBEEIXlUWBT+kfRvFy0K9z1x09r0kD1+489I9HdmrlT3+65KDwuick1tcrMl46XHjBmEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777926134; c=relaxed/simple;
	bh=V/85oQttdHGcKWzfEk3TKfcIxxxpc5yEguI3HRpcOMo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SjWVgJJQZTjgSEJsq1YKOvRT558/yq6DialEYbR1lIlnKREnsCyrhzYJ0d7h966J7LeOddMBiCQ/c7D3FWf6gDXJuPR1LbaDRd8wsLO5ZvV+9DKdUe7QXHGUs4Vr5qunH+vDy/5s07RGxN584g6rn568syXFSDW059MA73Kk5DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wJznX-0007WV-3d; Mon, 04 May 2026 22:21:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/4] i.MX LDB DT cleanups
Date: Mon, 04 May 2026 22:21:40 +0200
Message-Id: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANX/+GkC/x3LSwqAMAwA0atI1gbS+sWriAttowakSiMiiHe3u
 HwM84ByFFbosgciX6KyhwSTZ+DWMSyM4pPBkq2pohKvBg2e+yEONz/hLDcrtlNBpfWuIs+Q1iP
 yH9LZD+/7AZL914tmAAAA
X-Change-ID: 20260504-v7-1-topic-ldb-fixes-8b3042dc50de
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
 victor.liu@nxp.com
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

this cleanup prepares the LDB dt-bindings for the upcoming i.MX93 and
i.MX94 LDB support and is a different abborach than [1]. This approach
should be easier to maintain [2] and far more flexible for upcoming
BLK-CTRL or IOMUX_GPR syscon sub-devices.

Please be informed: I didn't do runtime tests but since the LDB driver
never used the reg (nor reg-names) property, it should be safe to remove
them.

Regards,
  Marco

[1] https://lore.kernel.org/all/20260329-fsl_ldb_schema_fix-v1-1-351372754bc0@nxp.com/
[2] https://lore.kernel.org/all/2mkih6id2cfqjfksfvvitzlcnyfz7r4rs4f7bhtvdhf7scwzue@bb4ucnfxa4l4/#t

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (4):
      Revert "dt-bindings: display: bridge: ldb: Add check for reg and reg-names"
      Revert "dt-bindings: display: bridge: ldb: Fill in reg property"
      ARM: dts: imx6sx: remove LDB reg property
      arm64: dts: imx8mp: remove LDB reg and reg-names property

 .../bindings/display/bridge/fsl,ldb.yaml           | 25 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |  3 +--
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  4 +---
 3 files changed, 3 insertions(+), 29 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260504-v7-1-topic-ldb-fixes-8b3042dc50de

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


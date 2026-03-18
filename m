Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1313793B1
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821056; cv=none; b=D9YL3VamA75SRW2znXB9LY0O8+vC53auX6EIM89x+spIC0JPF21iJkBJLCkMxA4FU2Uu5mJzmXtOPldAyAA1KNuRVe8Ah8YaBH3WVtwN9h/BKdAuT5Q8kijUAZUfW2+6xH5X5QhnR5gVDeJTDHubSuCvhJoEkamHUIvuixpEOWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821056; c=relaxed/simple;
	bh=mE5Gqb5w5qJV6s+HALVx5N2QXllvrG0LS3ejVUVVgSM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nUOkA5dbxAcCFjy9Lv4kFixYvCmnouZzGjgNJ5kByqQZpP6kWM1iKdVGC2l8kXsxAr+4oIYqZPYPzugq4NqQalN68sdpWTBdGsVJPpf1YeZjsGK3uPwIHpPHps5RVAxviKgCnu1lnuvpjgAWkAwtYHe0UUObYI7tO5N9LRLPi0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E8D771A0B1E;
	Wed, 18 Mar 2026 09:04:06 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BC4471A0B0C;
	Wed, 18 Mar 2026 09:04:06 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9B4EE1802161;
	Wed, 18 Mar 2026 16:04:04 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH 0/2] Add NXP FRDM-IMX95-PRO board support
Date: Wed, 18 Mar 2026 17:04:01 +0900
Message-Id: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFcumkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3czcCkvT+LSilNz4gqJ8XfNEixQD4yRTA0sLIyWgpoKi1LTMCrC
 B0bG1tQBAQP+GYAAAAA==
X-Change-ID: 20260311-imx95_frdm_pro-7a8d03b50982
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773821044; l=654;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=mE5Gqb5w5qJV6s+HALVx5N2QXllvrG0LS3ejVUVVgSM=;
 b=LWF0n4fHX0FoJSDwiQOS9IThSnKv1UhSVQTEwkOJSRvZS05p3w+3phh9aL3+j2u9WVlbJB0jZ
 KyGRQyugl47DG0+6yAARA/roZf/HW4X9yJqjNKBhA6DjxwfFkiW9f3w
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

This patchset add Devicetree support for NXP FRDM-IMX95-PRO
development board based on i.MX95 19x19 SoC.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Joseph Guo (2):
      dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
      arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts

 Documentation/devicetree/bindings/arm/fsl.yaml     |    1 +
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1012 ++++++++++++++++++++
 2 files changed, 1013 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-imx95_frdm_pro-7a8d03b50982

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


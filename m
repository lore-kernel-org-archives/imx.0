Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9AC17B418
	for <imx@lists.linux.dev>; Sat,  9 May 2026 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778311292; cv=none; b=BKSiZJMxQ5y2wq7VJSJGF0nKiH+5m0wStmUwVoItMLVJufYMRl5fuzKlgzNYHmmzNEp6ggyIWeDntV6b6ohl5wGaHfUW2tUX16SW2X6cRlHtTFEHfhos0cp8AgVNYASuTtHLmys/GDNf8jl08hsUU//OBLCMKdUNLpyQwg+OWSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778311292; c=relaxed/simple;
	bh=e7feVXRt8YF18HtNxdbrCQf9zi+oyqiTuXLIliRn4/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aWeUk6q3rdf5nUAOJVtnF0oaxPvA84sDdvzIfJJjwiTqzz55bkglnHgnlwXsJL4qPF1icbWYh+9z3wZBjXlg5HxIBjKzLTG5aC/nPZuh4ZAeepTC68SB0CRi0Lwf6ZhuKFE0jIXKu7UP2WGIP6ncKklMk6PddRoM4RL90Xtd3zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D1E711A39D7;
	Sat,  9 May 2026 09:21:23 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A0CE1A2413;
	Sat,  9 May 2026 09:21:23 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 62E2A18002C9;
	Sat,  9 May 2026 15:21:21 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v3 0/2] Add NXP FRDM-IMX95-PRO board support
Date: Sat, 09 May 2026 16:21:13 +0900
Message-Id: <20260509-imx95_frdm_pro-v3-0-96290b471396@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGng/mkC/2XM0QqDIBiG4VsJj+f4/dVmO9p9jBFZujwoQ4c0o
 nufBSPYDr8P3mch0QRnIrkWCwkmuej8mAc/FaTtm/FpqOvyJghYAmeMumGuZG1DN9RT8PTSqA6
 4llApJDmagrFu3sH7I+/exZcP791PbHu/lPqlEqNAVQtgZGVBM30b5+nc+oFsUMIjFvgfY44FF
 yhAlxKtOOJ1XT8yYJbj5wAAAA==
X-Change-ID: 20260311-imx95_frdm_pro-7a8d03b50982
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778311281; l=1190;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=e7feVXRt8YF18HtNxdbrCQf9zi+oyqiTuXLIliRn4/4=;
 b=6zDrA03bjP7dgJmPInl1iH+jtlFPbTDJzNYdrk3jrs7dr35LrdsOeveyJqVWOojfCKG1R7wfd
 Pq87IkKG5NMDVHeHEMM3ZMAB05m0RYbrvYYJKj7lNH8mPKG8OZ1zWQJ
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

This patchset add Devicetree support for NXP FRDM-IMX95-PRO
development board based on i.MX95 19x19 SoC.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v3:
- Change status of CAN1 to reserved
- Remove unused pinctrl
- Explain difference with i.MX95 15x15 FRDM in message
- Link to v2: https://lore.kernel.org/r/20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com

Changes in v2:
- Run dt-format to reformat the node order
- Change compatible of mqs to audio-graph-card2
- Add imx95-19x19-frdm-pro in Makefile
- Link to v1: https://lore.kernel.org/r/20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com

---
Joseph Guo (2):
      dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
      arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts

 Documentation/devicetree/bindings/arm/fsl.yaml     |    1 +
 arch/arm64/boot/dts/freescale/Makefile             |    1 +
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1021 ++++++++++++++++++++
 3 files changed, 1023 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-imx95_frdm_pro-7a8d03b50982

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


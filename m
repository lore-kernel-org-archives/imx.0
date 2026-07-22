Received: from mail-m49209.qiye.163.com (mail-m49209.qiye.163.com [45.254.49.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D632E3C943F
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737104; cv=none; b=t3cik3wIWp+cH7BD4wd8pae6qw0LsODG3ECuesJ/NSS39rdTmRGJpTY7lqrRywd0op/3UEReQ2R1gytiVaObro4TA6hP5xqRIejUmbdIVwZyQYX6RE2OtoYGh7hofTY7SQtI3mfBoHu1NOFzH3xBcR6AkFVtBxXA0f+jmCk+ikM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737104; c=relaxed/simple;
	bh=XKSyz3rotSlKX1BqouvmaSVj7RopHzI3qas4x53oa+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FT+JUNSCHhKrI9lxldNAbfU/GmSNzM7kT/qMciFM0Nmigg1c0rJZ0lX2vIaJZN3uFFFs2VHJSgifK80RiR4LQIAbDfj7udkbqD0fmZeLKERcLTcL/i4KRmuGeW/osfXpBpKVqBGcoRZFSIvdVjsHzex0cM853trTF903jEi4nqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Xq8Lvvev; arc=none smtp.client-ip=45.254.49.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Xq8Lvvev"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 472ee9f29;
	Thu, 23 Jul 2026 00:13:01 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
Date: Thu, 23 Jul 2026 00:12:38 +0800
Message-Id: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbrYGoC/6WOQQqDMBREryJZN8VEjdpV71FcRP1pPkUjP1Es4
 t0bpQcodPkG5s1szAMheHZLNkawoEc3RpCXhHVWj0/g2EdmMpUqVUJxmlt8TchHWAP/pgXPlcx
 FqXWlCs1idyIwuJ7eRxPZkBt4sAT6F9siuOBZX6u2qrO6NOYe7Dz2QN6ZcO3ccExY9MHR+3y+i
 GPof22z7/sHk3DASRMBAAA=
X-Change-ID: 20260616-rubikpi-next-20260615-462417aa865a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784736781; l=2096;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=XKSyz3rotSlKX1BqouvmaSVj7RopHzI3qas4x53oa+M=;
 b=XADByVQZ4Absf2IRhJZ3nthW8M2bYqMEyC3OBhnlHKRuiJGMNYUFIo8mWIM9/agUNow1JBAlF
 y8xdrSsHcJpC1xSKOFSuQZDgxjM9ztTRr4rHRVQYqIgiyp443uUtRRE
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f8a9a13b409d5kunm8c572dff4a6e5a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0lKVk5NQ01CSEJJQk1KGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Xq8Lvvevs8CxyKd34U94tBj/KJmRvaQ0t51HccmhqPNgZ6Oo+TNpCC3ApEgH8ULD/6cayo+EUe53VBwjj2vZPTrBEkpgq5vZF62taNtYSQAVHYC2A9IXNn/jlkwyKaONcw8L1Ca69o77dIxGP5G4lyovCyksgw5WYKVpCILrkpM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=zeqQNC9dxpeHtC4McTJMo5VPAei5GmbsiOwZwfryttQ=;
	h=date:mime-version:subject:message-id:from;

RUBIK Pi 3 provides two camera connectors but ships without camera
modules, and each connector can be used with different sensors. Describe
only the board-level 3.3 V output rail in the base DTS and add optional,
per-connector overlays for Raspberry Pi Camera Module V2 IMX219 sensors.

CAM1 is connected to CCI1 and CSIPHY1, while CAM2 is connected to CCI0
and CSIPHY4. The overlays can be used independently or combined, and the
Makefile provides composed DTBs for both single-camera configurations and
the dual-IMX219 configuration.

Both dual-camera and single-camera configurations have been validated on
the RUBIK Pi 3.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Changes in v2:
- Keep the optional IMX219 sensors out of the base board DTS and add one
  overlay per camera connector.
- Add composed DTBs for CAM1, CAM2, and dual-IMX219 configurations.
- Correct the power model: VCC3V3_OUTPUT is board-level, while each
  PWR_EN controls the module-local sensor rails.
- Model the 24 MHz sensor input clock separately for each camera module.
- Describe CAMERA1_GPIO and CAMERA2_GPIO as privacy indicator LEDs and
  associate each one with the corresponding sensor.
- Drop output-high and output-low from the GPIO pinctrl states.
- Rebase onto next-20260721.
- Link to v1: https://lore.kernel.org/r/20260616-rubikpi-next-20260615-v1-1-3d96b89397ff@thundersoft.com

---
Hongyang Zhao (2):
      arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
      arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays

 arch/arm64/boot/dts/qcom/Makefile                  |  15 +++
 .../qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso  | 117 +++++++++++++++++++++
 .../qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso  | 117 +++++++++++++++++++++
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  24 +++++
 4 files changed, 273 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260616-rubikpi-next-20260615-462417aa865a

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>


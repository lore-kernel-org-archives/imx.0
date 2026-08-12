Received: from mail-m19731101.qiye.163.com (mail-m19731101.qiye.163.com [220.197.31.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299FD381EA1
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 02:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786503528; cv=none; b=Xuy/gn5jNddOeIZupM6asi42mpOy3h185m6nqAL3n596U9A+psYHZivcF1xVBbOfYdic2+dmomR20LYnuYs50DoSLtbHQNX1v9pSh5K8tI2VNAA5SCX2JmiOY1hEKAVjQrr4QqNZdfwshMfQuE0JrIrF4tKVvC2e+kal7iqSsyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786503528; c=relaxed/simple;
	bh=LTaBk9f3msJO6Xsstu4uZkU2+x36F3GJxnDvgK5nDZs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k4LPYhzV+EDfv8EGbF8YalnaJ5lQxjpf4NcKxevARudCuo7cPtpTTBTSeILsaUxcMKJGzlSgfxqdqBu15A+5xSddXkTtkyNaZit+P68Fq4anXautJaZq5Uo9z+APwlzinhk3HzocR6RG1q2ebfS8VXco1oerAR9kAg+RLXjFhiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=IBr8dqd3; arc=none smtp.client-ip=220.197.31.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="IBr8dqd3"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49a56c4b0;
	Wed, 12 Aug 2026 10:23:14 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
Date: Wed, 12 Aug 2026 10:22:37 +0800
Message-Id: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3Ye2oC/6XO0QqDIBQG4FcJr3dGalntau8xdmGpS0YaatKI3
 n0Wg12MwWCX/4Hz/f+CvHRaenTKFuRk1F5bkwI9ZKjrublJ0CJlRHLCcoYZuKnV91GDkXOA17W
 EgpECV5zXrOQo/Y5OKj3v7uWasnJ2gNA7yX/RIgYMVDSsrRvaVEqdQz8ZIZ23Khw7O2wVvfbBu
 se+POKt6H92mxrJ26oI/WYRyKGoupILUecYF5/Wuq5P/L9+ZV8BAAA=
X-Change-ID: 20260616-rubikpi-next-20260615-462417aa865a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786501394; l=2720;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=LTaBk9f3msJO6Xsstu4uZkU2+x36F3GJxnDvgK5nDZs=;
 b=i1e9fCAQ8RNSznnVVdzbNMsQYU1PJDYn2qrVVB1tbxi7xSkuo6L61D7HnEsEFwg4bgCrVS9R+
 jLduNxACIwABVEQKZIpnHCVt75H989aK1PsHGlMbU5iLCRkOPpuml1i
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9ff3c7ee3609d5kunm2a4e641d37f47f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGUNNVhlDSBpOHUpPSEkYGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lCQ0NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=IBr8dqd3lkzB18DsIpkDhOtTOOcoiKhh6U7jsoz39eNMBKCIWbm/RnZgrTCk2uqlFM29Vt2ccvHZcx4mnnufQCpRYJVGhG3BAmIKyFKZ8NI+l6ViHbNjVegSSR/BJ3Xn8LfpEJoe/B9JVVSHee8vU9LSVbfGdR/JU2H5U7CNc4s=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=H73TAwOAuZuY+AwTNwZCpyJkJqzHQ8W7sXvPEwn5o+Q=;
	h=date:mime-version:subject:message-id:from;

RUBIK Pi 3 provides two camera connectors but ships without camera
modules, and each connector can be used with different sensors. Describe
only the board-level 3.3 V output rail in the base DTS and add optional,
per-connector overlays for Raspberry Pi Camera Module V2 IMX219 sensors.

CAM1 is connected to CCI1 and CSIPHY1, while CAM2 is connected to CCI0
and CSIPHY4. The overlays can be used independently or combined, and the
Makefile provides composed DTBs for both single-camera configurations and
the dual-IMX219 configuration.

Both single-camera configurations and the dual-camera configuration were
validated at 3280x2464. In the dual-camera configuration, both sensors
streamed concurrently and their privacy LEDs followed the streaming state.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Changes in v3:
- Drop regulator-boot-on from VCC3V3_OUTPUT because the boot firmware
  does not enable the rail.
- Clarify that PWR_EN controls the camera module power domain, while the
  baseboard has no dedicated per-camera regulator.
- Drop the fixed 3.3 V constraints from the module power-domain
  regulators.
- Add Bryan's Reviewed-by tags.
- Rebase onto next-20260810.
- Link to v2: https://lore.kernel.org/r/20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com

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
 .../qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso  | 115 +++++++++++++++++++++
 .../qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso  | 115 +++++++++++++++++++++
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  23 +++++
 4 files changed, 268 insertions(+)
---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260616-rubikpi-next-20260615-462417aa865a

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>


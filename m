Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147E40FDB6
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 15:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120390; cv=pass; b=rW/lL1ZQkj1L4aOeegYnPMznyGp4Fc0qB3nNd/tv9CBAfMsdeHxK5JAd7CPIeQmBjf2YgJTRgzQ2F3DC0y/nr6SQCLSG0myO4DuqeDNIT1jG9pNxJ+uaomXX+Q66WWWj+MbPGqsSonDEJ13Sb/dg2mVdOlnr3NgtfiUU06Hjnw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120390; c=relaxed/simple;
	bh=7p3KnwhCjiXCAFckjTZO4s4z0gC/fOAvonkWNNLLb1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A50rLOoG0BVFVAm2EqiBIHqlOyDPuFwx1+wh/LKfnOcYOlxVk5gu/tjDJKL5fMz7xxXXFpM0HkVtg1vbk4p9lBXj3D6Kp/IntokkufO+rDpE21bFkEltjDBG7JKDI5dDTHCMawVv97tOVhLUSt04QxlevqPjKqBos2QJ9DkYHE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YLf3L7NF; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YLf3L7NF"
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=IzqbFvCBgdaUFwS1qXmfy9dqVHi/nCebaI0DN6ZkaEE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120354;
 b=QSB/BdntK/L32rCqReOtAcvbz2Qy4htYndofcwH7hxhlkmUMj4fRLjClTTZ3NPSUenr0c71f
 csrHN2Kqsf2+dz1hz4Rq2JR4b7b5W99hK7mOH74KFKzEip0kk3DkDJfXRXXLfLnT0yY6erjfMeE
 LLBvaGjuwxOfMdR4CGd+muMDA0QgtaZTeIX3cNGoTgQwXsW+AesBzDHgc+VntGSq1vyWKZ4LG82
 FdC0mvd0jAu4l1zSJFaiJ986qoitYWjul+cJ7xGlhCW4lHd+09CsPmYR67PEC9qIJiN2iO173io
 KySf+A1DDreQqex7KCWHwY6HjS2GaY9kSpIzIUwdbPe1Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120354;
 b=HcibdOMaswqyzbyta5uMho5J6vibFrkW9ZVpH4IuyZlDLu3yy1wuh4caS12JY9bhmdoAGg5s
 mtETllfl23OaFNm1fd7D0IoMG8YDFybfsz4PqoAvboKeZT7ECqSTDG8thxg2Z++dCUzZjCHTint
 /injH4kkallhND3tK75rL6yfQIctsQTmjPrbfFWeSYIKsAHFvOTk3nPp9pvVVQZ0NTfNVzKrWHy
 JBkPosYq0PdC5G4xVqdjYp55oehhZcPKmhC98YPPIF8ej2YPXr5QAXNlnkXTXQR63ajtx56+6SC
 L4ZxoqBv3G8ptv754BSpGb7dsH5hP7eli5b67ptmDZDYQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Thu, 26 Feb 2026 16:39:14 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id EFE42A407F2;
	Thu, 26 Feb 2026 16:39:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v3 0/5] Support TQMa8QM
Date: Thu, 26 Feb 2026 16:38:49 +0100
Message-ID: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4fMFxL2sBsz4F898
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:e6eeaebf4cf021a93157c2a1ac4b54d4
X-cloud-security:scantime:1.938
DKIM-Signature: a=rsa-sha256;
 bh=IzqbFvCBgdaUFwS1qXmfy9dqVHi/nCebaI0DN6ZkaEE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120353; v=1;
 b=YLf3L7NF14MdDkjwDwaoR11qX5nV7B/1/7f1DALpzDYMf3ppRmkwl7Y56sPXDTQORY4AbW6u
 0PAT2uBZrvHlsKji08hp7OzF1UbAsZDU37L4pMOadwiQDAc7Ze8nCkvVZy9LqfNACiP/Dt29yqJ
 AkrDzHtcY1MMtbOsIcb3k8H3KPZO8hn1dq60krpgmyOZdXlZucRoGvfhMcUaIOcwnbFnZAmoVGQ
 ueqP0lAfUTbp3MBdst/HUID1Driwtc0j8Xx2huEeeOLHSC5CqfiW7+Aj/0MfEeDs4zLdFcKcYcj
 nmzt3zmYJFANenhNsvKRuaGCQcmmmE4gb5vtiJ4Z9pl+Q==

Hi,

this series adds support for TQ's TQMa8QM. The first 2 patches are prepatory:
1. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

2. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

3 & 4. Device bindings and platform DT

5. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Changes in v3:
* Small cleanups in patch 1 & 4

Changes in v2:
The need for clock-output-names properties for renesas,9fgv0441 has
been removed by reworkging the PCIe clocking

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (5):
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: freescale: add initial device tree for TQMa8x
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 867 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 325 +++++++
 6 files changed, 1207 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0


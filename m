Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49263D6CD4
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181984; cv=none; b=n0npUrfVin9SjUjjlka5rD2kU6jIUKJlVoe8/U2V62qkNA7lLtEMQBaPWPAMohZVYDXlWY+yGO6ZKV276KfmOWN+tLrQO3wOJfTnF8+AoKm5L+5OtjrPv/qd5uUwdy+PiqYtUw8trD8WfB47W/8nmJbsHZKvxPX9WsZNupgby4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181984; c=relaxed/simple;
	bh=enmkQ4SM11Xyvw2Ocvn2UqEtwMLyXpQwOuPLsdcjDI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=COIiL/Ih3zvQdpkMygfmtS+psSnRQ/l+EtKKV3v7T/zbUSm+9PFXJAYhkVPZqvfJe4tr/KrbeshcHRZvQyafq5TLeUS+Pl9/n/AtTzEJ5hRV1wmXG26Bd6vFbRL8mvlcEoDUiu4L8qm/Wd7EGtNP8erC+sPFO6scisQ7ulI4DDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ZN44d2h3; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ZN44d2h3"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0CBC118F56;
	Mon, 27 Jul 2026 21:52:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785181975; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=T2vKdvVL2ZS5UItHSrgeEqfl6mbZxRI3CvzLUep76yI=;
	b=ZN44d2h3dVeEWHr6hg1DtO0JZbAipOrjVB1oVzkIhB7985G0s0xyV9ncexDkr2XwM6Qdwn
	/Ebz2YMT1dMRMdx6LO+cy6fkJucjOFT+pyk7yQ3XnY21Apl7EJuYhWF9cLYCF4BLO1jJF/
	TyFCLiWeHljK26G1N/SECM5U8mHtrFiQy4Z2I3CVwl28+tKGCyPmQFvshSJH4KQV+EoEqH
	Tl3MD9f1xxY8GCjbicmmjF8eVrjMijgerYI9XRGgIBbi/KKWAsly3q9fHaT5mtzl05uMeZ
	4B3WvAjslBGdgKB29lwzLQvH8fDIqKynv4LfYgWPJNkOT6rGg/Xf3+W2twFMJw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Date: Mon, 27 Jul 2026 21:52:16 +0200
Message-ID: <20260727195244.78199-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT label to SPBA5 bus for usage in board DTs.
No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V6: New patch factored out of previous
    arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9cf9f6f08654d..bec64cbb36347 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1437,7 +1437,7 @@ aips5: bus@30df0000 {
 			#access-controller-cells = <3>;
 			ranges = <0x30c00000 0x30c00000 0x400000>;
 
-			spba-bus@30c00000 {
+			spba5: spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				reg = <0x30c00000 0x100000>;
 				#address-cells = <1>;
-- 
2.53.0


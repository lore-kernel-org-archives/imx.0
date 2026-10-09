Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9924D9F88
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550189; cv=none; b=NK8c/1D/CTyseakRHEICTfDlVRLWjzsCIPuCxAOQui5eKuvfjY65OinpJqYGCAGfiVfiSiFRFExLRt7MkQOz/uk2Xgq0dqqmjSyF4toGb9aYypS3SmGoAZ4Qdvcx//wOcyR04XV+SxRNAXm0snSWosr4PG25y4rMElerE4ibcJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550189; c=relaxed/simple;
	bh=1XBsJBnzofYErpaoeoKCSDs1HqT3DWsfGEqap0XFLjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j4vJf27LhSci8wzDEljGqSy4+GeIe4Ixd7QIv345LrCul1799+R714MigmuVvbtxJm2Flr797e7O1b3NFMnL0QrV+g5tXKRtuM+vTbSXqt1rJrwSyPpdzwFckoKu3dV6JddAQY55wLwTSI5mEKbXA+KSXWkyjVI+6A/FwUQs8GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 49B9B1A02F5;
	Fri,  9 Oct 2026 14:40:42 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C4411A0002;
	Fri,  9 Oct 2026 14:40:42 +0200 (CEST)
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8F8002037D;
	Fri,  9 Oct 2026 14:40:40 +0200 (CEST)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: netdev@vger.kernel.org
Cc: s32@nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v1 4/5] arm64: dts: s32n79-rdb: enable NETC IEP18
Date: Fri,  9 Oct 2026 15:40:33 +0300
Message-Id: <23e77c8e48f84c67af8ec24bfde712baf64eec54.1791548316.git.claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791548316.git.claudiu.manoil@nxp.com>
References: <cover.1791548316.git.claudiu.manoil@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Enable the NETC v4 ECAM bus #18 on the S32N79-RDB board so that the
ENETC v4 Pseudo-MAC port (PPM) PF and VF instances are probed.

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 1feccd61258e..897ba24ac03a 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -68,3 +68,7 @@ &usdhc0 {
 	no-sdio;
 	status = "okay";
 };
+
+&netc_iep18 {
+	status = "okay";
+};
-- 
2.34.1


Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EB473173
	for <imx@lists.linux.dev>; Tue, 21 May 2024 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716287114; cv=none; b=Z/bHq7E+v/7LbqZc1TB8eaibEsFCJaos1WUEUd37pScO7zFiuyF3wgmN4ekL4EQ6s8ShQA3MJ/4otPAWpFmObzOVhJE15+IhYMU3kVY/qLucR6Yq0Lr5RinbIQnKG3i0QEOqxE8fNRbd1hKX3MmfPFcUry1zRaI00nxPvhQ3qVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716287114; c=relaxed/simple;
	bh=UhNZOgy/Kr2fB5s4etVMBKzZEf4Eiard8DD218aTKfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLtwsQEOGObm7OSbI27FouE8O59krS8Z3GRzpNn4d46R7KdiWG9btxRJKZUMS3sjpBYOza9/eRG4bVpAXg1s8yBAa0vLRRfEq1OiV3VXDNW2YPO3zuV2fqUQybrlzRbYZNlTcx3i0GQK0C8I71F9FDWSqOlj87Ej4kjEdk1u4mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=TbqfSKgU; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="TbqfSKgU"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8C90D88261;
	Tue, 21 May 2024 12:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1716287105;
	bh=Ipzvrdy9CFhWLrXJw7jrfnNksXZKO1zFwXQTi7Vz/48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TbqfSKgUF4i78NKfuxILqq74PFT01n/iNU6PfreU2yPDhdvzVOF5+aMgH/zevDo2b
	 VxgSKNY6M9ND5nCRRymVG5Gsr0L/Ydaw6PGRr6YcfJVrZfViCJA2loCfPrye/tmL4I
	 WXFrXgYQmWkvIGRWSsjHg+y9P7KYAPUwBKR1LY4la/MrxeWB/SAIkXTXtucUPWHO4f
	 4FDioity0x18QmGSMKcqlb26ek1qa+EnxDf8VhOPljnV8Vrus1SvZC0lT9mBONHFP4
	 9sjQgsxR5ZQH//w9XOXfY3Hi4crT1tRGZcBaGT+KID53mos+59iF+dfjYZbYsdhFLD
	 JxrtU5MFCS+WA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 3/3] arm64: dts: imx8mm: Delete SoM hwmon node on i.MX8MM Menlo board
Date: Tue, 21 May 2024 12:23:13 +0200
Message-ID: <20240521102435.10019-3-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240521102435.10019-1-marex@denx.de>
References: <20240521102435.10019-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The INA239 is not populated on the SoM variant used in i.MX8MM Menlo
carrier board, delete the unused hwmon node just like the rest of the
unused nodes which are already deleted.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
index ed83a019159ac..b8dc7b299f94c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
@@ -197,6 +197,7 @@ &i2c3 {
 &i2c4 {
 	/* None of this is present on the SoM. */
 	/delete-node/ bridge@2c;
+	/delete-node/ hwmon@40;
 	/delete-node/ hdmi@48;
 	/delete-node/ touch@4a;
 	/delete-node/ sensor@4f;
-- 
2.43.0


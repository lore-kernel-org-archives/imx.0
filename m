Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA619CC39
	for <imx@lists.linux.dev>; Sun, 10 Aug 2025 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754841918; cv=none; b=qpAnB73KAaKTW0N7dpbF/xMzsGisYBC2QHc4glZSqEzcWgBlUrgzrmR4s6liEHA6ih9+96dOC5wm7tGu4kfBmc++ntYfVTUs7MNynIbjkG0FCSAB/sntty5pxZWoV6XhDmIGeHXU3Y5w0h/MnP9dVlr2VTrm7g7L1U4UASob+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754841918; c=relaxed/simple;
	bh=KVo5vgs6n79wF/7t3/adxZw9TEcA6jNSPYXjYlLmXM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c0NGD6pCWWGnQ7+o8w/GWrOKPnkvJLbZ/bkJrI1dt19Qos41fngBXpm0knxq534WJ3f1d1BH+5oJ8TM0kgqqUMA4VYDx+wFyJ2hBjrgCZN4LuYkTlrspGWHsQJDgpu4HBWgpwB3m++kYExsukNW43iJqaZCSYtiC/mq90Il06HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=f7KyaG4z; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qbq7XXkB; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="f7KyaG4z";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qbq7XXkB"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c0Mzt5SYxz9srm;
	Sun, 10 Aug 2025 18:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754841914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+3auhxeE+Rfw/97tdfWtAk0l+LpplUvhw7JTvBvY/L4=;
	b=f7KyaG4z2hUHYWLxJ36Zp631VXu9k+LB5Z1geBRZk0lvzLiAgLgg6ygQCf9tMU762jshxk
	rnLGI8eZ2juO5KMVVzdmczB00pxsGVD+JMW3iidkfkuwKCQPw0gvvFtCwSKYI3+Eh7nmkq
	QfkWtm5cKfcMCN11n4rBayUEb3GZ9lmZ0NRTgsiuTPQ3RuCFhpP8wx0Pi2cfeDSBwj/UCL
	gWMQmxZVRWTPTIfiqu2/YqPEQ1/pFDWgjx3fZShJ/PxyN+bwMSNRyi8gBck7Z8fs39cKcO
	ZkPkQTDMLStb6Z7GPVWHl0pl+kKVvkaez05VFi7jGE95Uq2TZo0NyJYH4pVSbQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qbq7XXkB;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754841912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+3auhxeE+Rfw/97tdfWtAk0l+LpplUvhw7JTvBvY/L4=;
	b=qbq7XXkBM5GCIjM7ZZaICea7bxIpdICIT+QHHJcybuR+baO8/iWEU/Zh+S9RmA0HslrVJC
	cDs1sKgLrRD8DmHNPzRJYsaqjfWzOyk71VQ7I6DHGCr7sm0OU02SAdyc58NYnxXFWMHzLw
	jj4sYj3pd0kk5bjCKd1yo5ekG1ilEqalR8XeW48cjtlpBfWD5dBMn9CaZ9jXNJdX0IGvme
	P3q+OlJ9MDJ5FttqepPzyA0N62U/cDK0nhOp94CXM1M9VH4UTkjyn6tz1y1TdfO/MlDCwL
	vdHE+jr2p98ghArTKO5wITOGgDPbMPGqg4ZP7Vtphjs+IPadnmHZBlcSAAd+dw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] arm64: dts: imx8mp: Fix missing microSD slot vqmmc on Data Modul i.MX8M Plus eDM SBC
Date: Sun, 10 Aug 2025 18:04:32 +0200
Message-ID: <20250810160500.10213-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a50f49fba771ab398e8
X-MBO-RS-META: 7w138gkkn3g7f1c6osbhsdw38b6kaw4a
X-Rspamd-Queue-Id: 4c0Mzt5SYxz9srm

Add missing microSD slot vqmmc-supply property, otherwise the kernel
might shut down LDO5 regulator and that would power off the microSD
card slot, possibly while it is in use. Add the property to make sure
the kernel is aware of the LDO5 regulator which supplies the microSD
slot and keeps the LDO5 enabled.

Fixes: 562d222f23f0 ("arm64: dts: imx8mp: Add support for Data Modul i.MX8M Plus eDM SBC")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index d0fc5977258fb..16078ff60ef08 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -555,6 +555,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
 	bus-width = <4>;
 	status = "okay";
 };
-- 
2.47.2


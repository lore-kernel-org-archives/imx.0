Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B8175A93;
	Thu,  9 Apr 2026 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733068; cv=none; b=syjWsEsRFu64i2PFiXc4MgFx6drxIA/Z7yVqORvzjQXPVnMeXhJYEMKK4ePHgUC5qKppaK+D95EXAkfZsqr0y4RClNiyrVh0yKrfUjztCyeOGHqAoS/s2Fxig4OIwU+xjUHSX14aGuag2fr9dQAfc55UhtpQX7An0kc3C1jUumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733068; c=relaxed/simple;
	bh=K8KaF3buRwj42mKt4tArZWt0FX77uEm4mGSzhVq/Wrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YM2MmlkjDAFWzwXbIIOgf1ypoKtKbpSWrdb02zAB9xtc4SvCBPpcn1BBacJ99nJju4kR6wXAYRGomHI4QSdURaK9nNqxNQP9eIg/UrLeoSwjYAoL5ilTK2B3r7IbnE0zPswMVLeivXbA6QHEKb7gwTfNfN0xeX8f87x8i9fjQZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=M7s5GcvU; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="M7s5GcvU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=OV2GCA32gAnlYxlCqmA6yqtgsz4STfr5MZ9WlxqJfMk=; b=M7s5GcvUow4ygO1jbwOr5E8FCw
	Y2MXGnfo0CdgEpTYLMzuOjqzntRwVL607SqqGEpa7pHcIaSt82SOgiUnhDyt8dXYGeF5Dv1SGty5x
	vlrY6ARm/5O+e2hsmvllYZCLMk+y+otyg713ZN1VY53Ff2Ra84I+Z6uSbrmaIvutUCa7IYjrndIVY
	BXxiLvqQaGvZSbyJj4L3z1BUS4794RwZMqD15C9BGR9wnccWtoJW/IiF2DHBgC5IjnfVMlmfBBRCf
	DPsu5zkMvJlYZ3NLicYdCBxfl4JBzmxMNVVfxUKXtjouMChINrQuOaUy+1Wa52MZiWdCluDavyvyI
	MkSux5yw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wAnHq-000Jcc-2a;
	Thu, 09 Apr 2026 13:11:02 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wAnHp-000GvU-39;
	Thu, 09 Apr 2026 13:11:02 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 1/1] ARM: dts: imx6ul: add #io-channel-cells to ADC
Date: Thu,  9 Apr 2026 13:10:59 +0200
Message-ID: <20260409111100.4177389-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27966/Thu Apr  9 08:24:43 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Add #io-channel-cells property to the ADC node. This property is required
for an IIO consumer driver to work.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Use imperative wording in commit message

 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
index 24541fdf49ceb..d2bfa08b5e767 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
@@ -951,6 +951,7 @@ adc1: adc@2198000 {
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6UL_CLK_ADC1>;
 				clock-names = "adc";
+				#io-channel-cells = <1>;
 				fsl,adck-max-frequency = <30000000>, <40000000>,
 							 <20000000>;
 				status = "disabled";
-- 
2.43.0


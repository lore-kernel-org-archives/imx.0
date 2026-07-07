Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5586B37DAAD;
	Tue,  7 Jul 2026 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414558; cv=none; b=jNPwtFrWFUbYLOshpZXz2gxRk07KQT561mL5wWlpopa7hABJuGfOn3XzJPxk5nXGBXP3OOMEBgfSs03YU2+LZ/tyjpNfiApZsfsZ3/ivYhGpV+CoaL38PEEEW/MDWSexlYt2ZOiYk34HXXBWFsbsGAucGOhAUw/zofmqXEPY/YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414558; c=relaxed/simple;
	bh=D+Gb5FcXdbJHqVEwM49RGhiZt7utI7dBUsTnIksZXS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OSnDL5QxGYYAvV2ZT6YMl+zKW6cda12NTvbswHcrnLjlMmwkLT5DSNoXM5m5A/eNgZ4AxV9/5X9rnN3BQ1/40J3zGWLsGIxq9Jphsrox2AY9LS13MUgKHJQ/boi6v0e3udzV5zQMWC6d7UCaBUmOGpMVhSDp7he+qTYLLAHCefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WR34kl40; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WR34kl40"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PED1sAAvc+eHIpy2VeGnVjN/Bq6VZc3mcXzSO1CICEs=; b=WR34kl40cowjq6IiGcUD86tPPa
	ZVOoisFC9e2IIL35Cv8ZzZW31b26uaFeVaeCXPzLcwxKByDkAUYnNkDUlwoCRcIEXPq4XKvviq6Aw
	TNsDl+fA9Ln2lVIBUhpnwemGBbHS8sLuVEYfEnAh/ystnCF/gJ2VO1aCHV8LjP3E5nr8E7n95JtpU
	SDiquimTne/M9Hp4C6oisB4TA2pZSGeLuoK84ZGdtCVU1UJBsnt7GYUSrRTahr/dCxlH0iGee3vWF
	BPtvt0nVwEE40GXFecWMhBQ7hjPHGOZ/56IV3nRRM8046GcZGubhiU3Eo5nYTB8VnvCKkbh4QN31W
	mB/BB6Yg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1at-000Gjv-15;
	Tue, 07 Jul 2026 10:55:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1as-0007hK-1e;
	Tue, 07 Jul 2026 10:55:55 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] arm64: dts: imx91-tqma9131: move ele-reserved memory into 512MB range
Date: Tue,  7 Jul 2026 10:55:43 +0200
Message-ID: <20260707085551.1683462-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
References: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>

TQMa91 has a 512MiB RAM variant for which the edgelock memory location
exceeds the valid memory area.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
index c99d7bc168483..a8c79731eace5 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
@@ -33,9 +33,9 @@ linux,cma {
 		};
 
 		/* EdgeLock secure enclave  */
-		ele_reserved: ele-reserved@a4120000 {
+		ele_reserved: ele-reserved@94120000 {
 			compatible = "shared-dma-pool";
-			reg = <0 0xa4120000 0 0x100000>;
+			reg = <0 0x94120000 0 0x100000>;
 			no-map;
 		};
 	};
-- 
2.54.0


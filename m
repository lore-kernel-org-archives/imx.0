Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0064218FC8C
	for <imx@lists.linux.dev>; Mon, 25 Nov 2024 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525284; cv=none; b=ejXW2ERJH33/c8tOcz6RVisTOsSF1q8bNvJszrbfgCgBhRJOd31dDbXCEiXaG06Ld78woOFoezd5Uk0Hbd6Pu9fD4Ec2pktjBoBnuYimbpNrgfg3ziXWhJvFZocxiEFQm/Xwg0Sj9PIZpIDdZ53+1NT/HgSmLymLC6JwJ8ioXGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525284; c=relaxed/simple;
	bh=r6vKdV90dcyXKE/YzBzehUQ/3Bi+TPEkC28IsMtilSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C3eoLnyeSIHyLGE8Xf4OedtJ8yrgwmI22c350w3yINOdRX+3/EDmAPQLMuMxA2Q+r2WjL2KGKdEk/IHNhR1Pdl0hl0zWnMKfp5e72O4dvlsI3kFig2Z3Rven+6wI2E4Jf17+yDCi0yk0nUELq68XH/4v+3ZL5El3Dipd4f7cxSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=ieq8Uimo; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="ieq8Uimo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PQU3zYencAw/qwBE7f29L0tLXXnnnc4bmngXZaP6VWs=; b=ieq8Uimo6G1s3L8p+bcoGH4vJ1
	tnIav+L023XBLyz0CNuJYPC5qZSJfOiDLoIpXsChB0Kfie09WZpe2CgTX7GxRjNb1GFSMODosN5zc
	H1gU3X4gSWkmG0kuKdsMK4e3KzBCzSfkKMRWu2x8b55k2YJ125PRfF1CJjE1/I1fmOEA7CHwoPh5I
	d+HQBSqQtpG6xH29jUt5iQoeJlPwtOm/V27QvEddr+veNHMZso0Oy4txUjyLmsQwqPJtOmOS/uybu
	hyZLZHY8wlnPfXHPWtGcNKAWGmKum7SwojJhfj1lUQTs0dL9djBfCfZZqLaJlYS8Zyn2lEttMrBsa
	L4M/1i7Q==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIs-00Eq70-0F;
	Mon, 25 Nov 2024 09:18:41 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 08/15] arm64: dts: imx8mm-phygate-tauri-l: Set RTC as wakeup-source
Date: Mon, 25 Nov 2024 09:18:07 +0100
Message-Id: <20241125081814.397352-9-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

RV-3028 RTC can be used to wakeup the system on phyGATE-Tauri-L-i.MX8MM,
mark the device as wakeup source.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
index c3835b2d860a..c9bf4ac254bb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
@@ -217,6 +217,7 @@ &pwm4 {
 &rv3028 {
 	aux-voltage-chargeable = <1>;
 	trickle-resistor-ohms = <3000>;
+	wakeup-source;
 };
 
 &uart1 {
-- 
2.34.1


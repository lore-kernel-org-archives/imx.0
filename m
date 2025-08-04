Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A74EB672
	for <imx@lists.linux.dev>; Mon,  4 Aug 2025 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754293622; cv=none; b=S9sHSYcQ4X7Zpjkc2T1j+LlmtkMZ9kGA8Decv0uwyG3AKq6K4dERUwv0sr9bCa/4oXlsORNxMt8HekQNdmI7ROcZkQqolHejKeYe2ZSnxtyn00Sbrq5dIkWvIvlxIU/6FZzccnznICnMflGG8101dEqtzZIfp73HqE7scygkTn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754293622; c=relaxed/simple;
	bh=w2FQsejIW9tGu/d12dVCX72xaJq4TZ/tWsq4IMGd5/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kOk8xuSH5CMqXlrH+bBJb8U2JWuBtTJwOBazL0wBvO1AWdwGszPdgooA86pdWJvZoEmxsfWWIf2x2DlaarYz50GaoopM12EexGGMhT20CjI47u9J6RUZxshs0pPoQYXa8FUNxJaIOUCw61JLE7SSBNPhJi0lGmN1J4ePOyVykOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ZUIYz1XZ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ecKANMWN reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ZUIYz1XZ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ecKANMWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1754293618; x=1785829618;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CdSfNikpGH6BscsmZd/Rx5luzG62PFHqKEcL/imgz3o=;
  b=ZUIYz1XZsvElIzniBhj04Zm5wLjMlyexuzD225MC+aq3Zs34DigroWyd
   EdLD7eT9JwkzU90uEG9D3vL2eyLYsyK/xagR1qFT1Csgy/MQObPPxrL2R
   r33d2/bPhx04vVoYAbRT/ioazj6RsSL/yT+AKZs80p7Mjr3etkGlo+uEu
   zy9CZk0pwqfE9W1fPZ1fxjWtnu/Ai0n/NovTN4xEpw6bu1ZsFO59Vz13l
   2R6cOX2Hs1CJaDU3V5njuPW/XgN0/3R+IpvCwW0PBpJwCEJjvYHofEmzU
   nykP7/A4HQL9VmYMeS+M92jxNaCAA5RYcUYtti6o/1mYLr2XPNRYT9WZi
   Q==;
X-CSE-ConnectionGUID: HpCTta7TRG6yj4QOSCB+Lw==
X-CSE-MsgGUID: Aeglv0tvTyugj3tAdvpArw==
X-IronPort-AV: E=Sophos;i="6.17,258,1747692000"; 
   d="scan'208";a="45562890"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Aug 2025 09:46:50 +0200
X-CheckPoint: {6890656A-1C-BC5CDED5-F054443F}
X-MAIL-CPID: 4AC64EF87B1BE66EB7BD5C8C8A82D21A_3
X-Control-Analysis: str=0001.0A00210D.6890651C.0090,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B04091617E1;
	Mon,  4 Aug 2025 09:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1754293606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CdSfNikpGH6BscsmZd/Rx5luzG62PFHqKEcL/imgz3o=;
	b=ecKANMWNDiOVfAMTmVMafSHm/DT+1YcSONM7nAJtnCxEO+Ziaf5xmwr7oQZbcP/FdHjQZg
	c9ItJju72cOUClS8/+/I1KwLI6Mx+6sRV/eDMCLIxGgiHGjd9s8h+vVlbt6f5IDiEfhNag
	hobttP7S4HZq6MYU5tMCWE+d1yVUgWdDYi2dyd/yDI341E/PzSpE+DttX7gYALtPMihhFX
	HqF0S1rfCDNd+Qb1CKFuITUKGft2Ml4cKgH+TCeFZ40mc21dbV+99v0bDJNYMFB1wI2CNk
	jGOHyQsuc6l8ivt3B0btn6LjKlWBiKlyxzaMRqUqvV8IP/+P0AudxGNX6UgbPQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [Resend 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB driver
Date: Mon,  4 Aug 2025 09:46:41 +0200
Message-ID: <20250804074642.75072-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This driver is used on imx93-tqma9352-mba91xxca.dts.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Added IMX Maintainers

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c7520e78b6a11..2271ce6079bbb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -441,6 +441,7 @@ CONFIG_IWLMVM=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_PCIE=m
+CONFIG_MWIFIEX_USB=m
 CONFIG_MT7921E=m
 CONFIG_RSI_91X=m
 CONFIG_WL18XX=m
-- 
2.43.0


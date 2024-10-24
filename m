Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D491C1758
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779757; cv=none; b=V6ETnNTTB8FtjrJQ6UyRcGcv+1qqbIBC1ExwMncA8YYmxvbU/mlV2lxkE7aDpUNMq72KLrWNpoLM8IM0wK+PoHMUeaX/hFngKuChz7ImtZ5RCODLHKIeKRgY/R1hc5X1BNHIzbXhVpl9w9pUGNXeYPeA4qv5u8ClU5WfTFu1B3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779757; c=relaxed/simple;
	bh=j2WxG1gi9sX9Q9XHaunLYPDXuZFPxo2eTPeWaKuZNcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eruynwc61cn4bsEtNVs134XRxTPWPF1mbCAFFb++GD13Dr0tVX/CFAg+pLph8QZkxvRTkickp+xsAQpQzcN3QpHNRI90F2FO6G/IVCBOiXL6p+h7CinmpAqDJF+2biFKDiEfaJqDKuceBoKPW4L+CkXmgN08kkZaSUgJSDTw1OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=MM/hUCPe; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="MM/hUCPe"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t3yjL-00AA6D-2l
	for imx@lists.linux.dev;
	Thu, 24 Oct 2024 16:22:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=A1dLRRt6Gpz+f3YNGF2cRhz0EDeBb4t+Te4s+RjcUeE=; b=MM/hUCPeAk4kxGtObuqIjI7It9
	vQ6bnYec76DSP/lVZSvohzuDN+J+olXJADgnX+ZC55NrHM3OtMR0VOw3VNKVK4Q+yQ2BqDTXKhQaM
	a7kLY9jUXNOhwIPDVJ3T9E6MdVC8Zs+SjMJl4NdjypRuzQ+Ouh3h6vNcWpCbVUvnzlnChf/+H/YDL
	jBtEun5orMn3srx51NSgh1fof84qTxO0MTc71fTKvE4gvI3CjAwMnz+cpULLV2LTrmxol3MMgFuBL
	d3alLHAqhzHvXTygyaocNzkvYDX9Acm37eUD+n+NXrh87RFrN3TsZMo48eRaJP0Goh/oh+aS1Dmwb
	qukz3mHA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 3/3] ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E
Date: Thu, 24 Oct 2024 16:22:06 +0200
Message-Id: <20241024142206.411336-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024142206.411336-1-andreas@kemnade.info>
References: <20241024142206.411336-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable drivers used on Kobo Clara 2E

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 333ef55476a30..0beecdde55f58 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -68,6 +68,7 @@ CONFIG_BT=y
 CONFIG_BT_BNEP=m
 CONFIG_BT_HCIUART=y
 CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_NXPUART=m
 CONFIG_CFG80211=y
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=y
@@ -253,6 +254,7 @@ CONFIG_MFD_ROHM_BD71828=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_ANATOP=y
 CONFIG_REGULATOR_BD71815=y
+CONFIG_REGULATOR_BD71828=y
 CONFIG_REGULATOR_DA9052=y
 CONFIG_REGULATOR_DA9062=y
 CONFIG_REGULATOR_DA9063=y
-- 
2.39.5


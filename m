Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EBE21832A
	for <imx@lists.linux.dev>; Wed, 30 Oct 2024 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730330905; cv=none; b=uDztbyAWCxukadwEt0NjeFI/QPPNdUS3DpaNq8N8blfVSRwHloUx4nezQB/m1obIf9wm3v6SB6L22hm4BowbesPJtLlZ0SsAiHgpThMKL9SfYNAW2uoTOx0sTZz6ci/dIpxwTAWBs1dU+MOxOR+vpIupcfmpqRI6nqxpAWKi/CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730330905; c=relaxed/simple;
	bh=j2WxG1gi9sX9Q9XHaunLYPDXuZFPxo2eTPeWaKuZNcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c1ldKQjDqV6fIq/vuewNHisGeh0F83uI24IHlLXSMerXefhTZbhFPg6gC1ppzBTJ3elfHm5sRCzXKRSuyxsW/dXlH1y1xYEW+dK1SsO9R18dMU3CCoZ1CEy+0jtfmKWq8g/2Z7isjy+Q0yhp32vFWxEXO8yTjlXqWJInztZ2/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=MFOqAO6X; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="MFOqAO6X"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t6I6p-00AMKw-2a
	for imx@lists.linux.dev;
	Thu, 31 Oct 2024 00:28:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=A1dLRRt6Gpz+f3YNGF2cRhz0EDeBb4t+Te4s+RjcUeE=; b=MFOqAO6XqjGyvEm7AbuJN82usY
	sWvcCd1Q6neva+KTQ1AiEfgOtBadaU+TllYnrDqwmsK/nhylFD2DzvtTq1r2ImPIMKs3KOQshyNIh
	28ixTccW9GNKQ9PN5/Imb+fwC6Ct8mxF2136WwQtkRwR2hqOuUXsZ3gsFVibPO+xGcQpH2rte8AK5
	wLPf2UYlPvpI0RqQ94DeuSV6nh5V+M8GxZZ3z8mCykGcHwwpxTtolbCJ0coBHnjlz2NJmWRSPKf8s
	BfS32TcZKku51OVq4cpkYSd3zCi8kRSv1P46WHxKejRqlOnK1shgWMwu5bBRAzP+j0y1LchZFKouF
	6d1xJcvQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 3/3] ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E
Date: Thu, 31 Oct 2024 00:27:46 +0100
Message-Id: <20241030232746.2644502-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241030232746.2644502-1-andreas@kemnade.info>
References: <20241030232746.2644502-1-andreas@kemnade.info>
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


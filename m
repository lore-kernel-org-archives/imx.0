Received: from mx-relay188-hz1.antispameurope.com (mx-relay188-hz1.antispameurope.com [94.100.133.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673F133986E
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895769; cv=pass; b=FZVt2yXtzWQh2c543HrpqpkGzaLnhPEh2nD51r+PlegLwAVutScV0EWpRnyjGMJP/PoWgoCV1BpCkeNNuw5SrzksFcTkbxB4tQNFPiV7jMcaxksVM+OM3qMbx4Xy0qubiLZIRQ4/jeEBpxBPLlZcRfzxGpUD6LubrFrB2GOw0HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895769; c=relaxed/simple;
	bh=gWDX6LfTf8jotwegNRpfzGbyFgsOsmXUa0+kXlVKINA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FR+o5mRRvkF8gwkuFjcm+3jUiR1ttP8Pib+6uElq+08JH4ayXPUnZ6IBVN+kvuUj4iLbmf027zmOA4Fok5hHSijAT8Eu3PVrVUb7P+R2iGN6F+szflgWenDq9zpPbu3NJKlRDO5pBNozDNR26IeyrUjcBHOGjaFPFLMx9Px5DBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=c8ZWZkvF; arc=pass smtp.client-ip=94.100.133.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="c8ZWZkvF"
ARC-Authentication-Results: i=1; mx-gate188-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qKBTf3iQdLB1DZk+dtKgJbMYJgOTJyBTWss+V+NIWlY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765895732;
 b=mqBf91NJqe9x/h3oMWaTknrVHpYCcAd0Wfg2czOCxaczcltzIfScmmcSbthWcvfaTza671OD
 ewJfTY8bqVG3jg+FWUT3wi5It+q0tLtJBs/PM7QpgbTb35E/vR8plaLq4wwkDaPrW1SwgXNhLFg
 z+bTk/eqUHdWBQ+X7irfB/EEpLqcXs1cicAtdhdXuBB3D/zUsDY3TUqEeHFF948dLeL4DLw8nCR
 xQh23zd546Qc7s2iPVERkNgevAA5934WFJTzablZz3GwTEPIQgBILprW6T0nyTLwQmUAYvVfzDo
 Sklj9ei7mc5P+U20qVqCb72c9kr3jkwlsG6ioQ4Ob/ppQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765895732;
 b=r4xwhUDf+VMcwKepT3o2S19OO+1X25J2oL/G4rI6FflmHOQeQQCmEoAv1ECbjj5aumGL9YdT
 72bm/aBCjYlYn/2lYATtnM2HLaIRNmrc8nTnpBLL05gmMx+drXiaTBp5NvqA5eh4I7z8cMpplW+
 D9FF+HZExbNXRg5MpN7HnZjF+ZqpUOMpIrfnEkDE4kXQ/omgquaCd1Qs5MIKkB8NKR7AD7+7KkU
 UfPeZI/0f0kcVuKLiU2DIkDLLHWIG9igFafaVcmAaNGc3QjszPRYpYzw9Y/VW6eVqTcFBRIi5P3
 wUqyoEJ2vfB11cElzvOZYT4FmVYjLUrMWjhF0GQH9mLyA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay188-hz1.antispameurope.com;
 Tue, 16 Dec 2025 15:35:31 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 950FEA4079E;
	Tue, 16 Dec 2025 15:35:24 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: imx_v6_v7_defconfig: Configure CONFIG_SND_SOC_FSL_ASOC_CARD as module
Date: Tue, 16 Dec 2025 15:35:21 +0100
Message-ID: <20251216143522.1064563-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay188-hz1.antispameurope.com with 4dVzx911RSz2Rb2Z
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:03e778ea2bf9a6c2fd2ee577023a1f9e
X-cloud-security:scantime:1.933
DKIM-Signature: a=rsa-sha256;
 bh=qKBTf3iQdLB1DZk+dtKgJbMYJgOTJyBTWss+V+NIWlY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765895731; v=1;
 b=c8ZWZkvFHZeuyw0z+e+TxyD0Jf0Ks6z+/SwPCuZXSU/MCxRXY4VFc5tm8JSsO+Wn291M+6EP
 JnG3N47WZBqitRDwqs+F9SDEhTe8GqfP3zfHfdSrP5vQEfdketGZhbegMqtapoLNPzEK9hHP1mB
 3DBWQh86IVmJQcr1NC8o0CnrEVB2O7Iy6UUc34LANx7+2YfXWIC9gAUE2N307LdEr6x/ZW8izTO
 IPGNheaedjA2kjrjZIrqXx3nbeioKvgflKO7+gN2jAV1AeIdgKixtpYsnGfobLhBQ03RMjuHliH
 +/nfWJ2NxIWsRFP/TwtQFsAk0FYNPysIYUcdHiSH8weSQ==

This option explicitly selects other options, e.g. SND_SOC_FSL_SAI.
These SAI drivers use DMA which in turn is dependent on CONFIG_IMX_SDMA.
SDMA needs a firmware which is not yet present if the driver is built-in.
Thus build CONFIG_SND_SOC_FSL_ASOC_CARD to avoid useless driver probe
deferrals due to missing DMA channels.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 0d55056c6f821..d75f5d71365a4 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -311,7 +311,7 @@ CONFIG_SND_IMX_SOC=y
 CONFIG_SND_SOC_EUKREA_TLV320=y
 CONFIG_SND_SOC_IMX_ES8328=y
 CONFIG_SND_SOC_IMX_SGTL5000=y
-CONFIG_SND_SOC_FSL_ASOC_CARD=y
+CONFIG_SND_SOC_FSL_ASOC_CARD=m
 CONFIG_SND_SOC_AC97_CODEC=y
 CONFIG_SND_SOC_CS42XX8_I2C=y
 CONFIG_SND_SOC_SPDIF=y
-- 
2.43.0


Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6A9286D60
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766502216; cv=none; b=pVxVBxv+ZmsY5d4tfvT5GC+PWUI8Nyf8bvUoYjOZjTaDsvNWh4oPZV3tZ/kPu4jx1ETRZ0363rIs4gMCm0IE90BrVeuZSjzJYslfb+egaYB9/8Vj+9UVvpOhdC/FvONRjs8TUwHmAfkzd/3blEoWEpAI1IYANA10o9lUQfdi6fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766502216; c=relaxed/simple;
	bh=Y8h2u4IEUHAPn/mDroZpxYRKFzvRZI7gsgCOWisMxMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9FTiL2/F2rtt5lEswZ4oqrLAf/WNSfjUkHtKTL6n6bcqnjbR4lkA6ajCd3eerZceD5L1BkNJbfNaugjFiAeznFdEXsoHnxIQAKS0+sqU45daCGeirVN09XQr6vqq3IUtJOOtSIvwN8i9wi+cfqLNXdMv5WxczbFjiG5clYQ0sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=beims.me; spf=pass smtp.mailfrom=beims.me; dkim=pass (2048-bit key) header.d=beims.me header.i=@beims.me header.b=CDV/8891; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PUqnhElF; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=beims.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beims.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beims.me header.i=@beims.me header.b="CDV/8891";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PUqnhElF"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 3C2B2EC0108;
	Tue, 23 Dec 2025 10:03:33 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 23 Dec 2025 10:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beims.me; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1766502213; x=1766588613; bh=l+VjmMpqeoXGTdow4O/go
	ELngynUtd1mvs6oU6B69Iw=; b=CDV/8891CofWQWPqwYChTmHxoYzVHnsoY6MrQ
	3/URfht+XVI9IhW8rqu3xgnOcweSKd6Ie8cL+GQN3ni1vENjAPoFEa9XMCADgdfP
	YTlvKjta6InrF3U7rzMrfiU1WhPZY/8kcvCVEaWH8eq707QXb9J24jKuNNr9UFnf
	mrqspHvjelSrzScyOF9bgL+NfQCVEaksih126ozwDDfXCq35PEdlAOhv34/GQIhL
	UNo/8yJx3zoRN7OknSPvCFB+Hy8xHoNO1CDCehFwLW6Ktb6vCYTkD7a6IWbeHBqR
	SxMOYkWhEMXleYPhPlES7FGEOs4+neZjMh8nDbnh5QFu6tLEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766502213; x=1766588613; bh=l+VjmMpqeoXGTdow4O/goELngynUtd1mvs6
	oU6B69Iw=; b=PUqnhElF83bqeU43vdBA1Fly2kzVcoNBeLKYPcj9poDqObPhum6
	A2QKkevf1KyLn3U8e7jcOoZ/Kp43E2X4YFaJyrnQC9n3LwCm6Dd0S0yXgduc3osm
	oUC6gEni/+dtuK9tif6z/4IiS0+27VNaeJSOzhCo1VKG55R1Fq2WLBfc5pFCpuXP
	qZfAMf29fPvx+V446FZOTgkuy4mdoc9yIsb7VBFQZIafrVLy1hR+/PkIK67eTPBT
	aWfH//RdqdhBehZNCBhAuz8bf+S7V+io1ioiADsHEjg7e9Y+MIqRiwof9I1+xxld
	2dn7KLOi3Kv6DdG3CM00XC+rrV5eYePx+Zw==
X-ME-Sender: <xms:RK9KaY6aof43jCLbXSsdN8LOhnx2I9FN4py5cDz3ttVwaPRq-zDlcQ>
    <xme:RK9KafGpEmuYjq7OpiZF16goaKDRZQzLHJLmIfaTjzbxK5f-yWTkTH9Xod4f5lzhC
    wA7Gt5sNxBdhcms-ZsWpSnCgJ5b5QDOhS7wYHPaQ4GIP4G4KBJQ5g>
X-ME-Received: <xmr:RK9Kaa1pNyPZ_WC8_22yux42EgQwK2-7Z7OvokiRxoaS3nHF_yOnhklvHkSgCobXQdIn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftrghfrggvlhcuuegv
    ihhmshcuoehrrghfrggvlhessggvihhmshdrmhgvqeenucggtffrrghtthgvrhhnpeegje
    dvhfetlefhveeljefhtefhjeejffdutefhvdeludfhgfeutdetheeggeekgeenucffohhm
    rghinhepnhigphdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehrrghfrggvlhessggvihhmshdrmhgvpdhnsggprhgtphhtthhopedu
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhr
    ghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhn
    vghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhphhihsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidrug
    gvvhdprhgtphhtthhopehrrghfrggvlhdrsggvihhmshesthhorhgruggvgidrtghomh
X-ME-Proxy: <xmx:RK9KacqrI9d4KmL_0975qBKl1XfaZyVNZTg4v1Z-yPiGk4ZzTXWE3A>
    <xmx:RK9KaXM0OxMBqlCIDiVmQrrwagF_FzsiAsTwQ27ZeL6gA3OoqbOxDQ>
    <xmx:RK9KaeUmObZlQ8h3-imcqqfQVMf_cWjfpxaW9GOl4hUqWlJbs2Ex7Q>
    <xmx:RK9KaaveHqM9h8nHqSTumXpXiimXjRFkOTvS0JSw17O9CwjYSHDhFQ>
    <xmx:Ra9Kad522RH4sJuvJUdZqhFBxfez1fV4qGTD5o5ugPPV_vvZm_UAXa-O>
Feedback-ID: idc214666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 10:03:30 -0500 (EST)
From: Rafael Beims <rafael@beims.me>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	Rafael Beims <rafael.beims@toradex.com>,
	Sahaj Sarup <sahaj.sarup@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] phy: freescale: imx8m-pcie: assert phy reset during power on
Date: Tue, 23 Dec 2025 12:02:54 -0300
Message-ID: <20251223150254.1075221-1-rafael@beims.me>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafael Beims <rafael.beims@toradex.com>

After U-Boot initializes PCIe with "pcie enum", Linux fails to detect
an NVMe disk on some boot cycles with:

  phy phy-32f00000.pcie-phy.0: phy poweron failed --> -110

Discussion with NXP identified that the iMX8MP PCIe PHY PLL may fail to
lock when re-initialized without a reset cycle [1].

The issue reproduces on 7% of tested hardware platforms, with a 30-40%
failure rate per affected device across boot cycles.

Insert a reset cycle in the power-on routine to ensure the PHY is
initialized from a known state.

[1] https://community.nxp.com/t5/i-MX-Processors/iMX8MP-PCIe-initialization-in-U-Boot/m-p/2248437#M242401

Signed-off-by: Rafael Beims <rafael.beims@toradex.com>
Cc: stable@vger.kernel.org
---
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 68fcc8114d75..7f5600103a00 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -89,7 +89,8 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 			writel(imx8_phy->tx_deemph_gen2,
 			       imx8_phy->base + PCIE_PHY_TRSV_REG6);
 		break;
-	case IMX8MP: /* Do nothing. */
+	case IMX8MP:
+		reset_control_assert(imx8_phy->reset);
 		break;
 	}
 
-- 
2.51.0


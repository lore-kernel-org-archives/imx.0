Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB043D6CD3;
	Fri, 22 May 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448976; cv=none; b=loCZlzN+WE7B8pMMDOj0LLnq+7269tFrJPB4fYulH0kuE4ME3XajNEoWxz0l0vnHwtbKr/x2G69wDfM2U3SCdK+r4EEXk5i3yMvUzn/qG99zEsUEp/jG+8hxxhOTkAgu7OpBMqJPvrY056qM1bFsJeEYX7R9WXcDKEC1YjO4RkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448976; c=relaxed/simple;
	bh=dVoIqqePaTwdmJ4zCf2ziXbp09M2+w+TjqkgtzQvOeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SS/h8hCFnsuBTBqRTIgTXSEPmpGTnmaGT86wPGYOMdgWqvo2ic5WeT5gn8XUj0NVx/GkOjaw9PwXvNGNbR2kJpr1Bn+fBxtrd9Ls1ep/2gQx2t+IlWrukfrsCL9MzgTroyQNiiUelsVOTJ0o8x3Lw9Z4s98vnDOF+YaVQkZ6Oxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YlxTvWMu; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YlxTvWMu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=T3tk8Eb5PMfkxhc7QmwtyePErKb19NAaN1ycAhnODwQ=; b=YlxTvWMujQk4CbaU8jtSHO4WJ6
	fueDXX3ufB6F//ly60ToZcsDNyfh+4+VDfbnUZ31vqRoIobsxduZLfyHNRrbke3hezgdGo9d/Yyl4
	I5VmiagAjnp1eBqO6VJ4f2VPug4WHScXsRAE2d8HG5kbO2cDL6sVXZE96GqEDyOidK3sTYp/M2l8k
	x0oT3Zs9PrdHv9E7/qFzi1PwkaxUdiufHZHfkPAMME8OsxucEnIKhRQ9NLg4Kf70+VgttsDntFqzT
	HnT48i8ZmyiojpcQ8vpqi1nz0jlgpgzxbLE3x7F2CQ/PRxtL3CatZaeWhfYjSDt54CVDFhagJTIzn
	rpQWYdeA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQNxp-0007q9-2z;
	Fri, 22 May 2026 13:22:49 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQNxo-000HQJ-25;
	Fri, 22 May 2026 13:22:49 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in sound card as well
Date: Fri, 22 May 2026 13:22:46 +0200
Message-ID: <20260522112247.1046944-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28008/Fri May 22 08:24:46 2026)

With deferrable card binding the sound card driver tries to
get the mclk configuration before it is setup in sai3 node.
Fix this by setting the mclk config for the sound card as well.

Fixes: d8f9d8126582 ("arm64: dts: imx8mp: Add analog audio output on i.MX8MP TQMa8MPxL/MBa8MPxL")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 890d1e525a489..1ea1da735762f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -246,6 +246,9 @@ sound {
 			"IN1_R", "Line In Jack",
 			"Line Out Jack", "LOL",
 			"Line Out Jack", "LOR";
+		assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+		assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+		assigned-clock-rates = <12288000>;
 	};
 
 	sound-hdmi {
-- 
2.43.0


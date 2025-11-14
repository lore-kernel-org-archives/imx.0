Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A731A248F62;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129511; cv=none; b=tyCC8VjlScjiRdLSO5NVpvSW/sLSj+jFfkp/SOM7h8Yfk8p4e1pcCrRRIerlX9NfEGAOFxNT01uCQ3XSZBLXnFimwJe9vK6Wo5Z0fvGRkhc1/UE45u2uXYN47AK68P0XDYJBh7n+eDnHPajcbthbLXs9fHImCUnm1uF2Y2NWCNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129511; c=relaxed/simple;
	bh=mTtLJkC8ZjzMtE19mKVd+FtcGarZmx9IQ2vvvMjQJ1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knnuuKZY9XcsUoM5nYULboDtYiDqrFGF8OvF7jUL7Jjf0zE1oSp++sMb3R/TGlDT4MM/Qxt6keaaQrmnKuBqUNVpdQckAnAzR0zIlsebTFDucsoKJmY3mNh+py703mzSCJ2ZQLuwCQGsreGNI0fZODdu27198hBScwkLvEQbRw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+OZox8o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+OZox8o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29ECCC2BC86;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763129511;
	bh=mTtLJkC8ZjzMtE19mKVd+FtcGarZmx9IQ2vvvMjQJ1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L+OZox8o1zV+UgRXT+uOHHgMLTBQpf5lTYKDQEpChkzyQpbeFJuO2aZU0zmUGOyoW
	 dAA6xAdJOhJml+KDxnj1ScluljnFsUFhBt5L2yAWKg4TMP1ujXFRlpCPQZY4FYRXtF
	 3sn0y4a3My38AotWvRIljCsqOXby4yAYdj8dOg/vHkCHkE+HI2DvjuD4VGsFmccEv+
	 zdWEjThYEBYxTfeVeLAjHhu7x72Tt62oBo7sVXQq9tY0nWXYoWG/+c6yiXUx1g0XKN
	 p/HPY8Q1UenT4qAzsfi0o4wBj847fzMdvrNkzXghoYHe2c77lTvlIXH7eXlyea/AZl
	 H+OOEs0VJlkFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101F0CE7B15;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 14 Nov 2025 15:11:50 +0100
Subject: [PATCH 2/3] arm64: dts: freescale: moduline-display: fix
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-disp_fix-v1-2-49cbe826afc2@gocontroll.com>
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
In-Reply-To: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763129510; l=1271;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=A/MMLDiGbqabv2busN3iJ3qqT/bsCqxgmXodKtDcUZg=;
 b=n6l0t60l1FOiDpkQxRskl1y+G6Fe9wDxFVerCWKAVl1g46IaaWaigUVBuXS4d2BihfojgfmWO
 L1HQN67q9CABf0heICn6pKZWeZHk4xLnmQVASPaqu+1uZfTrmPWYx8d
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

The compatibles should include the SoM compatible, this board is based
on the Ka-Ro TX8P-ML81 SoM, so add it. Also add the hardware revision to
the board compatible.

This is a breaking change, but it is early enough that it can be
corrected without causing any issues.

Fixes: 03f07be54cdc ("arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard")
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
index 88ad422c2760..399230144ce3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
@@ -9,7 +9,7 @@
 #include "imx8mp-tx8p-ml81.dtsi"
 
 / {
-	compatible = "gocontroll,moduline-display", "fsl,imx8mp";
+	compatible = "gocontroll,moduline-display-106", "karo,tx8p-ml81", "fsl,imx8mp";
 	chassis-type = "embedded";
 	hardware = "Moduline Display V1.06";
 	model = "GOcontroll Moduline Display baseboard";

-- 
2.51.2



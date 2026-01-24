Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEDE56A
	for <imx@lists.linux.dev>; Sat, 24 Jan 2026 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769263364; cv=none; b=Mq+6qrygf3FPnJTmeGfyRvFGNmDlf+L2TH15HFr9kbQftI2v0+Y+CG4d0QN/oenAPKCKMzGunIgjNstod11vd794XZmKaMTimxK56eOCl0J8sJ/bVqQOz6JGZnwLv52lEBvCRax57059uYgcPRX3mkG1eEVn/bLIxJT+//7ieOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769263364; c=relaxed/simple;
	bh=WaEx9JbT1ocsMl2cCjYOFkLVa63KbyoeWsW4DzXeu8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qe+tUw7WuYWcnEGDfY696+d+7scc7rmpogGcMFYF6dqU+pRjvTr6NRrlqlAEPOLZNCv2x6bDz7iOQ8h7i/hRvMI2pO3WITeIpLKN/VCSgwrqdmwzvXtpixugCJdSeBwrpWlLSX2FzsEXFSviJ8IZj66ToSG0H/UjbV55LIyZWlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=dJu4UK7L; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="dJu4UK7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1769262990; bh=WaEx9JbT1ocsMl2cCjYOFkLVa63KbyoeWsW4DzXeu8U=;
	h=From:Date:Subject:To:Cc;
	b=dJu4UK7LBLqigMU+MyvMDtZQWVZXVuxpmTkQXpBDCE2ZgWZIfUmk3Yx9E8z7u3X2v
	 mueA4zRtqzocWrHZ0GDaU0Q6Lt4ftaijCWUnRXOS6lJ/A5zjaYdSHvJmZhta5X/OSf
	 w617NY14nUw3u8JgOXV/TVHWEwLqphBKMmyZ+jqmGfy4WJtco3+NXxjU+oZ7LCWeJE
	 RDLMu/IvUvpZs7I0RMjEfQD4yyNI8mjZUTfWYQX6Kjspvbx6gCzPkMEVKe3tH7Yv6z
	 AhR7/NX8G6po7wqTVIEIAPrAm7l4xa1dcEpgh2DNE8OOFDc14/yzUrK0jCeKaWLDyK
	 XvfLuIw/5KUfw==
Received: from pliszka.localdomain (79.184.64.12.ipv4.supernova.orange.pl [79.184.64.12])
	by ms.puri.sm (Postfix) with ESMTPSA id A41371FC84;
	Sat, 24 Jan 2026 05:56:28 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Sat, 24 Jan 2026 14:55:48 +0100
Subject: [PATCH] arm64: dts: imx8mq: Set the correct gpu_ahb clock
 frequency
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBA0auQWTuxxUisVzEupuNIJ9ICrRgSw
 t2tLt/i/w2KZJUC12aDLB8tOqYKe2iAA6VeUB/V0Jq2M9acUeN6iTP204IUPPIw8gvtyXlyTI4
 6hppOWZ66/re3e7WnIugzJQ6/2aBpKcdI5S0Z9v0LyMbr14UAAAA=
X-Change-ID: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=WaEx9JbT1ocsMl2cCjYOFkLVa63KbyoeWsW4DzXeu8U=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpdM+M8iuwOiLFNHvgo9y9nj5lKxXmAwh3Lo0Jy
 wJVIBg/szWJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaXTPjAAKCRDo8jXPO9vD
 /77ND/wK3Mxk91/EOQVO3K7G05rArzUGrAXagRlfdG/EB65PE5NMRYeIIJGRLscO/NafHaiUjC+
 o/yzpZ4Tfs35e7ve9RQdoJfM7biGv/Q3B8KRBZ46jW4ViR3pHNqg+QzhL7GGlXcVESeoX2a6iZV
 EmfYzN3lSVnmL1uPyBVh/RD5dLpg9n3FhHuvwT3ov1RyQo1kM9preBUObk4BjDubqayB3EU2W49
 b9PKuV6x3aBq2r3Tup4oAolH8SJx4Q+LVHXUuHezO/ONqSMjFZUmX2PZlLJVh8TTFCFA1A5zflD
 y5GfSDKBDoCIpdIrGgliQNqPC/r4dsLLpykBf934A7cQ62ewPHUFNf4W0oeFE1n1/SGHw4igKM3
 jI0ykdRMjSOYZPOI9hklC3lW5oG0MiDnQXnU62JAuxjEOvPsUJJZA/YNm98rXOVkvXbV1zyTDae
 b4egigx9nvSEIG8Dl5nnS0UkRG+WVKcqWMSvOiEbJbvM9sSXlY0eiQAM6TVAq11nxgp10p3EQSl
 VZCk/19Ty+cUYjirg1pXRHlwEcYNRlI8J/SNNakWUbJRTCATOqF3xAWR7rLwxuCe/OD3/OCTOTo
 B9stx774sZuQ0b/mpXsgzUXwJTtl9s+KKZF/OUdgXkr0cBKDphBaxkUSrAatPisUEzeHH4Ijoux
 dTRRKayp4dxW41w==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
frequency is 400MHz.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 607962f807be..6a25e219832c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1632,7 +1632,7 @@ gpu: gpu@38000000 {
 			                         <&clk IMX8MQ_GPU_PLL_OUT>,
 			                         <&clk IMX8MQ_GPU_PLL>;
 			assigned-clock-rates = <800000000>, <800000000>,
-			                       <800000000>, <800000000>, <0>;
+			                       <800000000>, <400000000>, <0>;
 			power-domains = <&pgc_gpu>;
 		};
 

---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


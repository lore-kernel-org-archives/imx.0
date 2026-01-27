Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E12BEC34
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 23:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769556542; cv=none; b=EjvGtHpsALlFW21/n6Cpwv7CIUXkx9ZFSUCImOYLrxjiMKmE2tjz3vJwqtahNyMMEbXy6Ggv+IRTuIOsHIYhCboUKGGYzoeLd5K5SQ+LOQuK/21JqYqvhRaXcU/OI3GhEGL4gLF8neepUGWzQ3IWWGvEO2mLkycdn5mvBmtd9bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769556542; c=relaxed/simple;
	bh=nB5itl0OfsAcMlRRjvhiZa0Vpr0lRGlYy2oe6AKphVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lCGIetLRzDW9qR42tuo4OauH3CgmQ9/fa5xNY4AvsFzf39RIN7EXbO0SxBsyMK35qwMV04xC/4ONIJnEZn5YjnlXUgd+lR6vb9gHeXup7FXEI08U956txCdcCpmIYEPLeHgza4+LwcDKmGxRJ+G5Dva2/8bi4kw11MensfM728A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=QFigpDm3; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="QFigpDm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1769556532; bh=nB5itl0OfsAcMlRRjvhiZa0Vpr0lRGlYy2oe6AKphVE=;
	h=From:Date:Subject:To:Cc;
	b=QFigpDm3M/HXbeVuJlEFZYhGpfUfL4MQrYI5JY6AxkEl+yliw1XHgziURM54N02MW
	 Azd3benz7gvhuACUuJj8fO6DE347VRQwNHn2LHT9tmyEoCwKvF/Xb/3kow2mKPVZeK
	 HinfDqYIYc594uaa/GXaF951mSIw/mhMelwfNTRhHXGCNp7W73LqOnCoQuWgpAQera
	 DjgOeQFP0dA6aF2SSXoNrYsv7BVJCt80BWZKD4o12Mi4z0K61rIjedtLvRuE6J7lRw
	 YNn3slOg/tn5I8lVeF4+Ca6rEMOUqFq5aOe3fU+/BdZC0F29eTjq5tECt4sLtHuGzJ
	 iV+4DtJ7bMqOg==
Received: from pliszka.localdomain (79.184.64.12.ipv4.supernova.orange.pl [79.184.64.12])
	by ms.puri.sm (Postfix) with ESMTPSA id 1C00F1FA50;
	Tue, 27 Jan 2026 15:28:50 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Wed, 28 Jan 2026 00:28:28 +0100
Subject: [PATCH v2] arm64: dts: imx8mq: Set the correct gpu_ahb clock
 frequency
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4V07Sit8nLlfxgWba10Ii3YAYIh/
 LuFuDR3dZL7WhiZgIbYNVlYMBMSdj6COCRMW+kbA/iIzEQq8pSnGaCbS/eGph9BWgW67fQL+Ll
 SstKykrlmMdoH88R5r73XkZUkAypIr+1W1qIf6eQkDSZsdos0dOGzn5j4Fvrticv/vYlDFNfCF
 LrMClXc+jHgkRyr13X9Asisg/TVAAAA
X-Change-ID: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Frank Li <Frank.Li@nxp.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=nB5itl0OfsAcMlRRjvhiZa0Vpr0lRGlYy2oe6AKphVE=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpeUoyEZCFYMXUwUaX5gfjPGTC/JuN9qZhu2+65
 pdy4BmhMaGJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaXlKMgAKCRDo8jXPO9vD
 /wG1D/0WomytfwAtHknFNpGvPysCpyApzfcnmCaY8ZJ8/b1Q0vuwi5TnXOZdm9ycpSkKEIiMnNO
 zmlOOXSS0ux0UzaZEZ3R1nEM21uEARQlw4xP2R/6P4H32ZJhMPumYGpuV1cdXzcHhsGAeVJZMhY
 NHnks19P0Y3ha1RRLIp9aE2I61x017aQAN2K8xRyLx6bvDSKsgITEJvDxo7nkdwfYH16KkDcpQU
 cuUEHeoXSPXoSz+wo19f92ApjReZfgZESTiyc325cuFzhm8C2/tHu+y7yePYVGpQvnNJuxKQ8rl
 i2YncQp+VFI/Wd0K1xSWrwISmQBLi2LVRqLdT4Uy0yYgJUq5P8dNN9awpzgLq4ICNF1SfLg8W9a
 292ZeqKhoWFH19xCIrx0bkyVRCYjy9N0f0srsL8GAvx6z/8WzTqKF1LIuaIaNgmd/nxCcnlRthk
 EubUq0NG28LmT6GxHRpcwH94jHHdZ+piTBJLzpiPBvnkzfZTZ9IYqn87Go5i46GDPCQHlKFoY8T
 +UdGwtPO8h6SPcGfbbKXEVY0UBZfzLi6OtYYYUfr/bz2PnhkizXEe6t+Nj/MV5NBVSn8JhQVra1
 7Ze+jafmKiwNq3AZt1r2kPCUlBjRwboumQOcayFcC67TqEy2yxaZadMt44qebUce4iYBCraXrvD
 qZj6QAXh8n87cTg==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
frequency is 400MHz.

Fixes: 45d2c84eb3a2 ("arm64: dts: imx8mq: add GPU node")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Changes in v2:
- added Fixes trailer as suggested by Fabio Estevam
- Link to v1: https://lore.kernel.org/r/20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm
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


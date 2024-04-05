Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F616F90C
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330956; cv=none; b=WSW2c4lGCaY5kfAN7xnN7WPhaqZxsGzUM6GKexNPxeiHXrEzuBea+VuuH7GpmnlW/RwZIAqdl44m7UEe8nFMinrhJM27fbB3f5nJn8AVu/VpLqCl6LV8ulsRZVaQ8kwOUINNs0Uwg16tHNQ95sYnu/SiwRl+CR/zQZ+hwnZnv+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330956; c=relaxed/simple;
	bh=fat/r3HbU9fmQ9BZUSIoNdkoDjoqNHVWvYNMh5bZGac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WTVhz1ch3uhvkw3o55KICSX+XtmlpUbBWKEx5ljXk+IIjP0GxiLn5gf0iio8vafIlvpRWrXVhMMLDvKNwKGHCfB/Oewk+5fi3Gj2aQUD032/PbIbSXDDwjD6LqxLGfpJ6JTaFm/m8qa4LnOhFvFN0xmOF1GlU8/smDzcs2OifjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=kIEXk2Gl; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=RfOs6XjD; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="kIEXk2Gl";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="RfOs6XjD"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslV8-ynZKb9-2X
	for imx@lists.linux.dev;
	Fri, 05 Apr 2024 15:29:11 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Fri, 5 Apr 2024 17:29:01 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 4/6] arm64: dts: imx8mp-verdin: remove tx-sched-sp property
Date: Fri,  5 Apr 2024 17:27:58 +0200
Message-Id: <20240405152800.638461-5-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405152800.638461-1-f.suligoi@asem.it>
References: <20240405152800.638461-1-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0641 (UTC) FILETIME=[FC636B90:01DA876D]
X-smtpcorp-track: 1rs_V8ynZKP92b.EuMHjfTo-G8L8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330953; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=z6/lBWhbzIHfLCrRTM1SzzPe1OKp0Fc/uUJ7RPvyKV8=;
 b=kIEXk2GlMd3osXEoge3AOWydcjAyGFV/SOtNy/3r6roxofVs55K9GEFHGpgVB0etZJ1yI
 WgIBpyaAujfM3HQPFgzCyAqWPAulLHyHPyyqaUYWlXRz0jLVTURTlmy7hoVGaqNOCjE04Ks
 4YxWkh+Ckwm1JbS1sdUeYOgJ6JGlJ2gQj6fNXzFnQCGhqkyOvlMIvBCucmA6aclCufsw2Bx
 wzO9s4/hnZFlRUUkbXPITpFZzscmk3c+ikQVC0OkZZuEA9efErVNgByjRbRYrHge6xXghOp
 OMKaXaw47YEJ+1RgSsi6cUk5hdt4DpfKXIUGSMHlWs0rjJF20VOrqLgqfSjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330953; h=from : subject : to
 : message-id : date; bh=z6/lBWhbzIHfLCrRTM1SzzPe1OKp0Fc/uUJ7RPvyKV8=;
 b=RfOs6XjDxUyr7sj4LnyF5yIVkYNx2927NOFGw/KGqpK7vQZZWtU2j+GiXRBMJn7K5v+hu
 /r/i6AKMmlhdQZ0rJl1XN4TXJkAL3ra8aNBJbY37lZWT/TaCxUU/YiokyEDzo984+FGFzmb
 IMzOcDp5yxoqGnohqVKHtIy4kKqIG1LEkNaxMWUDdKOI2Svd/3kLL/7zUVOCE1H8Yad1gC2
 N6radH1J7foCeKjnJAvF9rvRaU/1UxB98757zpl6Dpva1PdSPEijlme0dincXcy9nNnUzJv
 Ne8OsC/17GdgOUXT/TuppYD3D+L3rif0ZXSln/2qDe3poIdQQbkgEy10c3Lw==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index f033d4310305..5b1b36a7ad38 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -260,7 +260,6 @@ queue4 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1


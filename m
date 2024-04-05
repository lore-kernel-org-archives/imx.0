Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9A116F90E
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330951; cv=none; b=k1Ml7SgU+paNyAGwutjyQ3ylasPNw9qfvRuchz58imYdO1BQaTIodSdi7y73bR1UxGlFwMUFdEEOWfBEP+D1uJHv16cUFhhNDpKpCo584mfewxU/xJDzCtd0LT97mPfC/8aG/S5DdZtKBinT9k/4mMjnpVCu1N8Nz8hNTUyPUm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330951; c=relaxed/simple;
	bh=yEXd6R2RFIyAkUmeFULIOxy0s9OfDiNnoGFMw55jKdY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o2zsqyn/SGa9rhBjpH7PV42Up3Y9IbBeJbFfYYE4+jWf8o5q/krEvsfp3CiFJiT1nY1iL7fTBO2NVPAQT4+XwJXaJJAnkCyho5CTmwwDVgSWxqAdQz3ZVWCr8GBI18FyaYdcpFX4iu6TMJ6Lr9gB+RZmFDl/U75OcY8d4bb/tv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=tgYnG+lw; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=hQQtzrsh; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="tgYnG+lw";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="hQQtzrsh"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslV1-ynZKb9-31
	for imx@lists.linux.dev;
	Fri, 05 Apr 2024 15:29:04 +0000
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
Subject: [PATCH 0/6] Remove stmmac tx-sched-sp property from documentation and DT
Date: Fri,  5 Apr 2024 17:27:54 +0200
Message-Id: <20240405152800.638461-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0370 (UTC) FILETIME=[FC3A11A0:01DA876D]
X-smtpcorp-track: 1rs_V1ynZKP931.EuiAjfSRBw7Cy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330947; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=PPveenjhvhYMsU4A99FqUOwm3FtKhb+PERao04VTYEk=;
 b=tgYnG+lw/bWwPwCPWGpMUnrKZSmOXL+KSEutex16ycJN8mqsMpKNGSVe9PFqn2UYSV1Hk
 dIPRHtm1fyi5yq+s7iU8Zf+n5bX2dY+0lfAKJSCiw1Fn/AipMfCJSnoUvqgQpKlMwH3dH5h
 gInYiNlOgoluiAulLC2ataFS+bYvMLYifjTnSBeV+bLPC6bxhJVZ0zXP/9ihy8xYeUue2p2
 fM6Kd7MoaSSbpq11NxGo/bwEmSj47NN5ka37GxTvNdSy1uWiJtMMdpFspqQSDTxJYwzAfdI
 S3pSzaygJqHn0BVO6dI6R3VM8GiPuEc1/TFVSlRpcRsPjGIgTBgwoKMhL9Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330947; h=from : subject : to
 : message-id : date; bh=PPveenjhvhYMsU4A99FqUOwm3FtKhb+PERao04VTYEk=;
 b=hQQtzrsh9Ut0FbdUGKJ+gRLzMny4/GN83yWVdC2J33269ZlIKDNsiSsrSV5ypJPOViPIR
 w8gthpVh/Tg/AivxEeJJAfIioMYF2BkBrK412B34tUP4bqiW6TXq5dH5iaRXMRCT66Vwe3v
 uXpfNqhyaaGP/ecmOSZxMReOTXL67pNa+KLQrS2hUQ/i3gKc1O4l/QEKspJ+nYaCdbrPHmT
 1YH2LAFpKmcji+QUtWWEfDkFihsamIc7/5luAjk9l4FJHNBA5XUMtGlND6jS1t0b80Vtxfi
 obBabZjBODTuVKXD74DHRX+oeoDZdogrwal8MtCCkrbwjLWbAV8ZGB6QDyWQ==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

This patch serie remove this property both from the "snps,dwmac.yaml"
documentation and from some device-tree boards files where was still used.

Flavio Suligoi (6):
  dt-bindings: net: snps,dwmac: remove tx-sched-sp property
  arm64: dts: imx8mp-beacon: remove tx-sched-sp property
  arm64: dts: imx8mp-evk: remove tx-sched-sp property
  arm64: dts: imx8mp-verdin: remove tx-sched-sp property
  arm64: dts: qcom: sa8540p-ride: remove tx-sched-sp property
  dts: qcom: sa8775p-ride: remove tx-sched-sp property

 .../devicetree/bindings/net/snps,dwmac.yaml        | 14 --------------
 .../boot/dts/freescale/imx8mp-beacon-som.dtsi      |  1 -
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  1 -
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  1 -
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |  2 --
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |  2 --
 6 files changed, 21 deletions(-)

-- 
2.34.1


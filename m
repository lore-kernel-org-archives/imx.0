Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A78117106D
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330961; cv=none; b=ROwLqTzOXysDn5wrnYUDIg3nb8eGvwrjC74xpoww8dzcLvOSGWicqi//dAcIZGG4EJ6CIXsk5wkRfTbLt9S+mV2nTgSqQZB0ldYQ08UCIaAUroztJo5b8ef5Drf9tsQnVvoW6KmaODMsR7i3dCroiy4VVw6jJCLYqiS0WAcLqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330961; c=relaxed/simple;
	bh=0pYDM4UNhKfS+fr+khXSp9jVPuhVAFWiMJpP1HoiGpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YgHCUCx1TAHcKIVIMl117/eJ7ALXXqF1WClmWQYJqwDHqpkKedKRuALQbnQTVMDEWKpyLm2MlQIA8dS52x803alkpcD1oVc5GHNYFHgBh39Fgn+CkogrsTtVI8yNzMdfmPayQuzPwne7Z9GTd/dQuMrb5whm4/f9xtOzZ+HzpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=aS1lbxVU; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=eIwXx5tB; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="aS1lbxVU";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="eIwXx5tB"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslVC-ynZKb9-0Y
	for imx@lists.linux.dev;
	Fri, 05 Apr 2024 15:29:14 +0000
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
Subject: [PATCH 6/6] dts: qcom: sa8775p-ride: remove tx-sched-sp property
Date: Fri,  5 Apr 2024 17:28:00 +0200
Message-Id: <20240405152800.638461-7-f.suligoi@asem.it>
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
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0798 (UTC) FILETIME=[FC7B6060:01DA876D]
X-smtpcorp-track: 1rs_VCynZKP90Y.EuMLjfTkJ027o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330957; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=ZlqPPXH5bNJhEltSGKCBrMvzg4Eqwu2ZB1ba92tVMY8=;
 b=aS1lbxVUsHU//uc6SUvMYO0HZ0Gs98HIDieINceMalYqKcsCrm6vHv+0UxiTXM3Qii6oD
 nWC3jfEc7ayPQatuMuZmL5PsluASvRZ3a8Mc5QkPssr8iFcCGziXjxwimKwakvWeqyimPGt
 /i/twMMP9YIaNcl7RJBjqluWgwnUA65zNplWQEyRp5MhOAkKFzdTCUMz8SxEGXw0Om7Bzv+
 5GdWA0OGQg4WrJR4bwCUzgxaAziLIM4lFf1wzp0U/1JKoJywnsXadifp7m+8g4n1Ic1IZ0s
 myp9s8eCBsKIKSC0MlTkwDFWmTMLfWaT6nyLZvHqBrGtywKMiper9z2aj5Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330957; h=from : subject : to
 : message-id : date; bh=ZlqPPXH5bNJhEltSGKCBrMvzg4Eqwu2ZB1ba92tVMY8=;
 b=eIwXx5tBhy0oPPkfCanE4wLZYKwZz0fCDymkLKdJmMTwjEdace3QEtTCoHc9YzmkEyFZ2
 BhwZh29DPtn5Ub7iLnVpS9cWYC8xvFOBVWXto8pI4F+5DloCEhK5X18kIA6PL5M+dITvVUm
 HZvNkgU+t0D34CIqKP59MHB/gLnXnOgfL8SvAH/jRVUpqZUkHnQROqYrVvIKNtkjqDO2/kx
 MS29u2XtEJnydTPRZcSkOl7W03cHnfaqEAOTioIoRKo632qKX+XVemP0OOUc1pb3c/3Pr1P
 UI7TgiLrqhmkvC7WRnB9vKIciGQWIAPGMbkdN4TOKiOB/BSJwy5R8tgGz+3Q==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 26ad05bd3b3f..2e1770e07f45 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -334,7 +334,6 @@ queue3 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <4>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
@@ -404,7 +403,6 @@ queue3 {
 
 	mtl_tx_setup1: tx-queues-config {
 		snps,tx-queues-to-use = <4>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1


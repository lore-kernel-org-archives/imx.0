Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0916F90F
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330952; cv=none; b=lMAmSHkEYl6xUnrTSgz+oUu5HeP+ncJK5hfph2tWQ6YQ9soBcm0rrCIEn/xNCNMg2XYhEEBg6le5YkCELwULc6e+3GMKHp96t0c6tN36x4/B0pT+xTLMb3w0AQTemtvpFij5Ykok43ptmyvTY2MJYWLVafTrt5C7Z5+zJHv2UWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330952; c=relaxed/simple;
	bh=4qwJYpjiE6fWwx3p9TfXqvaGfWov9YXj6SAWVJ99Sgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uRI8zKOUtbIx6qitYZjbEyJKyvNd2MmzPTyX1eIgPsF9jLLMDayLA46/CP6u52GBahYKTvTJl2tMbzTNYt8Dhmm7sDYfi4IVSSK+ORar8LAE1Z66d291CyTiWLWbTM7wnlud60Ff74GYiGErGxamBpalwC6DjXNrIz6mhXjEdGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=WE4glPEy; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=hB0qthzl; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="WE4glPEy";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="hB0qthzl"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslV3-ynZKb9-21
	for imx@lists.linux.dev;
	Fri, 05 Apr 2024 15:29:06 +0000
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
Subject: [PATCH 1/6] dt-bindings: net: snps,dwmac: remove tx-sched-sp property
Date: Fri,  5 Apr 2024 17:27:55 +0200
Message-Id: <20240405152800.638461-2-f.suligoi@asem.it>
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
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0385 (UTC) FILETIME=[FC3C5B90:01DA876D]
X-smtpcorp-track: 1rs_V3ynZKP921.EuMjjfTvKjK8u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330948; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=5jJHGZta+4HpJK5sG35qXkW6G+1lFaAs7ITAMPwZI1s=;
 b=WE4glPEy48t+V+vQ73mDM3OpI0zLUyMFickCwQa9me9JowLq3RJEzObT8FlmAcs0ZLGs/
 apmfijjwWnEGQHgnFy60AaAMNsapK8wH6APVoXQ2YLMzPFLmXDB5cw/Us29Ke2KFaBAD8+8
 o4PGpIs9ZJVCWDeRCL4qzEZa0Rr8+MCxoYGHcRfdY39AlsGtd9bSVALMGX0XOqhpQrMkyPu
 VSg17rked5rC9tQpGS8hQYdpatUelwrXCtnZe5uMaFLJ2Bt3ZknddeyAByH2r2xxth4ZeDj
 vooNl3Qt3Ur9X9wdtPcPTfD9jiJwFvTNTI0NBp+h1toGbdqzpiU4Cw+T9cYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330948; h=from : subject : to
 : message-id : date; bh=5jJHGZta+4HpJK5sG35qXkW6G+1lFaAs7ITAMPwZI1s=;
 b=hB0qthzlpQ6EP4iU38yzn6tDwfy+da8WRcfL6xhtCNQ7SZynhPZe+MmXLqzdwxS/OyNfm
 CwJxFmO2moVNY2IzLGCihrIn5pcRM2DU0tiaAt+XYGxan+aMz3SfH5ZiW1b4wlbYVC0rUBO
 kt7ccrvnm54wfR576rNZifGEgxpaZgh8M20RFbwoFG+vpm5FmYaPWt4d6M1/n1diJhWrDBc
 L63qxUKt9OvIHU46CNNXlZTO+0ZpIZ4zl5bk3W6rO7U3OZZ6IA+26ZGRQijHHUvRMS/zZas
 XE71aDensaPcpIskODnF27FabrZnfYiGvc3qNxtOJqpiBwyP9/6mY/ejgrsw==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 15073627c53a..21cc27e75f50 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -328,9 +328,6 @@ properties:
       snps,tx-sched-dwrr:
         type: boolean
         description: Deficit Weighted Round Robin
-      snps,tx-sched-sp:
-        type: boolean
-        description: Strict priority
     allOf:
       - if:
           required:
@@ -339,7 +336,6 @@ properties:
           properties:
             snps,tx-sched-wfq: false
             snps,tx-sched-dwrr: false
-            snps,tx-sched-sp: false
       - if:
           required:
             - snps,tx-sched-wfq
@@ -347,7 +343,6 @@ properties:
           properties:
             snps,tx-sched-wrr: false
             snps,tx-sched-dwrr: false
-            snps,tx-sched-sp: false
       - if:
           required:
             - snps,tx-sched-dwrr
@@ -355,15 +350,6 @@ properties:
           properties:
             snps,tx-sched-wrr: false
             snps,tx-sched-wfq: false
-            snps,tx-sched-sp: false
-      - if:
-          required:
-            - snps,tx-sched-sp
-        then:
-          properties:
-            snps,tx-sched-wrr: false
-            snps,tx-sched-wfq: false
-            snps,tx-sched-dwrr: false
     patternProperties:
       "^queue[0-9]$":
         description: Each subnode represents a queue.
-- 
2.34.1


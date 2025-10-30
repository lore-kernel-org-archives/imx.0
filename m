Received: from mx-relay73-hz1.antispameurope.com (mx-relay73-hz1.antispameurope.com [94.100.132.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814C224B0E
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832435; cv=pass; b=SlOqXQUmkqTLOO4bCONzcHo24B8fPie3Nd+yRUIkRqhS9y6J+wjLitZ4AUmyyeysIvU+W/42wAm5YOeKMNrUzFh86+Nq1gPrhDgC/kfAY4uThf09ANEQ2FuORftQ/O9htetbe1WqsSqCPSm45mCeDQG4AHjJunbbe2Q1T6QcEsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832435; c=relaxed/simple;
	bh=tJrQacF40a7gkfl20Qlli9OSH8A6qFFlTzAw0DY/ick=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfzxM1hKiCqTgd5w1EUfbPIN1ZfwICna8JXuIBH3GP+/hOPXqklL59FUS82MabLFx8HPfGEFwM+3FWzwNQ6LtDdJzjhiWTW/RM+ItOp+iinui8T4ZkxiMONC24xR2TmwY9xL2i31Tvy597zKZHPjlOAUvT9itoCxIZVR/c/Xvpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gv4ECHzD; arc=pass smtp.client-ip=94.100.132.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gv4ECHzD"
ARC-Authentication-Results: i=1; mx-gate73-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=WrjQJJxL5a0An32raO9r8CtscWfKA5mlsUuQyxrLoQk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832420;
 b=ZZQEf77V+PrIyrYSfPELzgGPkbS/+6AR2BCna0hdP4lwhr6vBujwqzKMzCbbu6RxFtTJzE+O
 cr9mavrfm69uTV8NxuYF4IfeSTIxe+rOoEy+gswZPOXa3l81wXqrhigct+IwPfvg3MRzcHJvigX
 /wenm3rgl4acFQofBCL1j472nrxAYCKSYavVfiaepdyOqP7dcJgmEXUDJm4xZNPT/TF31Vs7cFy
 hxO/6dv1XoMeRtXwbdLEMay2Rr/4d4rcmwKjkVCgH1y/n4h2kHx/NLWd7RkDIDfYPYd431ffrW/
 lH/gkqvIZJzaj+7hp8VsSipKyk/04/E/ZnN1++DxuJ10g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832420;
 b=m0ZRbzpJdlTJdqDaCrN+ZLm+LRxcpeT8pMrvV0LerEFP4Owa6Apfy7Jt0vLkWGXgvByuyuEk
 7522b1UFYWB7YgQz34Iauc/61jIDTCTi0WdAicWAIrREtoGwfpbeTbl6L+YibSzi4oyxVBOQ3yk
 Fyl+Wju5SDc1R6H+SgYkFhLFuKGJlGywrmQoldhavhhIYYakhqj+AsQ9HuYXcKWlGECrnawn639
 A6FwiatWhEEJyxg2vbOmGcr2ckZzTe/J5Ebol7VnhCiTWDWfrWgsZpwnQ+lMV7FeXo7o6OKZ0t6
 G5Sec1W7usXkWNb3DTSl9/0Oq3szdWLMIgLvhPwoPnu7Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay73-hz1.antispameurope.com;
 Thu, 30 Oct 2025 14:53:40 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id CE8195A0AF8;
	Thu, 30 Oct 2025 14:53:17 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/19] arm64: dts: imx95-tqma9596sa-mb-smarc-2: mark LPUART1 as reserved
Date: Thu, 30 Oct 2025 14:52:59 +0100
Message-ID: <20251030135306.1421154-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay73-hz1.antispameurope.com with 4cy5DV2Rr7z14YKb
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:adb5c744a6af74ddd2c8a6726a431f2a
X-cloud-security:scantime:1.676
DKIM-Signature: a=rsa-sha256;
 bh=WrjQJJxL5a0An32raO9r8CtscWfKA5mlsUuQyxrLoQk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832419; v=1;
 b=gv4ECHzDs8MI2B4Tmx8MQk3xQz1KzWqrAxK9iNNayGj10dxf9/hRouUuhgIPpbZw9WQgfZZy
 AQmGUCsmmQ3GkRuOTLQj9LpI/voZ3HR9jjEsXb9F8iZjx8Z3EsX/T0WRjlw64tlD/SZ3lFA7K7d
 5KMmcFPRx/dR4A6vq5EWkLU+1h+vGEBwmx6Sft1wLkxIiBzzlNp7/6vzNSA6qJwet1lILsxnIZC
 wWvSvAPHhhdY4xbyh2MfB+irqI1TQPu0lq/s1BhFku/eKm5Oz2bb6i3H/DsVCHc9zBHxE0qVrua
 D1lXmvDIkdNai05WGk8aVEU6dA1G99eU8Nr7T4KtMUS6g==

LPUART1 is not disabled, but used by system manager (SM) and should not
be used by Linux.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index d1c3d55b14469..15d117d785445 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -212,7 +212,7 @@ &lpspi3 {
 
 /* SER0 */
 &lpuart1 {
-	status = "disabled";
+	status = "reserved";
 };
 
 /* SER3 */
-- 
2.43.0


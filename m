Received: from mx-relay125-hz1.antispameurope.com (mx-relay125-hz1.antispameurope.com [94.100.132.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6852F8BCB
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.191
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967427; cv=pass; b=n90xkFh+ASWTDfqxHGjvpTsth0FGVY7xEKmwYZu7LERSuPykj05WZSHG1QIJsB4VtRhydJLhDyzn35X1mILaEHUgoevnbsLyDf8xA5gBon934h5oTknCdkkuwDy4B4r6ztoq+7D+4B/6m46nRlH/QxypPca43qQ3y3QIa/SGKf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967427; c=relaxed/simple;
	bh=Ju0/wiKUvWYjWHdcAYDMANkjK3Cm/u3Wfd6p2jPfLqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iyWfYparz0TTpSXpAlEFYfXxAq5QWayGyNblbl/AUcfsuwCMdArecqFVQ3gHNsrRhqW6xDyJ7UEhhPo56/Ols0/o6hh4iBDPHWDUHr9rtWsJ+B0ZYT8b7qIIFSyZhZ9U6tDndB/EwO1CW2SFRBvyBI/PUGJZvEJXQr6tnfEyKus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=e6L09YNx; arc=pass smtp.client-ip=94.100.132.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="e6L09YNx"
ARC-Authentication-Results: i=1; mx-gate125-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=1W2HGikbIJzfaYIFBM5i8Nyqmn5OY0xo3QvYrQaWSv4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760967356;
 b=RLP62XlGJ6jDiVy2KhQOOMxAIOf8BRRZmyCVwOqTkrstdzz7NFFIjAQBAMrIFkK+xqkKyLmO
 N2pYsSXfrE3+Hwmuwkhdm2eqYqGCEBpPAC3a+CW6vPlg3Qioq7KBUhlSkd6bDwnSAiHbqi1cYNQ
 svcrfoAtVIfZoaI+5E5VHIT2AGZQYRJnCvvR3hM/9Fbcmp4HhEefw40D+Xu/yH5iQu9HAM+gFBs
 UZfqI3LkOh/7p87rz1Qq6Fco15zWPLgr04UwSpoPIOP79JocmHhx9P324FJVaR+te92JcG0G6cD
 LjUsWjqHzbSsvGPpDB+O3ZPC7abOtqYMAPo0qkFdlcOvw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760967356;
 b=ldl/KPNnDgZB8qoz6Dk++o4q9okzkN0xFnmmOw2eRvkJCTI5RSX3Gi7GKWyNwoKLdfbYm7A8
 RVJBDQWu0wh1dlw4TISSQiFLzx3rM12TwcKuaI3TtBMphSVCUxIRfLolEuP/bvS00qMDZWqbvWu
 OzkO61ECHrYkLUA+EKkT7nu9c2XEtEN2vuZcKAkmVkmZSbiDhHMBLp1koaTuK5tGqrdkAoNUaEA
 FUi1kh5l89hxTvgp1uURe0nVdTZka3ga2jZnRL8SlvE8VwhDjlIwERZK3phWtfeftmIJohy/Xjt
 41izqSbS9sKBmSQLdkpziUS9tB6NX9Bp/sjShod7nHSjQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay125-hz1.antispameurope.com;
 Mon, 20 Oct 2025 15:35:56 +0200
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 90AD3A41252;
	Mon, 20 Oct 2025 15:35:37 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND
Date: Mon, 20 Oct 2025 15:35:32 +0200
Message-ID: <20251020133536.303471-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay125-hz1.antispameurope.com with 4cqxJV37nmz3jhMp
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:130be11a8cc6b50305d6fbf7d7b2b905
X-cloud-security:scantime:3.047
DKIM-Signature: a=rsa-sha256;
 bh=1W2HGikbIJzfaYIFBM5i8Nyqmn5OY0xo3QvYrQaWSv4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760967355; v=1;
 b=e6L09YNxVXl8Cs+q2d05k60g0M41pyC8Db/G0XAbNn37Z3lQXtdtw4ZrmyhIEhIjHH7fU3Qu
 KfXI3Q6sDs6Kxk6DetbLF2DvDntqfqokSBFjOvnq6Mz/uHjuk1nRGiP6ckrOAbwsAEFpCLCHohU
 vyF1eAa6jNEUuqtedRVGMYIWn5Azrwam3omO1FwWboKOzTkBN/aLndPWZttjKg10tPWWhnb/dGZ
 qjHLWZF2IxyJDxWSCpRS0Ko63Ah2MEsasZ+qWkTiSuf6TCkYxcapMFl89Pfb/N2WYgVtIq/YACo
 a0dStQx/DLzSOf/aqq5/oh9Kn6t8eQ5XwpHwwChJ4XgKg==

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
Layerscape LS1028A.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Fix indentation

 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 34c822a52a5e3..12bf25fb0a97a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1665,6 +1665,15 @@ properties:
           - const: kontron,sl28
           - const: fsl,ls1028a
 
+      - description:
+          TQ-Systems TQMLS1028A SoM on MBLS1028A/MBLS1028A-IND board
+        items:
+          - enum:
+              - tq,ls1028a-tqmls1028a-mbls1028a
+              - tq,ls1028a-tqmls1028a-mbls1028a-ind
+          - const: tq,ls1028a-tqmls1028a
+          - const: fsl,ls1028a
+
       - description: LS1043A based Boards
         items:
           - enum:
-- 
2.43.0


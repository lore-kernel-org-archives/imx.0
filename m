Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37766172766
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 21:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712353614; cv=none; b=Ghn8wztxDnDhw1CTJK2E4SSVNLYr9MVL7K0SGB59/vIXiyNZ6NXZ8jiarzKAD4bUCRyKXpPU/oHEhc9OF/kidhLYBNNo8/3u+oAMMzAKQtXQ6I0sywGweBM8jDCxYolkfTsw1U2rw3c6wceazthJHy80CIGd1GiWYbY3MjAm4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712353614; c=relaxed/simple;
	bh=RCRD7PBZK+IYMkYhekf2AM7vOGwui0gNYYlkCH05Ask=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcUPRTG7BTS+bc06RIQst/bbVMXigsId5nyMJxhAWN+Yf/5U61xAA/yBj/pbWybpTJrlOPAXsBpOGyKliPYihfSWXLsqnp1tnh+/WZysNjauTU7Vn7kPf9RkvJ6Tc2bzGyIWY2boxXluXS2eC0f8lbGCPAQej8+5fgkK2NTYpTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOW-0002z7-Kv; Fri, 05 Apr 2024 23:46:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOW-00Ad3W-7o; Fri, 05 Apr 2024 23:46:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOW-00FZog-0V;
	Fri, 05 Apr 2024 23:46:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v1 04/49] ARM: dts: imx53-kp: Drop redundant settings in pwm nodes
Date: Fri,  5 Apr 2024 23:41:51 +0200
Message-ID:  <1372abe78864ff2e3f0bbaa1c0c833b30e17c17a.1712352665.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712352665.git.u.kleine-koenig@pengutronix.de>
References: <cover.1712352665.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=771; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=RCRD7PBZK+IYMkYhekf2AM7vOGwui0gNYYlkCH05Ask=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmEHAmAaE8sqmgp/JrEF2xOp+KXhOwVa8nhEEQY oWwaYOo0kWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhBwJgAKCRCPgPtYfRL+ TkgBB/9TRqBIuyUK7A3e438KA4qd8qXhISkUetFnOFemiQtiC5bD1xmr62eo8ew87NoyTT9v1fq 4kEJYeW/0JCfVS/yP1ZwIMPxtp1CGL32+2D4AArdwEZe7rVgx1Yp72NXL5Pj122NPn0aIGn0iDz 7JrfCipODyaH54psH5A4ilXWQ0ajIPdlm0ln84U1towSbV9JNeyc+uh0/344vQYVHOWdMKuq7tP wdHCIVjlXXepEftTrVA5z1T5rdZmIqtlfZUBWAOvL8QRMiUtkT3ON+QLfRQx6x0WtQeDiFYHhIr UkSC7Y2+KGsPn7Lsme8rqta/wcWwkMoaC0GHlHl2huim0gOQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

imx53-kp.dtsi includes imx53-tqma53.dtsi which already sets #pwm-cells
to 2. So the two nodes can be dropped without resulting in any changes
in the compiled device tree blobs.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi
index 4508f34139a0..8b25416a5303 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi
@@ -162,14 +162,6 @@ MX53_PAD_EIM_D20__GPIO3_20 0x1e4
 	>;
 };
 
-&pwm1 {
-	#pwm-cells = <2>;
-};
-
-&pwm2 {
-	#pwm-cells = <2>;
-};
-
 &uart1 {
 	status = "okay";
 };
-- 
2.43.0


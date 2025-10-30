Received: from mx-relay32-hz1.antispameurope.com (mx-relay32-hz1.antispameurope.com [94.100.133.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EECE34028D
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.208
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828669; cv=pass; b=rhQMG0h/jZ/QqX7xoukhuoYCFOSNbKNg1J8sa7ui9QAd+2sct74iydboPkMj591O6oSrysFaGRL025JeYKMnheghre2Sjc+uLPDdK5P+VgEoeP79gpCFYBDlUBAZgTdu4gwW75DTDK6Y5Y7f4a2pPT/TZNAxc+A0dLYT84txhTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828669; c=relaxed/simple;
	bh=8R70P4kEEcIbFjodXfQBxXqAq+lQZtKZ+MdM85RNf64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1MrIKbaK2xcYRXBtHDohlWvqfS87ntc3IU0zM2qPQbmbjSl7qGGSyXs3QBgnfj/saGypd0O0v9jx+OHuJlLrmFM7vjrzgCSzO7sek+bIREC7SVmN591QBjF70+mx3R5C7TG0BezGiUh4MKqSfkB5uqDrgeeoLxFrbCfa8BuExI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gBT0fuSF; arc=pass smtp.client-ip=94.100.133.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gBT0fuSF"
ARC-Authentication-Results: i=1; mx-gate32-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=orpjfmaMqp/ep6TopDZ6qss0KQr8oMJ5sbynNFItMqc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828613;
 b=qyx23syYf6W0oE9hOPWb4LVMWWcgEBjyIunCRWyoh7tWsWWw+bOQ43K6YGRYlZiBxC2n1YYv
 GFIRXFjk0o3H4oQEDLww/oq1vqAd8VXBF1XSRcMJlrvxGS/2IaAeSV4B53Q9wxpq87p9eI5WDAs
 DAvKuY5Nh+DvoaghHC/SgMH49xvrRudksI7cnKOMak172LE7Fgh5ypcouEQhhmeU0ZU5RngSmSd
 mOWU3Rvt9Ect9VRkQxr9uBNCvQiimf6PyUwcaW6Oywg8aB5MhIu6Evgjp2ZvsM7RIWWRd3tu90f
 WmFAcgTHNh1twBh2XnCn6JzlIbQYHUbAnj06WRxIjscRg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828613;
 b=nV9VfcUFmTXOYAGkdDDJRwqQBo6NqlNDHx02c9Mw5Wc02YrddYQiRrBd0BqRNoAbRmhQKKKx
 SUxjfwxHCS6xdzk4RfP2EAL1f6fBjndslOv0m3uSQ+XEjldTDoQ6ha+LvFXQObjWdrd+5GwKgVs
 cpPZUqMg4jS78rb6erz2uUGFzb9z9XUtWOtw4zxoGXqlco9gIlUTO2Rq/rk36wzP/ma0bit1CCl
 iQuUDJVb25PrszxD1nJHZu9maQEt3OGpyUFNTifQY3FhqI9Sv78VrjiKQdnH9yaOz+7yQAfEjmV
 NIFXAe3ET2oEwq1GWfCr+FiBIHFDfhV6CVCa6lRhSE8Rg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay32-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:12 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id CFE28220C62;
	Thu, 30 Oct 2025 13:50:02 +0100 (CET)
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
Subject: [PATCH 10/19] arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for flexspi
Date: Thu, 30 Oct 2025 13:49:17 +0100
Message-ID: <20251030124936.1408152-11-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay32-hz1.antispameurope.com with 4cy3qH419Jz8stG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:201a609ca4cd8de84ce042f2b20575b7
X-cloud-security:scantime:1.813
DKIM-Signature: a=rsa-sha256;
 bh=orpjfmaMqp/ep6TopDZ6qss0KQr8oMJ5sbynNFItMqc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828612; v=1;
 b=gBT0fuSF3CLV4X1VejfzuwEy2SU9djDwthoJVC1p0ULr6HR4QwsXk5cWX3Hv+2xOIRWJflWe
 oBhlk/Gp+pjnYvVSM7AlRe2hJDNj0i5YMA9Qch3FY9NRVm3SWDH2L4/yBo+wVO46L8tcuI0p75u
 Lj9oJy7nkcLg98kV5OI13v9mS9sdRajTpd32pHPrPxx75h0m1F5BA8qW7VGww4+scMZmUfXUEwt
 1QSCbo5IF+i25dxXKD4SCzBu/LIXmQESY8mhyQviOOqLy8+sc6i1jfCNNQJW8byyYFuBf2ZSX1y
 zeZ6VGmx+YPweRos0LFl78Fpa8gaOhw4bbVuFo5jB7uhg==

A sleep pin mux is not useful if it is the same as the normal pin mux.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 36da8ff8d1835..b7136982700a9 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -117,9 +117,8 @@ &flexcan3 {
 };
 
 &flexspi1 {
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi1>;
-	pinctrl-1 = <&pinctrl_flexspi1>;
 	status = "okay";
 
 	flash0: flash@0 {
-- 
2.43.0


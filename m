Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8598014885E
	for <imx@lists.linux.dev>; Mon, 25 Nov 2024 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525355; cv=none; b=MP5pAvNPcL7tFngsvb2NFdyLg579FXifLYHmfX2GZzWx5X/JI+ZNmh0c57/4XQTEkobC45zntbwvwoAozSB1YecCO9aBruaRK1agGUAAac+7Lxd1Co9wSqFdLW/QTLg4buLQtj4LB7jho9Vuu4TvgCqXRzj/4mPSdHvN+6z7imU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525355; c=relaxed/simple;
	bh=uJXExFdZHf6SBVQ9PilFPTPrzrw19XFPVd9ZOVy8v7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M3hMjXQsGmLWAjMwcn1iUJpzUaJ2S6Fz4jXHDf78ipxo0Wtc1gFXp/qIqusfEgsDPEQpaSVl7CMj13wyZ1jBsxyLnE5LHaPMA5ztICfiBzxNcBxGJWBXXcK+x0JXtPY6GsGlB1aY3g9AjLxahgmJZs3TvuL9kRIVQx/7YiQm26M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=ppKY9K0Q; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="ppKY9K0Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VokN2zx5/a7fgGVGyKWlkWcp8WKF3/t1J4RYnujfUYQ=; b=ppKY9K0QngzwQmsmUbJNKx2azH
	5f1UvKpoGUdXhA3yJc/v8yO7nYpk612Ln860A5xTeypGMSYaRSnTKX7rkgGC4aRwIuEobC/adEz+J
	gCxfc0dN8aN0Hfsxw/mcT4+uU/AhFQNCXdMwcRRqe0Li0PfSGPYQhTHRJ0BY0fWylmoX09pEnlUSI
	3lFHuDHN6u5JThxKQk0pWMcJZOKN5pMr/0N1jlgjSYmsj8OGQ3XLsi047LzHzGneTrSJ98CdN65Sh
	93dZVgLUuErELOcFDZZ11lFFeG2WaErC0WveQptEFzvCjPe+mM4kNG6jj9OzCW6P+DrTX9D2Emjrb
	KiALj/Rw==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIt-00Eq70-1b;
	Mon, 25 Nov 2024 09:18:43 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 10/15] arm64: dts: imx8mm-phyboard-polis: Assign missing regulator for bluetooth
Date: Mon, 25 Nov 2024 09:18:09 +0100
Message-Id: <20241125081814.397352-11-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Yashwanth Varakala <y.varakala@phytec.de>

Assign the missing regulator to the bluetooth node. Absence of
this regulator triggers the warning message from kernel as driver
uses a fallback dummy regulator when there is no regulator assigned.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index f5f503c3c6b9..defe59d957d8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -266,6 +266,7 @@ bluetooth {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_bt>;
 		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&reg_vcc_3v3>;
 		vddio-supply = <&reg_vcc_3v3>;
 	};
 };
-- 
2.34.1


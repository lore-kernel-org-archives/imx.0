Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17071F12EF
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 10:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455457; cv=none; b=FuTI0vEzuzJxjx4NY93AnDz+LkJsUfWFK01TAQvKxq67QNyMhjQO84iAScFZ50ngFTz3Uc+BWAakzhdxBhdUK29Sd4hcYk6+7wtPt4gvnVrorrtcAIir67gzfqUgZ0ci+s977Epw0xcUKbob0y4MrRl3FYWxI2jdS5HZSltLRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455457; c=relaxed/simple;
	bh=84UaAt+Aa50jmX9i+l+0TlWPpIUjPwjwNChUg0M0t+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t0AlUxB/+uRnYfASMb6Uym/fhrHIVYldLMIIxO+xcOlr6zk2kUs+jgKhlvGlcRsF4sk9Ns//kKwAdg+m9YQIETLGI0SqsYul6hF9tcmk7ghjGhud7DfZ7j+oN6xXe+Nu3iq/FCO2egX6ZEt8eonqdiVAXi0PkP7QmeRcDkKUX5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=isvp8U3c; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QjOqyfbd reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="isvp8U3c";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QjOqyfbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737455455; x=1768991455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K8Io2FVm8ksYxt/jYkMsqo3Fs1cQ+iTHjGXr/XIuer4=;
  b=isvp8U3c7Y2rqFHfYzAMIFy+qJKGthaFFsXiYQF71yGuKVkuDX4wIXGT
   o/SvVxBi+W4FusSdVSmpUJSgoJagkrsT+nALYwfTGJTC6qjR+1hGKGQQ8
   krwCI4l249B6yqpZ1jewxoHoVXhKCa5NkLw8gg/oSrFfA28qjhRklmQQK
   mXuyQjM8SNcy6OqL3RzQ7ojQhz5yOALqiAqQo0QMwDs1CAo0gEfbM2Y0Q
   Ro+96uJF2i9rWqvofRUr+heVHROlzC2mZnuJT72XkaKJu9K+Z8w3NPvxR
   4Y7aIXHa6cr9adPZei3Wxtrd82nNCIN3+osrwW9I750agw2IAfdGd3YNT
   w==;
X-CSE-ConnectionGUID: lHRgaHtbSzq4R9L+1fLhFA==
X-CSE-MsgGUID: ECk7eBBnQyyZdp3zZMWYaw==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="41196382"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 11:30:52 +0100
X-CheckPoint: {678F775C-46-1D00F64B-E6C57517}
X-MAIL-CPID: 75279A3BF38464E7B5BB908EE17BFC21_3
X-Control-Analysis: str=0001.0A682F22.678F775C.00BB,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B757C163693;
	Tue, 21 Jan 2025 11:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737455448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8Io2FVm8ksYxt/jYkMsqo3Fs1cQ+iTHjGXr/XIuer4=;
	b=QjOqyfbd6NNHlvVZA4iOB/P6NzkcI7rZaG0n4Hr57foRvXX/g1SFZv6DUVnvT5gc6HqatB
	q5vtCn0wVV8RES4UNFhyt6g/cQjV4dwWSnA4ONKvtwygCWVjPaorTzPmZhnBLtABoVXw2G
	uRM6EjxhvQLX7CXV+9u7SvfsCK3taZMBRYG/UoMSEP6G9vgM7P+bzezBBoWPgHUn5U0n7u
	c+pnw5GxiYpSAvJUah6EW/zLKXy/tIJLtRlh2WfVp9oF1yOaOHQUAYb1aggP4bxk2P5GgX
	xqPKTew5SSkM+85hADshXJMmH47xB2e3RX9oKvf5LuKbV96CTPiBoleInQa7+A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: freescale: tqma8mqml: Add vcc-supply for spi-nor
Date: Tue, 21 Jan 2025 11:30:24 +0100
Message-Id: <20250121103026.1404856-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
References: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 8f58c84e14c8e..b82e9790ea205 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -65,6 +65,7 @@ flash0: flash@0 {
 		spi-max-frequency = <84000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&buck5_reg>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.34.1


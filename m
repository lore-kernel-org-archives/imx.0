Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22126E71E;
	Tue,  7 Jul 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414558; cv=none; b=t9eosfbSqDRsePF6tpmfKKbw4Vbg+Pt7B4n03A7jx6MUJUhIfxj6jdcHISEd+/k7JqdOGuZVzpEmrbx2d/Aqmj188g0kWtsC1FVKUlYymrRfUfXsLao1MOJYpivftkfYlOZpyyL8YOhL61ijst9Mumj4sC5niQeZgjj7gU65iNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414558; c=relaxed/simple;
	bh=stQ8EBTcC6XBglJiW8pEBVJ3+YY/OaqD/d5v0EjcNJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cuUcwWCi8H+PzSTGYblebOw2jF1e/kv2YF0kCeIhB0Sbel4BTcGo1TGIUevlsSYYW79jwSjnZWaHEwP87wogOCK8KsnvgUk9lApS8NnAh+g22zz+4Ier9DPrMezT0qtS/aoLWNgMbcLV1Taa5a0oA6ZUekH7Y+cXPr8lXSxM4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nhD7Uhcr; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nhD7Uhcr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=U7F17aj8Sa5BJFs3fVPcy2J4kSdJYymT/XgbT8NZ0cc=; b=nhD7UhcretKxextf9sjVeaORgy
	goWAXXXqyUP/MJ5sr/PYhgCcXrjDul7WxbYgd9cjQq97p5dNPqdfZUBHz0OM9+smxfYY+HpYgrpCU
	YwnhGkUdM1kf7UdbkACw5F9A5M7fUPcHfLkQfD742t6OLLDcTVG/GszQSPvntha7JaAlZYdz1tOxn
	lL+7j4JWJcHh1ibM79MP/0O4a0PSzNZgbG8V1VNIQCPDHY2r6CqQBubSg10xsVKXsoBlzUBFPFSo4
	onUUwtMdl8yC3Nbr4ubbPU6QVdnegctL8S5oA3leQaxiWi6YPGHz5rWGaJcZnduArEPt91TA1kXFE
	VjTjfavw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1as-000Gjp-1T;
	Tue, 07 Jul 2026 10:55:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1ar-0007hK-1y;
	Tue, 07 Jul 2026 10:55:54 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Small fixes for TQMa91xx
Date: Tue,  7 Jul 2026 10:55:41 +0200
Message-ID: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

Hi,

here are two small fixes for TQMa91xx.
One adds the USB PHY settings similar to other TQ mainboards.
The other one fixes the reserved memory for EdgeLock Enclave to be suitable
for 512MiB variants as well.

Best regards,
Alexander

Alexander Feilke (1):
  arm64: dts: imx91-tqma9131: move ele-reserved memory into 512MB range

Markus Niebel (1):
  arm64: dts: imx91-tqma9131-mba91xxca: USB phy adjustments

 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi          | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.54.0


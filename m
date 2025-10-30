Received: from mx-relay100-hz2.antispameurope.com (mx-relay100-hz2.antispameurope.com [94.100.136.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C7B2609FC
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832506; cv=pass; b=GGqk4GDCyVQ1rkOXUznmJNtMOFkdIbFzIeeZTDgXXdfguWw9XUGqZQtxZQr+O8jhMk2G+JuB7mzxfl42gznxOPjyrBkCJYqy3vX3zD1rcDc5iz060NW5up6UEmmtxP4Ip2w28PxZRX1wtS/dUFPH0ZyHb7ht7eHnuLwy3XfpEpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832506; c=relaxed/simple;
	bh=EaVfQg/+QVSPAOgls27VI6muuvBs3u/FUZyH+/o1etI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuTJmFmZ8jIP2FJT6kHoiAmCJ+7su4TLg/T16287XfQUX9QTGn2iyLU4QZwuHRQg2PW7y1ZQ4jMpY7SG7R1qYJfuzEoSJK/NYzz5qUKPzYanYN9jzz9qzMb3XWjHcnz2U8MFvIP7ENI9j+QQhqI2/mRiIrqFdntu7mi2Y/dtS7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jXoSb1g/; arc=pass smtp.client-ip=94.100.136.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jXoSb1g/"
ARC-Authentication-Results: i=1; mx-gate100-hz2.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=KEZFS4oLzG/srptDoN54vEJHXHS1Iew+xlKYXMZp3q0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832421;
 b=ehD1OeoOxo/8vJIX0DuJ937ygw4w5M6q1gQfX6PiQGj0kn0aYMhk8smbyB7prnxHhTGh9Dp3
 FBLAKwsxjSMR61w6eeqzT+MucfNPXEevCEZYoqkWf/A0EsiQy7W/eC1OA/JyRMPxW7ctmLZE1OF
 crq8Am6oL9cfK3+t8M34+FQakXCkyHV3i5icyu1+1nx2veBLydSOLD0GNNgoEvpP1gRiCc3/T/Q
 poX689tmpCw1k7pvz0Fi6yMQ46AG3ZElkj1qZMfBvAWH/rsDpxBGFnsZyQNpqa4u2b6brgHwKN9
 qtvJQEyfYtMq7TAK/+WayBTNcJeiomqAKdWNBcaARduRw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832421;
 b=NcY+nBTWUqaL3LvfzAcSX7I2Z0eRztdYsa1NqlzCGZT8f3jf39UATta20Kh+8mnJb/Tx9R5T
 m8Ve95ojn0xz1mzuYQ2eFnzD/AF+kOUe4FJFCayUhj6sdLwH041L65GQUPH+suL6CCiFF2Pp7wg
 f7+EqVK9ZwHR69/ZB1C/hYAq1HyGLNV5OUdGYOMytSb906NbQ5CZjUNT/itrk9VMlnOAX50CRLl
 G2uxD9xE7gr1unCU94xGnabWiclq8JUrGsfLf6jzEYbFtoXsPjIvlpDgqZaVu6xdEg9QKXkGtrn
 uSWvLa4BlrX3Hr8WGbvKjA1auWjdgoYSMMy39l6lf28UA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay100-hz2.antispameurope.com;
 Thu, 30 Oct 2025 14:53:40 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5CA0B5A0E73;
	Thu, 30 Oct 2025 14:53:20 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/19] arm64: dts: imx95-tqma9596sa-mb-smarc-2: add aliases for SPI
Date: Thu, 30 Oct 2025 14:53:01 +0100
Message-ID: <20251030135306.1421154-9-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay100-hz2.antispameurope.com with 4cy5DW3sFkz3PJ21
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:a7bf318555c57f949278cf3d40d2a7cb
X-cloud-security:scantime:2.336
DKIM-Signature: a=rsa-sha256;
 bh=KEZFS4oLzG/srptDoN54vEJHXHS1Iew+xlKYXMZp3q0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832420; v=1;
 b=jXoSb1g/pXvJvuZMaD8f1wh65gnyhNVtaQluqx/tLxaKw3PlKU3M4E4h1a+bYSe82HS7ZW6t
 FavqkAwQOSJgfqvmg1tFu1Ursh688aBSGi06CHp8qw9c7vL7cZeATdK3fkpQJrpM0VXOGsdhc6q
 bJ9iFntApqyHjzH6okVCYmZzqPLB62PoGzEnb5f5MwYHAHRMCjvZW+428QuqNEC2w4DxnjovB7J
 Y6hepDF++K74arjR2CDatlfCIJMAE26x4hcTsmIDDdpXrBssf0vVZBSYXoplLxMZjzQ33UxeH9r
 mCYZVxMfs9ZQG+DXIcnEmKa/FDyWoDgNQjJb/XxxjCnLA==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Add missing alias for SPI controllers.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index d3a9360b8c548..97726eded0f86 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -39,6 +39,8 @@ aliases {
 		serial5 = &lpuart6;
 		serial6 = &lpuart7;
 		serial7 = &lpuart8;
+		spi0 = &flexspi1;
+		spi1 = &lpspi3;
 	};
 
 	chosen {
-- 
2.43.0


Received: from mx-relay54-hz1.antispameurope.com (mx-relay54-hz1.antispameurope.com [94.100.133.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77232D0D4
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.227
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383085; cv=pass; b=Fjj3Yqz5Q/zy6bTpE7Yy0SuLQ9jg4WBYMTkTp2KLjYtNz3A1dnRlGo4s9OK/SJ4D/VHJmkpA09x5Pz2r6llX1ypue1qwOep4uPwtoybIaOsqoHrP9Sb2VT79Lrr7o9baBfQT0XXg09hamK9TcflPTBvV5C6R6ApspulR/lKrNWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383085; c=relaxed/simple;
	bh=1xuEALpj68pXNIymWLxa7LLNzXjOVAd6uISM8nvgMAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=some3fyUDleEUxmoKEUsmKCb1C7atHCPi0b0bLeS6MBCxAkMqm0OFF+Ch5aP4Ia2mfy3Un3nbYQpd1NGyL1+M/Mv8kv7N5JxQmdD69YrTXP8xoV/PW2UcwLiw/5UTAHb6rDkwWwogERYjpHqPQphzgZMYpioU7KyBajxEvSk4qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bAffkV7J; arc=pass smtp.client-ip=94.100.133.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bAffkV7J"
ARC-Authentication-Results: i=1; mx-gate54-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=DetMJ+MPA+Wq5fNrwEPDOsXLnfF8QeGVFeKlIfLk49s=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383031;
 b=fLpCk35JpJ8aBFm/nQYgyAe1UmmDzgHKm006aqIVUxxjpCFdsJkNjVk0lV0Cuo9CxOJ27wvO
 MrhYOhATsuI4ltpzHL7NyVBbPTi7iQ1U1zPCeN9D2pf1FHrCsnXLzpKjR5T2NEhctA8JFyOLGKH
 3LrpPXHm47KZouQnpqNm+/RvAPcrEErZoGqhwgNIqbe6qERH1p27D1WhbeH74xYmH/9RAVTDwb4
 6oNPQNYB7LMxfNEB+M2yTyn38cFw335Ks4msFeRwkcWDfPR2Yt0Efmu92nC0jD+Fh9YvODJx5Iq
 7Ovy2ZN2odJO0yn/NEPjCEbY92z6Jo8X7FEe69kfahsbQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383031;
 b=ZxHoXskhm5ScXMJ2s6xUnofXRSv9Yhhd7H6e4Sf0HU9w4LlRiB82a1lbGQiJtl7ZhyX05gxn
 aT4rE7NBEI4w8AZr5fg1VNyEPO6mtpAfkVkyjFm4O7iAG5Gx7BH+ghvAMgyf0hZ31TURkc+dx1M
 D527Q7uqltJ/UrvLw8rdehfPTJsQmLKmMBopBsIhB+VHgDvalHstQOhCnLu7LRMB8hGtI7m6sAQ
 bN3NKwnjz46VeYDfwyrP7VHMIjxwKcGAOpYizeEI6TfxVeY71RFQ0p78rU4fQWRpa5ZLZ5fZ0bY
 iEf79TPvoPHedFwBgqIXEGovMy0m09PiLQ8Z2C9b3Mw/Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay54-hz1.antispameurope.com;
 Mon, 17 Nov 2025 13:37:10 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6AC7ECC0E92;
	Mon, 17 Nov 2025 13:36:59 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
Date: Mon, 17 Nov 2025 13:36:34 +0100
Message-ID: <20251117123643.711968-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay54-hz1.antispameurope.com with 4d96gw0g4Cz1l5kV
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:8bc22d3d12689751e329df603757331c
X-cloud-security:scantime:2.731
DKIM-Signature: a=rsa-sha256;
 bh=DetMJ+MPA+Wq5fNrwEPDOsXLnfF8QeGVFeKlIfLk49s=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383030; v=1;
 b=bAffkV7JfbFfDZDX+JbiZ6lq7cahDmFquiRgLQue/AdnJZ8EW43/X4kzl+cNlC7y0nxAa95J
 ei/GCKRPuBst9sY2crZLroKnFndUo9YcANc55pLXy/6XGJ6iime+5bxmM8x9Cw/Jq6QrgHxptEL
 giiYoBfLQDhJhsppabVdGuftE/QQYuMc9beELrbSS8ipPrPH7V4qYqFNmCtKqZKx8tafINysnSE
 zQzRZ+VvIQyEonM8rYrqYd1DDHDExWdL9tuBiltNJTuQsdtlVhyPRa/xnD+lvHKXPLQa/ejqyMk
 r9cUHG90QnYuw4i1hQtWGi59UNrUw23+0koB8eU8nHpOA==

As per datasheet of the HDMI protection IC the CEC_IC pin has be
configured as open-drain.

Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 67fe1f63fd93c..30f0e81c4be00 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -704,7 +704,7 @@ pinctrl_hdmi: hdmigrp {
 		fsl,pins = <MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000010>,
-			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000154>;
+			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000030>;
 	};
 
 	pinctrl_gpt1: gpt1grp {
-- 
2.43.0


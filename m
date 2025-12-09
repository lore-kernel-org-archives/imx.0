Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470892F1FE7
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277647; cv=pass; b=HtrFGud1TaiWFxz5dShwDJcd6sVT7gAYvAjoOtIVfANze3+asEjQImeGgVLxwSZbSfsWp0eX0n2hl3UHVfED6xMTMH/GkHmgvLBsYq6SWnJQnYXYeBYSkeKsCTehst+l3Qj2EWI0mEgd81OtNV4U3zb9Py45AyqO2WLy3P72aLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277647; c=relaxed/simple;
	bh=nmPAFYlLwYdLHsbfcU9mSYegvCAZChpys2/gU1VqB00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nS1o36f9mpxbzOwUq1RTToAva8xBSLDg5zAK6JsTfX72Yc3QBFDSkMXUbUj+LyC84C4VPKZSiM6eB56JZRRw5aznxt958tE1U4tiF7Yro2AMgLIUEF0sQ2NXMRv6BSeqP41Gs6z73s3Ca16ua3fjHwh1wa9i3iAE2MzFNtz6wh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mM+modTk; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mM+modTk"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277615;
 b=GXRkAdN7ARM7scMcFDvwHSEUgWSvquL3NJbhWKLBJ8wfxDUzOBEnyjMW95N0SR2YG9caktMG
 62h/Bnc/QGsc32lD8qvEEgkLpCk7oljzyhhNKHfAr252fCNV1rLSqt4hqV+CiGJ1YfTWqrh0Dqx
 LEcMQmT/vqQBvrRFav/k/jvw5VcPZYcBkT5Ix62qWxHiLYF8cLVNB8O+TeN7+1lqbo2ZC6Xfeed
 LN3ZDB+9GFVxaB1yL95ZRRy8uaM7QGJ+ixfhPcqqUqMrXNyH59ArvkbS7v2Nxz+eRxFENE1N5sF
 WH4eTBPlCl5Rmi6L1jvdSwO5EMLIaIGfkoiTBkMLKBYmw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277615;
 b=XOw7CxctsATyXDcj1/Ms9LmeDIcF7SAlR7l5ZC0XeURcCw6e4AzeQiCSmXDTO0NpHDDKVu1j
 Bb9oZMh34BPO2vlgRIhlJ5tVkM5Nu+JiUynqAHVf3LOa0GA5lsnwXUNYAX3KBhjfePQoRarfJEU
 cN9X1usQGHDQaANLP348vz/jidegzmN7QU1cCSFZgGbqRwEMz5280ymWUVH3AoGTZ4HjUmRyD/H
 /sf8/eHPkTQMwv2BNApnXosMnDm9p89xl9Z/nV0iAOJhDIj7ZJKaSeG9SaLTPleGE92LgX3VW8c
 1qclLHi25B1JaZna+1zGrFV9pOdqUcYtrc/LDbqD+2a+A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 09 Dec 2025 11:53:35 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5A481CC0CCB;
	Tue,  9 Dec 2025 11:53:25 +0100 (CET)
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
Subject: [PATCH v2 4/8] arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
Date: Tue,  9 Dec 2025 11:53:10 +0100
Message-ID: <20251209105318.977102-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dQbLG0GZzz1kNh54
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f72542e298952ecd7d6a450cc7cae500
X-cloud-security:scantime:1.806
DKIM-Signature: a=rsa-sha256;
 bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277615; v=1;
 b=mM+modTk1NcM/L+/67FkKD+71j3bzsczYXwWwcL2bFvfljIpE0HRDo9TMqPrC3EXC3RmMtC2
 2R03Nc8qgOOwaO8JfoH12jA7+ht0MPubhK1pZ804B/MFg9RyS6uSY3aKPb1jncDpXiM9bdPolPL
 MK7+x3e+rXqeyW30MXd4ZYWu4AkpQzrxnj4q+jeTtSjt0Lvs0MYhcDXpqujPdMve3V9WNXiH7IA
 1veoXt/5ZvB0rz/n0DrqWTqesXa0uDbvL800yHmC5qR2IUFWAFy4QDTFZVgIaR1/H269JRQEv29
 dcfp7UJ6LGkmbpjluebKxEbk+aw0wqO5DethYmfyOVs7Q==

Add the HDMI audio soundcard and enable necessary nodes.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 03b75d4cf699a..ac889a69da69a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -248,6 +248,13 @@ sound {
 			"Line Out Jack", "LOR";
 	};
 
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+
 	thermal-zones {
 		soc-thermal {
 			trips {
@@ -290,6 +297,10 @@ map3 {
 	};
 };
 
+&aud2htx {
+	status = "okay";
+};
+
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -486,6 +497,10 @@ &gpio5 {
 			  "", "", "", "";
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.43.0


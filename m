Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A51F4FA2
	for <imx@lists.linux.dev>; Fri,  8 Nov 2024 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731073797; cv=none; b=I+Fei4MhhRWSxscqeo5Vr2RYWFAcZam+44ZB8pZ4a4qTnNRPpAEgi5ryUKqBRKXl604NfBoV8T2ZKJ4qTq6B27nehaZBnwXWObd5IlSzOsQHXqAgJkkYUc/a22xhIjxm8ZdVPlYtT+w26tCmNH39HUdlxnibiDmukoP2A4mEy3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731073797; c=relaxed/simple;
	bh=aCBfSx5ga7pj2Hhamx5vaPscCNi3wQymN503IgykoPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mKJOh4izyHwsYBm3wWqNh7dCZn3b6uyCVJnDnJvnw7kpqne1g410OCtyUfp0VnEPRlIqc3l++5Rirg7FOiTUm4ySTNUlQURt7IGKYvn9zpjMVK4f3t1ee799gtabFLEsNs4NevNIfreFl8T4cHo05jGrrsEtuNfR7ttHNVlTS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=MtdyvEOG; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CLaWFqzb reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="MtdyvEOG";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CLaWFqzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073795; x=1762609795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K5n323UXrPp5uudp6Hu5dvoIoBuE/xHbBKXp9ytYca4=;
  b=MtdyvEOGIeT/h57lAc3uXlK4tAW5AjiKxb3HtyHvvWq3d+gR6gFc+8Ar
   3QNbVgs39nWzRHNJysluHqEa6csdcs+mfdeex9YI65bT/n2QNacl2ad5g
   buBNQeXMJDgP33RJs07g8xNDT8AISviM1XpDKv0lG7vidqo7GOo5UIYdc
   ZhsG6f13i7G7T4c6mKA2kuUk40q9b7bYKiZFUCmlh9tRM0+Rm9mjyd7hT
   4wJlhDGg3WqgQKPYIIezcoN8AkwTZGlZSTr8Z9CoBe1og2XLHtHXf7dND
   HhJ6lnnR+IwZTFe938BSW6KYD7TQMuaUCk+60EniW33rwePC4awRBu7tD
   Q==;
X-CSE-ConnectionGUID: kI+aj7XnR4C+APTkXdKzqg==
X-CSE-MsgGUID: wnAiSrcLTs6RMK/QnJbJqw==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936928"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:49:52 +0100
X-CheckPoint: {672E1700-1E-86C05612-CA75E1CA}
X-MAIL-CPID: 98C61AF8CE5227264DCC1B41E75CB408_1
X-Control-Analysis: str=0001.0A682F2A.672E1701.0010,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B63C816528A;
	Fri,  8 Nov 2024 14:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073788; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=K5n323UXrPp5uudp6Hu5dvoIoBuE/xHbBKXp9ytYca4=;
	b=CLaWFqzbYQhqqkJvBP9b9GlqzyBAOllrLxcKE8UyXS1soo612hpG4eF8DCIm7aR0zQpPCU
	3f54K20btAoC5/06OfMXy1hOyiQoTbCZvbNP/gYWY9+LEFK9mivt7AGplj7yozMaS7gG8A
	efisn+KuZAZXQ9tUIGKgB0f+EMjF0Wl6BJTJPdiaOIRxSROA2XtyTc4YBcDymAVr0X9D+u
	6Y+GnI5y0AqhaU/lWWi20WGvrVhEl0aiGh7unM2RyZm16xpvJuGO/cdFBmLkvgab2HieWE
	kcD8uIW5M6tagjDFVwZRoB7wV8cbts3exQRZ8ojOwWRR37Wl1dZuUvkKcplYag==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Jo=C3=A3o=20Rodrigues?= <jrodrigues@ubimet.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
Date: Fri,  8 Nov 2024 14:49:21 +0100
Message-Id: <20241108134926.1324626-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add missing supply for LM75. Fixes the kernel warning:
  lm75 0-0048: supply vs not found, using dummy regulator

Fixes: c9d4affbe60a ("ARM: dts: imx: tqma7: add lm75a sensor (rev. 01xxx)")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 656ab0562695b..aa8f65cd4adf7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -135,6 +135,7 @@ vgen6_reg: vldo4 {
 	lm75a: temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
+		vs-supply = <&vgen4_reg>;
 	};
 
 	/* NXP SE97BTP with temperature sensor + eeprom, TQMa7x 02xx */
-- 
2.34.1


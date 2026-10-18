Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499664C2251
	for <imx@lists.linux.dev>; Sun, 18 Oct 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333397; cv=none; b=Yvvpq1wDzYDHws062RrrDctpiklMPaIN/l0hedZV/G/1xum8y8btD7XmyhnYZ6lAUw8Oh4piapOcBY+H5DkYI17ygsbeBw0u0I+Z2lG1Sl+gJxPRAeuLypU2HAPJHIAf6hypHK3ax7EdW1VAwsu44Y1rqLiIfIlkvEZ7bwKsjP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333397; c=relaxed/simple;
	bh=DehZpx2/K8ju4VpADuJdHXsOH8lGOwPvHMyPcJsyyKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5DTHhIe39Om+qC4BjLChwwNonf0x03pSsMWiOWnapKgt4JlCFtJImqdmehcvC1/5l/aaQD44A8IBMIlM5hhLTZMI7vr3VRd0IlMH8PlxFbefVxOIOPMYiQfaNXZlkAFmg5Wjae0/gj342+5+cfraR3G2JKisx1e8H8rfZe4HB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVYTaLOE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVYTaLOE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1060068f8f.0
        for <imx@lists.linux.dev>; Sun, 18 Oct 2026 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333394; x=1792938194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A95fhrvfAAlu2Cvs/sZqanN19o2eeng7TB9Tzs9GgKQ=;
        b=DVYTaLOEzltDWYa/RDOUoglJco5kAKU4+q/NmqjUI4Mc1Ki8gvO58SMLVqXZjsetRW
         9SVTvWjLp5K7p5dv/EJN4TTp7FMiP7n7P+RunU+4S78EJrnNFi4LnlPMtRoy7G0DN0Pm
         lQpByqhLL1xYf2imM9XCsGm2FhwGS+qjLJCkrvWHgn4ZZt/xSGqvgTKWr//56Pi2nmwO
         JZ70Bixftu0wrbRA8ikvDOn7V0Xt2wSEFm1APtmyq96/MY/lHMI1K85UluKswdpB47AB
         Rm68IiJUPRSEVbtiy4dY9GqB7Wqp6vIrzaCFH4ufT0HCoLMs+rIi9H9UpUKC4pq/OQvF
         qnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333394; x=1792938194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A95fhrvfAAlu2Cvs/sZqanN19o2eeng7TB9Tzs9GgKQ=;
        b=zeOXhPqRlolxEW6eV/mXVLny8HORA2xVCe0jxF1T9YJ/NYYBl7UQhKk7QGpi53Oh2k
         NFs2elMZysjNeScSmZMc8sC85zg9kz/27iIOsbGIa/ZUjpYkFl96eiGugj/micalMJUW
         PJ7sIGKquxAoE618HUgwbEUJ4eqTD1H4OxOocq/zcoNRoNF8KKFwp1ThxtMJ4LxwCTBh
         KvE8/w4BMDHfl56A6zjuI1mT2L9GxlSR/1Kq6TET8E6mbEToXjbFn/bzsdrVmDnK+0FS
         bPGBaSA226f3nB97QU7o9UQh/4XlTNekHlser+0PrX8WhkUEJDQxgPETvhARAxk1fkKP
         mD4g==
X-Forwarded-Encrypted: i=1; AKwUvBxthzeJ37HTgaOnrkn4TxtA/bjppra7xTvHb1dvwT5CyCY7gHlnoaRNOOzVDJ6bVherjOw=@lists.linux.dev
X-Gm-Message-State: AFq9FYL4cjmIV1FIf4VmFlLvF+GdX8IVeljNQaaqrQwMvodpfBLK6tVv
	QujDgTgPeqCLoVWOmPSpDdqp1zr+2NWQiNo+tTC+WyuhSDrkYjGa7RYP
X-Gm-Gg: AYBFou0PTNvgQS5suqqFGu5/M0uueBOaQRBpRX2TowIjGcjRokCgwVG/EAbxIcDf2My
	fJukPFVRHPEb2ncZ5p3jKnF4Fw2Etbj5AYF6kzSFpxD2CD5H49p+FLB5McBOOeIRcyc9CLq5yNj
	qxaJFCF33N8hRJbZsYTivR1uuL9MUDVNIrVgYrYH0Ev2eEZyVnxdHn2cHx2BiOfYctJBnfQhBKb
	PfzlVq4etUohVozW3QlT5HVT3hU9UJ9mkTBMMgNEU6V8R5Q0EQLHmg+d4xlj/IF82rw31kl6TDY
	SCeUef3KE9fjmULYOFQFYyY7NdjgNbaJOrgU3c3s2D9rKfcZ2RmlRnZyW5lciOI37rptxHB/X0F
	SJ1vRvOQ+EQTHZhQ8LVQX1YMEJMGqnlEtXYcpHnr/A0aVQ4EmnVVjBFLmfjC7BTbd54DM4JxpSM
	VgVY0cbcyyAJvdP0m7I4MAI2dNCndHuhtbZON3cOSDQiSrNNarb17C4Z1ENtbipmiPTPeZDg3iJ
	F2uEMqT/E3cgUz87tcVMTZu/j46k3sgqc1YIQswg3gWv9148/SNyjqUGVFW+9tzYEFqQHoCCF0x
	hTXbSRr6Tn61Dd8JfYkF6w==
X-Received: by 2002:adf:e18e:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-48e07fa0252mr10691595f8f.37.1792333394198;
        Sun, 18 Oct 2026 07:23:14 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm14971909f8f.37.2026.10.18.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:23:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-som: Use the official product names in model strings
Date: Sun, 18 Oct 2026 16:23:10 +0200
Message-ID: <20261018142310.28242-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Replace VAR-SOM-MX8MM with the official VAR-SOM-MX8M-MINI product
name and identify the carrier as Symphony-Board.

This aligns the model strings exposed to userspace with the product
names used in Variscite documentation.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index fd0a1862ce90..d9b588526542 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -11,7 +11,7 @@
 #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
 / {
-	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
+	model = "Variscite VAR-SOM-MX8M-MINI on Symphony-Board";
 	compatible = "variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm", "fsl,imx8mm";
 
 	chosen {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 514cc568fb71..e717bc229d3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -7,7 +7,7 @@
 #include "imx8mm.dtsi"
 
 / {
-	model = "Variscite VAR-SOM-MX8MM module";
+	model = "Variscite VAR-SOM-MX8M-MINI module";
 
 	memory@40000000 {
 		device_type = "memory";
-- 
2.47.3


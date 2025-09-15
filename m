Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9EA296BDA
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 22:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757974029; cv=none; b=IpNsXnrTLKWRG9E9mjICwMjobBIs17ntScwO0+zNUgcHCcuKJVJn0SX6IUT7qMu0PiBy1CndxBApt/muzR3EMI+JQHwcNxJmuQoZBv62GA1/lEqHDIcFZhAmClaIV0C1ZAhsvwv7ThIFGO+pG9PMx30+/UpH+BEyeivsPnlPQ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757974029; c=relaxed/simple;
	bh=8Erp0FSOgmp8Qh6v7i8vIf09HFje3C/hg4JsqGtXnUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OJ5nkAJZ0EWt7KhzguARCOji/fAtd7RCGs8KBHxtjbCBPE7PpSWh9ZoZ2XVP1z1Zi2rAXme2xsTepTxnjJm+c3xhwqejYJfNQj5lRDpRKubTjucnJMZi40oqhTQ7XoszVImN1yEp4YFLvM1kjAgnZ3A+qLvvWJQSFSUsFgO/TrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUeU5aOk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUeU5aOk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0411b83aafso706556066b.1
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 15:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757974026; x=1758578826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWq9K4N62YrjUgnvfrpfBO/XZHgq78ADcqLRBLBYlQc=;
        b=OUeU5aOkLQuQ7Vcku2tOk5yk6Zoy9AxNWMqH2reG7cZi0wQABykFSyUv56kZSgIVex
         wfc/ZvOJARfdBBoce8fTb6+jmLgjQ+9Ikah4Wmsqoq3xfH6GnHmdPhIcGwF8z6rbTYzi
         z+H1TaGLoha7dP6OI7ucEa99vA2/T4Qs8XmSsjSOJTc0Zl4Edye5NmcfdnHaLsMqSJ1h
         jeE+OLiEeaNjilVRt05MgVz1ITO2GIVESAV4x0tPXxMmvIOsDLpPFM6+G9PgOUk7Bf9I
         PFq503BYFkpxRcs7LXwD9oih/AiohCer2mKeDNUOG3T/mKTJ+lymw5kt3Rj8WeZvv/jF
         TNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757974026; x=1758578826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWq9K4N62YrjUgnvfrpfBO/XZHgq78ADcqLRBLBYlQc=;
        b=Xz6W3gQ7rdYbFal9z2kDdvNZO+S8ABqEjpN6aor5bk5F+ZVZMfgrd51nJo25Po8fqy
         7Uzpbm41G5U1x5Fy+P8bnt/QwjjnkLaO2fa/0shGQcEcWboV4QtAZ/P0mgcQriEOBe3p
         LrQwo2M2RhnTrTl0ZhwrTvtTk0p9RW7r0VFOkg9Um1TbkNkkCkFVr2neWYbPrQSmdkUn
         gyrDTMLbsVTjWqXC8Tvd0UTan9BLoeQSwzsX1OWqe+V0u7a+KW4hsuofS+stNAHpwLuF
         IK+O0DIrzAq5RiUrOW4YFwt9lJfK+js8yAkc5t5980r0cgfJM4y6LAb61d0fQI2fY80U
         pNdg==
X-Forwarded-Encrypted: i=1; AJvYcCUi7vsPU11OHGx6oEyrb8FLh1Bf6Q3KCmW8GdlY38Ickz19BiKW+4gaHEpIugXli2QpuCk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+OiDZeVfbEN5hMtw9ndWnqEeWchB7Ppg8YICbPf+vA24trlBC
	moi8Jpg0gtK8D4lB8pBSJ2tdm00fLEPV410E+j0i8hG8UuMZHIrh4qo=
X-Gm-Gg: ASbGncvWjX5UmNcm2+ROPkZ0N3sk1DZKvjvOV3ikVJr/vc0vnM6bC173BduR7qBWcI3
	lvDWM8CYSOeOIJk8iL5BT/jaGwlnunS3bCjKJBq0qTIWw+VYre0GAua56l1I8krdaFEjY5Czvzw
	Rn7/KwY+/RxD5UqugvyY1SInCp4GdCQ6xk0hmte3E+2vftpptVlaN5zgFZFqxjfVhZ4V5NbjQL0
	iMe01C85fi2TxQqbzr+fHOva89NF0qN/x1VbSl+Vm1Yv1wz7W0JDT3rXlsd7YbbvSSJUEnDkxXq
	x7Xb8n90JNcnqF8mqu1mBYX1NVLlXmJWRlusNMAurU2CZoel4NmlWfPXkNOWqajkPO2UduhwWND
	or3lZvjsaq4+IawxSB8Nyey9DEGXcXp5aYyy3XSH8x73x3JpWM2x6ng==
X-Google-Smtp-Source: AGHT+IF7dPa8OCPxYg/A8yjmk5DCk3dELMYC35KzC0feKlYcosBohkoTLl09lrT68/wEHUmsB2ldVQ==
X-Received: by 2002:a17:907:3e1f:b0:b04:6047:d4b5 with SMTP id a640c23a62f3a-b07c382989cmr1253021866b.44.1757974025443;
        Mon, 15 Sep 2025 15:07:05 -0700 (PDT)
Received: from localhost.localdomain ([78.243.111.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd6f3sm1011464166b.67.2025.09.15.15.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 15:07:04 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	l.stach@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: dts: imx51-zii-rdu1: Fix audmux node names
Date: Tue, 16 Sep 2025 00:06:55 +0200
Message-Id: <20250915220655.143861-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the 'ssi2' and 'aud3' nodes to 'mux-ssi2' and 'mux-aud3' in the
audmux configuration of imx51-zii-rdu1.dts to comply with the naming
convention in imx-audmux.yaml.

This fixes the following dt-schema warning:

  imx51-zii-rdu1.dtb: audmux@83fd0000 (fsl,imx51-audmux): 'aud3', 'ssi2'
  do not match any of the regexes: '^mux-[0-9a-z]*$', '^pinctrl-[0-9]+$'

Fixes: ceef0396f367f ("ARM: dts: imx: add ZII RDU1 board")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
index 06545a6052f..43ff5eafb2b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
@@ -259,7 +259,7 @@ &audmux {
 	pinctrl-0 = <&pinctrl_audmux>;
 	status = "okay";
 
-	ssi2 {
+	mux-ssi2 {
 		fsl,audmux-port = <1>;
 		fsl,port-config = <
 			(IMX_AUDMUX_V2_PTCR_SYN |
@@ -271,7 +271,7 @@ IMX_AUDMUX_V2_PDCR_RXDSEL(2)
 		>;
 	};
 
-	aud3 {
+	mux-aud3 {
 		fsl,audmux-port = <2>;
 		fsl,port-config = <
 			IMX_AUDMUX_V2_PTCR_SYN
-- 
2.39.5


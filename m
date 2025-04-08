Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CD2234979
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126984; cv=none; b=SEnX2ObAXHPIcZt8CnVnp4qhrvrKvLIKAdHXyjOFftrgpUs304tWxoG/S4C6n5T85E74wqmEAHVHpfYcUIeGlFeRBYtOOoZ7mbY5Gk9MIe8ramb0Z4m6GKXuMOrKuAlVWWKinEYXR7klo/rB6ilQfS39aROr6h9Zx3iC0ITK/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126984; c=relaxed/simple;
	bh=i/623J9RhzwazO09b9AuVaXf4VhtohpFAm02gcyGGEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gxjSx0UQ6zOy7h3zj2zXyeGJdG5wyWp6OrV3+NYOxtWcC9benBBcIbsKzc08YSafpLooTs6+Zuca/epV+Ej5Cih7fqkhMZJmLZ0LNBYTSS3EoMLYHql56CG8vlWJTzkbZiTs7ejpz32yfDZmzIo9bol+EF8pu5ygJ9I/V4OBLsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuMt6M1z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuMt6M1z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf257158fso40804455e9.2
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126980; x=1744731780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=cuMt6M1zWVYdZPNzPaBJkRy5H+BefxAKUeCVmeIboyeafUwO/CbgALDXBWEdN4MmJT
         mJXlVYjuOkh3MfwCRtMuRWrMmyLw16MdM85ndh3jOQfoW9J8G0XGqKLJhzP+hFZqrlZy
         NDReWZEYUz/0RJX5t9vvC0txdxrWeJefgWOFutNtN8idOiNngZ42dGMFzum11fri9DmS
         L3pTnksEHALetq2tQAh3SxVTYar2sx+caOy+3ho8I/X0ZLvUv6qcGo04V7wkefEPibLZ
         dYALZ1T24ktnC1YRcRJQvzdNtniu0CZL7vv6mZLWbub9+gNPwZYIXwPRIU74oSnUzsaq
         DMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126980; x=1744731780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=KlQ4SRusD1U5nHDx5KSLHPid8HgXpstIqSdWv7AQWjiBjWUXxOWyTRSHoRqzCNfND7
         bZP7Q/IJ8OnmgRJbq7M8f10EQIbkhrzj7xsGUVOsjhD393QlxYI7OBlfh2NSGUeojS9S
         uJvy/THDL4OnFXDPJdDMRqt8FoheyN+kV4rHBY2e8MI5ZOBcd7VPP4ugmW/FSBCz0D3l
         oDLnhK+84xPK1NbGO1nbeeLKWvP9UQsJNjGbJdtOv6nQhPzu2jqtMy+M/mtc/wP090oV
         jt2SVcwbfKcOcY7+xCwib9Lm/LM9c3FfbjJzzmFTX1vLBLaMm6+xuzAejx6/32pSkdif
         srnw==
X-Forwarded-Encrypted: i=1; AJvYcCUykUgqDhlMQaTOdTT1K9TlGat9ecI2EOYh4JbN8UxSzz4drNxpSs9NB1mbcoscrLj2zdA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2iP1L4Upl6bBhvKawqBbwxDPtPOHJ2ECraQlJOsOllI/bPewo
	lOgTO9TV4ODbP0OwhB0Isl8agUsU9QKz7JkdpTVYjx8YAMqV8FXQ
X-Gm-Gg: ASbGncu71OrptUuVqEHAFQAOfsZ+LcryAGAHgRMkH1utJKWZ4mpXJ+shHDo83mWq72P
	c1dIF5Lu3sk55WF8zrYc1tYS241Wdk/EbglAkF170nYptCT55KqLsl3Sun5Nn1RV/KLI3UTP+48
	MXBH7sRPU+mnXZDkdL0SGWuzp6LM4eGU63vPkbb4Jw4qy/3gmzOn940YS86awoFFrJhmku03SAs
	TtXuL44Z6rSYd/urArjIZqAPA3e/kI0mDYvn5H91oIwxS14z0UUlIBkfuTWdn6c3Lwd+yF3RcZ6
	BfoTNrHuAMphMG9gZei8AaG0N4mZ9ARYf2Cl57jGsBZUmAwvirv02VSsU3uvghoJ0jlZYnAVjxh
	2ZXt212U=
X-Google-Smtp-Source: AGHT+IGK0ruPX4WysFV+SZLwQ89r5QOiFeAdeHiZNygg9R+OkQB5zmqWtRPqwT+0SEhCLeJWSD9ebQ==
X-Received: by 2002:a05:600c:8411:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43ecf9fe1f0mr141672885e9.20.1744126979744;
        Tue, 08 Apr 2025 08:42:59 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue,  8 Apr 2025 11:42:34 -0400
Message-Id: <20250408154236.49421-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..aa7940c65f2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,12 +1399,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.34.1


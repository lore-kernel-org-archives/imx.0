Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423893;
	b=y34GMsuw8hRWFtrYyVLebnNDyISth7yHYQFK+ayhFz11CVV4PaRmi7+mtRz/oSAdvctI
	 r+OQfTxssfkt8WwJWc3Od0pK4KVW4WlA+CIPo12XYsotOhcsTymxUCwL7/GtW0fDBIA0j
	 je8KHQIlSJB6C1G1vRrPWoQNEQ63izju1U/Km8/vICKoNN3wBU7f47V5apgyy1bePL431
	 4WHsDR6X5+wmpoQDzpH8ApJ/AOSe+lzCDSfZ4ndcAzKBWdxUSHuecic07XKLhj63ON+E7
	 Uu2YnFNKpBlz7UM17mC9q+0kTC4yMib4VtP7QhNosFQJ4ysBuo/rukQCLk+ILqAiDZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
	b=GWOd6Yhr3T3z+UH28G4DxmithzZ6w39LsH9ypD+ayFJVrHo4XFXCiPkXJBBzP5UOSTZT
	 xetaaVC+gL3n2bVSZHLOB/kOdbQTNLosrfFxQCXQ9nAEZrX4NHRNdzB0aBMrFsu+j8r5B
	 i7mjFm+/5ug1X2uZMpd2YJArAPCXm1IE/cQNAt/x7dVCMl0p15gj4bnwwwyuY1SGaY24R
	 67XIqOOfDKIbrUF2abx5O3suZ3ir7DLYbS4VH/uefZIsr9S9SKpKm15h7rNspQBAvu5NL
	 gbfrittP85B8PO+HwiM3FgXr3CSOBWJCHd3EqzkKYi8MDUe67sotFtf8O0FhRjZwAFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maWVn8uD;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEE4606A333
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 19:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBEE4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maWVn8uD
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2106597a91.2
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 11:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423892; x=1795028692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
        b=maWVn8uDDf4wNRY7rSOKs2uy2NOVccmyyeWEakFRkLdY69xVzaNUx2M6sM3YJMjJMn
         mpwBetOe5vg3fsdYS5qF1TnSHlMUZckh/Rua7Jj8v/SJAxR3PmAjZdmxxNWLN+o+CRbn
         3Ed+1VqTD8+dKoVZVbml1ra6y/geU2vO8WFcjAlE+FYaw/PnPRNXFmh2ySjNLTh3y11R
         fPIEyyVYlh8bGpUR54wM2FHblHALCRk9wy+9a/ih7Yakwi9RZZBhSgyjx5kBB4p/NrWg
         Stoz/69SKyAKnR4HQNz2Qy7ne0nNiRCNqpdMfH5Ib2tIr0WAtNGXpuY6blQbmu4atueY
         nyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423892; x=1795028692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQ5F3RSAqprTdoFiaIrgjuTwVvYLe9Mk5D+8vt5PGPI=;
        b=FKb6d8tY9wHZgg0z5nrIV270XZmIDIG5K/cMlIvoVrjZ3m0glYeXgqIUdrAR4Jwf2h
         jTyvrGfQP5cb1VMvqjwPuDRZEw30nfEgFA3ECDXfOx5wtUHLrNUQ7ZaLGEs3C0tL3CB+
         RfLha7cSg6vRrccp2svMTY/+5Lsj3JV+6Mydabt9b49UGEW431cN76U/4jMLj7YVKG6L
         mfUmYbuJhjbujSkO4jMbJuD1z3Ok05b2IzG48ipa1XrLcrZRAH8+h9E6bO6DsN0CVAMN
         T9PIOu+jHbwOeo89AYXVGGPYpJ0eLKsswuuUmjwOD1mZeQO6bnl507so+uA4QCfa6Q0j
         FwYQ==
X-Forwarded-Encrypted: i=1; AL+hErG/8rHE4dDln9WDlNtoHT23GuiGKTurC2MiOYEE5xcFoSvdQFqUPSIGCJ7xmGonBKis9ko=@lists.linux.dev
X-Gm-Message-State: APuU4Z/C70z9COR/TBqRBqAPzLP3gA81Y4gXoi/LwyEFtixtPZrF9MW6
	Ia00lMM51F3DoIxY+AU/P/wfXm1p1LrpafMLJ2ltvm4XVygPY4npF4C4
X-Gm-Gg: AYBFou2rG+YfYTy7783vIpnkPGXGp6MqFBT7YicRvKaojeYjcluYUc2fg2HVWradxj7
	yq6zcGUsQdVZYw061on3mgxICo6htqSAqeLGiYtlqrQIUMPkHwQxmTN+ZT8muhUXC3W7JhE+G4j
	DBAntDXozQX4Q9uWu+JDFarY88hg5KqNFCduH2C8hzDxbT4n8MEPvJx7U0Mjw7eBeUXckQpg2QI
	HNbOOAe+orDMM+S/zkEWx+8Q5hDNzKBjCx5mPtRRSJRF7TyTpcaa7luyVtXwc6KIj9nJD4AnSOi
	XySg9Dkcg45DJRELo/c/CH8xzUhnpR+xQK7mXOEcNiLCW51I6xhst+QJaV1mquhZ6R7LXPQ0lqW
	C21SDgUzUGJbWsyTHCixMYfHWSkjrta+7AOYMYLArI/j5r/OrRA1iNUZEJD2H5h0ZWuT2UHaPb3
	ztk3Fcyc1IK7KS9pO+PLyD7MslH4Pr83nefplQim/S/sqSuVE4SlgDLlSm3fbkvdXgNbNLoAb61
	ehx56Rswm4tYpZ85vi9J2Ys1/GuI33Rjg9X7xAKj2KuFW91lnu7HjrNsdM1Zg8Q20ZoBWXSv8pD
	teV3Gqc5rJo5nxExfi11kulYnCJJIyeFWA==
X-Received: by 2002:a17:90b:4a43:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b182e6f662mr3176907a91.17.1794423892375;
        Wed, 11 Nov 2026 11:04:52 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:51 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:02 -0300
Subject: [PATCH v2 6/7] ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied
 Load
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-6-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=2480;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=SdMTfWEdhEcbVe3jVg4HQtrokGsmQDzPQ6HKrJzZjGE=;
 b=GUA2MhZVPFVVx+fP4wtJTG/ZVarRMQCoFUO+AAwZGNJULsfUqPHcm55hq2RjOIUamkxu2JjEU
 s7y2NTEMgqhBHj95eIB/wJVpRyhVGVv/R6f5pa0rylqerr4dAklrjSi
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Apalis iMX6.

The overlay is also combined with the Apalis iMX6 V1.2 Evaluation Board
V1.2 device tree to provide a ready-to-use DTB. The codec and its routing
are already described by the carrier device tree.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                        |  6 ++++++
 .../dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index fc9a68cbdd313..fffcc54545b09 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -152,6 +152,10 @@ imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx-hdmi.dtbo
 
+imx6q-apalis-v1.2-eval-v1.2-nau8822-btl-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo
+
 imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx-hdmi.dtbo
@@ -326,6 +330,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
 	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
@@ -339,6 +344,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-nau8822-btl.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 0000000000000..b2f9c43d29cd2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
+ * Board V1.2, combining the two loudspeaker outputs for higher output
+ * power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};

-- 
2.43.0


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDD73BF68D
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913380; cv=none; b=MJKTrRqYu5ZgiPTIN+VRPS2AjrQKjTE50Rat6BsyNgiiJct6R3Yh957bsh+UCnDl1cdxeaUbibqscWGjg0IAMZu4ltoeXFh3SN9n+m+/8mnWFzxlXnc91Tw+rqSVv22BZzz3NM3DvFjQs/Fz9URHDXwiUWvmPg/IVad9PqL46iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913380; c=relaxed/simple;
	bh=dXrFtWZiquTbNHiSJWN4gwWuKVrE5L4OMb/ZitvMUxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPfc1MhvzNks75C3wkPLATt0QsvJvcs7ke3rRfcue4y2ibsT47ROiE8KqcAr0DzYcg8DHMLASGwFZafbhSbdICBENPV59LSKCNLEJtBbIo3tD+z0oOyKX9hpoeiEWGfUDuoPUAcieAVqnz/YXptjfCcu1W0OBB5OxO7w2O7iVpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJgwdUbO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJgwdUbO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so36313345e9.1
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913377; x=1781518177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXwjXcSk5MvZ7BwLfwPes/qcxy57EKErAjh+J+ytqQ8=;
        b=fJgwdUbOyVxIs2h0dzJAn4i+DOeIIpcTc/KYBOFM+T9kM2ngbIW1Ui+8if04vrcpnQ
         chOD1h8acHR2gskdb6RL4Alw7C82nOmh4brs68AzsX6eJV4uwj0tLr7wzRp46vJAcbwP
         RYcMlVrSd8uMl8pBp762LX3hRgcRvzJGvxbHlljvD0mZ1RYe48rctcqbcClvRgluWLlB
         fprj+lcRnVoCJCZvCEHkcQcFayelSO02iQctt8k3UiFBPGjeqilGxL7IpUZtylJvpzh5
         9ZF2EiDZzl7Es0GFdeHXnJ+D2w05zwoN07Bi0x4zYePQfp9P7IiZ0FU/mD7ZJug6Q1g0
         Dp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913377; x=1781518177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXwjXcSk5MvZ7BwLfwPes/qcxy57EKErAjh+J+ytqQ8=;
        b=diRoB9qHwqAgLcHX09pBTkyBEmZXbDnRHm1EUBSNxO5cR/ZsJwY5d/nNpcoksvPQcw
         8PaiEZq1IISr9wcqk54NN3kG9SSkk/nWRGrAq/1Qmrk+c+HdNT8sHRr7Ge23PM+5u41Y
         RlOmu1CMPWst/oF7qaTDpCpbJ5T6XcmPTOrgWj0A7uNmE3eyLTJRc03g0uCKkwm6VeMH
         4hu8s2oVCo2+BSouxcgmsi3bUujDl9qX0+C7B2VvPSvZZE5dUsBDI+CnqhfS6sfjFAPR
         EmXeUaT3rZWE1g1Tbs//wkvoqra1nykhPWaClRG2Q+SjWcD1y78isdRDuHwTV0V5VFEs
         3LxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uFB39BYw44BvAfuwPfkm1sk7qLpvAHP54v8L1U5/w0O5Pu8EbnxUVT74jS0c7wbHd4eo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3N9Vt+LUIww/oCYEdWfBaxpqVQ6kmItB1kT5n3NJxKp18uqI2
	arecsKBz5rfeq8Eq9R/g11wUWX+sqAroI5M8cROHQKOWRWQnQb9ncV/8
X-Gm-Gg: Acq92OEKg8QuVInCTvx2sNAEll6ScPR1Ppq11O8ELjsxAra1B8ItRqIZSZZFh2y+C7W
	d0BDqKnR651FMT0sV+IfTBv5WpPVNIUxnV5CuTln6rzUxs+itwkeaKE21v5TyzubKCzTIlPA5LL
	bS8fHF/6yRB3PK4N7ULsQFmnONj9cXe38btVTIDkRIIJMUq8ifW1QuKqhefwvWugGktTlI6A0iz
	sapNJ48fi0Mx3UfIpJ5+S0OGhbN33fZgq4wbLt26YPDqP+jQbCCe/nTWNM9vOaZGYm6fLCmmLcg
	wYXBVqpTLhXR8TCG6hC70qNQfqe805KRu0OQf1m77tfMNH0kYbBWDiUpZzShUxWhKtJJWGTInmd
	lH4Q9lG3mPCROUahl94pg6YIBm0IPKRvc8FQvD5b7bURhVJTYcA/7/ohZEUPEjkWJrdcU+Fjbkw
	OToM/MfjWl+C/bbBb9FfwJJb5igP0TLr11OijKq+lffNixYgMvs68uOmxDwKoJ2mnMVGaabOly5
	YhR2JS/0+tySAq9zbtwplMtMHahFCwo/+jIrLji7byYdPFU
X-Received: by 2002:a05:600c:1c29:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490c2ceb6f6mr220547035e9.8.1780913377253;
        Mon, 08 Jun 2026 03:09:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:36 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 01/14] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Mon,  8 Jun 2026 12:09:19 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


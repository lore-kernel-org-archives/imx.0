Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED2638C2DE
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051974; cv=none; b=n7IUmS7nHh9BkGPaRgW6xbnFtXn1RXMLUdnHhgMCkX80dPEXpMpWNW/zCXAZcXSlW2gGq3cT61OFw+qO3NsTG94IgVqRDtFJrxYXQLwM+oD9cazrrd1EbL/wAg89lZstPyuZWHE5XYUkw8+OwQ9RCYIlzRMLZDPLq4VcXIQJA4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051974; c=relaxed/simple;
	bh=bVslPCSnmT70LCYLKEcEI3c7suTV0ChRZWluuR68gV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNLwliajTBhvgm1NeYA2YJVa+0pc5aqkteTIqN6Aud2geFao1AU1PMvJ/KBEHU77aSt3kVKYtRoM6h4ZBZC8MJdX2lzwgDw3z8E8HHoBLOIjF/I8peb/wXYcBIktAF+qDHI5uNL03stvieHORifxPcppk2xasz66/lUgDFVEJwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9uI2wjg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9uI2wjg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49068493267so38589885e9.1
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051972; x=1780656772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWz1bxcbCKnB1qui3eEEw2DsDlA+ORcLDTKiyWMH2XQ=;
        b=n9uI2wjgWG4UW2+wYOlJw0tzqSGv3UbmQZewEYiHapqpebOV0N4L5BTuMt2MIc4/6T
         E0R4qu5FihKpVR40vwFI3UGxM2kjfXRAPmKgvTfSHTFSVW3eP2KNPYiKlQznsmwivoSj
         UoHYqWPDJV/ObhJxffLqcPv1JtSJiu+JHk4ml0zM//gyvcDEhTYHzP58mv+mTTeNPqDn
         Bi9J9a5FAymp74lhSWCQOgrNyFMz4ljmWpXLL8mI1WCYq4R5EvmloL9HWm9v+oqdg9GD
         wczPkCnGSf4RI5D3tXnuzxTZuPOEj8Hv/mlxVVUzq4rQAQmmH/WQGPp57kpTiIf9oq6O
         cYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051972; x=1780656772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWz1bxcbCKnB1qui3eEEw2DsDlA+ORcLDTKiyWMH2XQ=;
        b=sMGDZzBTqY06ak9mGFdfwWrPqf2OCR5FDBuc1OGgvk8RYK+c3NiCCV0v+3/eoPJnwI
         4OyvZP9Fd5S4SkIkwv0aUGh6H7lt5FhanpB7FxUGGBKeCRhrJbcj4YXgMpq+Jt9WAQPi
         B1ohWbGwo0MHsXHGW6eoPde69ml6gxbN5gocNH/n2kfwdOm7ZXnh5Y5X+snuZGOPwW74
         8dzqW+q1tyaJMO77TfshSfqe6ieR6JEoEUCoZqFvMyBc8d9M5oqoYBsRLuy/46w+SdNt
         wEpjGrtDGkvWJHRuF8Vq/YHkKaVJMBxO/35CJWwD2Oo5YkG4cdw0i75NFXYill7ZVsRF
         SbBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ix919HCgOcU87WwSEKnZEPb95vhE4bapsa4iZe9Ua79SaFfiDBbyExEjMzMK7/+tXUEY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBKW7dEaUS/3wLGuJOYURabVRaj5SScKFivv+SaLrhAx4WnwjY
	uGZcRRaF6vmYL88jIT0KuJ8UZN77w4wbu+anuN8AUpIUAq+e3LCbEDlj
X-Gm-Gg: Acq92OEIZlECiz1QdNKRbfRrqi18o2aWD/GZ7cDhhba6acw8nHQo1JYYcyuURdIijtT
	+YrNgBWmw3uL64xrVOUZhcjCd6bfr2wZ/MpsZUH5ZFzPDP7Is7OuachIfeaJgjBSAzucNiB/pcS
	edAIdx2GvpLXRVpPAK1IN608GMtqtsSv0d9uS+dyKPVBIYTwxFB2wTAHme/dzHnu/57IeCmQddN
	6UuGaCgzNB1EvbIP8RHbNYCwN83SNVhDg8YJnImgU/MvA0EMu1pKNlk5vZ47qNH1AtJEYfXvdu0
	PQ0FFpRjAIK+ercP/XxDTMXoPswsv6EWzDaLl7P99ECXuDWfS7QmnatUaqAmRkUHTqdjvEikeVW
	FamIjUOgVYLIKrbDN+x/cWHTORPeTJHnYHHy7feDNwHFwUMl+uLW8uEux/DxR/sndrdhDxRNsXo
	bEEpHt0oXUTjNz8ZMZRgW0RpYh9DAyHIjw2QIUQC80BDlGP+MMuh+P6HNQimZMAujbEuJOTKzVr
	BeEDopRSEV01h3iviF2h91rfv99XRDYHoPORZfP4DbkHm43uBZthYBimQ==
X-Received: by 2002:a05:600c:a08c:b0:490:9d1b:2033 with SMTP id 5b1f17b1804b1-4909d1b228fmr42473415e9.9.1780051971822;
        Fri, 29 May 2026 03:52:51 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:51 -0700 (PDT)
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
Subject: [PATCH v2 1/4] arm64: dts: imx93-var-som-symphony: add TPM support
Date: Fri, 29 May 2026 12:52:44 +0200
Message-ID: <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM enable line is a board-level signal driven through the PCAL6408
GPIO expander. Keep it asserted with a GPIO hog so the TPM is enabled on
this board.

The TPM binding does not provide a dedicated enable GPIO or supply
property, so this cannot currently be expressed as a direct TPM
dependency.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

 .../dts/freescale/imx93-var-som-symphony.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c0842fb3cfa3..f541308ebf6b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,26 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
+
+		tpm-enable-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "tpm_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3


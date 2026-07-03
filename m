Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7838944E
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068387; cv=none; b=ZAqpx+5wupg99xBGwE0hiDmvo+x9D2AtAu8fqG1F88LwVxZQjdiptmAjfztFWb2IbHzR/Ac3x4Ve11WN81GgfD86cYRBnPSPs0c5dJqPGoD/ndhm4CvVAXmJAERab428hBkFSJi6u5NCZkAcV4dMPrdyIVrPk0PIexIwxPe8LME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068387; c=relaxed/simple;
	bh=pGb0LIydITclxhgCKi7OR3gJR8YFVO/cH9t8i5zQNEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMcMZLYLL8iWFR0iIlAQwUCQqG3Pdx6vRzLlbYZmuxWkbL00ZoqeSNhKwPusgo0TSTPdxkOx9M3ENJdmdv3K5/qo5LnfGaxoWI1LnZji/a3AqPSbVfIBkyYPhESVS7lJHllYpzX1BaSMO7KWeRhbJu8HaSr+I2ixxwYFOshKYZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKMRcSfB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKMRcSfB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493ba701891so2138495e9.3
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068383; x=1783673183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tphBelM3OpoRDnS0cz/tlkI5Y11yJVN2jJKRfJqazDM=;
        b=tKMRcSfBp1umz3NdFf40Gd0AOtGB8ehHS+fSWw6/17ifRkJfabGg67pjvU+77Epch8
         eByi28mUY2ZpcLX70WSL+HbUstjq312GOxwYVsXOvZJ/g4SNy6w9bTHYzB/FbGyybzWm
         FGmeSoY2UnMhmvzPGLZO03v1t2B5HYnLNAhMSz53bm7YfhW4Q7iS58xttUehqFUBoMyi
         uITat8QO9LVtb8ZMUkzyqKnAk4+TDrwwLy0de4IGhID7pawOo+zmVbOqtqsn4Wvg8JPA
         +NIzr/cFw9NK3Vdydv5ZKI4yG4CnxumexEYSWlUDeAGU1U6Jjlyh4L7LP6Aj7KuwzLkF
         qNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068383; x=1783673183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tphBelM3OpoRDnS0cz/tlkI5Y11yJVN2jJKRfJqazDM=;
        b=iHJa/1sWLHLYbH5Fb+lly/6c2kUjrdECJ5bK3ueOmFU+mBY1wwvVfzXFXxWkRimYKc
         /9VhtvAdQ833F8HRcivkjAmT133AtpWL7AmUFQmIMf2r7lJDzQaIBRQwPnOVU0wm32ip
         eUhfzkzykPAkenhrVSsvIdI6mBViIOCibtjAsEQA7Pm1xHY+GFQji7sGc3p3ZKJx6liH
         AS0ASG2bhe+gx0DKIuS0ZqIXwLhLCkNLmCRvN7LHv5NfXhQR90ZshwD+LUYVuXH2Jhs0
         InuPom7F0329KzD0tl6LfnMiwnKlWdhLp+wAP+a3GVGY1EJcIHdR8ltwl1r8Bti/d9jm
         U6sQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UOMizUnhfJsKEw6xXnEHj/CJrtmAo7mdnlC4wmPdElsV3Sagu8T9jbmo+2eQzmKgKyn4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWsQRH+G/c3tmsGUEYqlqLEUoxyyVRiAQIWZhOGldKVzWnqnV/
	UtZ7oId7oy1EJYpqG7gTUG9acecsNpdFdJLHFj8EFubeRHA1tO6K7OKP
X-Gm-Gg: AfdE7ckfe2zFFQU4g/bgpW+daNANP8SqLW2ACWMhxFQNuwtvhGnWI487cdaCt3L9wCj
	ekR7lzIIipRORE3V4je4Vg54pzFD5qhrJhKq5v/lW4I+DR2F+WjZd0V8HvrTWjbWL5oc935cIh4
	llGEjWhHuuy/R5UpMqj9rBigr7j9BLEV1x5hv39AiuY4VPf4XxPrO0V8zKnirzbBc+L1kyO0Bp9
	YjXaa1YXx+qKOp/YZ2+dyx7egj9uu1cf7zFsBYq/qwtsVIKUgoE+QD37ppmL20IHvOODzs6aeeg
	ziE3rO5smp2KHQJwtiR/pirYawxVcNwARf4RoOoHUMhYT2aq22Jn/Uhvtv8AbfPHo0N9YvBTz4I
	Hwtb8uw8YW/x0a43rUojGy0PurZl5LbXmA0VAJS7IXlmgwHNYW0ly4r5dlc3PkqrGtf45exSjba
	msbdpWDSRHyitr7FxahhLxMLZ3mpk9xmnk1At/zJprMOG4cBp9pQKVdPGrUwGzQCec7RNXuFUlR
	SNALVZcJCSDZSU7D01rCuxp7A==
X-Received: by 2002:a05:600c:4206:b0:490:e913:656a with SMTP id 5b1f17b1804b1-493c3cf0d3emr72946345e9.27.1783068383286;
        Fri, 03 Jul 2026 01:46:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 14/15] arm64: dts: imx8mn-var-som-symphony: enable PWM1
Date: Fri,  3 Jul 2026 10:46:01 +0200
Message-ID: <e20d78ff8e242d3aa938776d435162cfdb7b1d66.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index ddd4651b35d7..2afb5b438b68 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -217,6 +217,12 @@ &i2c4 {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -310,6 +316,12 @@ MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x16
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT	0x06
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
-- 
2.47.3


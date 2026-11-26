Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708934;
	b=Pyk3OwigiMYv3Ou2aZx5ckLmmfRZ4lYJxLxsWuLwsL2r3D2YTUBK7qh7Jvumw+FwhQGA
	 0bWeTKi9yBhhCwiSweMMbJi8vAF+uGqUIWeotcaJyWUKjGMHkcpWF9IhdoHuhH3YGRsbC
	 tpiks0PBMbhl3WxSei+REp7rXYOnPCfeMeaPMcr29huxngwjy0tZidpRX4jd+gO5tFVtT
	 vXlnmtpnTZ0MGCSKtzrcjwkqW/cUEAqpmAgY4YmcQJYothxI7tqgNJn1iyJVsCC/1FF2N
	 m4xlEKtCwOluPbam0ti+wO/502pphl2VcGKQLBuDbDa8as29Njk2z1ap/fyO9XKPGpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1zNw8Pd/JqrMGg4lyFXAavmYqzgxCJ5fQLfj1g0DY+s=;
	b=CMMSdPL3fJjPQq8gTdm2N2InTSLf8s8AIR8jiOcoyWnY04wKUo86tkIqnW8UmyW09Dze
	 wkWpJx9lCJ3fXxbv19WGzDngUvdaPnETfFHWikfoSxU2Z0lbRw1MxsmnpqTWZksgROP4Q
	 UUc7iej/V4PBlM5yAJ402rloG2mJcBFbFm+GSR4FJs6Ae06UvZNXAZ6wTzbIFfVMHjNda
	 wFXswUkf0HHV0BzhhRKOUMaIPEEWl5Pp4aIAIaGdBTNVFRjZSSomTSN8+thfh3f+BuSOl
	 vgwd6hQj6ErSB7b12yhozm5KJEVfe0UB/ZrESmD0AGFXFe5JSUAmfUTXk7/Rfc/BZUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jb8Eu7uK;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A48606A323
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 16:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A48606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jb8Eu7uK
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386bd881d39so7236142eec.1
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 08:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708933; x=1796313733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zNw8Pd/JqrMGg4lyFXAavmYqzgxCJ5fQLfj1g0DY+s=;
        b=jb8Eu7uKhz/gLX2WkqSpvSHwX8AeEGlsaWpmDe3QK22kYuznBfR5GKcZZFuyioSZn3
         rhN3oSqJmAbcHUG2nZabJGmo6ExZYiSLj9BLRzOXagg3onAtyNLt8YKsWjEbjOOa+mIC
         rktO7dpBrNB10hwZnTw/Bot5TkvM6MAxCXmlKAx/UmBYlkAxVvvydNkxzcoHkYvNgNQ6
         e3Rr5Zdq42fnPlH7x5odY6cgLv92jvvsedUvL/FLscEKU8ZyXTd3PxEU7GRG1FOG5X2p
         cZkU8f92SddTd04E4Sk5/bF3OnNXHYAeMRA2mO6B+vKH/XVIOzSoNqeW1fATHSLqI49d
         9G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708933; x=1796313733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zNw8Pd/JqrMGg4lyFXAavmYqzgxCJ5fQLfj1g0DY+s=;
        b=HO5OOkVdWqM2dFJB8Zdg+AjqnUd1IgVfvbH53+WZTX1BuVZ2bXON52iIhLCbpK2nKQ
         F/1alMdX2P32CA5ndCZIVe3peai1md5Hj25oihIWoVxNSNLULxFxZie9VQuTlQI8Csv+
         /VzgYKFwELgd4cqdzyB94vSQYcvxtc08fqc9T62d7sMKObL60GosydL1xTaOCDfCb+RH
         kVQLehMCWDhaYEuETIe4Xbs5ARmrci7xeqKWrXBAkdH3dZSDWFbCUSCRgNT1GEKfKeMg
         k65MRq3Cle473pNlsnZ3rm8qYJSQk4JjlozUIc2mziZpt566o2Ic/Ok2TbtradxDNsaM
         lDdg==
X-Forwarded-Encrypted: i=1; AL+hErFR/jk/gYIdHt/Eftrd20iZUDI2wzRW6vBq7HfYOw3ir2O0+0i5RK0RtH7NYviaIMwJ4ZE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+62TEvbcnaJUnWZwcMHtRpM4FC//aKTm1YJEJaX3YHFyjYAEsb
	YFuLgqAtQ1aa+BXGirNYTAHYgOMzqIRktP3JZFSgZ/vqYP0hGf9qt6Er
X-Gm-Gg: AZFdTZev3z2bJaL64DE/pFooclpkCG8oJNdWfVTsBUQIr6QptGMVRKUHEtfXHBiUd2Y
	jPAwQkDLgHOUhnd3Ef0fgQWfPWHUyp6xBnuvZItxeTqv24IGElLUABXEprbSSvAlL5A2iWAniKR
	fl5nwNSn8JIERpF/xVVO9sKpxhM79E3elt0fAsqkygqmTCCKN1rI74A5svWUOTY1C8/GeyG2VXr
	3Ds5CTSylpvKsFbXXELBjAjPyXeY2hALrrjVKXlh1G4NuohGzQiLjTw9XVi4Itz0m0h3Xs17tz4
	cWM4lWaQYlvkQZGqnJAoDqYFk3fDU6Trvvb98k/47wWYZ6M5FkwqitUPXvRAwCxwvcEuFX+ABpC
	K7PRBtJwajDUZ6kPQmfF+nUCx25oeA1vprUZtmav+8Ndkk6SaeFV3mdhRQvjV40mG+zx7iGTG/Y
	TZqknHYd/umW4Msb0fcHAqVbfnBw5G3AXNt0uTFhYMfgzS6t1WOoVLB90top+ISRXx5u7qqEtWa
	Kez2Q+ki8fPfhqVQA7Mh0Jdec8yfHG5Ay4tHBTyExFtZm8Qm54deqX/N4XZuWEcmbUXer4+z0y8
	sdXzlEJFgsdEjlKu1jbJpsg0dulxO7G15twlcGZS+e02kQ==
X-Received: by 2002:a05:7301:3f0a:b0:384:8f9:bbf6 with SMTP id 5a478bee46e88-3857180d3b2mr34804423eec.38.1795708932635;
        Thu, 26 Nov 2026 08:02:12 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:12 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 0/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 board support
Date: Thu, 26 Nov 2026 21:30:59 +0530
Message-Id: <20261126160102.52163-1-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dinesh kumar v <dineshkumarv85@gmail.com>

This series adds Device Tree support for the ADLINK LEC-iMX95
SMARC module and IPI SMARC carrier board based on the NXP i.MX95
application processor.

The series includes:
 - Add ADLINK Technology vendor prefix.
 - Add the ADLINK LEC-iMX95 board compatible string.
 - Add Device Tree support for the LEC-iMX95 module and IPI SMARC
   carrier board.

Changes in v5:
 - Remove duplicate GPIO expander mapping comments.
 - Consolidate GPIO mapping information into gpio-line-names.
 - Update SX1509 GPIO line descriptions based on the latest schematics.
 - Add Reviewed-by tag from Daniel Baluta to the vendor-prefix patch.

Link: https://lore.kernel.org/r/20261125113845.297658-1-dineshkumarv85@gmail.com

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 118 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 609 ++++++++++++++++++
 5 files changed, 736 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1


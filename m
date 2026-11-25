Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606764;
	b=pRjKpdJDNfQT/wNtsyT68epwgHfXJoMGzfZ64jDEhM//dPpqh6ir+30w3nhsI6zw+z8z
	 sUtEAUUE6sPxylAfYUWdsWhsgU8LF/Ug/t+8MQhFEMxum668w4Na2Y6ufJRnMiTbvqj2Z
	 r0FG8UnBV7uONlfGqOygrXFWRS30depybU1EsTdcWVY/JaGAhtRDM4fqq2yzq3+TEU9Kl
	 JwAc8W4OruPKkGLsx08uNKt1gAP/picNV12bHj1MLoP2wckObdbvL9NNDjG65ImaKk9Y1
	 2kuXklVZuKRlMw8d7OYsmZYQNW4y67ZFPqjHtwIG1hPy4h+L6xmvsKcHiup9uA6xZlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ucIqmBM6KN9EminbPJZhmBbHA/CEHwAxdNotG8ANz4Y=;
	b=NR2IJmU6QedhnUzwX+V992kInpuIupvx7bPSHXZdeyYWky7URdF1GZn1IvvmntSBHY/8
	 Io5kWma96yO9eRRnGl2Evev/IkUFaz0tjbu0XYz5N69emvhLeLljb0jYfCH7pWIl3Yzex
	 kS7R8uK8CwhX/d3V13BJt7cc53pBDvgBlcgkKDASjnY6KJUbmoPx8RJtTo27CjMEiLHaW
	 CN7zQO0zpcvI99r18iTyF+9Vazipdpdo0bZI6h5scnZhiBuzrpleBYbxlIgk3zC0Ms8ZX
	 rBLdkVu+Mx7ePnWpubozKrIGhMTpXjQItztnukypb/4B+LjKXNph/672UakNsAF2DUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h9AMzDAz;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753CA606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 11:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753CA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h9AMzDAz
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3866a784546so7540166eec.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606763; x=1796211563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucIqmBM6KN9EminbPJZhmBbHA/CEHwAxdNotG8ANz4Y=;
        b=h9AMzDAzqxN4r+dRWawnW5q51V6HIUz5WyoZ+oT7wODZEpTZ46zOfenf+TuiyNL4zf
         umwsyt6wI7idhsVRXsq9gqncNa9aqjVv4k3jqVVHKwg49UcnW/I2uiRRaujMMpCD4BsM
         fvHFkQr8tq2da2cizap+r4kLM5z68bvt/dqwx6sbGtqym1I6bqGOsNuGiNWKGSWaAdoH
         3YBTTMddztRrZPgugqU5FydNHZA8nOe03SrMu4d0k0a5brpkZJ1cOwFdOijLf6hw8RmZ
         SZTksLYkt8mjKQMXxKslXQFWDvFve35YtRZqDX9oOLrN+dWP4i8GpA639+7knX5sbmY/
         sJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606763; x=1796211563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucIqmBM6KN9EminbPJZhmBbHA/CEHwAxdNotG8ANz4Y=;
        b=iQ/RtOVNsKXfyKNcyGEhCacorzyWGnUmB6wjmC0qmN7K+rldGf0ag3Qidb150g3r4m
         vowgmWvUIuXLEXEsWj9PiJLtg4A83qzMftkzB690QTL3bFcFE4LpuX8+aivwb5VZ4BxA
         n6+ok1eZ7Y29FBJ8kGwXZld53WyNjlJTziX3iVgX998o9t7fi/xYLv75CLWboOHaU4Q5
         i03xxyGkvZYpBJve9pPhQzAg9RHv/A8Ikl6SGlsSxBO8xHY23EM7vgfBkvjlfMwdJias
         FAGYLen9erSCJ9uK6P0QaTZxDoQeFxKejGqUGDzZng/2JXwZlTmThEpVmeF0DrPCG9FN
         t3ow==
X-Gm-Message-State: APuU4Z+ovPNvuEzefW9RQx7FiLat7128a2R4DUhqjykK7VkEo/2qhI8H
	S2198s0IGJ3exwA45QgzCldfrbYtDO3vTOCJpbNv8t4TCfHf9gG8bpFV
X-Gm-Gg: AZFdTZfLyPT64BLfhBSgbwji00yAq4cIqMtwdiTnjHSunHbKg/eaBgc1VNcyitHZOWV
	8In3qggJ/IpgRNapWhrYvb2D2q7FfCDuTxoBlWQd4MaIqB6H6oWtxKAaBUSV+sjsWjknSGs/YbA
	QWUrRkjlrpCmKngoOOZUFl/2NxWqlaXHo3cIY2rKMBCFjXR6484vB2ENrhyLQk2SusQRrwoFEqX
	r8hLPLNRvzGkKlSpYTharbMJg2lQAWjgXX/ghhY4ebX57ZgcDknd+35C64xXWBh/rMV4H5LtPBO
	6cwTaEC3qM7iS4PBtRyAIPsENPTgpUymvP3IqSjQrlZTz3+lElwDI6U6FRD8kpxj5XrqGO9+EkP
	p5JaxElY7umnXpMGcW8ChZpzUrQiXYMF+IIDOQXXEOx2eX0t4C7AWBxVYNFpe8gFQ184l1ZQEOC
	TQM9QTZQKgPP2b08TtbI+qRbxk7BL+m7t/YxIgGyM5rz8KJIeyBFEUAs5ekNHsb3wPVVu1FQ0SX
	+6REmzIPnV7ghQ04Z2WbQr3D1KkvLExdwVDo+gZI5NfdpaEnpBn+i2YpE4iIWSnC0ixOEROSttP
	8ocWSIt7uELGRRrSZzrq8WiYE0/wH74FTyFGvDmntNO1h1g=
X-Received: by 2002:a05:701b:4502:20b0:152:9e88:daaa with SMTP id a92af1059eb24-1b55690040amr17444087c88.36.1795606763346;
        Wed, 25 Nov 2026 03:39:23 -0800 (PST)
Received: from localhost.localdomain ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm47479629c88.13.2026.11.25.03.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:39:22 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 support
Date: Wed, 25 Nov 2026 17:08:42 +0530
Message-Id: <20261125113845.297658-1-dineshkumarv85@gmail.com>
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

Add device tree support for the ADLINK LEC-iMX95 module with the I-Pi SMARC Plus carrier board.

The series includes:
 - Add ADLINK Technology vendor prefix.
 - Document ADLINK LEC-iMX95 compatible strings.
 - Add device tree support for the LEC-iMX95 module and I-Pi SMARC Plus carrier board.

Changes in v4:
 - Correct alphabetical ordering of the ADLINK vendor prefix.
 - Remove non-standard USB aliases.
 - Remove the ChipIdea USB2 controller configuration. Hardware testing
   confirmed that all four Type-A ports on the I-Pi SMARC Plus carrier
   board work without enabling this controller.
 - Remove unverified SMARC USB connector comments while retaining the
   DWC3 host configuration and U1/U2 quirks.

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 138 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 628 ++++++++++++++++++
 5 files changed, 775 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18B2280A29
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353790; cv=none; b=Cs3IcON+QK5qfPyNP5VHC5+v6GT0UFhZFCxT0PE9CxaOL7hsZeKx2wif4AQsh7jfWHIyPyPb+HxWROgRAcR7oyr1i65jF8ByQ2SnwiiczthcXMSeInMDj7hHlt/RdykIp7oWc26GlEpbVXoXWSOde/77a9fIlp9S4fLkAeoA1JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353790; c=relaxed/simple;
	bh=a9/Bv9gPGrnch3FbaQtYnf60T9suaENPANAWBPUwioA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVuogNbA4s3gIW35eJXCzzo9xr1u/54mu+rjF5EJNihnjsXPbeb9p8j9cSYak/LA7p8kZytTuvYkyljYkoSPefwxTPg2nRvk7c1CEX04uuVtlOlcNMFF8rPwnLBvBAOljIc36qsgBgGomvrESr87+WEDd6UqBPOtrrKth+h7Va0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhN6RT51; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhN6RT51"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48069a48629so42754595e9.0
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353787; x=1771958587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bS7q9PPDCy2sDXPZ247pIc5Aq5NHhY6a0if5OF26uog=;
        b=XhN6RT51zdmoPyVlcbL0wJV5Pact7lAzNnm3D0YpcNdGYFSKVTKVq3DkelaNM0emEU
         KqkVMJNX7xM+n3ovQWrah6g5mUEnddWjN0J3lbAtWF4Fs2dxfu8LvM6SZGoE62GNopui
         WUJAh7uqGxsxqjmcuH0KDFrQ4GXz0nycTa+EoAkkjM1HJFIZtyM81ubxmIcWzC1MJ6AZ
         e5iMiaKK9g0VXJO6rQCJxZ7gTVZo5vRuZtkKJ07QVr0g+RcVhzHwmsbNQQ66moXOQCRY
         q+hXnybIMBjEMXz4KwNWYJjikD9PA8FoS98cSOFDNT3VQgem7Cws/oPR+oEmhyW1sQgg
         lUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353787; x=1771958587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS7q9PPDCy2sDXPZ247pIc5Aq5NHhY6a0if5OF26uog=;
        b=slfnRCD/CWXyEA9DdmU8lbPByi2XWt4j2DLNtwXkDSRnXGZZgXpjJf7Yt2wyLBE6N9
         NBfNpN/cs41WWpvkxptwv/2lIkk+G27E+ES+5m3zcFDr/frXxZ44Nxc41DrZK2VQ+SWL
         Jn0DPa8lRbU/Wjxvvw+lxWCrFvho4bhFjL5/9/rbODBH0AkPw5cHzo82h5xE9PevEuAD
         6Jx1v26hZy5wTTfADaMd/4sKqUjGZD8XKVeKO4AAUO5RamQ9tta8i6IrAsnYNFkqcP14
         TWqnCGAgwxeY8KOFoMBnL3HJYZN6Zgpjz8nMWB5v5OcHYBSKksW+VwrG3sdw7aEBIB2J
         63cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWola6FTflQWoUsHE0tqF2MQm9dkAbbTXzP5bvR8/Jn36n0BUKcuS91H/zIsY/PhReWknU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7D691nXHpnGDNyzpZeqQJiZAKD+phZoXjI/Gm6+7W3VhI9x3x
	jF93p0gxIF6cFM3ILAaj+ap/lb1laIj5WXJLg8f4O33ugko9T+Ac2vcH
X-Gm-Gg: AZuq6aJUy1FbprgTaaPrB7KtEd/ZTRl4VgXdIqcBHxRh6BL3DbCrSlX7fN5pLuYuWyr
	rYH9962fVimRsLF759z6sw1r4YJTDy0mcwxnzvEtuSVm9fMSqX/s5P53cFLaXOLsp+1sxCxhkj+
	z01te50nnoVWoB2QuYtmsIOK0Eg/5me3ApWvYU0wz9fdPZ0X2RsNgoXIt9quZkTtYnFWfXBhfsA
	fM41yNIF3D12B6rUFQfn3rVfGFj07Fwf1FSNebH3B+LfIQSOuyq1XePVo46oK3sIoN2OckSk7Lr
	P35y3vGwoxwjgfuKD2J4Au0iJDaxO1v6VQlZz7dW9lNWcsf8Fm7lnVc7Igu7biRq9eLlopkVP1C
	M1/jucfitprbNIiyhcXMmvDrGVQtG/LJrgGKhiI4Hen08Lu9IWE6/YiTZZyKihko8Pd/E/Wb7Tu
	WXx84/thU4PRHJW3q0Qa8rcGV7yg7Zsc90KfJtfJeZIGD/pjeCqpnDE2oB7mzpzWp7QSYdDdRWn
	zYNL1xmPB+egRt8FOE1DUN7eCdlFTLwzyiKVnAc
X-Received: by 2002:a05:600c:1986:b0:483:71f9:37f3 with SMTP id 5b1f17b1804b1-483739ff8cdmr266953675e9.1.1771353786638;
        Tue, 17 Feb 2026 10:43:06 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:06 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 00/11] arm64: dts: freescale: imx8mm-var-som: Align SOM and Symphony DTSs
Date: Tue, 17 Feb 2026 19:42:34 +0100
Message-ID: <cover.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aligns the i.MX8MM VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

Stefano Radaelli (11):
  arm64: dts: imx8mm-var-som: Move UART4 description to Symphony carrier
  arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mm-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: imx8mm-var-som: Add support for WM8904 audio codec
  arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT configuration
  arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
  arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
  arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
  arm64: dts: freescale: imx8mm-var-som-symphony: Enable I2C4
  arm64: dts: imx8mm-var-som-symphony: Enable PCIe

 .../dts/freescale/imx8mm-var-som-symphony.dts | 206 ++++++++-
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 420 ++++++++++++------
 2 files changed, 474 insertions(+), 152 deletions(-)


base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
-- 
2.47.3


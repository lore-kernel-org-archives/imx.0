Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11607296BA4
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761825766; cv=none; b=H554BTPhQgYpK3OTKXk4NLCX5R6A1mrtxVz7VWCEy3NyCtO3jQ18SvnkOSRRsm4wTuVusa4AF8Yqr7zKmY7Uiy9mmyH46s0l/SWL9JRCJaPabWsvBZV0WjvYMOyxro9e9MaXC26iYJ1WLB5qqrGgyMlhqmU5YGL9TrL7U6JgHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761825766; c=relaxed/simple;
	bh=2wqxvv1LyQFzj8yk+I9X6hMiGmB+zBuKRmM0nZOP2cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I0qszVugnRzUQUo6DkPL9DjPKsDkD3F0GSzTUjv1hJ3SEDnObs32Vt3pDS8M7AIJSBazAjJENDjJmsdJLY3WFiy1AyNjRgbyxFXBimxlBtJHPdV2Vg8n7+Mzu0QOi9129ip+9g1eQrr7xMjG67ktYxcrIbqU9MC71j7SodT++gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gxo77vyD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gxo77vyD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so983876f8f.3
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 05:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825763; x=1762430563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=;
        b=Gxo77vyDKHcFUYRfgNy36zfog0LqyPYJ/Sd0uLQ/2WmxYmW10LhnzaDjGAuMh0iHJK
         Mfq1iUVZPo/5EBVp1VlI7lQHyH/le8bb0Ntc+cGA3lArfDFM5eruMfnodUxHe3HBbfG9
         3MZ/VLS6CbjVOa/V73Elt/mF+AIGdHwUCdVdNWlhp4Wo9AEzJ22wCGAyLULofyN1HVds
         WJdUVtOsyLkMaTxBaKJEQBxF0p0VgYit37aWbWZ/x4EFVj7S4a2dvgWmm2lNYVwnTOXj
         OMNeq32slUIUCwJLqPWZCEaZTjW9dq+ol8igns6OLq+qc0GGJxFcTngkNjgZ1+3z8x9O
         Afgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825763; x=1762430563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=;
        b=mRs1eXl6I489g9Su/WpaB1cFpYZCbR+6TYda2WWoam/cP87rYfEhndhZHjZuuDHRsG
         1SxUPP2JkFoO9JzZSbNzYwFLkFa04sAPl3TOQrllFIeCRg4StHGdohbw8vHm8YHMHmUM
         k/I6NAN+Z4r+k7V34P4k5bVLlCltvVGwAk4RXA8f9/cqHtS6lwCdVu1tgoAWEx8MtU3+
         /0UuL7sLOCB1mhdfzk8HLYPBKrK4b9cMyydojLriNni3rAAGecrctZ+fQYojoefO5z9D
         8co4dgcaF5vNl9zeLrT1h353tdYvCHn2hlBvq5PbKkghPknal5mpAeZqn83qm2BAin6/
         NAAw==
X-Forwarded-Encrypted: i=1; AJvYcCXM1GfRjRuhFNVEegFqS9430FgNy778O5zOV6ocP7qTokjYayW5+FKuBNyfOeoqDOVIyKQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIg3l2g/sPCgkHusbulma/KHqnSSsYr6mmQ5dHwbrEqXLheyJs
	FVeoNX/625OaOBwf5jqnlfz8Lpl7aiGURI9OHGga/v7xGjLgEBj84z2s
X-Gm-Gg: ASbGnctlj9Ub35xF99cXHyQek5FDtCvV198FgsNAOEkpq4RnLvjLhdeBm+IjjXMtqux
	9y6Mna664Ea/9iAVSv1kCY1mi7GB/EMvtQGkmOOzOElNdSPr4QSoicor09EsbCyfqrLxnk4Ru6a
	Ze+bbsvEGPIkX7JIMokDfDsplraS96x9tBRdUsh+cWw6xnKJvT2J7RXSdY+8Cp40uefp5krCnEx
	y5/QVl9yIJIBZX49Sw0b0xai+ZJMCw8sN1kZvc+Ul+Bhv2uwMbnHetjgqkTHm+DNkyXoo3bbWPd
	+9JaCdVI8z+OzfCLOW240c3NXLaqDeQAKUuwGw2VREYPQx9xu1jWbHA4GGLIw9z1TTpPdgHT/sH
	oQM8LyK9y76NCvsc8ovalIJRZirYul7Auu7wHtg1KDqbxtnyBM+PHL6oXwXhGHsoKjObeEWst2J
	SWQoVYAgOehlBnxsyqR04ldflYi3NRLS1JTCkQYsyHK7tAs++LsqG6+/2n2NzVP+yLIOZh9WOT
X-Google-Smtp-Source: AGHT+IGkEzWaIhOle1zjpMnONwufJ9WytmJCNBOpcHQt6RREK2pdj8LZw4LmLrh8QmCmDfNohShFNg==
X-Received: by 2002:a05:6000:26ce:b0:3e1:2d70:673e with SMTP id ffacd0b85a97d-429aefb2a1fmr5378560f8f.37.1761825763215;
        Thu, 30 Oct 2025 05:02:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429b9b436efsm2399848f8f.23.2025.10.30.05.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:02:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] arm64: dts: freescale: imx93-var-som: Align DTS with hardware revision
Date: Thu, 30 Oct 2025 13:01:20 +0100
Message-ID: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series updates the device tree for the VAR-SOM-MX93 to align it
with the latest hardware revision of the module.

The updates include the addition of missing peripherals and devices present
on the current SOM version, namely:
 - WiFi and Bluetooth module (NXP IW611/IW612)
 - PMIC (Dual NXP PCA9541)
 - Audio codec (NXP WM8904)
 - Resistive touch controller (TI ADS7846)

These changes ensure the DTS reflects the real hardware configuration and
enable full support for the mentioned peripherals.

Stefano Radaelli (4):
  arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
  arm64: dts: freescale: imx93-var-som: Add PMIC support
  arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx93-var-som: Add support for ADS7846
    touchscreen

 .../boot/dts/freescale/imx93-var-som.dtsi     | 332 +++++++++++++++++-
 1 file changed, 331 insertions(+), 1 deletion(-)


base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
prerequisite-patch-id: bfa4df6e3787b415218cd441317fb838824e06c3
-- 
2.43.0


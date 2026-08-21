Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CA438BF67
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324365; cv=none; b=BxNarD362DJQYccZS0v+LZeZypnHXu9/Ha/McTQXQaGwmvn+ncJ/tUW7lfDxIExoHOtnuTbRtEOcEQZFOOBBWlAqNX5gp4WnekEo5ksUcFSHTFi55xW6Kz8Bv6UHYdm1+VFi+WCp/uJOtGVk4mp/W27wZPsB6dtpSC+Bwfr0UqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324365; c=relaxed/simple;
	bh=WDEAc+a/SLkgrSJkUe7LKkxiz7rqpJlb0a2xNqjXnFE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=unRyAW3Yp0zCDdt562IKroxmmbjXKBeObesOtDBHVjET0rhp6tNAFYSHbR0jREUlJCFRBUZoyqaUCLMaCFI63ct4fQbLsup1mEFQAkb7T4J3LZpunAMVd4J32mrVHlpI0bfMnS+tw/Ndy9WF0jHVk9a26GWpmAHwHK3HHStqzm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFCmMeh3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFCmMeh3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso2193015a12.1
        for <imx@lists.linux.dev>; Fri, 21 Aug 2026 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787324362; x=1787929162; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bmv09nVrxkTx/RCEk8yEB9FeokGQe6GnMpeREDR5iZc=;
        b=ZFCmMeh3K0dqSNGXs4bGpXLd+f1NHtXzRgfwS7GfHsnjiix4ExUFlEoe0XByPcluuc
         EDZ/+cKphxVAXZggmFBpR8H+IDGFAFpmmZfoI3P8JuaSeuOJfTUbwmBcA6B8sUWGsVbG
         ZXvKeN/nHg03+dTWRLxblWOvOuhLZ1drvCNgmiQG3BI1Q4Dr2S+IqoZXpBL6rNkbNs0j
         94qXJGWUi0d87mnKkcVQ0OKKAIgp9DXuK/7uYBUSbIuhql0b/0zo/laKpdruVReGUHkr
         ZKVOcUEeGxIxjoAoP9H/+7yafUdYJvvGeqpU16M80TkmCZRxzIfOvZxLsJja8+AowY5K
         8Iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324362; x=1787929162;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bmv09nVrxkTx/RCEk8yEB9FeokGQe6GnMpeREDR5iZc=;
        b=X4Vrk1NAJRqxnKGpoIn7BE5X0HexUoJT6pVuMTeLY7OXXI7zAKATphmP4SZMUpKB89
         w0bLgS3ijjissKZF7LrqFy6lr5t4qB1xcycJmI2eUMKCMf0JIZTyHry/UxbQpOTs2Kpw
         vDot5h+iICxTcx3jLidvnkTxxfozQWg56PY499FcWONvrUzOLEyJhGMiUlU9Kdxiia4w
         bYxfKHiT9ezqojJ7htUW6ND/UfpucP5Cz/52zuHfgXTt1SHnit7tleh8jioYVSeFbv3F
         QKiUJGAnZ23Fa3jdvM/B8/tgzq6CljC7TGlSNujiGSSKH6FFZpv84tLe/PEZTdnMfUdU
         5eag==
X-Forwarded-Encrypted: i=1; AHgh+RpLqLznLhkj6z1o1dSW3Q0rHlhOlLPa1GnJiO6N151kHOoaTO6lABkq+ct71moyePATmUo=@lists.linux.dev
X-Gm-Message-State: AFuF++l7jXdfA/M9EdcB7lKs++hT3sA0En6vao0gXVhsZT64wdstnP8K
	L0U5EGLvDamGrcvLLbMjQsNa9v76ZZqHTpj68RmU00XQibCeHoC38swF
X-Gm-Gg: AR+sD122yKuzIOIYzPL60TISokjGYpmbipEFiERlk0a2vG9oQdbvA2dNDDchCgtPKjk
	T6BRN/tcRRGIvpy3FJaCMJEK3zhuMn+bUqxwh7Skfqd4YVicQq/NDQ95RQgCYOn+aL1or8dOyrp
	aT8GZ5YUxEWNHWeB7AWjWeKBk/5CmD55lsuXR9NkrppYzg/Zt+Izp2JRSqsykVpsW8B3TBFNHrR
	7MmPqaUHqP2IQdRhPEwy8aEQ1D+1gGAH28lJgVXvXKr9kYq4lSAbg/ka0WUwjbx6n3lmui9GtjT
	JFGgO3xELsVbFNXYg1GLfzfl7vJcEEFPqdugrsFzMGXTRWm/hCyU3rEVr8OOJfwMkvZYUIO/Wh4
	90z7ngHQa/c3cDxdfQ/w6queOS9hEw8wMQ74FFNKSRy28z1fvcpuzoJcuqm+hKSCJZjiCPcxVNc
	eP8b+DaP70Ant3sKVZsTyqH4nlh0vGfFNzp+EXcS1dOK6jor8HghoHPBdVl4dx24fATDXs9G97n
	2rFkKaXrQOPWjYhlPPQdtoUliT/TyCLcXBkSoOHATanaZ1Xrh0IRMArcw8L1r9DobbS/7JOfb0k
	afzjtU8Ki8s7MJfpeMFEC5YWbLGzDnVljhWdjpy1S9KovalW
X-Received: by 2002:a05:6402:321a:b0:69a:a4cb:2882 with SMTP id 4fb4d7f45d1cf-6a42f216beamr8673257a12.9.1787324362464;
        Fri, 21 Aug 2026 07:59:22 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm6577066a12.11.2026.08.21.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:59:21 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/2] arm64: dts: imx8qm: Add USB HSIC support for Apalis
 iMX8
Date: Fri, 21 Aug 2026 16:58:56 +0200
Message-Id: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALBniGoC/yXMwQrCMAyA4VcZORtYypDqq4iHLs3WiM7ROBmMv
 vuqO36H/9/AJKsYXJsNsnzV9D1V0KkBTmEaBTVWg2vdufWOMMSIYQ5PNdTX6nGxPpky+o4vzI4
 o0gC1nrMMuv7Pt/thW/qH8Oe3g1J2/bdeCHsAAAA=
X-Change-ID: 20260821-add-apalis-imx8-usbhsic-84c9cc211d1f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

The Apalis iMX8QM/QP routes the second USB controller in HSIC mode to 
the USB hub on the module. Add the HSIC host description for the 
iMX8QM/QP SoCs and enable the HSIC path for the Apalis iMX8 modules.

The HSIC host node is added in the QM/QP specific dtsi to not conflict 
with the address used by usbotg2 on the iMX8DXL variant. Therefore, it
can't be described in the shared iMX8 conn dtsi.

Tested on Apalis iMX8QM with the Apalis eval board.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (2):
      arm64: dts: imx8qm-ss-conn: Add USB HSIC related nodes
      arm64: dts: apalis-imx8: Add USB HSIC support

 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |  6 ++++-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  6 ++++-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  6 ++++-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 16 ++++++++++++-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  9 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  | 26 ++++++++++++++++++++++
 6 files changed, 65 insertions(+), 4 deletions(-)
---
base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
change-id: 20260821-add-apalis-imx8-usbhsic-84c9cc211d1f

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>


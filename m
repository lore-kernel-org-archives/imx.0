Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F97E30FC12
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955091; cv=none; b=sCURgkXif8NU7B0Dw8BJNZZqbk6EYBHuMrCNRARZV9coidpHxJ0ce7Km5INTzrfIiyrsV/HC6gK6JpQnjzOxJxPRAzbBsQ86Kh4ygMicA1BO+uhBIVN3FxLLWTyZSY6ecuSIkWaaQtv8Emw0jbB+HobbOlMwfS+diRV5IvD+vxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955091; c=relaxed/simple;
	bh=j2mLaGlX/M3OQYY3bEw7FU4VFX2tJvFMNYetvFqxJjQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gk9vD6G5nY4TTZMbtwlSqC48FuUX4Ao/K6PGQXrdovkX56BKQRbBWSf08zuMaoWC1oHFLDgdjt1AW4EM5taVMMubeR+xOQlRO4wxWXND0IZQTys0pqxwXxBcALZ/0hYwQlxRFu7ZP5iDbFo1APFLtoBa7UYpLi80v/eAJQh795s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=ohTnp4aZ; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="ohTnp4aZ"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b+iRqStKWjX0dVRN0JeDh3+qxY1BGSjM04HsYVWpNPg=;
	b=ohTnp4aZfpK9dyEdZ8LExroR5p0hMFxMlR/GkOjkck0/Uq71bRnX7oCoB9h5P6tfuKA/AK
	voJS4vL+cVUoCABI0GWLfLyMuTUm9VM7DfU8Bf8iGtTdghCLSMIO/OuOpnRmp3y6TULMmb
	y0f1WfIUomzwoeSHKEu7WBjliL2aQ+/dLom7bU8jXNX8t1XVOUjCFCw1w+Pkdyu28//VOT
	NAuvEnhkvTE0nvUBE5PouMW7xJzi1UTfVVp+wMijzldgZ9oLb7qAzS2U3yb5ydTxlyInKX
	tb8VUq4UPwd7mSwlj1XeZlvkUlze/kBuoL4XtfDJ27NvfyRv3imAlsWoNR9ksA==
Subject: [PATCH v2 00/10] Support ELE API in i.MX OCOTP NVMEM driver
Date: Mon, 13 Jul 2026 16:53:36 +0200
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBSEr0K69pm2xCquvIdhAe0DnkrbtIVgC
 HeXnxO4/DKTb2ZmEQNhZPdsZgFHiuTsCvKUMd1VtkUgszKTXCquhILBxxSw6sm2YHFKcCS8AOo
 ncNolD/hBqC5CGtMUquY5W20+YEPTvvQsD45D/UKdNv3W6CgmF777lVFsvf9XRwEcdH1tclXcd
 I7q8XY2BWfPBlm5LMsPW2kQHfEAAAA=
X-Change-ID: 20260616-upstreaming-next-20260609-imx-ocotp-ele-a512ddf96b03
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3600;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=j2mLaGlX/M3OQYY3bEw7FU4VFX2tJvFMNYetvFqxJjQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkj41d54T0qVsORIoxrNZZ9GJ7qL/BBbGDaktFije9i
 WB5N+NbRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwES+pDH8z5UxaCz9uVWV5/fj
 CGarVcFXTj7f6vYiTpVHyKtnUapyD8M/S9nFlllcN3lXi50xl3JlnbXV+8nfD48eyolO4PzU8aW
 PCwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

The imx-ocotp-ele.c driver currently uses the limited FSB (fuseblock)
to access the fuse registers. In order to gain full read/write access
to all fuses, we need to use the Edgelock Secure Enclave firmware.

This patchset does:

* Add bindings to reference ELE device in OCOTP driver (patch 1)
* Export ELE API functions (patch 3)
* Let the OCOTP driver use the ELE API (patch 7)
* Extend the devicetree of the Kontron boards for using the ELE API (patch 10)

The rest of the patches contain cleanups that were implemented along
the way.

This was tested using the 'crucible' tool and by directly reading from
the nvmem device on i.MX93.

This still lacks support for the i.MX94 and i.MX95 as I don't have the
hardware for testing on these platforms. As the documentations is
incomplete it is hard to get the keepout table right without testing
on the actual hardware. If someone else can provide the data and
testing, I can add it in a future version. If not this can be done
later.

---
Changes in v2:
- Adjust bindings to allow secure-enclave only for i.MX93 and improve commit message (suggested by Krzysztof)
- Export generic ELE API functions to be used by drivers (suggested by Frank and Peng)
- Move the fuse read/write functions to the NVMEM driver (suggested by Frank and Peng)
- Add patch to use __free(kfree) in imx_ocotp_reg_read() to fix memory leak (reported by Sashiko)
- Use device link to prevent SE device from being unbound while referenced (reported by Sashiko)
- Link to v1: https://patch.msgid.link/20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de

To: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Frieder Schrempf (10):
      dt-bindings: nvmem: imx-ocotp: Add support for secure-enclave
      firmware: imx: ele: Fix indentation in ele_base_msg.h
      firmware: imx: ele: Export API functions
      nvmem: imx-ocotp-ele: Add keepout table for i.MX93
      nvmem: imx-ocotp-ele: Remove device-specific reg_read()
      nvmem: imx-ocotp-ele: Use __free(kfree) in imx_ocotp_reg_read()
      nvmem: imx-ocotp-ele: Support the ELE API
      nvmem: imx-ocotp-ele: Remove the FUSE_ELE type
      nvmem: imx-ocotp-ele: Rename FSB access map
      arm64: dts: imx93-kontron: Enable ELE firmware driver

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  10 +
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |  26 +++
 drivers/firmware/imx/ele_base_msg.c                |  47 ++--
 drivers/firmware/imx/ele_base_msg.h                |  16 +-
 drivers/firmware/imx/ele_common.c                  |  35 ++-
 drivers/firmware/imx/ele_common.h                  |  15 --
 drivers/firmware/imx/se_ctrl.h                     |  14 +-
 drivers/nvmem/imx-ocotp-ele.c                      | 244 ++++++++++++++++++---
 include/linux/firmware/imx/se_api.h                |  78 +++++++
 9 files changed, 392 insertions(+), 93 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260616-upstreaming-next-20260609-imx-ocotp-ele-a512ddf96b03

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


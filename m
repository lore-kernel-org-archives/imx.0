Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433145;
	b=0vc8dYBmuFvf+h2uzk/5QlmkAIwHJUKTs1cdTmWCPpWEC6zlUy/t1Mx87Oz7m0FgOAeU
	 uTw/10sP1ypuZQzlJ7pWZTvztWbbSgWDSPubzfxErbe5DUd7Ao/vEMPo9QxiI3dkDsN7K
	 8AdljZM84BnxoU8Pk0jPWAo2OVdnyQ+8IOPeWLDvII0yS+5RIIvygX44cQZ8Z2Pb/eDtH
	 GBUKDIOZsY4mdQ+Z7T1fAS9+RDbwQqX1XtFvd7HZYNxBY4o3OlnsBnhV5/5Rg6h0qUov4
	 30CjNuyCtM9C0TI8C2GSMvickLVCcDiAkIZv6Rlx5KZ6DFYA8XxpkuWq3xoPDhpT/rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=FZTB+VKUReCx8XgfvlzddrAeMA7GwaWZltQEpDEq+1w=;
	b=29nuV+HtvCw0n5hCQJmPkkDK/7sxYN21RsQIGWdOVVsszFjmQJKU74zQOEGSH9GPPSvM
	 UJPYI5DvuDUS8GRXMynBE4CsxmBG+sa5B1XIkhWujiFaKruAU7sorm8l36lgfimCT67+m
	 tXYx4Xg8ocNGQLJL9Em4TL6qaBQ7ixSirBzTS8OUzJ96NwiUO0kKfs6drAYNn7wH2adGC
	 1wvmoB3N2Z7MeFGI/8wnTLFbbzADUzpuvaFWSXpWMQqIY0B0xsxS4xObLms7+9fJyd1Q1
	 aP20Ii1YPTHuNJR3ICjxw8PQoudUe1uiNSMLQaHiEidW8JvvMmCKQVxYv3vBsOVeL/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="XC7/GABB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520EC606A32C
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 11:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 520EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XC7/GABB
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4FAA92004F5;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FZTB+VKUReCx8XgfvlzddrAeMA7GwaWZltQEpDEq+1w=;
	b=XC7/GABBbVCy6qSUBLzaxbF1Tgdso6abzV0o+CLMO7Pyrc+E4bpaPHhMYOPvqBcnH6d8Kz
	pS744332w9d2Kp0QSlr2pLp+O5LG9/ly1US6YHoFz3jhhV4uM7cFIFjCgkeLnqFaedQ/8X
	t59iSGt91W1E5YUbdEfD5WV/CvRzJFxllHa5BlVFlLGFnpt08gEWlnnm92Qalp8YzLgSLM
	EhOje00UR1YbhXNIkbvE1YUmdZC3FMOe8XXkBTblXQzLoTUXRdK6aIoL+B25EFCLoV/oie
	gwBhmddDSciXPsBhRIct8uprObwmvLzcF1sv0cLEFyP88X/pa4wtRjCzai+/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FZTB+VKUReCx8XgfvlzddrAeMA7GwaWZltQEpDEq+1w=;
	b=CZKb7kQBUh/XBdr74KsMTSaav0Yi7PRhKkXpjI35Isabftlf1S41trm1bBY9rQ2Q/hl2YL
	Qmmjad12VNfrJkN/zhHa+QjU9aaLXBq5A7vtjkyLRSRoqZ8axd4oPN3e5BEBkRERDYX1hb
	CH1HCW9BLduGvjeWfcOI2e3zQrC2BT9jDEpalwF4oaKewpLpzMJi2NxB26aOfVHY+hCYk+
	rKK/3nj8XKBy1stxatUc925dn6NSryBENfIeK7M/S6ex5y4ucm3jEfuFKA5h5nuJ2MZWIA
	fyx94IpDLymJ9rdQstIPhuRROPv97OXsA3Fsy5DQfkD6m85/bhu4ryET8OANiw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=Px/bp4ZMaZED356D0hsShG2xnXTdCwbJlF2VKHrd0g1sRd1h9xMausOhY1EmQISVZ/QMUO
	tqqidIDPAUp1tgz2WaxyEVIDpYuvafWx5Oe9BJkefHqTwfE8WUwdvixgM5En6vdWpT7W4T
	znkivYous1GncOc4DJT0vdwepOQM9fjksa9J/SeSNXEdUSP10aXUInxU8SAtxeG9jL2j7p
	1Sn30dYn+ygxqbYanRUTyU7QOrD2vIrFkJCrBrU+Ww3TSJIVYgoM+ocb3LOyxhRaZ0qgEg
	UOY7FA7qYrZN/jomXKqWInUUR2p15ehJFz2/3qGS33qwc8SZbTZcOMgHj4luaw==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB3-0016XI-2L;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Fix i.MX93 FRDM hardware
 descriptions
Date: Mon, 23 Nov 2026 12:25:14 +0100
Message-Id: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2TVtDRU98R+GA9ItrAmFtIVgC
 P9uQY8eX2bmzQqBPFOAe7aCp5kDDy6BOmXQdLVrCdkkBiWUllIK5H65XdB606PlhQLm2hYmJys
 arSHNRk9HkFaP6sther6oibtnb3Qc4uDfx+cs995Pr/7oZ4kCr4UxpFSdvqgcybVT9IPj5WwIq
 m3bPsgMzwnHAAAA
X-Change-ID: 20261110-imx93-frdm-fixes-56f8d5ef0c66
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15.2

This series fixes and completes several hardware descriptions for the
NXP FRDM-i.MX93 board and the common i.MX91/i.MX93 device tree.

The changes enable the PMIC's I2C level shifter, describe the PCAL6524
GPIO expander supply and USB2 VBUS supply, and restrict USDHC3 probing
to SDIO devices.

Additionally, the missing EL2 virtual timer interrupt is added to the
common i.MX91/i.MX93 timer description, allowing VHE-enabled Linux to
use the EL2 virtual timer.

The changes have been tested on an NXP FRDM-i.MX93 board.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
Changes in v2:
- Keep USDHC3 at 4-bit bus width and restrict probing to SDIO.
- Move the I2C level shifter configuration to the common DTSI.
- Address review feedback.
- Link to v1: https://patch.msgid.link/20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Freimut Diener (5):
      arm64: dts: freescale: imx93-11x11-frdm-common: Enable I2C level shifter
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe PCAL6524 supply
      arm64: dts: freescale: imx93-11x11-frdm: restrict USDHC3 to SDIO
      arm64: dts: freescale: imx91-93-common: Add EL2 virtual timer interrupt
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe USB2 VBUS supply

 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  3 ++-
 .../dts/freescale/imx93-11x11-frdm-common.dtsi     | 29 ++++++++++++++++++++--
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  2 ++
 3 files changed, 31 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-imx93-frdm-fixes-56f8d5ef0c66

Best regards,
--  
Freimut Diener <f.diener@pengutronix.de>


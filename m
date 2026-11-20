Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167428;
	b=JisPkHjb/KocGPbw0i5jv6KSd4leV0+DdB2eam5LYH5cDomW3neUhOIaI9jgztfTGUOv
	 TwGYQxLYDrqbHiREjqat0WOLKVu34hBK0ryMvmQr06U2lIWTNgZtzzGB25BQbtfL0Z0bO
	 GKLOTUBttaHgmgf46xoyoqG8U4RLdMwdEIg6070171omtLBEJNyj5OXZDNkp0rXSf5eSj
	 xIlV9DZzcI40rrntIjtqWq3MwI7PcqwC4Lre8kOdvB9d9cmEBgYzN6/AvziLrNxqjTYY6
	 Ds4giWgoXwF+kpQGAC5FSW471TbNT1n9XbkIBslmmDsuuyiduO8sSQwmDxfZH/qI0DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+M8hWcs4E5N08OqYVtXoBpjInpc8kFOf9jqGSDXrooc=;
	b=TjKLMlH727k1Nj5kKCo8UP77sVJ7Zu4LpnfLQ9sVgkGKgpgY8J9kiUHPfCrWcT60X7vX
	 pB5LuR1VYcX20272HDGWJc9aBC2RykduI7rn1QbiDB7LsxG/UIP0SPzctyt9ob5Vj8HUD
	 aEvunDTYJdGMOPyRKlM89py5/qB0szNN2ZggrKcrGecJ+j4VAf8G7GOFNz5nJo8Q/qjjQ
	 kj+Sh5u7rBy4gyjAw/XC5FQ+dz4fPNvluVGvZVx9lP2O+94CxtBOtZDCp1bxwmmlp4vL2
	 wgg0e0epR/6TJ569qc67YtYRm/BR3fzJMd7CJjsKXf6v7MPyykrJBbP4acdBID+WSzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="S0/Kgf2p";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9577606A325
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9577606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=S0/Kgf2p
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 974A0205B22;
	Fri, 20 Nov 2026 10:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+M8hWcs4E5N08OqYVtXoBpjInpc8kFOf9jqGSDXrooc=;
	b=S0/Kgf2pAEJ7F+kSn/v+IMsSKfoej7749XbflY48WrcbcYnZClttYWM0zFQcFUbZjr7ob6
	ZozQhl+IdqsuPRylCU1Vx9CaZA9Jfbu6svq/5nqy5/6n/uPGJ1tdblKPZ3wpmB8F2eJy3m
	K8x6vJpjxU4UqfXConXnBwyAG89MGhY2foGhjh9wqi9xy2fbRupCd+/SpjaQzE5ZfS7J7r
	hBuOTaJ0hkYCD1Xhjnq8Jw4ynlarFCqJE0DMo/m3KfdNzKUnCpg0vg6cQkCOx20Tb74C+o
	O9iD9nKaieHgxOOA3ZRvbwdvlzu8ZGDnEFumq1ore+epRIow2b+TkRDJdQnYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+M8hWcs4E5N08OqYVtXoBpjInpc8kFOf9jqGSDXrooc=;
	b=eYxcoelSoJotssnavplj3Q9RMLZIFHeE94ZCqMyKIB4iqldfh0XtYTaYN6bcSjRIK4bsNn
	qgj3OWGUqBN5R8XN5h4Pf4avoLLCLZK/lb87b8f9r5xtSv7vuVMwzvDSUjLzYTh0a9SEkE
	rOsCVc/yWeapwcoDWqYC5jWRvpX0MYC3UxT920/XH9dHJ6bq5g/rnnMmB1VRxxxa3X2v44
	fv7VoNiIrTzgDvX+7YdGwZnCVSULOT9u7wHxHZSUz/8AzuTgP3JB/T1AWEIakFfcASqF72
	lP0lg/vcCsGzvPjtkkX7pOKGVoZQBkv74PrRqX4Bt6VEhnbul4btPskeWKC59A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167425; a=rsa-sha256;
	cv=none;
	b=VN8DGXOhoPfwH+qqZjXhV4ZHdjnVOtd2XHjF6OqNIrlszZKp80RjWjuzeC/1YtP8cK9xMK
	Wki4en5Kjcoy/8rfijSKsKVA5ZPCaJ9Xd4+xhG8VRjWU7YfpQv26dlDQ988F/ft+EhKdEa
	KQYoWsfsU9rYsVag12ac64K+RcBINMp7d+nONfB/Sm1p4s2iZnzr8bW2GPNndE42tjuMIM
	AKAL/Q6/r/kgTbFhzNPGIpj6rIYOdUWQr+XYEpWP288jC4dtLpM7mrfuZi9Z+iOfwVSbOa
	xIHG8dME5qGXYj6ScbA6NF7LWHJlukMjqJuJhxkzGzUlNXqM+ewfvLQGywBmkw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-03;
	Fri, 20 Nov 2026 10:37:05 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Subject: [PATCH 0/5] arm64: dts: freescale: Fix i.MX93 FRDM hardware
 descriptions
Date: Fri, 20 Nov 2026 10:37:03 +0100
Message-Id: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QoCIRCF4VeRuW5Ad1GqV4kuWh1rAi2cbRHEd
 1+ry4/DfxoIFSaBs2pQaGPhVx4wBwX+cct3Qg7DMOnJGWM0cqqnGWMJCSNXErQuHoOlqL1zMLJ
 3od8wqsv1b/ksT/Lr9wd63wH8Kr1DdAAAAA==
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
GPIO expander supply and USB2 VBUS supply, and correct the eMMC bus
width to allow HS400 operation.

Additionally, the missing EL2 virtual timer interrupt is added to the
common i.MX91/i.MX93 timer description, allowing VHE-enabled Linux to
use the EL2 virtual timer.

The changes have been tested on an NXP FRDM-i.MX93 board.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
Freimut Diener (5):
      arm64: dts: freescale: imx93-11x11-frdm: Enable I2C level shifter
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe PCAL6524 supply
      arm64: dts: freescale: imx93-11x11-frdm: use 8-bit eMMC bus
      arm64: dts: freescale: imx91-93-common: Add EL2 virtual timer interrupt
      arm64: dts: freescale: imx93-11x11-frdm-common: Describe USB2 VBUS supply

 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  3 ++-
 .../dts/freescale/imx93-11x11-frdm-common.dtsi     | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  8 ++++++-
 3 files changed, 35 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-imx93-frdm-fixes-56f8d5ef0c66

Best regards,
--  
Freimut Diener <f.diener@pengutronix.de>


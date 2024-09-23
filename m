Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A31CA84
	for <imx@lists.linux.dev>; Mon, 23 Sep 2024 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727104464; cv=none; b=ufkJQLv6akHv4llOqslLqzqspvmRMmwoV0V5ivSYoni8LPipRGBgQX1pbH/7saC8F8oO08nnb7syfgznMr3qFkqyjGzsgTXjS9VmaZYe0wWYAshOapG3OpdR01+HjN1JNBLZq2sswOFPkvYESstJaBaaah4PGskrvmeUxyJ/EyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727104464; c=relaxed/simple;
	bh=WDXytlOPylaw8vHOvWAB3UnxkSH7kzqKouEgQkROwF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PIZRLV17DGr1nuK5hyDeMjHAguk/NBUGFSzyOmMfHnEPRlg/Rkmb0y9mmdTagywSkQizbKsglAMQBNzn32x5SmkPniSAlRpG+CbUBa9xLkYcTpIgBa+emt8XK3zdwn9J5GrMQxgz3z2wRAGC4Vt8qPZ6MQCMa0ppgwN3ag5cD7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=HtQzKfwZ; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="HtQzKfwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1727104460;
	bh=fh4wDkjBwieGfhDRU61EZTzebRURhMzm9ZL/62vlTqk=;
	h=From:To:Cc:Subject:Date:From;
	b=HtQzKfwZXc09ashZIl9PXG9ggz7wC78fzF3VDzc/iAgFScPIH1rIMMB5j3YgKhqB+
	 mdCmMRuhvyuoermkQTkIbKIxolsg3O6kSrALoAez6WZhKJHH9ytyqRkIZN5fitveYL
	 XReUFh29j3rEFjWYY/0EEK2zGBWbHSr+qssS6pV4=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id ED723A025E;
	Mon, 23 Sep 2024 17:14:19 +0200 (CEST)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Petr Benes <petr.benes@ysoft.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Michael Walle <mwalle@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v3 0/4] Add support for new IMX8MP based board
Date: Mon, 23 Sep 2024 17:14:13 +0200
Message-ID: <20240923151417.1665431-1-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this series adds support for a new member in our IOTA platform.
The board is based on the i.MX8MP SoC. The first two patches
add support for most of the board functionality except USB Type-C
port and some other minor things.

[PATCH 3] adds new device tree binding for a Diodes Incorporated
PI5USB30213A Type-C Controller and [PATCH 4] enables that port on
the IOTA2 Lumpy board.

We also wrote a driver for that Type-C port controller. I would like
to get that driver upstream as well but I expect it will take much
more iterations and effort to get it into mainline-ready shape so
I intentionally excluded it from this series. AFAIK it should not
be a problem to accept a device tree binding for a HW that does not
have a driver in the kernel yet.

Michal Vokáč (2):
  dt-bindings: arm: Add i.MX8MP IOTA2 Lumpy board
  arm64: dts: imx: Add imx8mp-iota2-lumpy board

Petr Benes (2):
  dt-bindings: usb: Add Diodes Incorporated PI5USB30213A Type-C
    Controller
  arm64: dts: imx8mp-iota2: Enable the USB Type-C port

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../bindings/usb/diodes,pi5usb30213a.yaml     |  88 +++
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mp-iota2-lumpy.dts | 517 ++++++++++++++++++
 4 files changed, 607 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/diodes,pi5usb30213a.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts

-- 
2.43.0


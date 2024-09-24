Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1D19C545
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174411; cv=none; b=R7jKrIsPHQ0Lboivc5h1jRyQ3jROvtJMZGPJnTZKPYqB2rorl+NLcrK70bEeoQaoTg7CGYzFE1YYMSyamL+78Fj/qrQbZ2HjX716iSLl+/4gtWz7kmktq4TEO/ti2W44HAK+7aIsWELaJhgqjTK2NEhFS5mAADeE9xa8IZ9te5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174411; c=relaxed/simple;
	bh=dNP4cVkYeMVPCUAl6V9ZNPpmFdKOOmK3mbBZjBEMtfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UVNDWwiB2asnP073Ol7bnnZK2V2vjv5uQEkBBpo7YlaYIll4mWXo5Abu/mKDDJ8H4+aa5p0HtOnvceBAZ1dstfuTMkI9CeECn9lzwjXnjqWIdzFgHd/ltzW+Gc2bI35jhPPZ1e+sf5D98x6iPhfE7kN5vBfdfzRkFUUrEfe7c6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=pC8Ot6Kn; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="pC8Ot6Kn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1727174401;
	bh=b/byf2gL4R1q3RchD94jm7yV/wDyD9oU7cKPxmILi+0=;
	h=From:To:Cc:Subject:Date:From;
	b=pC8Ot6KnQD068NvG3k6OTdpC8op+YBVCyBGgBeMfEVA9YrSNM0bljqt+xkeGTqYry
	 aD8EZKxpYkXtXbs0E5hRAePAjBFrptqUVqiMDue5rDIEL6jEhaT/SYCb2OOD0Kq9zo
	 27Q+qEQ+w79e68A1nhfXmEb4k9OQXMh/QPbvlpzU=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id 497B7A0419;
	Tue, 24 Sep 2024 12:40:01 +0200 (CEST)
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
Subject: [PATCH v4 0/2] Add support for new IMX8MP based board
Date: Tue, 24 Sep 2024 12:39:39 +0200
Message-ID: <20240924103941.1729061-1-michal.vokac@ysoft.com>
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
The board is based on the i.MX8MP SoC. It adds support for most
of the board functionality except USB Type-C port and some other
minor things.

This series originally included the dt-binding for that Type-C
port controller but I finally removed it based on a good comment
from Krzysztof. I will post the Type-C binding including the driver
in a followup series.

Michal

Michal Vokáč (2):
  dt-bindings: arm: Add i.MX8MP IOTA2 Lumpy board
  arm64: dts: imx: Add imx8mp-iota2-lumpy board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mp-iota2-lumpy.dts | 423 ++++++++++++++++++
 3 files changed, 425 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts

-- 
2.43.0


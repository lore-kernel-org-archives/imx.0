Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA7C25C802
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597907; cv=pass; b=M9H9bnMTbTyOeK33eW6Iie3xnENGNgygjhgXaLkDxACmU10h2iLn6LfYe9an4sd9Rda6H5UohBxW9gFhUzCEFGl2qVbHeIrxKlSarERD+Bp5zCZzbOx+WWPvdkw1hwsBytMgA91VdEhNjUv6OTq/6ubHnEpdXRPmyvR5zPOZB78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597907; c=relaxed/simple;
	bh=UR0qhsOgq/eZkHuVUougHFosvJPvBioheeVjjazTi+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BBZ0H35IWxvMEkEMo8SZ5ug3vaCqaOvEH17ViAVO4kFV6olFc218+7XIzGdMBNpwH0FJwp1rMZJuuzR2/G9lNImmDRWN3WAueLsJxAjPk0dCUVtikX66vgZ4OZow2w+rlzCef+7lYR5pq95i1I6+LEkrBZR+KsfUDs9WG/c5c4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cMfz8kxS; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cMfz8kxS"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=BB7YXaZxdMr/OyB4DMLiNUgJ/jOy4ltGcN2VfVrivUs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597882;
 b=ZCihWTpplQqigivYao7/gtqaHL/+3J7NmZfNTat1E5H+bNJ70qn8iT6txJYv5ePnO62zYjcc
 H+YqxhxbG/3mUHqhykmgP2hI7xr30gUUZwoXu/bty9zT5YbeqNVipM1Q2WPYa7d5NhDbHE/gqam
 /r/NB/w+41YPFczdC2HvRw3VznvuhZEiY2bH/QQhZ5jLg4g0h/Q11z+8rLfqCnTTKIw44FvtpAo
 UygXhXYRxlx2gZtgflQuayIYgIPS8WbESA7XpW3v0/MVl0SJYP+U31DNBldMqK1We0hh5YzFruP
 sM/sKCx+r2OvuTWtR60Z03Ko6TTgYo6BHQaU1MTzNkhVw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597882;
 b=fkpUjUwtVwtDK1O4o/MKJ8FI53j7juoXewxFkcnJSxsyt6TVaykMj1kWvLvpI/+AWXx96/AN
 M98fGHwHUa1FlkOkfekosHJObU/YxL+AAhq1QbdTcyx1LNtPEAkqsyKVnkM0KEmB8XEgYgNCuCg
 TXSF1vYqYteJZg/XHpfCRd+cuFBmaRMk5/gY7zHpV5Lq80kySmW3RenGXFdXkvcOy7zwNmA7H6M
 bb1ocvfL5XvlGubFQWPvSBfI1jW8zTu/d2r/QOQrmTawiMlnQ22nQsX775yvTRZU6y88YiQ1jp+
 LWq6ZINhgZLjKG9Prv+4/FapVaSnk6HGAEBw+YnfVrDxg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:31:22 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C44FA22059B;
	Fri, 20 Feb 2026 15:31:09 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ARM: dts: TQMa6UL: modify for use in bootloaders
Date: Fri, 20 Feb 2026 15:31:01 +0100
Message-ID: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4fHXjp3cjnz4MJhF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:b1566e3922d347dbabbbefc880e0b021
X-cloud-security:scantime:2.493
DKIM-Signature: a=rsa-sha256;
 bh=BB7YXaZxdMr/OyB4DMLiNUgJ/jOy4ltGcN2VfVrivUs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597882; v=1;
 b=cMfz8kxSKlMVgcldsaXNR2VOFj3eDolST5ID6I7tpiBp3Kj0amE5BBZfMs3FgGnZxYorD40E
 XoJeH3WK3hWpASm75GGsa/i3KZZMhg6+ArFAWAPqbJqJwM9PrJft8HGNpmGPtZQleEvfMQPxjF2
 znP1c0ZJ1TnkyCNelxAmJu05AZunJ0tePmRUS6iDBXwyiQdFyB6rTkKXI48dZE2lMP3ektYRkdB
 d2Cb+wPf2rCHkP/oK+zcTAWMHEl0ZNpt0Eh8s/Cc5MwOwrr9IJzE7sXJ1P1iAcPhsL9Kn1TIw9H
 ecCLTvnjyCHbPtEceAITBitJC4u19IWhx5znru3Ofo9MQ==

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.

Changes in v2:
Improved commit messages for commits that add boot-phase properties.
Add forgotten boot property for the spba-bus in imx6ul.dtsi.

Max Merchel (4):
  ARM: dts: imx6ul/imx6ull: add boot phase properties
  ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
  ARM: dts: mba6ulx: add boot phase properties
  ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems

 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi   | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi        |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi                  |  7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi       |  1 +
 .../boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi      |  3 ++-
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi                 |  1 +
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi                 |  6 ++++++
 12 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.43.0


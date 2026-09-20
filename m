Received: from v511.v5ed9ac7d.euw1.send.eu.mailgun.net (v511.v5ed9ac7d.euw1.send.eu.mailgun.net [141.193.32.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541CB386435
	for <imx@lists.linux.dev>; Sun, 20 Sep 2026 19:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.193.32.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789932140; cv=none; b=U9wvECZzJAoxl7OJiZ65uVGCesT1i5zVWMjqwDew8zyfuBQvpWfP0k3UT9XevtTTcP6dQczDRmz7sly2h9Mlwxn+cxTH6hSGoihZXFD+vNGcHQ3w2c3zJ4xn3m4IZMGHagmIvLOFyTVAe/VBCD7HzaOQDYeiC0tMqahO7ZqfN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789932140; c=relaxed/simple;
	bh=kC5j9r7oV30Xsi7O1+VYCu87aZzzmofDx61IuZdJkQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S02xarL1M8dkf4iUbpSVw29qz577LnsRBCSTsWlcq2trR62/e5e+wfUQaG5pkMn5MGRqXlNKY+8DzKN0B+3htkBX3aq4kHp7Clbk9Om13GtQ1SjTsK/YIFLdkP+aawb28oTFtUlrLLTD4l6WhUjpAi48fcqcEBumTy65x8HJbNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu; spf=pass smtp.mailfrom=plajta.eu; dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b=f5fEDOzz; arc=none smtp.client-ip=141.193.32.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plajta.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b="f5fEDOzz"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=plajta.eu; q=dns/txt; s=s1; t=1789932135; x=1789939335;
 h=Cc: To: To: Content-Transfer-Encoding: Content-Type: MIME-Version: Message-Id: Date: Subject: Subject: From: From: Sender: Sender;
 bh=dvTZ7hwDigE1TUR0dsMQH/2HfcjkM4rogOQWqvzHFxI=;
 b=f5fEDOzz9CSHVY8j5j1r4uJ2YbHrJGUf6pFkMAKgi94gZNoQLjvlZTH11QvGgyuD1R4sj0Z4keT9/0cmaQ8Agr7Vx+WgKwmGvITyc0n5kGvn0CN6Bv25q1BX9NS/k88qXF/WcP2PHUmUzKHYkQfYSqEGL8c40hRkF0xDAjv5tBTbivC0aYphd/3RO6GcA/Ceapb85lU4w9B1eUsZ4LGwobPwj/hj8MPu7scKuYSs8Vjkkp7FXlaHHGhAvpMQCDojNAgToWAXWxoJRMFp99CojmtjYn71TiDaJE4OX7zlrK2/L82Von5+fXpg1otOY40UxjQxw3+bjwsSGyUMBiyoXA==
X-Mailgun-Sid: WyJlMTA5ZCIsImlteEBsaXN0cy5saW51eC5kZXYiLCJhOTI0YiJd
Received: from [192.168.1.219] (ip-86-49-238-222.bb.vodafone.cz [86.49.238.222]) by
 62dde763711f91b09babc141eb112fb8433c3bdf14f6a1f222f9cb9a27a17a83 with SMTP id
 6ab032663fa6daf3e8258f16 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 20 Sep 2026 19:22:14 GMT
X-Mailgun-Sending-Ip: 141.193.32.11
Sender: andrijsalivon@plajta.eu
From: Andrii Salivon <andrijsalivon@plajta.eu>
Subject: [PATCH v2 0/2] Add support for Amazon Kindle 4 (Yoshi)
Date: Sun, 20 Sep 2026 21:21:36 +0200
Message-Id: <20260920-imx50-yoshi-v1-0-b8a46b3a972f@plajta.eu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0Q5DQBQFf0XOs02uLaL9FfGg6+JKSrNXRSP+3
 eJxJpnZoOyFFa9og+dFVKYxQBJHcH09dmykCQxLNqenJSOfNSPzn7QXk1NSF2n6yFrHCMXXcyv
 rdSuxWFS30997YDefG+z7AUT3IoVzAAAA
X-Change-ID: 20260920-imx50-yoshi-601a84435fce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andrii Salivon <andrijsalivon@plajta.eu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789932134; l=835;
 i=andrijsalivon@plajta.eu; h=from:subject:message-id;
 bh=kC5j9r7oV30Xsi7O1+VYCu87aZzzmofDx61IuZdJkQs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgRPkrbhoPH7FSvHGDzrn6ac5XixtTH
 LGWklZFOfCUTc8AAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDt81TQDuwkiSn0sKElpmCdqSi9f7xf6XAtpU1Zn6ry7vj6C1utSyEUv0nQK1M6Moj78aO0VYs7
 4oz+kt4zKaAI=
X-Developer-Key: i=andrijsalivon@plajta.eu; a=openssh;
 fpr=SHA256:NIrmQeSA8iZxz4K2sBePBO20E3POR1tDuMtfPGdgY+k

This series adds the device tree binding and initial board support
for the i.MX50 based Amazon Kindle 4.

Changes since v1:
- Fixed alphabetical ordering in fsl.yaml, Makefile, and the dts
  iomuxc pin group entries

Signed-off-by: Andrii Salivon <andrijsalivon@plajta.eu>
---
Andrii Salivon (2):
      dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
      ARM: dts: imx50: add support for Amazon Kindle 4 (Yoshi)

 Documentation/devicetree/bindings/arm/fsl.yaml   |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile               |  1 +
 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts | 59 ++++++++++++++++++++++++
 3 files changed, 61 insertions(+)
---
base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
change-id: 20260920-imx50-yoshi-601a84435fce

Best regards,
--  
Andrii Salivon <andrijsalivon@plajta.eu>


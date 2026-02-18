Received: from mx-relay72-hz1.antispameurope.com (mx-relay72-hz1.antispameurope.com [94.100.133.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68452D46B3
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421105; cv=pass; b=UZGDADk/sxLj18lU9XoWYacnLh1EWCFVsPOLqLGG8YXq940xIxL6C8EB7xlAjiJBs8jlljVw8QUlLFaIVKlCv5Ju4of3YirkWD6lSLKjFpDHx5IL+VK7LckjepL4cL7vODDt6BidOMTmdoEtSiyYCav97bHhP4ghmON6fjcYyE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421105; c=relaxed/simple;
	bh=rSPbM5+Rb3I1xzzbNQ/UovTcKhQaTCFQZgGkBjh1434=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H6rDUnW/ZpqNSTaahqyzONRqpjuXhl+OjgOyIGK1w/1TmviWMjRTtv3sU+rBNIvcwLDyS29Ff0kXyiSMcSQuHLrjlk3oYDhfK63gq8Xln3aTIrjHojqMaj7JRe9a7E81yu4YYbaJGpfXMWg0R0F+kxMxHfBCMhOv6SOflWYsOqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Eb0ZIjIn; arc=pass smtp.client-ip=94.100.133.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Eb0ZIjIn"
ARC-Authentication-Results: i=1; mx-gate72-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=26hFcz4YFdUZ64qcDiMi0nzQrtZxfOFCZaOcVUH9w7M=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421035;
 b=Gue0GiXjidND53iM79IwIkS5eurqVfB9ohfHrBrwRC6KSrnvcraDgl+Cpg7hfZn47yxJrrzs
 Vz97GzcCDhqnNQ5NUxdyW46GpR0BqPR7wc8QPy1mVNh5mjPn90MJ6UFbPwzPFTIcSgR6TvEKvLf
 1AOi6j2zWyd3bBY2mY04SbKJob+SeQZ/SuO2WHzDgrC2IoORAQyvXsqfOeTHGqpJsFkQZFVMz6q
 eT5/w/bTvDoL5MS8giGhGEfGDn5ZfJuGx8R1ymaPaXt9fT+vlZ36UYgMnp70vNajDSHvnmC2hdu
 f7ZTD4M9gXUUbx2npBOWSjQcpHO4YD/JDojX/KC1i6awA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421035;
 b=PqHEKbDUpYGDINCWAY7Zs5uUNl+FdoYSnrB+7VeuG3kx2LZlq2sM6HSGwNuEuSH6kp9OugI9
 rLxoQbD5777owwx8qKhwWS2dj5nwcOZJPF9t6Cca5lcoo3LaKGLJbycHmoXJHXXCDZbZXWG/Yvv
 ZxEMSkNRNOfozpaRmUBznuyBhU05ooH0mYv96ZgemVg5VWv8SSme73PP6Qah4uRuzKvzQbX9j9u
 +xAzxf3fEEp2eicBMNY4xgeqt8YzQf34GJNWSk45LxCow9cvvVBwNI98k/4enUfsERT5jX5T3G+
 E1u5xu4HFCF2x7r0Bf/hVVnlwxzrJTJfauVZvD/W5T2tQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay72-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:23:54 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D060B220568;
	Wed, 18 Feb 2026 14:23:42 +0100 (CET)
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
Subject: [PATCH 0/4] ARM: dts: TQMa6UL: modify for use in bootloaders
Date: Wed, 18 Feb 2026 14:23:33 +0100
Message-ID: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay72-hz1.antispameurope.com with 4fGHJv3yZYz2PVB4
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0bafeb34a22a86651aa13410244c885a
X-cloud-security:scantime:1.972
DKIM-Signature: a=rsa-sha256;
 bh=26hFcz4YFdUZ64qcDiMi0nzQrtZxfOFCZaOcVUH9w7M=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421034; v=1;
 b=Eb0ZIjInU01DiC9Iq0LuVKlbZgvGgNKmp4ZTngwUTCcGpaDvT9F3/e9j0LACYy3b/QJ94/dZ
 TNfhdu9wY7pnTf52f/cJwsPVZJ+WUdiTpPhtC7GUzAlOh7AYTzlmpe33LZeCO2HtY0AsThLa5/P
 tvTUtHM7HCHEQhdJcChNQXH8c+9AddSXvJKATYCoAuOXpEbHx3Cr9VfZ+gxEVdsW/Ai5XQlrt/3
 LaVjQq5xPluKCE2FEMS8WqwgEkiLOYtVZ+d2HJ2w/CJvOFlZN+1rtxscDI8M4ROWZ0tSJRuSQVQ
 kebivs3JEbqXzDLkWPk7kpJo19ETVl/p+lrN/NjuiMFOA==

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.

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
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi                  |  6 ++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi       |  1 +
 .../boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi      |  3 ++-
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi                 |  1 +
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi                 |  6 ++++++
 12 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.43.0


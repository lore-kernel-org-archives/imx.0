Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762EB17E
	for <imx@lists.linux.dev>; Mon,  2 Dec 2024 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138566; cv=none; b=BtGA8o5gYmpff65cLNd9/C6RgrbpS7ZSUxC7znhkjtSJiq8NKOHgpLYuMrxiOP+/nIG/E3RU4g3XxcYGkcUZssO06LxbJZ41l96aMPqOYYfnzbhiL/sdja/8ZnzDvRAy1ukRCywJHfa8n4hDf4n0siWpKiy13geodO6yqWj9RTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138566; c=relaxed/simple;
	bh=yYY6UVZGGPjEaxvwgj6lfAOYs8yXP5MAIF40HOIAKuM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EwTbAMCky4Fxkhg/lyH5CceODnMmhTYPXlbghkGpeGLpcMJzxaMKn/HICR7AcSgZ8pk+fTHJaI4tVd8HPvvNjIesYkSAWhxUhwl14RvSjzbaaRvgL1+hXl5TBBH8u/MovLXt7kCUgUhff+1TlWZ4GGw88SINO4Z23YsRcSqAJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Ve-0000UG-EC; Mon, 02 Dec 2024 12:22:34 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vc-001Hsy-3A;
	Mon, 02 Dec 2024 12:22:33 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vd-003R1L-28;
	Mon, 02 Dec 2024 12:22:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/4] nvmem: imx-ocotp-ele: fix reading from ELE OCOTP
Date: Mon, 02 Dec 2024 12:22:28 +0100
Message-Id: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSYTWcC/32NQQ6CMBREr2L+2m/6KxHiynsYFlgG+Im2pEWCI
 dzdygFcvpm8mZUSoiLR9bBSxKxJg89gjwdyQ+N7sLaZyRpbiLFn1tfCeIKDC9PInS5I3JUPKxc
 pBQLK5hixF1m815kHTVOIn/1kll/6f28WNlw0rTPGwVZVdxvh+/cUg9fl1ILqbdu+R3+sJrsAA
 AA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peng Fan <peng.fan@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 stable <stable@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733138553; l=1708;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=yYY6UVZGGPjEaxvwgj6lfAOYs8yXP5MAIF40HOIAKuM=;
 b=IyiH7dNwx3TDJaMvyHgiKlUx4MOxAGSizpDngcE1QG9+Y7eDNVWmGSzsJy4o627rYktQUOpos
 aptGTe3jxdoBtjiJqyE9wwyq7tAcvxBx+40ttjKsT7ATUXSxtfEx14J
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Commits b2ab0edaf484 ("arm64: dts: imx93: add nvmem property for fec1")
and 0d4fbaffbdca ("arm64: dts: imx93: add nvmem property for eqos")
introduced NVMEM cell bindings for reading MAC addresses from the ELE
OCOTP. This doesn't work as expected due to bugs in the driver:

- imx_ocotp_reg_read() interprets the incoming offset as 32bit word
  offset, but it really is in bytes which means the driver reads bogus
  values whenever the offset is non zero
- imx_ocotp_reg_read() reads wrong results when the offset is not 32bit
  word aligned
- MAC addresses are stored in reverse byte order in the ELE OCOTP, we
  have to swap the order before passing them to the upper layer

This likely went through unnoticed because the bootloader normally adds
the MAC addresses to the ethernet nodes and in this case they are
preferred over the NVMEM addresses.

This series fixes these issues.

Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v2:
- Add Fixes: and Cc: stable tag as requested by Fabio
- Link to v1: https://lore.kernel.org/r/20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de

---
Sascha Hauer (4):
      nvmem: imx-ocotp-ele: simplify read beyond device check
      nvmem: imx-ocotp-ele: fix reading from non zero offset
      nvmem: imx-ocotp-ele: fix MAC address byte order
      nvmem: imx-ocotp-ele: set word length to 1

 drivers/nvmem/imx-ocotp-ele.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241023-imx-ele-ocotp-fixes-f7b216171e1e

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


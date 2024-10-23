Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBEC15852F
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729671164; cv=none; b=pM3p3n5K8yQaP+FZYuNOfR1i/Dy0Ix/627muf1Cch+NLjCUrMTpyyKzWklFTdaSN+TiAMv3daDE9sh2ZDLUZWEy1fYJyTiKb3Dx5X6s+g1zJBNjCDTnFijAN8eflBm2oP281VNA+n4HzQY+ZmUb1GCLRbYd8fusJqFBP1zfWceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729671164; c=relaxed/simple;
	bh=lJmLv8QEgZj8qr68MkJgML54hWdN7FQAB/B9Q49TT8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SnbIuyH8xGUBfKpa5bv/Oxhp7XLg9WwTq29yNqoMZcgmBibgKLYFV/sq55yjyeU4eYxYQg+fpAg/QSTe7mZy/4GL2pVtbDl9hbZj/aT7YQ34RmQXvrEm4GZ/S/6xLEZV8Qm2BQ1glCHD4RjrFdPtYSnG56J6hVnrjC3RxjCKC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTv-0004YR-3A; Wed, 23 Oct 2024 10:12:39 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTu-0010Hh-1X;
	Wed, 23 Oct 2024 10:12:38 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTu-00FrPY-1J;
	Wed, 23 Oct 2024 10:12:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/4] nvmem: imx-ocotp-ele: fix reading from ELE OCOTP
Date: Wed, 23 Oct 2024 10:12:27 +0200
Message-Id: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOuvGGcC/x3L3QpAQBCG4VvRHJsyS5RbkQM/3zKF1a6kNvduc
 /j09kYK8IpAbRbJ49ag7kiQPKNpHY4FrHMymcJUUpiSdX8YG9hN7jrZ6oPAthmN1NIIBJTO0+M
 Paez69/0AxNLX7mUAAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729671158; l=1527;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=lJmLv8QEgZj8qr68MkJgML54hWdN7FQAB/B9Q49TT8M=;
 b=23/el6pD17uTVtS0E0e8yELD1xfAn93eobVXoT2FIMgXaKQMtd+nxG1fLT827oM2bNGnu+SXE
 Ur/AB/JB5/lAh9m5STiha+xFcrTUCFA3nlQltTXKREjaelINqoQWV0T
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
Sascha Hauer (4):
      nvmem: imx-ocotp-ele: simplify read beyond device check
      nvmem: imx-ocotp-ele: fix reading from non zero offset
      nvmem: imx-ocotp-ele: fix MAC address byte order
      nvmem: imx-ocotp-ele: set word length to 1

 drivers/nvmem/imx-ocotp-ele.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)
---
base-commit: c2ee9f594da826bea183ed14f2cc029c719bf4da
change-id: 20241023-imx-ele-ocotp-fixes-f7b216171e1e

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


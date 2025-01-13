Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3996F1CB51F
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806388; cv=none; b=bLPSZL4dRRCRKtbL49KJtmVE8h7a+knbRL7VDnJgnj2cvoKrsWRaqlSzsx2uePml1y04grTEuKoD5qq1Q8+6bdeF0N6wMa4/EnbCvY1+nTXX08ok1e8KxUk2LlL4jVDmP3J5aCpEACM2HLf2G3yShWqytqIUQsWG68NXUlHtzxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806388; c=relaxed/simple;
	bh=0tSxROtZQMTtFihkWa9QLAM2GvlunNuLL18JI7+Oneg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P8Co/CnYdlgNOd98t49gDTicBwZ9rW3Ax1ydUVazqyGXWIvpb/V+8MXd7T0PGMPtxfikOytVXGpZoya75SHUtV0fqQNC6jzftq7ybSKaqc98t9sUIfXm+CPY5WSI9xlg+WIGesda2jTpP0vtVnJIL1VXvLmXpeoC3LDGJA66Y90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSgC-0005dH-7V; Mon, 13 Jan 2025 23:13:04 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSgB-000KYE-0x;
	Mon, 13 Jan 2025 23:13:03 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSgC-008nKU-1W;
	Mon, 13 Jan 2025 23:13:03 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:13:01 +0100
Subject: [PATCH] MAINTAINERS: match mxc in file names by IMX / MXC entry
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-b4-mxc-imx-maintainers-v1-1-7605d3d8e35f@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAOyPhWcC/x2MywqAIBAAfyX23IL2oOhXooPpWnvQQiME8d+TD
 nOYw0yGSIEpwtJkCPRy5MtXkW0D+lT+IGRTHTrRjULKHvcBXdLILqFT7J8KhYiztVJPRpmZDNT
 4DmQ5/eN1K+UDMAyDFmgAAAA=
X-Change-ID: 20250113-b4-mxc-imx-maintainers-8ff1c7dad8ed
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

There is a number of i.MX-related drivers that have mxc in their name,
but are not matched by the i.MX MAINTAINERS entry, most notably the GPIO
driver, which is still being used on current SoCs.

Looking at current files containing mxc in their name, all of them are
related to i.MX, except for:

  drivers/iio/accel/mxc4005.c
  drivers/iio/accel/mxc6255.c
  tools/testing/selftests/powerpc/tm/tm-vmxcopy.c

Therefore adapt the regex to match all mxc files, except those above.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 520612b3d26da0a7ef9767faf02e846711a339e7..4aba97eac41758ae27c8fed61bd406241f69809f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2475,6 +2475,7 @@ X:	arch/arm64/boot/dts/freescale/qoriq-*
 X:	drivers/media/i2c/
 N:	imx
 N:	mxs
+N:	\bmxc[^\d]
 
 ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
 M:	Shawn Guo <shawnguo@kernel.org>

---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250113-b4-mxc-imx-maintainers-8ff1c7dad8ed

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751900;
	b=Mx+M0SLBfHYar0UwigUuVcgb1ABdZkoGUYLyYvqueZH+HU1tI7jvy6TRSrkrlSI+//r1
	 XH21NVx5XOq9tGDVoe5jbChFiAfCC6J7t0zJf+/Vh6+PLb66oHF1aEQmvP5RZ+mTrpxFe
	 euoZbhBNKcyIMkmAiYEOWWWFp6h8r929lbiIobcv51A+4tO2WnjpTrCagl9kXDNnUAo3E
	 U3BJsoDy/voU7xWsscwPP7VBWPeZ6wu7zRHZ3WMHM0tjFpbJ9nxi+TzylHQjf7J80TYKL
	 HQLL3XFcPEE25lmP1VDYXqZ7UBKotVgII0CZa1Q3EIEvuuj7xo9bs6htzCD7pXCNtIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751900;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=a8ettMTIMLv2Wh6ztg/2TP5SGbNIvkE4ulbl7gtN2Rk=;
	b=McbkDAxFyixDuxwmfMO1ECYqA9Ndn1wmKj1XjTvqw3xn/b3ScHp965PJM0DkKiRAEsV7
	 PXWHtRX1/w5MqSy4+qrYUnAcSCfcVCsrMgBKF5pQvRt3i+/xtXikOC98oCmLz+KdOuhyJ
	 gLEwrJl86bdRltwRUobtygvZwLfI4P1KV3tu+xn9xdDOeBGG3OjE7l3nNm5+keu4AaZtu
	 ylj0NitLSSkQ0OoCNuQMKqh50zQg1+WPLORBHx2PpFidPdyQkbGdFY+LOVvjcRbsDGd3W
	 cf4YG4rWA/BVgoCOJwfVL9ZMcTFGe/nsj68KFrUH0sSs9pkPa4cye0iooHjKA/OReNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NZCmnVXC;
	arc=none smtp.remote-ip=91.218.175.32
Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F07A606A323
	for <imx@lists.linux.dev>; Sun, 15 Nov 2026 14:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F07A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NZCmnVXC
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=aPxa4y3+ppxmpAAuJ70W++p4hkmg2eJERKnjs9y4jWo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794751897; v=1; x=1795356697;
 b=NZCmnVXC7qxU1dw6OfZEl8mzxNY+bk1+Pzf9KIvRNb3qrU81NHXNTBwgl+SPUbXmO/H3k/JB
 AoR65PIvRjWMjH/YS84ZSTG7n7dYby+f4TN/sQDYpi+rHoXaoDBwInXpcj67GkEk8HrOP3vlqMN
 HV6X8opinCETepsMaLPSc0UI=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4b04229f9dcdc18d;
	Sun, 15 Nov 2026 14:11:37 +0000
X-Mizu-Trace-ID: 4b04229f9dcdc18d
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Subject: [PATCH 0/2] irqchip/imx-mu-msi: Fix MSI dispatch and probe error
 handling
Date: Sun, 15 Nov 2026 22:11:24 +0800
Message-Id: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NT3czcCt3cUt3c4kxdi2QTUyPjNEuDJMNkJaCGgqLUtMwKsGHRsbW
 1AKHbSYNcAAAA
X-Change-ID: 20261115-imx-mu-msi-8c4523f90b1c
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

Two small patches to fix bugs in the i.MX MU MSI controller driver.

Patch 1: Fix MSI dispatch through the parent domain.
Patch 2: Fix PM domain teardown on probe errors.

More information could be found in commit message of each patch.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      irqchip/imx-mu-msi: Fix MSI dispatch through the parent domain
      irqchip/imx-mu-msi: Fix PM domain teardown on probe errors

 drivers/irqchip/irq-imx-mu-msi.c | 70 ++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 28 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261115-imx-mu-msi-8c4523f90b1c

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


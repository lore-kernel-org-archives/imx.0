Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED663CF04A
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034235; cv=none; b=UW/K0aPwXg69ZmzA+lQlkm3iLmLFlxGdW/+Ufa4oehLMZhXk+AcEP3KBMYq8BTQXAmZWa89gS2W1wNNseLUCX8NVHI5cQj+QIo0wRlvli3t2FeiH4FtTMvJtsyGKu2b1ip4+Ex3sWKzjKK5kQsAb9jrF1HLispTH3C1ZuRuWaPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034235; c=relaxed/simple;
	bh=Vuvcc1h+aGEm+G5RRhrxQOhhVZZeISRZiJxo5Gd7yfU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CsXmMoCCbQQPrWEjvQal7DEfnszDvzcO7BZhE0P/VsdX+Ie0NhtMvnWs0pJUK8Mzi+xTKOabDuOn9ij6hUyH5yx9r+JRQJJHmlu2aq9fQ1Up7EJdSlrqAbe712AL6CQKq+sKd2LyjO8o9s0USNk4QaAu9v0o5WYAxuh+Vz02H5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f+WEPqPS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f+WEPqPS"
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 414508F;
	Fri, 24 Apr 2026 14:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777034122;
	bh=Vuvcc1h+aGEm+G5RRhrxQOhhVZZeISRZiJxo5Gd7yfU=;
	h=From:Subject:Date:To:Cc:From;
	b=f+WEPqPSUh9OpRaqyRcyptrshOlIO30j0MPp8BtjYEKVQN4bR3/DckpKIAKxSLQRF
	 t3mumK3Vp1kY6/WPiD6wbY1MF/QXDOpU6ANhFIE6N0sWwGRYB6yylY9KTWs5ouWY3b
	 HXE+43jsM//2gt/qyZ9k1nLcLB5vw4olPJooztCc=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 0/2] Minor changes for i2c-imx driver
Date: Fri, 24 Apr 2026 13:36:45 +0100
Message-Id: <20260424-i2c-imx-fixes-v2-0-34fb9504aaeb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1j62kC/3WMzQ7CIBCEX6XZs2v4qYR48j1MDwhbu4eCAUNqG
 t5d7N3jNzPf7FAoMxW4Djtkqlw4xQ7qNIBfXHwScugMSigjtJTIyiOvG868UUFNSkszOuvsDN1
 5ZTqKrtynzguXd8qf477KX/rvqUoUSEZdhB6D7aMbB3IlxUdyOZx9WmFqrX0BkG1E0LEAAAA=
X-Change-ID: 20260311-i2c-imx-fixes-3e23164a8a8f
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Gao Pan <b54642@freescale.com>, Fugang Duan <B38611@freescale.com>, 
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Vuvcc1h+aGEm+G5RRhrxQOhhVZZeISRZiJxo5Gd7yfU=;
 b=kA0DAAoByElXemxFdTIByyZiAGnrY+2hfg01AQYplJ1UP2hWS1LfeEjJlGqWlvQDABs0G3KIk
 4kCMwQAAQoAHRYhBCrK7DIOdl1v6bGab8hJV3psRXUyBQJp62PtAAoJEMhJV3psRXUy4ZcP/ifU
 M8bPXDhdSbN69rQrxBfKPQcp2eNCk69VX15sfOjKATToTah5tW9sCRo5KmDJsVmgMTpO9BqDBq1
 ZCBNQYn3/rBa5blQmCOGS//XQpwP110XXvEXms9Hqu7QKAJtU2sXBEKHDI28ezwKj2o3I6iXyok
 TXsnJho1ICHrXEgP2WLGvZ4P+hH6EkVtxIGZFFRU7i4H+lL61U1nervGWtzLNqerzHV+5t6cGkA
 ayAh93cPxeT89jfm8pY7VUiGCn5R9eA73etZBQEFkc53SUl23U9b5kPnTdTEMl8IO5d4sZyA53S
 W2QZwDjPFi19mxWZw/ZGzWgxoW9gWEE/ZsMZOZGPH63U+yVvhIrcLzbWIvb6J4V5aNrhmohJToN
 jXg6fa9/2R0vYRvlF3EEDJZO0djJ1OykQ9oOK+9CSXB8DIorW/4hItQVA4oKi+uNy1Fc1gbkkyK
 YTlThc8k9C1AzrbXCBSlmjMA7VWGi7QAtVLcLki7sRWaGfW97fymoEGKG8e76cCxiyWneh1jUvX
 GCz+eXSBKVTCQrs8b3ehJ65wvRypUpfDrh2yHhMTDTlzLwDai4CKbzaS4kTsj8bVf3A1/1wwm/0
 N1z4fZeIWUFNFt+lTgLcJBSjoASHUN7JKbTamnkExQeXXtgDrPwMR8Z7DBBjynGcMB36KemG7gj
 Yjg2C
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

These small changes helped resolve issues we experienced using the
i2c-imx driver on a multi-master bus. The device was losing
arbitration which triggered the driver to attempt to recover the bus
rather than retry the transfer. The set stops the bus recovery
attempts on lost arbitration and instructs the driver to retry
transfers 3 times, which seems sufficient for our setup.

I had intended to make a larger change that added a new devicetree
property for i2c-controller.yaml that held the number of retries an
adapter should use, and then parse that to set adap->retries. I found
a relatively old discussion on the list though in which a similar
idea was discussed and rejected so I dropped that, but I thought I'd
mention it in case things had changed.

Thanks
Dan

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:
- Updated the commit message in v1, and added a Fixes tag.
- Link to v1: https://lore.kernel.org/r/20260311-i2c-imx-fixes-v1-0-e625034d8202@ideasonboard.com

---
Daniel Scally (2):
      i2c: imx: Don't recover bus when arbitration lost
      i2c: imx: Retry failed transfers 3 times

 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 4a181746639404023abfcb28eb6f6c66974be5a7
change-id: 20260311-i2c-imx-fixes-3e23164a8a8f

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


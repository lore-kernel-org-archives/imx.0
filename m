Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ABE28BAB3
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166733; cv=none; b=jOTdiWOZ3+BtMyjVE8UumbDQf/28O3If/Aci/q6RWUU3i/YOAm/QTZS7IAIaNoyEXMY+knCthvugR4SVh14mZfw9JrRXiSRT4DIeCuEj2b8NAhcIPZNxxta50Do7T9VgethGpZym8uM92fGeqm/xzoVv6RuU93gVbNT4AZRpFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166733; c=relaxed/simple;
	bh=bZbKu9frw/vFoCdNCqD5fqyOM78ardIlyR+M1e+RRjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4IasEaHnC/tP80Da+G/iXOpVf/PloW6csD3zw82GYX8u44kcRCeiViQ/ZoSIDXsnSUtZ3n3EUXtMpPH7rbIxVSoTAXkhBuk9FaDJL8wZXc8vwwWWtfxQvYsILHu+zBcPZcV5sKMKiD1E+MZhadqE5pa5GOHI+faWgFS/sw5+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:e2bf:c3f2:96ab:885d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id 2F60766ECC1
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 13:25:23 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id EF5A942A7C4
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 13:25:22 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 9C5E442A7A4;
	Tue, 17 Jun 2025 13:25:21 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 33d69c02;
	Tue, 17 Jun 2025 13:25:20 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 17 Jun 2025 15:24:54 +0200
Subject: [PATCH net-next v3 04/10] net: fec: rename struct fec_devinfo
 fec_imx6x_info -> fec_imx6sx_info
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-fec-cleanups-v3-4-a57bfb38993f@pengutronix.de>
References: <20250617-fec-cleanups-v3-0-a57bfb38993f@pengutronix.de>
In-Reply-To: <20250617-fec-cleanups-v3-0-a57bfb38993f@pengutronix.de>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.15-dev-6f78e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=bZbKu9frw/vFoCdNCqD5fqyOM78ardIlyR+M1e+RRjI=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoUWyzjTOp4WX+7A2CtObFNPs7uwqPf9Wt5miSl
 xH7iiS8eqiJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaFFsswAKCRAMdGXf+ZCR
 nJG8CACYj3haMMeZTo2/4xjtxYz9NjSXCMtcJlo8fmRnWrvWUxZyFGDo2qhiRCl7p2FdHfDu9I2
 H6L9YswTPXlDH6RxmQgOCDnN1h79RZN0m7BkQmO5q+l+AIrXVtU7c/Y9AiTqgnvIBt8PqsH/aNF
 JFvQNcscP0jim018pYI1nWjxLBIfkk+Mxll+vJYLS3T3ooSa/93vlDGQR6wNzDcdjZ9ZWL92onG
 MK1/NlSTeoOvpNOeudVa1mx4l1j1A1hBrO6qV997VKvruAF+faetWgDvR41mIiuK4Uw/CrmnDuw
 4gaIUbqXkN49N15GlGHUVn+YfFyo3qZtQ66qFM9undEPou/g
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

In da722186f654 ("net: fec: set GPR bit on suspend by DT
configuration.") the platform_device_id fec_devtype::driver_data was
converted from holding the quirks to a pointing to struct fec_devinfo.

The struct fec_devinfo holding the information for the i.MX6SX was
named fec_imx6x_info.

Rename fec_imx6x_info to fec_imx6sx_info to align with the SoC's name.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 17e9bddb9ddd..e0d7365e5b4f 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -131,7 +131,7 @@ static const struct fec_devinfo fec_mvf600_info = {
 		  FEC_QUIRK_HAS_MDIO_C45,
 };
 
-static const struct fec_devinfo fec_imx6x_info = {
+static const struct fec_devinfo fec_imx6sx_info = {
 	.quirks = FEC_QUIRK_ENET_MAC | FEC_QUIRK_HAS_GBIT |
 		  FEC_QUIRK_HAS_BUFDESC_EX | FEC_QUIRK_HAS_CSUM |
 		  FEC_QUIRK_HAS_VLAN | FEC_QUIRK_HAS_AVB |
@@ -196,7 +196,7 @@ static const struct of_device_id fec_dt_ids[] = {
 	{ .compatible = "fsl,imx28-fec", .data = &fec_imx28_info, },
 	{ .compatible = "fsl,imx6q-fec", .data = &fec_imx6q_info, },
 	{ .compatible = "fsl,mvf600-fec", .data = &fec_mvf600_info, },
-	{ .compatible = "fsl,imx6sx-fec", .data = &fec_imx6x_info, },
+	{ .compatible = "fsl,imx6sx-fec", .data = &fec_imx6sx_info, },
 	{ .compatible = "fsl,imx6ul-fec", .data = &fec_imx6ul_info, },
 	{ .compatible = "fsl,imx8mq-fec", .data = &fec_imx8mq_info, },
 	{ .compatible = "fsl,imx8qm-fec", .data = &fec_imx8qm_info, },

-- 
2.47.2



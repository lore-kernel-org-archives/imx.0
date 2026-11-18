Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.77.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998293;
	b=t/ApJ2fTqlVdKOMoYj6O3utF6XtwLo7qyzd6TVHdD1XTxm/VMGhM0fyatoSoFNKWgbFF
	 U5vmsG1NNddHL9QWv9B22INL9DeY9vAV6paUCYdk+DV2HYmr1kw7Rmn8Rc8dr/NJ2+9V5
	 ZJe/Fo2mr0eZcht4gmyTUnU4cFFtZxtKE1aApCLvHdngwSkC1XRC1iSCAyitru0F2jgk4
	 11KWgN5Uk/L2TpyDXfe7LIpKMAnUdRBa0pUz2Ft8f+ZK4Jbctm9b7Go3N0QyvAI7SBqQQ
	 qD26c2bQAf0kIW4M1aCQFXbNiUfxfjLRguo619kFoi72at83gL8o67ZDDrkcLQGkwFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998293;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=C9nJMFyqCQqC0aSYr+rmBQxGR2sahljlQmIWT81NwDY=;
	b=2I49E/cby6vnCDSkH3SpV1NisaUv9FynrKGk94P5md8BDjiagS2wpecROMc4uZtgk/nf
	 Uo+oicMvnp5lw6bHCYhTaEILzhLACh06D1ou8l7z5thFdejJkihBWfIoD/jzoaBCPzrdU
	 RTWLx0Zb+Ah4TOaJqQODXw6cTHPCIcbc/AbPndHK4K83uqD2GaZf/sYOBMDzPHOmkcIyH
	 BB1rxJsJ7naEOYbJYIb7b/Dr761Eg6siLx7P4NPBJrH+DdmBF16OFjzcPMI7q7Kw2P5YD
	 XPl63P9dsh4iolg8rZEcC1kc2EOekF8bjtcVC5BFy//tzPPpu/RHZVeDzB8D0I+yRfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fris.de;
	spf=pass smtp.mailfrom=fris.de;
	dkim=pass header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=E6WTelkh;
	arc=none smtp.remote-ip=116.203.77.234
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E47606A334
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 10:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E47606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=E6WTelkh
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1794998284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9nJMFyqCQqC0aSYr+rmBQxGR2sahljlQmIWT81NwDY=;
	b=E6WTelkhvyMUBRNmU4AuxLu4ubSP5VKaFk063z2kRGqh19FIBabL2W3jrGFum/ZaLOjlip
	alqucVS84A5PLtKUw70gHw1C3Bb92pYJJznxkSnwjql8DBb8PDpoTmI+MEaydY5ZRSSv2e
	NnOzREY+OeaiQbrIufrwiCvGj7TSyJUM03AbID3Nj5WNDi1k+rnqWolAgwwuIC1+/0UcdW
	o/XLZWW3GKAngrgESObVZ+uM5t9iar3aB5qyxtQOsiCOwQSuyCRCksm5ekEBDl5OU5Llg3
	vDcATDcYJ+oHSs472MpiczzX9Qt1eFkxu+stNxbTYBIQGfJ+G2xeVQNgwtGMeg==
Date: Wed, 18 Nov 2026 11:37:42 +0100
Subject: [PATCH net-next 4/4] ptp: netc: use 133 MHz system clock on
 i.MX952
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
Message-Id: <20261118-imx952-enetc-v1-4-25721440602e@kontron.de>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
In-Reply-To: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
To: Claudiu Manoil <claudiu.manoil@nxp.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=LCQAQ1BB6kTXKdOUGFaeHZK8oskn8+AXnQmmv+OKHQs=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIetvA4fh7q/9LFyfVYqeHNEwLD4u0dxWvSU38HVyT/irz
 TlsYikdpSwMYlwMsmKKLFL8Fq9tzWJ95I9VR8HMYWUCGcLAxSkAE1G1YGTYfUxkTxjzTL81cwP2
 pubEFF3Pm7F5zgfuVe0O+9ja0naWMjK8Vu889Fvi55It0xMM2XRsHbgXCppwN2hwtW/o8mNcd44
 DAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Clark Wang <xiaoning.wang@nxp.com>

On i.MX952 (NETC revision 4.6) the NETC system clock runs at 133 MHz
instead of 333 MHz. If no reference clock is given in the device tree,
the timer uses the system clock, so its default frequency must match,
otherwise the PTP clock runs at the wrong rate.

The revision is read before the device tree is parsed, so it can be
used to select the default frequency.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
[fs: from NXP 8af062154e48]
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/ptp/ptp_netc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index 1a327a7561e39..7b9c0a4cbb4c3 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -72,6 +72,7 @@
 #define NETC_GLOBAL_IPBRR0		0xbf8
 #define  IPBRR0_IP_REV			GENMASK(15, 0)
 #define NETC_REV_4_1			0x0401
+#define NETC_REV_4_6			0x0406
 
 #define NETC_TMR_FIPER_NUM		3
 #define NETC_TMR_INVALID_CHANNEL	NETC_TMR_FIPER_NUM
@@ -88,6 +89,7 @@
 #define NETC_TMR_EXT_OSC		2 /* tmr_1588_clk, from IO pins */
 
 #define NETC_TMR_SYSCLK_333M		333333333U
+#define NETC_TMR_SYSCLK_133M		133333333U
 
 enum netc_pp_type {
 	NETC_PP_PPS = 1,
@@ -858,7 +860,10 @@ static int netc_timer_get_reference_clk_source(struct netc_timer *priv)
 
 	/* Select NETC system clock as the reference clock by default */
 	priv->clk_select = NETC_TMR_SYSTEM_CLK;
-	priv->clk_freq = NETC_TMR_SYSCLK_333M;
+	if (priv->revision == NETC_REV_4_6)
+		priv->clk_freq = NETC_TMR_SYSCLK_133M;
+	else
+		priv->clk_freq = NETC_TMR_SYSCLK_333M;
 
 	/* Update the clock source of the reference clock if the clock
 	 * is specified in DT node.

-- 
2.56.0


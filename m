Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.77.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998292;
	b=3jM1B+H2bNmGbFXJCwxVJF+QxTng5oJU1I5Ce7A8KDzw8wf21VyYNDg+Gi34uteIAn5G
	 8tmXNnC7Ytk65QojLPf/0vaqkZKHYgRpIbiyHH3HpnKZCnJYtTMLnXGPsnazb5m3lmDkK
	 09rFQ3287exeGl+Ro8GUv3H6fnPS70ANH3f17jnsoiyEHwtE2DDUfL87bYav0JQ2EzwL+
	 FXpTEcP+UQz7zGx1onmjtaVoWngA58eezd2ZFxWNWEwQkKSgEiNl/vCqK+slkGDv+w91c
	 JxtJUY2Ko4inN6k9bbyA1amVSfZir/zt3N2MgTQD8pyZV1O6h1SDpmVQqOajweKqbTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998292;
	h=DMARC-Filter:From:DKIM-Signature:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=wbk73zpgIWGMWLQNDj0r6n7nWyqLBsTIcSKbCw2JrHQ=;
	b=lgweI03BpOwqUNsg6jmDHx+a94yei8UPJRswwutOx9bkt+BMNQ5yvUJLJB0L0NSD8oO+
	 xc7J5HFQ6AZ8Opk7q++UPSJw/BHXc9mF1O46O1TpmmEz9CyrwT9FVRF5tmKPuCBYApewW
	 H2RrE7zau5ZSHKr26jLFaL3ESNv37EuMVuZ7okHX9SWfDyqm7lSG5TTMQA/zaIqai95rK
	 PiLqlVLJvTI2rf5/O+nSk9Eb+KXwE00nPw2PgyMd/GhIhlOAeLWeG5HDbwUnFJNs8UdtD
	 ATYJJMf7yAa4H0KkuHfFQhbriaZ5kfb0tgUGk4hPchFmYkWdidLYRQIgsQ7IoerR+lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fris.de;
	spf=pass smtp.mailfrom=fris.de;
	dkim=pass header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=IkEWOgtR;
	arc=none smtp.remote-ip=116.203.77.234
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517F7606A332
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 10:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517F7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=IkEWOgtR
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1794998282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wbk73zpgIWGMWLQNDj0r6n7nWyqLBsTIcSKbCw2JrHQ=;
	b=IkEWOgtRa/2EI2rZVWrJRvEFdDrzXt+Age2yK1mOeDvFoEO/7xG8O1vX4AHLP5bDsSK6qW
	oOa3ntzGse4k6Ry1odb3gK/Pu5VV8kOX68fJ7D1Blck+yKhUJnVwxeTdv7+n6EZ0k5Pwpm
	Lbqar3/vpJY5so0uxkatM66qQ3Br8JNodIG07iP9B1eGw4mTBhvAdDy4RRTXmjw0dMo5SQ
	no/k+GaoquvFt4cBeVlWW13LGZkVv+mZtpwv6CmcrW9HjpPpDla3xAiZmX/RDTfmgBm7Nr
	0FcgR807XGSFhIuqWP9NJ6c6vFHQaUVfKGsQssYq7rX/htGUu4MJIP2WKnS7+Q==
Subject: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
Date: Wed, 18 Nov 2026 11:37:38 +0100
Message-Id: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMBAEf6XsswdeSkX9FfHBpFs9wShJlEDpv
 xvr47A7MyMzGTOO3YzEj2V7xga66RBul3il2NgYbut2qroXe9TD4ISRJYgfnQ99r1Q/oCmvxMn
 qmjuhPSSyFpz/S377O0P51bAsX+V11/Z6AAAA
X-Change-ID: 20261118-imx952-enetc-bd2bc331e1b5
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=j33vW+Zzt7NNM5QDbL70z5xJMyrNgFIRq8zFD9jN5hc=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIetvA1Mbn6Jilc1pNXVv/66Yo9LNq7qmbT+x3NumYKXPv
 YQ/F4s6SlkYxLgYZMUUWaT4LV7bmsX6yB+rjoKZw8oEMoSBi1MAJpJVz8jw7+a9HIkvOcujlxRt
 te/+l9e7rFODMfmSqZv2CbdrFmlaDP8jiusiXXxFQ+7dV+2fIaDieSO7s2k5p4XI9XWXaiRNTrE
 DAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

This adds support for the NETC Ethernet controller on the i.MX952 SoC.

i.MX952 has two ENETC instances (IP revision 4.6), each on its own
PCIe bus. ENETC0 shares bus 0 with the NETC timer and the central EMDIO,
ENETC1 sits alone on bus 1. The NETC system clock runs at 133 MHz,
compared to 333 MHz on i.MX95.

The patches are ported from NXP's lf-6.18.y vendor kernel. The device
tree changes for imx952.dtsi and the i.MX952 EVK will be sent separately
to the i.MX tree.

Tested on the i.MX952 EVK with ENETC0 (RGMII): the link works,
hardware timestamping is available and the PHC runs at the correct
rate. ENETC1 is untested as it needs an add-on board.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Clark Wang (2):
      net: enetc: netc_blk_ctrl: add i.MX952 support
      ptp: netc: use 133 MHz system clock on i.MX952

Frieder Schrempf (1):
      dt-bindings: net: nxp,netc-blk-ctrl: add i.MX952 compatible

Wei Fang (1):
      net: enetc: add i.MX952 ENETC support

 .../devicetree/bindings/net/nxp,netc-blk-ctrl.yaml |  1 +
 drivers/net/ethernet/freescale/enetc/enetc.c       | 23 +++++++
 .../net/ethernet/freescale/enetc/enetc_ethtool.c   |  1 +
 drivers/net/ethernet/freescale/enetc/enetc_hw.h    |  2 +
 .../net/ethernet/freescale/enetc/netc_blk_ctrl.c   | 73 ++++++++++++++++++++++
 drivers/ptp/ptp_netc.c                             |  7 ++-
 6 files changed, 106 insertions(+), 1 deletion(-)
---
base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
change-id: 20261118-imx952-enetc-bd2bc331e1b5

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


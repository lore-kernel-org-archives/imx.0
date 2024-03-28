Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD6512AAC8
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.181.117.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711641577; cv=none; b=Zt2Xb0KWqYtSeRk3aNtMa9/Xw1hINq0GbbrTXw71zSpBtq3KtxmFBKdIzPNiOpsMyoib1QLXW2k18ronFjJH2QaBWNCpTOgHgtqUaMJdW6Cy1N+2PBNVP1xV+FMG/+92EeoNadrhYoGqYpnU4r6Ycxlig7V5/ed45RFGfKZ3CWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711641577; c=relaxed/simple;
	bh=rEYm+RuDegHUaXhNywXY5gVCIeEihjWtUykcULPsMHs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HGXiousE7KaATwhb5QEBRaiHGp63bGoZlFxeWC3sEag+n3GqBSEZn5oVUrti9AlkSe2B6wYLPevpmnrTmZZKOnpLn0DPHxv+WJE+Eq7J45d8pLiAdI7aP954bc9p1fmfdibew+AASGxGXHpG5kp+XfvKvC2mcn1smjDBXZkvLQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=actia.se; spf=pass smtp.mailfrom=actia.se; arc=none smtp.client-ip=212.181.117.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Mar
 2024 16:59:29 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Thu, 28 Mar 2024 16:59:29 +0100
From: John Ernberg <john.ernberg@actia.se>
To: Wei Fang <wei.fang@nxp.com>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Florian
 Fainelli" <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>,
	"Maxime Chevallier" <maxime.chevallier@bootlin.com>, John Ernberg
	<john.ernberg@actia.se>
Subject: [PATCH net v4 0/1] net: fec: Fix to suspend / resume with
 mac_managed_pm
Thread-Topic: [PATCH net v4 0/1] net: fec: Fix to suspend / resume with
 mac_managed_pm
Thread-Index: AQHagSjquwfDL2zjHkCW93uNOBsjcQ==
Date: Thu, 28 Mar 2024 15:59:29 +0000
Message-ID: <20240328155909.59613-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.44.0
x-esetresult: clean, is OK
x-esetid: 37303A2921D729556C7D60
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Since the introduction of mac_managed_pm in the FEC driver there were some
discrepancies regarding power management of the PHY.

This failed on our board that has a permanently powered Microchip LAN8700R
attached to the FEC. Although the root cause of the failure can be traced
back to f166f890c8f0 ("net: ethernet: fec: Replace interrupt driven MDIO
with polled IO") and probably even before that, we only started noticing
the problem going from 5.10 to 6.1.

Since 557d5dc83f68 ("net: fec: use mac-managed PHY PM") is actually a fix
to most of the power management sequencing problems that came with power
managing the MDIO bus which for the FEC meant adding a race with FEC
resume (and phy_start() if netif was running) and PHY resume.

That it worked before for us was probably just luck...

Thanks to Wei's response to my report at [1] I was able to pick up his
patch and start honing in on the remaining missing details.

[1]: https://lore.kernel.org/netdev/1f45bdbe-eab1-4e59-8f24-add177590d27@ac=
tia.se/

v4:
 - Adjustments to commit message in patch 1
 - Drop patch 2 after discussion in v3.

v3: https://lore.kernel.org/netdev/20240306133734.4144808-1-john.ernberg@ac=
tia.se/
 - Implement feedback from Wei Fang for patch 2
 - Fixes tag in patch 2 dropped, should it be delayed for net-next now?

v2: https://lore.kernel.org/netdev/20240229105256.2903095-1-john.ernberg@ac=
tia.se/
 - Completely different approach that should be much more correct
   (Wei Fang, Jakub Kicinski)
 - Re-target to net tree, because I have fixes tags now

v1: https://lore.kernel.org/netdev/20240212105010.2258421-1-john.ernberg@ac=
tia.se/

Wei Fang (1):
  net: fec: Set mac_managed_pm during probe

 drivers/net/ethernet/freescale/fec_main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

--=20
2.44.0

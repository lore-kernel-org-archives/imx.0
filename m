Received: from mx-relay15-hz2.antispameurope.com (mx-relay15-hz2.antispameurope.com [83.246.65.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF932E69F
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383089; cv=pass; b=l8wo6pVtP0ncwWMEG8jsXiLQZuewT5IhFMxPWikTPH3OhBrarkvBYCwMsS0I14PAq3VgWDarytbg8emkgh63cuIJ+GBb7MlZqpCXcycLQmE7jUYaAGx9NgsPbqpqnD2VJDQLuYoN1FktdnFEr16jyy49jleepikckiD59ks+l+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383089; c=relaxed/simple;
	bh=0FkXnnFLmOfEqTXhxucbtGEaFIfg84EOcO1xc43LJ4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lkyw4Koc+KNQH/ULKD5i5SaCSallKhUIL0tAzTvL8W3/bTE5evO1RMAvcFlory1exuOQJPtQK+CnR/iMK2JZPnkp8STis80Vj6M/R4t2ycTedMBOeTPesuekVdnnLKJ/FDIRrxnJy2eThK95lFMt6T83/bHaN/qgnMIh4fwV5Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ArfCDRTW; arc=pass smtp.client-ip=83.246.65.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ArfCDRTW"
ARC-Authentication-Results: i=1; mx-gate15-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=+xF4bO/fTs8QrjNJoxW4GipCjwad45AsUDQqmvp/V/s=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383018;
 b=gL/3SQOoN48ds6vo9GNBXyDi7wetYGjMSS3TXUzebqIN0qTH+azvo5pdp/CfFcbpa0PNnkAd
 Azn12q0kLWlVQi4AtVFatrKIyZhFglcuUPieg+5aBI4+TMyQFza5DXAw88Lf5JbbgBbpmXIUuyn
 6nM0e3SWqTK/Z0fL9sYY6bQ2HFztg3vh3L9oAqk76cEQGt5XErXm7p/fo1ExsB8ACAv9Pj7DHSX
 E72RqgzDu1+XhiHNYHlmTJIZUsx3HFkmHvUtcWb2Qth9Mut+e5Bb69pLy4qXgBkxSN63jwG9eSP
 TL3514MGsZBj+aVIuiwWv30YGc5DcpP6l28/7TTFlGVnw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383018;
 b=J5uPMz3KN50aSS1WPSZHaU2CG4VYD2OBx+pVqJKUdOcofS8j6PMaGxHuqmPzjGTwD3/FOCKB
 xhQtX3hHYQaSrM+NzU2FEgY7fm1H724xKFEXHBkbCX6uQjEAIegjbt0JSe+iEe5gkMNPIIEs8e2
 HOAs/TvAdeI54tmY4jJ+qIlDmCmtkDZRR0rLusrHRivIsdlTVSiAqmQHHJt9aF+D8DJMjgiN2RA
 fO/JTfgcY32S2f6yMbG0f9eMjH8R3LcaobXP45r3MdjyPOEkkO0e3SVWBci9y6R7EDxW97K7zXh
 qQiYQat9dHaQvWTT7hWtqNwTaifDfNz01LEaMgYWVEjSQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay15-hz2.antispameurope.com;
 Mon, 17 Nov 2025 13:36:58 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1F7C8CC0DBA;
	Mon, 17 Nov 2025 13:36:48 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 0/8] TQMa8MPxL DT fixes
Date: Mon, 17 Nov 2025 13:36:27 +0100
Message-ID: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay15-hz2.antispameurope.com with 4d96gh6p7Dz2FbSG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:328a4f074a2d613aa025241cbcc29309
X-cloud-security:scantime:1.739
DKIM-Signature: a=rsa-sha256;
 bh=+xF4bO/fTs8QrjNJoxW4GipCjwad45AsUDQqmvp/V/s=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383017; v=1;
 b=ArfCDRTW4oS35MYlvOnk88yFkFpvqkV9yG1MeFRcvdxryFUYSNnvNn7xtrRUwP5CWBnUGPdE
 EyyxClR+apudP+XCTKid4AS3HP4cBR+IwR6Hz9icGeCp1R9rdT90PDQxuXDpqI7fAfaFs/K0p2L
 UcU3/V+D/rEvtvKIMCxm+9/M/k0KyktoxRAAxXMTFgstzYwTwEvTESoLA0kjw4ZFL5O3lzqlnuM
 vXVFHQLUYE9boWk5etZAqgv4MwpFG8TPwVJMYOHBoEjMeGvWxcrWyzpMWghZRCoOfDBhhKpjnYS
 hGX5YO31oUvUKyaBJaj4AH2Mc0ugjwGp8YTbkvUPPnk2w==

Hi,

this seris includes small fixes for TQMa8MPxL both on MBa8MPxL and
MBa8MP-RAS314. The ethernet IRQ type has been changed to level-low and CEC
pad configuration has been fixed to use open-drain output.
For both boards the HDMI audio output support has been added as well as
the ENET event2 signal on MBa8MPxL, which can be enabled using
/sys/class/ptp/ptp1/period.

Best regards,
Alexander

Alexander Stein (8):
  arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
  arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
  arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
  arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
  arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out signal
  arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
  arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
  arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support

 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        | 21 ++++++++++++--
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 29 +++++++++++++++----
 2 files changed, 41 insertions(+), 9 deletions(-)

-- 
2.43.0


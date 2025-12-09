Received: from mx-relay90-hz2.antispameurope.com (mx-relay90-hz2.antispameurope.com [94.100.136.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE0D29E117
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277637; cv=pass; b=AaRiNwKf7h2bKY1z/YCUtbD2fq20qJKptJQgaFs9Hnevn2Nh39/+D+IJQxxEXkYWMG+lb2JsbvzcmktvjVdZyEdDYfg8Z0jtOyH1u7pninqRGenBEzB1Q2RRX6Lijv6UZ9WMleInKIkJd22O2dTuLEALrez39mFeftGeqvSexfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277637; c=relaxed/simple;
	bh=zAreKBXYzW+jAqB87lL5Vm6L5UsJmH4bDsBImwL5xHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kTJ/eowzJAgMvs5GFmngJMu+H/Pgo+cO13655ON4YM2DfSNQglTH48Au7+VoqMiedYx4G1FLk74Q5oiAircwmX0pOx8eIqEBj/JUSkVrJSCy0oN/GGNjlNssuFNIMw8HeWwNgGItURkqbX9WArNawmsKN2RxXGJZSYnfOsEoboQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=dIS89UcG; arc=pass smtp.client-ip=94.100.136.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="dIS89UcG"
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6npgSCSljI1jrpntYRig2rdWG53oGjgIHhHgeY2CZ1Y=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277610;
 b=rgi+usIc7UlrleAnt2UQqNKasRCim6tr8NqaeTZR7ZH1y3knWSF92UiPRCkK7TdKdAgPRYWz
 o2xsPOiZtfLbIW/+LBSDfZ5dtNvivMMCj+DtsXdb9ZPLYDbhONBtFyJFb+sXMBn3GB1d6XsCpcB
 rht0CAGbku5lfvs5ot4OyJOFgb2KMooSokHWPKglNSa7BlNPYyHv3W1Mz6sXIUHq6oLcFcZbtKB
 6c0v6leia/Tn2+k+Im+GukQ2UR59zGcOlAYldxGa2BLVKtBKlNRtpcKv6J5vZ1EGoBj+q9zT5qB
 gGOcL3lHlwypdytp2TDdcNdddK0BWvWPHvT+fsTYdf5sg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277610;
 b=VkWPhlGsZkMcOMtUb0EtDw/KrLvTe1WOktMaqSW7JCvNkxnuT4SXulfPGgQfOa76MSihSf2B
 6ElkLcqyPWHI8N/L5qUJ3S05/oPpPfzy3XBK1v/x4gsiGBHMlruOxhjo8dXwFCfqlPvMtG/80rb
 ffG85m3lahaFp8HMl2DIn5dtwwlbAcA5HRxmtqg4wFhpGooYQUyXGoiShi/GXHmIGgG5Xpn288c
 oHnXQDL+wsutv6j88cQq4j6cx2BXBwcSRo5nEEVLfUe70l68SGCzN9ZmZ/BF3NFnt5+mcI7eGjk
 x6ltBFcpCQ35r+YHGwdo26Wfhz3jdgAJ6RLs8eiYZCcNQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Tue, 09 Dec 2025 11:53:30 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A89F5CC0E8A;
	Tue,  9 Dec 2025 11:53:20 +0100 (CET)
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
Subject: [PATCH v2 0/8] TQMa8MPxL DT fixes
Date: Tue,  9 Dec 2025 11:53:06 +0100
Message-ID: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4dQbL93XFFzWw50
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f63f4ee375f07f63483e39071c52d6f9
X-cloud-security:scantime:1.678
DKIM-Signature: a=rsa-sha256;
 bh=6npgSCSljI1jrpntYRig2rdWG53oGjgIHhHgeY2CZ1Y=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277610; v=1;
 b=dIS89UcGELmnIP6g2u3PUwFV6Zzad8KttbKxOgZDdilfPFmBGp/9NODZEtJdcW/wVw6xnAPw
 qaVsL5OfsjkMAj0fhfCG3JEBP4w3efc1jIOqRJsqlYEje1kqMwx4ff1LvXFvUQVt3yO/Z04q9FO
 ZYI9ZJ1Mfybmeet0uLxDDsZwfGwQWIX2Pc+0AyWKGejRvI1aXl852YKa/am3h7j2l66sF7BDxAb
 WkLhsnLMlC9aRyiIXEpM4+4Z9r0MJfCT7khepomc+7d04kTzePxdatAovEzre9ODgHVS5FkVuV1
 5s0ryfsLdbvTJX6ymS7sZGfUDBNbJjL5chcEbq7BY33tg==

Hi,

this seris includes small fixes for TQMa8MPxL both on MBa8MPxL and
MBa8MP-RAS314. The ethernet IRQ type has been changed to level-low and CEC
pad configuration has been fixed to use open-drain output.
For both boards the HDMI audio output support has been added as well as
the ENET event2 signal on MBa8MPxL, which can be enabled using
/sys/class/ptp/ptp1/period.

Best regards,
Alexander

Changes in v2:
* Collected R-b
* Fixed typos

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


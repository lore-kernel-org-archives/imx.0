Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF296477285;
	Thu, 13 Aug 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624957; cv=none; b=XeArpmumzRpFlnexIvSz9p6HfzWqrrqO+v4dcpHl9FTNf9MTwC80ONVwRbXXYqhlqp4OM3VSFbP4BZxeZJTXUl6z1PhCN2WFFFrvHq5KEgzIjusEmkCK7iFveuHskz0E/KYN7yzXw//OyYSrc86g3It1GP+OyKj2aJcHl66mlos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624957; c=relaxed/simple;
	bh=iDL9GUzLEu+vP0SDFiFi/olRqNK4GoRXPkClXEGhXyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qGuontf4xTEMKeU4rssGQ3SfSA9JYjm+oyFaAl3Jp34Ipt9klXiE37OtccSYzV0AthESUTtxMnIIwixFL07bF0RQRFVkinzO6N7U/CJlv03V9SmVww4BxQJ81urqO8B5zG1Rj5lE1nhPxKyOP9/LdD5psl3FK6jiO81XqcN68pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qKbAExXO; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qKbAExXO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=YW77SL8hSTW9KFJBlbwpfAzYufCsrQovezRCHkEwhW0=; b=qKbAExXOKC+jl8GT5ik4OGCHYl
	0QmOMmgm3olNj0PXTahrWmN/m5fHhwm3cyxHs6eD8v883uqhVFh2oeu5/0I/TmYI+RdmlzSFXvNgO
	O7+6Fwe1QxVBqmKUG19AmqZ2s8P1wDpGwgfLK3Plw41O42HIvfyPnJXRTImKEThu0EdtmiInlxAuO
	S9Af3Yk7lTySVp5+ZcTykVFxX50Z4S0EX/V1K5j5jJNSPty3mT7I9yhXiuaBukq7daRM85EO6Rq2f
	U5k0I76sV7IxkH6dYThPeCfXRFvNMZ3rpoa/+b2W0f4yxit4rMTUnW8WLxyD570pedJrWFGKToP9O
	Sks9Ikww==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-000BWy-0H;
	Thu, 13 Aug 2026 14:13:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-0005zb-1c;
	Thu, 13 Aug 2026 14:12:59 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] TQMa6UL[L]x[L] DT improvements
Date: Thu, 13 Aug 2026 14:12:44 +0200
Message-ID: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)

Hi everyone,

this small series improves the DT for TQMa6UL[L]x[L] a bit.
Ethernet PHY IRQ support can now be added. And the on-board USB hub
is explicitly specified.

Thanks and best regards,
Alexander

Alexander Stein (2):
  ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
  ARM: dts: mba6ulx: Add USB hub node

 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

-- 
2.55.0


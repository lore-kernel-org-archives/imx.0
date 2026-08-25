Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9580525CC79;
	Tue, 25 Aug 2026 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641466; cv=none; b=e9qqSSHFMwmk2+tgU5iHhULCqNnRBz++fO2+aIYeORvEytnu4ul/dZc+bPWOnOGlcvB7tfXUQ35uhRNWLbdnu18UI1yYCxhzMiFQ9hzAUSlk66EbLH9GF5QwM7Cjpat5wCtrSddK2dEj/FKbtnGx4fVfhixTBQHWgdLHqMpuWho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641466; c=relaxed/simple;
	bh=gBdfSeuXPlbPqjPj/5sZZvT0WcSLnWRdi63/XIkpPzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tfojIcQ+DVTXELLNjvqwxhphPWjdN0bdEauc6ZC+0hG7r0WYGp08GRJgBA8nNCfVrSVr7N3pN9qVs1Hd1pSHRSZU9ZWXYvhtTKOUrtcKfGOblU7dAXiKVEtSXylG/qowAItSo8yVn3gLTIb9P4SfIk/yJYSF1rElVHxwhYN0ajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VTgDOIuY; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VTgDOIuY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=yyhmfHSnhvkNCTBiWqfj453SyLCDbsMwb4fZbxXlEDs=; b=VTgDOIuYSf8ELgpuavJKd0dFp1
	hHNTwy0Xe6Gt3LK47M7XGg595uYi0Ot8nbGzFB14eCcj2OhcYEY3+3abHTkrrNm6T3sFT3RLJjgge
	pU4K3eiqaXmh8FCYmIgLD7BndbrcN+t8dzSbAO5UFycay6CCLw+1QpZ2d7EWTQGNmDqnKxzuembDh
	0tEBuFIf25GJF3Gfb15136apu2VedFbZDeVtABTwoDA1RGXUxj62aPDDv1DnE5jos9VPsQgGCtMUW
	zXkYvlq7lwngYhYMYrixmuLjrZto42jRmWAxqmhOBwwQT3z4QBIHMCd0VcSy5N5RokKD5W2hbTHkv
	w88bPqDg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCn-000PBc-2m;
	Tue, 25 Aug 2026 09:04:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCn-000H2F-14;
	Tue, 25 Aug 2026 09:04:21 +0200
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
Subject: [PATCH v2 0/2] TQMa6UL[L]x[L] DT improvements
Date: Tue, 25 Aug 2026 09:04:15 +0200
Message-ID: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28102/Mon Aug 24 08:23:58 2026)

Hi everyone,

this small series improves the DT for TQMa6UL[L]x[L] a bit.
Ethernet PHY IRQ support can now be added. And the on-board USB hub
is explicitly specified.

Changes are mentioned in their respective patches.

Thanks and best regards,
Alexander

Alexander Stein (2):
  ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
  ARM: dts: mba6ulx: Add USB hub node

 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 36 ++++++++++----------------
 1 file changed, 13 insertions(+), 23 deletions(-)

-- 
2.55.0


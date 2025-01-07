Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70A41E32DB
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243412; cv=none; b=LKHnzygltNNWbqlEhgruK3KYM2UxReaQFFIbMnYv3Gf03scasdpNnhDZ9pWBHKXv9GwhaRfEWyfekAQ95f6Flm91hA7RBPQux76zF+0gsGQhBj0FheA37rrbFFox3jWLxbJH9fpsUXWCcNnRkqDJyIPb0RUny7ybbI1fRiIYI/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243412; c=relaxed/simple;
	bh=cHm2Pk3ZTkPBvgVVInIAKU+PEJ5lLzU6sKg/VpnGOAk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gk94eOgpkWwyyh9W55Kf5XhjdPcCiieFpieeyaikVE0nf6fPTdou8uDBTEMdj7VIjKfEnddc4HzNQPvEStQRsjiXNQ9OKRr1OO4khSeV3aQ2xN9J/1RJCXwury0sxI7vNiEplHXmiqEyvIFas/yiFc5t/sPZdislF3MXcVGraWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=f6VcteZj; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LLx2ow89 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="f6VcteZj";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LLx2ow89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736243408; x=1767779408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PcRc8LgBBacdtMgCc7Ma6Y3V6HlZ1g1g93eqellQlQc=;
  b=f6VcteZjzLa4S1Dgn2mNFoeJYl7sRQLEXtip0eqfFyC6+N4i6E/Xz8UC
   1kw4e2vAGzNiLcRN9Yat+B5zVdl1DcEqqPIfhGjPHMgztZrGG+bVVqmdL
   i61WetL3R5safH5ewRGYSLlDdQDwAcy3FlNy7C2xA9vL19sFqXBD3+w8W
   MnwcVW7I35em64mMaf+tB8a9OvEcPrbxeZ4OZtI4ARYtxr5jZ3G0IALKh
   67gI1+vieOdAUGw5UZ44eQzbwo/egIyAWUkm8EvkXlzPi0vsctpdOQ6Fe
   9P613a819LgYydT+IqHbh5IQ5rY+CS4B9kzFvQzJJfuG/zUOz6w4nEjJL
   A==;
X-CSE-ConnectionGUID: l89s+UkTQN+ueLLX4NvYZQ==
X-CSE-MsgGUID: K6k3wwvwQbaOpsw6apa6vA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40889014"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 10:50:05 +0100
X-CheckPoint: {677CF8CD-13-1647E5E1-CA16D1A6}
X-MAIL-CPID: E34F364A6D90C75BD1DDCF5165584C53_2
X-Control-Analysis: str=0001.0A682F27.677CF8CD.009A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 225FC163FA3;
	Tue,  7 Jan 2025 10:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736243400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PcRc8LgBBacdtMgCc7Ma6Y3V6HlZ1g1g93eqellQlQc=;
	b=LLx2ow89MHuHd9LpAlM4yq0HD29ldcNyTMzcvUSFhgjGBjiN+6zBw6XtgZGQrJffzZZX2k
	Cl5gh+qHs7IllTCWcOnlCGen5amj0/s7x0HVs6SyAecQ11yHLIC+QrGngkRHkU5jx07S6K
	uR1+txFkYrxxSECqiEMrqbdND7BcOd1ZjDoeEjYlSMfQF25pioOqHbss7tZI3jIz1Z+ia7
	uua1HxPKNH5asorsbOah3i4P5vJku95aD1HCfVXbd+XdwyO2sV16mdPffmAAwdu5BcDEVp
	ynixKC1yEclGFixz4SE+6slCjYMLy2uj+qKU8ajpCSVfyMKXOdQ2vBcpBYX2Hw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] i.MX7 DT fixes
Date: Tue,  7 Jan 2025 10:49:40 +0100
Message-Id: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

this fixes two dtbs_check warnings by moving the video muxing node out of gpr
and adding a new imx7 specific DSI compatible to DT schema.

Best regards,
Alexander

Alexander Stein (2):
  ARM: dts: imx7s: Move csi-mux to below root
  dt-bindings: samsung,mipi-dsim: Add imx7d specific compatible

 .../display/bridge/samsung,mipi-dsim.yaml     |  4 +-
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi          | 56 +++++++++----------
 2 files changed, 31 insertions(+), 29 deletions(-)

-- 
2.34.1


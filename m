Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E5C1B6CF1
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729775223; cv=none; b=LeNmkISvPQE/YUbNJHJs7vsfvG5WHvUixivkD0AvqBpm3kFyQHi1/fEUOIqnQttBdI6bf+DUC3r+8dGzfhxPddsxY8C/eQHzi621OpBztDg1UPm4EhrWzD3Imj6f+LwZ3mIorSB6SgtNtL1xKwgheQ5/wMQ+Uc7sbe2Qdud2hac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729775223; c=relaxed/simple;
	bh=De25Vhx+uasigBPfAuH+QLWUBBz+5PYWUPpFmRSD44Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=brMKl4urriFkOSvKaMVhcDZtlpLYqK1feZ1tqgYEp3YOAHNBSwrjziy327h0Wph9GDqgnRk31PPw1JzqNrgYoc6c5L5MrROF2VCgDp9vPLa74TrAIL7sCT0kFEADw4EBjY+zoQJeSyo53E39sjdCNYrl4Pidip1IYvEbgL5maSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=cIXGvtpG; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="cIXGvtpG"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7188D1F99C;
	Thu, 24 Oct 2024 15:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1729775218;
	bh=U2WiB+g/HawECyadHqc18p2lcEQdvPgRpIqGrQpt9EM=; h=From:To:Subject;
	b=cIXGvtpGnjuv6sP+m18GCQo+7vY4iBu19JRynCqQmJp9tD4lP0uDkhfVmxpUWkSr1
	 NlVXrpxNkiL8OMI7d5b4Qp3J8jsQ+7TD+9BbBSMmFmac3w+7sAfUulxfFeflL9+SFO
	 CIRfUb4Bi5gX/6DGA7sc7NsipH14yseKlAfFJzdAeGOzjLdaZyA4OnrJUOTE7afOxL
	 QdBT+rTC6uzObAJIF9B46+Uu3OBpwmST9m1wbcwf4ViXsv34tOu34ABhdaWfjTxdmH
	 6g4tUv9r6mIKfexV9AUHjlaTqsImECdt0Qa09CAFQbr/7SL3s2rJK1t6p0mvDRlwqz
	 aXutOsrR0ipUw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin: Fix SD regulator startup delay
Date: Thu, 24 Oct 2024 15:06:49 +0200
Message-Id: <20241024130651.49718-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The power switch used to power the SD card interface might have
more than 2ms turn-on time, increase the startup delay to 20ms to
prevent failures.

Francesco Dolcini (2):
  arm64: dts: freescale: imx8mm-verdin: Fix SD regulator startup delay
  arm64: dts: freescale: imx8mp-verdin: Fix SD regulator startup delay

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.39.5


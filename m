Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563333;
	b=L/Zb/wbEgBiwOBgSka/iGLW735Nuxapcd7QMyLgwxZ5PKl/STE3gb4eTuqPS8kry7ZSY
	 Jh3g40lufmHngLSWKw5ne55aS53STMQ0vxPexLnIFLYaIgD/2+ASL8liC7zfQTRnJvq4E
	 BR8jsB1efSGnzEeIGKb3h9o1KE24at9Rx3m6cH5kryjNNMwOsCD6Ga4+ySM6vn0+OIQqx
	 H07eSUI8Zbh5yot//YZoGsLFdDICkYwrvyrPWwOAPuBJ1a7PuPNW7JbdJBNsm9+o6OeQJ
	 I3sMCbpUwRmCw0sXeDh5ysFo2sokQFJXjl+ho2Ez88Q1kfBM44jrV8Pz6gIvCVln7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563333;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=VFHnY20SCHy0bTAo5uMaL3gLeSndVSag6rrY3F8fQ0s=;
	b=KqLxccYw7Ybkessl/DhCgGB8ahy83SqeKdMV+/ffpexAI5RvcK0pNS1Omwd8Duoxg4gD
	 1XehQbS132XnwZ8cZhuIuJSgMTpIgr4Um/LR+NdDjKjVCaUUtC08p6CbD1zGpo3cxiDuz
	 fmzVx9F+0msgcx71ksyLeNThSTfRgG0dHhuWfQ0WU9OFWtcKlLqwuyC2wpcfnNP/9Ls/r
	 yS9VXfUnxgJXbDKKy0uBPb8+lEp/d+pLeD2JRdWsF9m3G4RnlhVCYXKtcltou1UDds0gL
	 QwpKYohTDjGdXXGx5ofuiQyCYO/YovxsqBdfMyPVtw3IVJpsh+BhASeQjZkm44tQECA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Cruiks6O;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6F606A326;
	Sun,  1 Nov 2026 20:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A6F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Cruiks6O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793563327; x=1794168127; i=wahrenst@gmx.net;
	bh=VFHnY20SCHy0bTAo5uMaL3gLeSndVSag6rrY3F8fQ0s=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Cruiks6Okol23blPNuNL0daHoh7TrM0A8VLcWRjmlSxsF11sYceutxTPE5zdukuj
	 5OvTDityRApkPo7Vkh6FTG1W3WULzoq4bc2RCOHCRsKtpgfEzU+TNWugk4IcIzIt9
	 SiCqRQI6s/WUvbIfJAE+P16WjcgnyuqSGSrqNcAf8lrLvostrozQgM9h36KPiVhJm
	 nm9NK4N92uLvPF5AAmW91rBOXSxT657kr0qTTES/357ewGhec0O5/HKFBvJ691Ojo
	 HZP4VZGHYeFP2Xqbm3hkWtaMVV7yhMl/xIu8Zx5xxN/7x1cOW9h7XJoNAYGOfq01E
	 Oi5sqFKv8IEqr6vBQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWAOW-1x3KnU3YKo-00Is5U; Sun, 01
 Nov 2026 21:02:07 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/3] nvmem: Add driver for i.MX BBNSM GP register
Date: Sun,  1 Nov 2026 21:01:37 +0100
Message-ID: <20261101200140.141642-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IbfjlXoY8QkTneIEiWq/I6aYGrwTChgS0DXaMpBsoMRFbIJnCjy
 N1vc7hI5vF9ISiUKRyvs36YASs82UoQOmktv6c/SdCTe4+lPmt+JN0mkMYHrAdNEef7Axkt
 Efz5tczB4GATZAbU0Q2Buex8aeyyqbraGAwEk5YB4h2dpM5R/97sKSbXhgwbG8VaBaCmV+6
 v+uLkGwylNi6nKqMd0zaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:INE1ktt4NTA=;O7ezA1xBn5zlx4nmiobrv8yts4E
 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
 vm0wlxn2JY7xuS

The Battery-Backed Non-Secure Module (BBNSM) on i.MX9 SoCs can have
some general purpose registers, which retain their data on power-down.
This driver make these register accessible via NVMEM subsystem.

Stefan Wahren (3):
  dt-bindings: mfd: nxp,bbnsm: Add NVMEM for GP registers
  nvmem: Add driver for i.MX BBNSM GP register
  arm64: dts: imx91_93_common: Enable BBNSM NVMEM

 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    |  20 +++
 .../boot/dts/freescale/imx91_93_common.dtsi   |   6 +
 drivers/nvmem/Kconfig                         |  12 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/imx-bbnsm.c                     | 116 ++++++++++++++++++
 5 files changed, 156 insertions(+)
 create mode 100644 drivers/nvmem/imx-bbnsm.c

=2D-=20
2.53.0


Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F49A43B4B8
	for <imx@lists.linux.dev>; Sun,  4 Oct 2026 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122515; cv=none; b=MG/HXefhRW/PBIHVM5sd74Us1gny6rw0Wi/qiDkGR/6KxEYEBkmOx/LkxJByrZu3hCc14HrMDXRX/hsFNIaMpgrMhR4+M6+x/EyvsK7EoyeB9o7pDjkRWBDQdNp+HjycPmn2RnB0W4vB9wVBe2zkcN6BLN5WgF6JkI8zSMpGlOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122515; c=relaxed/simple;
	bh=eUQBQboycDhzf6qx+L+N+Nl20cbK4aDsepmCBpNNm+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNTJZD74zCXUl7vp9HuqPqCRvtFzPkqX5CSCRTEfEq4uX80kqjksCibY5v8tpiq2sSGarmHw6vw7KRuZIyHBL5EOKbE+ZX4aWYyertwvjYxWzNwknqm0LUy9UDOhLnOf3vjhFMkyykqd+ApCIueoJofv0spFCNU3qRxl+0IO5yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=PItNeKRh; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="PItNeKRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791122504; x=1791727304; i=wahrenst@gmx.net;
	bh=XcGWjbYJqX3PcaEGN7PAgpcqY5JwI2mciBfkPq7UO7g=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PItNeKRhpbC2dq+rOMuSC+mFsno6VdyF5QP6WVUORbMVzXhnpMnUVwz+1drvPSBj
	 4blpN0V7e2MttCJNmeOQpT9OXpc17ucGc9mCjZu1zseW+ZreOX4IUwioxx51CnxYk
	 Q7yyScruzSRDhUc+j2CfQhZM5K+5C5Kh40FCnnU/tCCsEKyeelCdmS4wZTtCu3hw7
	 0Bfmd4rtKPq5zwLYdH3eNOPzv8CS/0gYSGd36T4cAZZBTLPAl1KBS1/TqdvjuVwfh
	 NnWyZ2tnej0D0/0C0DFyIdDgeyeDbZj01u1KXfacEcPkli3uLIP0iHmvV9ijI5SaB
	 vZy6DUbXxuPeBBOkGg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1whars07Yq-00eSVx; Sun, 04
 Oct 2026 16:01:44 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/5] ARM: dts: imx6ull-tarragon-common: Fix Ethernet regression
Date: Sun,  4 Oct 2026 16:01:19 +0200
Message-ID: <20261004140123.46461-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004140123.46461-1-wahrenst@gmx.net>
References: <20261004140123.46461-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yDkjn1eM7fLJwKGg+q8llZA29RLfvK5Mf8a7EY6BYXuhGr0D4Uc
 Syq1HucEWGQiOMbPI8lbQhRfzPdjGJfP0PdgGGElKsw1RT0Sp5GTzlgPihsQ9e1XV9N0Bpx
 CC/y6w1IP/1aX1Ri3yLdXBiiClasOl/SmzA2dx0I027MkYzspbZJwy3iLQ2bDeHHrI37F9u
 S6EN3InkkOywFMpF6yKfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ghSJRbdj224=;GrT/qHLDYsZElG1bIRd0xrO3+eT
 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

The commit e2ba87c745ca ("ARM: dts: imx6ul: Set macaddress location in oco=
tp")
introduced a OTP to MAC address mapping on DT level. But the Tarragon
platform relies on a different MAC address mapping, which is provided by
U-Boot. So unfortunately the mentioned commit breaks Ethernet on the
Tarragon platform. Fix this by dropping the additional MAC address mapping=
.

Fixes: e2ba87c745ca ("ARM: dts: imx6ul: Set macaddress location in ocotp")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
index 5248a058230c..5622f0ebb7a3 100644
=2D-- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
@@ -119,6 +119,9 @@ &pinctrl_enet1_phy_rst
 	phy-reset-duration =3D <25>;
 	phy-handle =3D <&ethphy0>;
=20
+	/delete-property/ nvmem-cells;
+	/delete-property/ nvmem-cell-names;
+
 	mdio {
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -139,6 +142,11 @@ ethphy0: ethernet-phy@0 {
 	};
 };
=20
+&fec2 {
+	/delete-property/ nvmem-cells;
+	/delete-property/ nvmem-cell-names;
+};
+
 &gpio1 {
 	gpio-line-names =3D "",				/* 0 */
 			  "",
=2D-=20
2.43.0


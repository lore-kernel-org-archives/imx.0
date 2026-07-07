Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A4348883;
	Tue,  7 Jul 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414559; cv=none; b=PmJrhF+GqFEWoYYA+QsQq+RdLQkmR8D2RRn2nLdvfuZspczSB5ypy7RUqL0vGyihs2pNf7qsrD69iNctM91VQVt7Oc8KBfQjQNjr8FgEfj33+INae0Ew9eC38KGHHY2Epr1kjl3otxKpCgcltarsViyLprGGzVkZvsTU8jg+Uw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414559; c=relaxed/simple;
	bh=irrqjVYMySIxSLr7HHpy+Pe9GgqnEXTe4g4o3xS17mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZxqVdSFOKhiLdD92ZutTeCELWPyATQU/guHXxnH4N+wgxqfA+6zNPT/d9ClXQraSx+fd++o+qT3QP9CI6u/rnKFqHxJ+CJixfEuwmT2ktsFJ9ZklvwJODxVtvMHQFIHjmmwy5RT6sIdsjkYWYs3pnyFYB1st0tRFbXXOKckJQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KTHutmk6; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KTHutmk6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=HxqEWZp1qs8ndMuXkIPLb77vUFNki4MesCWvabNqrRw=; b=KTHutmk6OI9gPbLyrJ+/KgMksH
	ZjC7y5H/kUrSdpuRTUrSL2fgQ5Bm+4BoH7VB6HbsKDNI7gQBHPItXcn+QtQV4tXi3GbJtb8AgT6Hm
	I4dgVQYqPWZ7EuYz4M+C5GVX2iszeZU90zPERRRoOvDY3E5SV0cBLoBhwwBB1i9zgh5RZ7EC8dnWW
	GwuPorcjm+yi09qAhoCJ44wFDf3u4W+6949BhQSJ6OQx1WRy7sRgIjreCHISY/3YX3Vp3ycdLYnRq
	uLJ2qjs9+p0woj93L7cVoHPsWGdyly1c6KVi1CpE0f7deUsTW5lK2LiEw5T93PYxp/b/IDoiwpU0a
	ef8JufbQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1as-000Gjs-2w;
	Tue, 07 Jul 2026 10:55:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1as-0007hK-0C;
	Tue, 07 Jul 2026 10:55:54 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] arm64: dts: imx91-tqma9131-mba91xxca: USB phy adjustments
Date: Tue,  7 Jul 2026 10:55:42 +0200
Message-ID: <20260707085551.1683462-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
References: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Add samsung,picophy-pre-emp-curr-control and
samsung,picophy-dc-vol-level-adjust using the same values as other
TQ-Systems GmbH mainboards.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
index 5c430e6fca651..60d11a4573e3f 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
@@ -518,6 +518,8 @@ &usbotg1 {
 	adp-disable;
 	usb-role-switch;
 	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
 	status = "okay";
 
 	port {
@@ -532,6 +534,8 @@ &usbotg2 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
 	status = "okay";
 
 	hub_2_0: hub@1 {
-- 
2.54.0


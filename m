Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F256033A6EE
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 16:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766507327; cv=none; b=heLd/pG7SlAaEgeWhInLDI9K6vGiCUImzLuErto0apNp7vkYwoaATo/dr406qxQqyg/jV9CpjEztzjNkbhQr4bv7eS7K/VI8VCLYj+WVDkFGNsXocbdy4b4dLOGf8Xdn4Y9bRsL89c/b7eN5zH3dxqCyqQv7Hj406H8jm9hKVEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766507327; c=relaxed/simple;
	bh=hyau1PCbq35CfU2gKLl0cZE5KAGycWiD9MwmSCBDVUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIadx/egkNpPlyPkf+k/iqreIAx5KlmWQ9kEq4BUsx9/tvVfLGuhYbBUCz8GzYCn8bs1s89hE0nEqAoZAGO7G7vuzybl7CEtohrqo5ZjlLtIvoXAGwkJExRBoMwsQLieCNjTXEFPl3WtLTnXkQF9zdpX08zMiOgbk0B1bmrGQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=S2anlDl2; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="S2anlDl2"
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 9FF411FE0C;
	Tue, 23 Dec 2025 17:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766507323;
	bh=jnFb/IX3ljIxWsMngTBtcXekODzwjzg+jILeoqFZb7A=; h=From:To:Subject;
	b=S2anlDl21dcTQau6eVPjl9xfm98B/lT5hXIhlsNDw+YCmSzVqh/82dBzXtuiRpek0
	 gxxG7kCCG2MMFLpVrb0PvH79UaSokk3e3OwPDeXPi85rMqaofOdScXk8Fmcq//uzYH
	 EoODPGEwmFHmKR28fGMo/esPiE7QUN4HFOTQvzAN3WfHI7rd9Rjwm3A9n9S1PvSNXn
	 20OzctLHbbRyOsBw/aEcRh8dwoge05h5KAmnbmCIhoulTXix7pbv4hwXSFq+eMOjzb
	 qFK9vUakDsxxSwz9S7eVBjm477JXAjq6JxsqODgUAoFss7KJ/CKWjSTFAvsILzgQXR
	 /uYp667RrzdCA==
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
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/4] arm64: dts: imx8qm: Add CPU cluster labels
Date: Tue, 23 Dec 2025 17:28:28 +0100
Message-ID: <20251223162833.138286-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223162833.138286-1-francesco@dolcini.it>
References: <20251223162833.138286-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add labels to the cpu cluster nodes to prepare for the addition of the
i.MX8QP SoC in which these nodes would need to be adjusted from another
DT file.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index cb66853b1cd3..e0046f798eca 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -38,7 +38,7 @@ cpus {
 		#size-cells = <0>;
 
 		cpu-map {
-			cluster0 {
+			cluster0: cluster0 {
 				core0 {
 					cpu = <&A53_0>;
 				};
@@ -53,7 +53,7 @@ core3 {
 				};
 			};
 
-			cluster1 {
+			cluster1: cluster1 {
 				core0 {
 					cpu = <&A72_0>;
 				};
-- 
2.47.3


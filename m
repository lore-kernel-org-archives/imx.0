Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EDF3909B5
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127378; cv=none; b=PqIYo9fbgzxhAS4mlg5kpdxcjm8dQ/Lnp3Yx9P3Boh3uD92HIVDOsWncoH9xvfEPIUPiWR9wREl30qLDvqNGObQAPbcBhCg7b4Etg8w1TzzJWQ8Xrx+azSFdk2z0EDS9aECbEG6t+keRkwqzSLCOud7g2f3ZqOuGWYB3Fi43XoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127378; c=relaxed/simple;
	bh=r1kXVug9afwt9LLOSOUxNyzHexEiwqXyzSr9Z5DrmDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rOu/70+fuixLzgFaGSBrS1EqvIzWGB+dVPEFfVQWlXtNw9KyRWkJH6T7Cebg6UvxD7JPyaFmsAUofBQ3gvMFn/Ov0udISPpW7AJlhWhlUcHgCHfrYPWcKDSJ97jFmHhHRmjwmYERi8p8xPg50ufk6/hSfFy6UnINsvfN+R8wzqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=a35zriNz; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="a35zriNz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LftVk3p+D1lpNfbkKE4+KpyUeAmiTsBUQjaiRU8yqnw=; b=a35zriNzqF4F5VQ4nKIZhr2URy
	fWXHFkdz6aQg6BoTWFEjt1/VNjhyATDc69e/UPvPNv0rA0gTVTxyQJFlSyDes1M8jfluU6GRs8gvW
	sp8y641h7dZcNHzHiGJXrAjkOIWZLua53kEaCDonL4jrwSauxbqfKXkbW7O4ciN3TzB7LHkJTp5KA
	5cfCFa4oMMkuB8ObZ777K6msb66My2QamtC8S+sYZVyKxsWl+PFCgqGmhzqHdpVvLs8LkCYDpabDX
	JsRoNyY8abCkzeORiFHD628JJk3jQZHyyAV07ymP9c/GOO1LpRE7Y6hibt30g+v/pdVtYCmyJIrfw
	n+1EyOWQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52086 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Fig-00000009fYO-2Q1h;
	Thu, 02 Apr 2026 12:56:13 +0200
From: Florijan Plohl <florijan.plohl@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/5] arm64: dts: freescale: imx91-phycore-som: Add gpio-line-names
Date: Thu,  2 Apr 2026 12:56:09 +0200
Message-ID: <20260402105613.1303871-1-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add gpio-line-names for GPIOs with a defined board-level
function on the PHYTEC phyCORE-i.MX91 SoM.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../boot/dts/freescale/imx91-phycore-som.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
index 29a428a052b0..b9a453f6b290 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
@@ -88,6 +88,28 @@ ethphy1: ethernet-phy@1 {
 	};
 };
 
+&gpio1 {
+	gpio-line-names = "", "USER_LED";
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "I2C3_SDA", "I2C3_SCL";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "RESET_PHY", "",
+			  "", "", "PMIC_IRQ_B";
+};
+
 /* I2C3 */
 &lpi2c3 {
 	clock-frequency = <400000>;
-- 
2.43.0


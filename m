Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5DB34403C
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828668; cv=pass; b=fQXEgr5t8A5ZdRCJfpwttYKtgwfRF5ZQScfqu8CQxZE283I16c7EB040L/HAiBXvhBJ9OcfC7+urnJxGb9Yxtep+qOwKj8VsAq3b1IECGtGTQZVXphvEVe2cz4wbQlDSCqRdAhTt8i9P3zxMQHOss8GAJqwHYgWKh0C5tfkXluQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828668; c=relaxed/simple;
	bh=TLtc63oA8rsVyxrQ/YtnZvIuF5UIyZJhCDrvQsCFiSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYXMtuAFh3zB1l1s8GGBbv7lQMxQpWHugvbkDjT0uK4+FP2G2VaYrjVCOSCMRC437iz8wfibVgwBzFQDejrvzJdj7RgjM/k4ncVz/TjNQYndbhTEJyydG2DtvsSg4ZJ94tcaOsefYNw2Wh+mKzMKC7gK+KV9DUUeY5cLouBJohY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ewr+ddW1; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ewr+ddW1"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=y4zFQ3e3A9iazkDCS1HKUeYMC1gBPcCfcKqKlQwEs3Q=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828611;
 b=gTgdt1jo2tBFwLBS3vlzJEl4Q7V4mVqFjZUdILzBrdgO/jJqn4gthCX/zcJpp4o521vNs1yd
 /D79cs5tbK+Fti45Ws4gWXuGwrp/2otjZd/DIfXyWzNgOvgod225HO3buRquVs7LxZ4TLgyR5L6
 IcVpTFOG7OaktHEHJy9rAEhijtNuT2t9jClL6trAPp0j3zgXE92Ksrpw+l6A1nfFCPNl1OMvuY1
 gBSzpjcAGk++OTjIGrgm4it82qEBqZLwN7tyLh54U6gCXkQneVh+a8TerYzFgvxU1Ptt+iPNHyQ
 upjpF7YVBav5uIVBs87se8SNZOrdeF8xN2aSHzJQmfQSA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828611;
 b=YB9rzw041GONkR4HvPoAEmHZpLsvVlzPPwfeiSkno3mQe8xlsi88LAW+IfTMO02D7hrj7qWh
 fGmko3Xq819H0wSNxiOD6zDz+DcwSHgotr3TZfVkPcZYseKKW6kIHuSsAvwluGamocCsymL1N5Q
 g9cnNhS419mfqZzdpoatUaqGi0Sz6WUFaTBZM75Ii1AwiRz9QO3hFYiSx3zXCZkAdojf3vViKT3
 Veol/OkWgOkGzZpHhzV2YsFGfUnu/5CukpQfPU39EO9PuoFtg/kv1uus4oR9Qy6C1mSXtY4uKgx
 YxivE5g+wYOdu/dQs0icwBtqBvKrFYyJVCmZQKWKFHZhA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:10 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C48DD220BF3;
	Thu, 30 Oct 2025 13:49:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/19] arm64: dts: imx95-tqma9596sa: move USDHC2 config to SOM
Date: Thu, 30 Oct 2025 13:49:13 +0100
Message-ID: <20251030124936.1408152-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4cy3qB3ns8z4Mb38
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:441aea839c344cb72b836383b2e3b063
X-cloud-security:scantime:2.677
DKIM-Signature: a=rsa-sha256;
 bh=y4zFQ3e3A9iazkDCS1HKUeYMC1gBPcCfcKqKlQwEs3Q=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828610; v=1;
 b=Ewr+ddW1rf/GzvfIa5ji9a6A2RvPNDSCYAIatCapoFXLhJDNZaVNogNUZU0EvYTF7JzPyq1s
 3dY1StVhepDMlror0V/qnhiEOTaubkYQHhdfQVlKojMfJLrg4IPD3myGMBwgneRUul1XVIJc6F3
 7gc9yPNLeY9d4M56fT8rTSYLelRKNKur0kKPJsOLdtANAptb5tDz0oLCuMEbUFJkjtr1iVz4J5H
 +txxWv1Z2YtjX58+FPwQbaDQCcv6VfKImKrFX+L03Okbk8g9H4Z2L7ywsQicIJvUqSqVkcg3LVR
 XTg7uXDdXVa6VvT2v/+E8J9XmrSd1uH/sYtxiGNrMC6YA==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The muxing and other features are mostly determined by SOM,
so add it at this level.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts    | 10 ----------
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi  | 12 ++++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 43ed55e57d2a3..02bbaaf298930 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -301,17 +301,7 @@ &usb2 {
 
 /* X16 */
 &usdhc2 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	pinctrl-0 = <&pinctrl_usdhc2>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
-	pinctrl-3 = <&pinctrl_usdhc2>;
-	vmmc-supply = <&reg_sdvmmc>;
-	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
-	no-1-8-v;
 	no-mmc;
 	no-sdio;
-	disable-wp;
-	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 8da9e368c1f4d..166439e251c53 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -453,6 +453,18 @@ &usdhc1 {
 	status = "okay";
 };
 
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	vmmc-supply = <&reg_sdvmmc>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	no-1-8-v;
+	disable-wp;
+	bus-width = <4>;
+};
+
 &wdog3 {
 	status = "okay";
 };
-- 
2.43.0


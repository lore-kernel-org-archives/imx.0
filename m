Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E104F4727
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455303; cv=none; b=tOlIApvZnk339vCqqX5mtvh5BUuHT3KuabKR/zt8JEArVSvVczVukBr8V2q6bq/ej1VFf06FiSRzC7RKSRDugXXMuRdtoohZ3HcE1ogAajql3PJHaaH1bNvse+KYqErATzdD/cOfIVIjAUPnwno13MdxKCk2HCUd3Z707ERRB/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455303; c=relaxed/simple;
	bh=IVoujA+C+M/kei9eyCb8PbxU2gqfAVemANW0Mr7KYQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePSQBX4O+8w77ZyAlu2eBMWHis7MCoaIWk6ZU8xD0FYZhjfztfnqAx//DkeWtoqrJMMQeNGV8crV8iGT1oSWHGOzEYljclginuPtzW6GdSerySJOH0r6tlYyaGmR7wENL2fYz+8QQe3C42O7FPyREdbc+zsQkgYdWeIpBjEqZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6mPrfuO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6mPrfuO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso1111975e9.1
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455299; x=1789060099; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NF+0Eh+B7CRrv91L1LEQIL8RYBdIoY5OhO6aCb2cgjw=;
        b=i6mPrfuOj71mFTnJAWxteWzcP5M+TZY4vUR8udP1sCotw2tlPokMH2tGEJ8BMvL7Pj
         gCgCfuOFYD1e7BL2Ahripow3i43PdMYRgrVBatsmnoxT5MvDZdcetBWCzkt9Kv2R5MgC
         7vf6IBwEOI2KXTmpk3TyqcA6DIDJUdk7RVAAwlO9mVGTevDktaxnf1AyKVK1NBtfWJkt
         IkBCNdRpQgM/Rrqj9Mz+KJdHXqCrcvFV4v5vVXJdsDxPguglImwza+Qe2uRsHSxO9BkI
         yY6YtAOP0q5/pnRcxKuIU1sneHZcVQvnDcWfLFFVMWD90OXjdqxgxPJL8A8Yo6xFFkZe
         GDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455300; x=1789060100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NF+0Eh+B7CRrv91L1LEQIL8RYBdIoY5OhO6aCb2cgjw=;
        b=ju+qPwNdWJLfODZppv+EAlAVHUmFUXnnX+vp1+8PYvknFWdcrlAsQdEAvPhQcLU2Wq
         LQ/pH4vksXLGx57uJDQRTPv6ZtJTNYnb051Cv6HPN7fWjB9nGPWEd1tUeWWAtpcGei9j
         OSnigG5Z39bpaOyzN9diksybxmFkbAKlCcVLy7pwIa5QthzUix5QlporKtDduySRszW9
         aLvgrs+WPFthtOovboJDVtYbL5IUYmpNjF4hHsth9l5w9DjgWI2RuWnBTwmpYoV3L6L3
         69nSgahsO4OvvCY8eqVGP1dZnWaD2GPSm7BK9JqLUxmoQ+OPQl0nZH/Yxc/gk62Z/g6W
         Gyug==
X-Forwarded-Encrypted: i=1; AKwUvBx3wqjbxkYp8aMZjPi8BoLVUhGH6ZQNKwhX6J8VtxJxbThP77KDzZv0lhdydUl440c93Ug=@lists.linux.dev
X-Gm-Message-State: AFuF++m6lE3o6yHyxP/yFDX7JvPd4Vf/wlKvk+N5qqm0VfpZLKjGSQk2
	G8V/aVz8zfChtwphARAeQhhcilqCOFAtZPwZD4MXh6pHszdX6RqmZmW3
X-Gm-Gg: AYBFou3TrKWZcYoVO0p/y89AgGNMWnpJ00svBHI1yADqJfoKDSlrXWUBE7wbs2sea+K
	ob5Z6vmMCKDqHCYy9HsAf7GMI2cp2t3zLzeubXZ6jJG7u/N6/esfhq5iMmXAXVbJRF39B/xrXfv
	7vtaAob7YtqeTHgXkHYTt2XZYPHb6Lj+bGwq0eVOGOxtWriI350BibN019PjgT2cWgKoV0YeX4W
	UOufhCg29CRd6xVnWhIl0m9n/3ADnlB7NSlYTJxAApNmMccLvgr9C3lx+pUtwHhZlf03j7nwHJl
	tRq89sEZxWkE1m5Bi2Ub2VO7Rata3b86IgdTkVm7Pc9YDKeE+ECx5dHRau6aLSlbrCZ4Nv/AVLP
	CmBxKJNDoWpBp0EX/hFjn/nukpd1/OT9S6rs4RXqALL1RdCwaYJN6a1mwXDoBrSj2yETVtE0ZYl
	wWRyk4RBwk+elEI0IQgXnBHjnz3TDxiRT6Ez6/O7Fx+iwURtYMEWLAxrapX5OJBvsBhTt6PlBQw
	9X572I/DW3xsTbrxrDWUfU8OBsmFrYvRNg7mHGjK0pKGPi96C9NkWSOuBeb1WUVv65EqPCPTNZD
	x9PBVdriOW3HV4c4FP9Mxh9YTEtjFahIXSh5WA==
X-Received: by 2002:a05:600c:4f87:b0:49c:d293:70c8 with SMTP id 5b1f17b1804b1-49cf4f9dce9mr56543595e9.3.1788455299039;
        Thu, 03 Sep 2026 10:08:19 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:18 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 03 Sep 2026 19:08:01 +0200
Subject: [PATCH 1/2] arm64: dts: freescale: imx95-toradex-smarc: Add ENETC
 port 2 in SGMII mode
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-add-enetc-port2-v1-1-2a21139d7a7c@toradex.com>
References: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
In-Reply-To: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The SMARC ETH2 uses the ENETC port 2 as a SGMII Ethernet interface.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 7437e523ff639..ffe537ccd5bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -64,6 +64,14 @@ &enetc_port1 {
 	status = "okay";
 };
 
+/* SMARC SERDES_0 - ETH2 */
+&enetc_port2 {
+	phy-handle = <&ethphy3>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+	status = "okay";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a6c5398a81e3c..27ac9731733ce 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -15,6 +15,7 @@ aliases {
 		can1 = &flexcan2;
 		ethernet0 = &enetc_port0;
 		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -221,6 +222,12 @@ &enetc_port1 {
 	phy-mode = "rgmii-id";
 };
 
+/* SMARC SERDES_0 */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0


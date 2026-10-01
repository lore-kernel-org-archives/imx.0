Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0A74CC610
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844202; cv=none; b=mKNj46+syth05KQAfWTaFMbulSxA9bD/6BmD/F2hr4htwdNvGUxie+SdoIjFJd1FzEOh61CrnlJMZ9fKTk8P+bMicnK8HV+7lFLOG5mRNy9lFI1337tn3CeT9A78g1KKnjcpSXpfA7nPNZGTecesXq0vPcoY12SEPL1dyejYxtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844202; c=relaxed/simple;
	bh=wxElBAXB6uVNMhJYd8MDjWzdFURgnAS4XjHbavkVIDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsv0jtxltXcLiG6wpRW1NrAeJg1yLWR4eq6WddgqRj7GBvPalyRZ7mkOw0s80fbmG6NW4xzaO22zY9mceC/pLx8I6fUXcbZ1Bq3FkqcSEoggTwmBcyF5KvQ9BVdICURSTjrru9WUveWIkF/cqISoLjnnY+TUWLmHrXem1r6Yw8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBHuMmlA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBHuMmlA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so38305025e9.0
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 01:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844198; x=1791448998; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Atuw9lBz57e/hUpSiZ8WQ/Sj4OSIXL2+X4pHB8jkTYs=;
        b=RBHuMmlAvwd69I9DygjSK6tZ/1XP/0tYo1D/MVPyiI6vji81Bo/WEuz9JzdPj+fygY
         I2btQupP8KSjmm00+uHWvlHUVn09yytS8GQPAw5i2PbnBeZeZzDo/kh602ix7wjrni/G
         wAQsCcVuI2g2nF0TsVuAS4BeaAJT2LQbNGwKXw6e3FJFViV6RJG0m6xfS27AVND/hWlO
         c4LusoPups/ywkJb0rRGglxGX/9LqGCIfEh66ab9saFVGPaso+mdpugujOOSgyIWSbg+
         rXiLCze4NAn68ocwgQ7Gmlcgl5AR2GvPzDlHa+642PGklVcPcx3Nhzf7cVq7BWZ9Bguj
         wUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844198; x=1791448998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Atuw9lBz57e/hUpSiZ8WQ/Sj4OSIXL2+X4pHB8jkTYs=;
        b=KfObX5WS4Pqoi3IuVtBczjlNSRwlvCVcIC0jvqDg+4sTecTUgO7+Cvr8SrmWGsOz/e
         lQu9m11ff6gvaKjmxOv5pNYkaTFHtzsJJJ6O//+0c+wQjq3WzfwuJtk73ohrYI4nlwR5
         DEAuSW7NP8nN98X39hq7UigIHAktj3S52Ca81+SdaC8t9iTNAESZmSVStd6F7tBtmFek
         IZdMZQl2faKEQQ+tZmfhStsBDkVqFfi2Wu/V5jUIpqMSiQckbrWdvB4QrYZovO01cvN+
         g+vINsWHGvPoCMfqspRBEQSzXe70+sXDjTDXK+KuorG0LrxQrpc2xyWYXz0Wo1NYLxRU
         pOcw==
X-Gm-Message-State: AFuF++lt4ZJCqj94Rjncwq4upZTuTkeDuyRw/nfXGMavAixoNEsU1HfY
	yRh/M2tTn/qrCnZa4KNA5BvUKU4DXCVONaxKhR1dHJhgrgqQ7O2UixeJ
X-Gm-Gg: AYBFou0EkPf7jXA1fCq43WcCHgG1Zi/DOVOKn5FYptgQFbfpO7A/xgWSPMA+qkTlSGS
	uUHYzSliWfByTS/jB8OQ0r1C0/5mOECywKfqdbkqURRI+w55vegXhHT/b5ExnVqu0y4xIvpEM6l
	0Su1srkuonrbzOh0+O+qjuIpj25jTk8cS8hQ7UiOlip0eidhd4MLIMEtyjrJ0qspHxS9KV3jgBq
	wA8Ob2+XlyOCwMWunsjDUyJnI++J/b330fFkWSeUPNcix7BKeN1J+UeCMEY4YuIb257cKQYiX7q
	THNjusfkmwi+0d5NOIriL6TTxu4Kahl7L27kKL9j/SBMYRwIr5yPv4UIVdf/HyvMz+FhmfT0iHG
	hCyXLN17iLqrGh/IuwcGqG726sbinXcuMxBLy421bL/Nu0U1bEMdW+ZA9JQl3tMIaZuojDW/z6E
	JeXdxmGXs6oVmR9qm7n+4NEbUioFBRQnXNPNdlcnWkZ1zqWZrG1fjZDM0S/LTmYC/6jCjGhPpQV
	Tf1qZHBrsmMXWReDTpsQWyeQAcullMzg27Td/so/wNzK7voKAqvd9UyuCUwjDW4px1RQeuh7A==
X-Received: by 2002:a05:600c:4445:b0:4a0:1b14:e845 with SMTP id 5b1f17b1804b1-4a01b14e85dmr65548535e9.2.1790844197683;
        Thu, 01 Oct 2026 01:43:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:11 +0200
Subject: [PATCH 2/3] arm64: dts: freescale: imx8x-colibri: Add Cortex-M4
 remoteproc support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-2-21881dc324c1@toradex.com>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M4 remote processor available on the Colibri iMX8X.
Use the same entry address and memory layout as the iMX8QXP MEK.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 2415487d3a5d..b71bffb9dad4 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -86,6 +86,18 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "usbh_vbus";
 	};
 
+	imx8x_cm4: remoteproc-cm4 {
+		compatible = "fsl,imx8qxp-cm4";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&lsio_mu5 0 1>, <&lsio_mu5 1 1>, <&lsio_mu5 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
+				<&pd IMX_SC_R_M4_0_MU_1A>;
+		fsl,entry-address = <0x34fe0000>;
+		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -97,6 +109,37 @@ linux,cma {
 			reusable;
 			size = <0 0x1a000000>;
 		};
+
+		vdev0vring0: vdev0vring0@90000000 {
+			reg = <0 0x90000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@90008000 {
+			reg = <0 0x90008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@90010000 {
+			reg = <0 0x90010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@90018000 {
+			reg = <0 0x90018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@900ff000 {
+			reg = <0 0x900ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@90400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90400000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	sound-card {
@@ -487,6 +530,10 @@ &lsio_pwm2 {
 	pinctrl-names = "default";
 };
 
+&lsio_mu5 {
+	status = "okay";
+};
+
 /* VPU Mailboxes */
 &mu_m0 {
 	status = "okay";

-- 
2.43.0


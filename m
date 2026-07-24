Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228C9448B9A
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910292; cv=none; b=DN60X9jaqTJyPIX9Bl2TN+3+420L9j+lCJ2cfav41nmrm5ShdkrWIHJxpavZpk3blHjzRVEtkQEOUTjLt9yFMzu6pLAKf6wTwPHLcrnDYrmQ8HjmRyzXThCcBePaWQqBVXP37TGeZ0uqdxdrCpjQ/AK37GUhGV4hMdJ4ilBo1kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910292; c=relaxed/simple;
	bh=zDIgnleXp1YmaH4T0Fq8FlMbIWh+meVqwaZBR9ihc/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8Z+97iRqWpaHEs+iPsD0MAA1kK1YeE7aJPPjde89aXd+xhJsQGn6VPedG0s40Snej8tGZq38GtygUJ40jVvnAzd3HXdzhoLxomO3oRYN2PHJwDZhF9ECYG8QUVyr81KXbvF32dLtyr1NkRVqtO2MZXNVcbw9MJPYZwwd1X7zTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjZlFdtH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjZlFdtH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-471eeac43bfso605377f8f.3
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910288; x=1785515088; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=GjZlFdtHTEa03g+UXMUgFN1rNXeuvrm+QEIEOcDzGK9jmrmzCIP3R9TSWOD7hAEFAG
         PVaugnUjfydiLGWsh9dFcJQ8udHNJ9ab9ikRBnz02jitYGfM8LDVgChRB/tkf0TLmYyB
         g3b5ci1RMO+3ObUm9T29mg5A6SqpiIg1e50QQKpAhq8ggWE6E8au+PmRUqk/44f7fqCB
         pVZQdFEwwYJGVLUi0IC+JVyms/JRV1Qb8U/GLr6VheIt12JGdNcwrvVxHcWtv8yUsJsz
         /BmmS0BEQel3NmWzQW0z++wcI646KhgMJwNL03XWbjnKA8MEixSuVFE7Ttb4/5CG1I46
         kdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910288; x=1785515088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=fqwgKlAlT2lOFXaSuCMQOFBdit6oREadESrKrwGZx23jqKmcIbq7xXqoTQEH4OlGSv
         zFojRfTKVBGFfb1LBrSpWW9EzPFF9/WFG21yy4I3nSKvSYXLlzI7htGNbd8N2z31R6Ti
         uYpaseHNpy8e9Ubdzw9rreiTXD1+wsSr3oTS4CRtDPR59bnWHXYWuiZkgW7ofkwzvyb/
         cRHx0+81bC6U4JHnVFRAkVXIDTz7deMGfjAcv9BetgNqqJOP8CgrtHQmn9XmS5qJOOSz
         +7ykajr+dsOGxT0nbIFcNv7aUXqGrgwpojGJcq62l3Tugx9ukMFiMq/wXZv2KJlT1odY
         NJTg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0+cwBnak4p7T2xGb6YeYP/DPeCfamZG52O28C2AGDKbtuASd3shY2jpwVdsvBAXSik/4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzya+3+Tq/lujsHcfuvo8MTWCMGJdaP1sGsxTbednjs+S28aHE
	MKPz9me4mt0fKg98GpWkUfht7K34K+gam1ldwb+ZeWWZ921Ckzr4OAa5
X-Gm-Gg: AR+sD10AWIxy9DjgytbQv5jd92D3IUWq4ayxQr8XSdNmrBRryMrmU2Qrjr9W7UzOazD
	Q13taGPHHAIL8TbCX2Jk7QKuqPGJ+prKSzc1Us+bOGN/b9aAEHzjjsALY99RXrkKXsDWLTlNIaS
	VGghbw6f6+HWkU8j6p4X8cuMVC9tZyI2biTREWFRRDilgASBv/l9jHk+wSOSycboDGu9acy16ge
	bAkFJ5L/+FkLhoI/ACjU2c0CORfjMa9TixQDSGU47HjuazQoWf/CB9g3wSkX+b3PT7cFqNijROI
	7AT8dQHctBAAN/PUUTxFBKNq5ohAbSOb7igpfcqP5KpupmBmGGlLNfl6BCt9JmnMmmd/NOJrvR0
	E8wY2dVc1zqua1/znn6Bq+TEwLg+NtLtn4wyZO8hQks+DvWYDUUaIN8OuBivS/tiYqfyambM4JZ
	sH89QYaIaeaQ/Co+3LRFyxB/bICg472IzQeHnO+e+HZrdrY1Hkm8qMymn6Iz3xO5BqsG2GZvoLu
	w/SJg==
X-Received: by 2002:a05:6000:4287:b0:47f:8192:b451 with SMTP id ffacd0b85a97d-47f8d770474mr10555881f8f.55.1784910288031;
        Fri, 24 Jul 2026 09:24:48 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:47 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:32 +0200
Subject: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add
 Cortex-M4F remoteproc
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-6-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M4F remote processor available on the Verdin iMX8M
Mini SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 5fc177f589cb..ac450fc6cbfb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -52,6 +52,18 @@ hdmi_connector: hdmi-connector {
 		status = "disabled";
 	};
 
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	/* Carrier Board Supplies */
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
@@ -164,6 +176,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

-- 
2.43.0


Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA8C4A33ED
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054688; cv=none; b=bKNsk/6W0yA0n6McG44u+Hdpa/FiQZhivjFplHIa/TcX1hlGWRsIsKFA61TaMZoscIayt7+rdJuLeI/erMGdHNuvHA293WQZ8ft3dcTwBYr24AIXThsivuVE3hzfWSymKRXZ/lnfS7gXZjAQWPgf8gKRPDglaXNuK2/oqI0lQM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054688; c=relaxed/simple;
	bh=TrTvDfFn/k4uiEHyffaC4IKdjtst9K0k0gvyN6WQHvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jgcxi+EipWHzJoN9uYrkxBbyR+BB3+/EAu2Exsjq28QUbYT4aGkBTQ5FaLm81GVOJDNU+unS/OYPxXIPUQHK+Uec14AIdzrc+UEKjz1TtqKapqX6J+XFuWnQUsd9eaL9pGTBJ0lKLc81a0A+9xC3eTlLhso7TOBS1mLfRwjvPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gC1ZbLmg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC1ZbLmg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso76394225e9.1
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054685; x=1789659485; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=gC1ZbLmgcnWR555xq7jMu6HyIHyHvAGswGv6I2oZLthct/78yAlQUZ6ERQ0580+V2x
         481Z9C7UoFw3Wf7Vc+2oD94KvzZnkSOIpT4yJUO5VDOYyOZraK0pSK79UDuUnQG6/Nuw
         pVavktJz6K+dRmdWVAiqJXF4xLv2HhyO5iWMhTEwrPydyMFX6qQ7bM+OQFJQDdbhU3wE
         cM++TuxibH6X21/OJid7TPoGsapE6txTY4K13nTE6FCjLfIHq632oVkXvndLdoLR2jzi
         BV0DdkF9l5NW/rZmyENHYkgxJEufwNtx+yhTX1/9SqDfPc4z3WFaFSVS/nCZwjGGnmN/
         Z8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054685; x=1789659485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=PF4auJf9njmJ+4KtTU/zhl0TqM6ukFpMsWeO1nmi4qJjmz4GV3eqPDkENEmGUXcBnd
         bk8+gr7AXCl8xux3Z9DSwqIdEZlV/acNK6gv1G8XLHO0e9Tj1B0+QChb8crg3mTx4pHd
         ohqkzVoxmybiMffMVmpqnipbw3NXX1am3UFFD+KpV2qgEWOj9QCV4yFXssMWB4t/EqS6
         ZBpPSqmGJfuTJeJQxK31W5E23Xjn3rY3tbFvHWaHcEh2yAPkK82evMpQhgftLkkCP2+d
         6FB3F9ncpOrXIyR4a3yBu+kv70GCub4qLHPixuk2mIa1dPuYVFYlD0f0ooaHxvogXkRu
         EtQw==
X-Forwarded-Encrypted: i=1; AKwUvBxowLFNuPHnulEb2bfvzbNEH5lYONIk/Sif+orWToJf/g9qEI51bCVH9Ta8yitOVDGMm7A=@lists.linux.dev
X-Gm-Message-State: AFuF++kxQE6qE8PfiS9RdroTmbGWcYjfpnVBE8yRBdO9CKIwPnZByfhF
	N+rCCQLD02HT8AcCnbFzH3dU8fdP7PeN6Y0gAovwto4xI14m4TrbU/W5umwxoIMT
X-Gm-Gg: AYBFou2EZTbj1jpW7syTaUddlC2RqvmyVICH2uIPTFEWJnmYgWgqqpPGZeVMd+DrMyZ
	kGoSylvvxIZxxz7ZBwRiKVcjVXsWDbFMbsZWNXGjmtricM1Pd6P9hB65A7rfdnlqzavL/L9Mq6L
	XdMwChMQLGXL52Gx4LOYpHp88hFhQg559L5yzLq9MjrBRq8V8LYwzrQA8muuWaf3ufHwQ8i1Vgi
	WSgmpCw73z+/h3Q30po6fuR6zDb7CX7CQqnuBF3DrK0kDsreFm115CnY+2fwMSP8F5rsYuFb/eV
	5+x7IiT9XNvzmvbbzfEAQFo4RP9op9Uu0wjWTkyoYja8hYu7+RMLMqly2IzoMcfdfI2ruufGmOZ
	ETEiS/UhPHLjPt7X+jbQF8gTOqnn0TkFA6N6ExXCbJrDrq8CS3pFfgwx/HmVX/JLBK+Gzz0gF51
	szrUPgQHtem2NGtYAchqDDFHmiLzbuasVaLyU/RhnLBQtzdC+ZD9YEDKQCIs6bLGFVniFZNjSvH
	nZrMHw1MbvaBrqDLSaUGJPZX5uAFQmwE/bHJR70tN9a8Z/XOBXG8eqmRC7P4SGiqVP4ErOLaw==
X-Received: by 2002:a05:600c:c4a7:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cf823d0dcmr440541835e9.8.1789054684861;
        Thu, 10 Sep 2026 08:38:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:04 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:57 +0200
Subject: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-1-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..45a4713c260f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
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


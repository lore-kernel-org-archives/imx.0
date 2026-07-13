Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963903E0255
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955223; cv=none; b=mMLpPJKkCW00HRGWzx/eMz1IVyfOEagal+AZ8BBkmkQz29oS3HDq7mqvnB2wfHIoeTuHT1c7Xo2xzr31QBfz0Lsjnkz1kYt4glIF94YDMpVRN2gxrQU310jjkFjCiJHl1S+kcGcdevVfHnTow0V9rf0/+VCEnGtPNHVEmttGlos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955223; c=relaxed/simple;
	bh=zDIgnleXp1YmaH4T0Fq8FlMbIWh+meVqwaZBR9ihc/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUT3uk3W/B/bitjLv2XVxkS+rf59hHAVSfCjX68VhRgXtKDzE0OLps94DH3DmlzhxSv9OqidhJIlRkoMh/t/lpvCxWmP4OyH2N/oLybiI3NLwnlpFQeRrWRDP6uwFMdJ0IVAVShfCWl36v5gTqTnFrLqjJ7R2QDUoSGb3pZ218k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pE/4R4Fu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pE/4R4Fu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso29460235e9.3
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955220; x=1784560020; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=pE/4R4Fu1GTBHuTWbH/KN3iFYbJxzLT6bpfEFdpt4xOCD+5+ZtsZDnp6BqSLrL00L7
         WwLhzU5ooHn9AFLHJ91GZa4RE/GFGRNKOD0VGILkwfs18br7nKJ2ZWfWMzbbuiCsnGar
         vmCi3h9ly6iHv5huxcBoCKbdpZxPM3EK44O9cN1/XlpVvJRW1+XwybHqhuUe1tGHbtxZ
         NfEf6zsKFsNE4QOgnGnew5yfe1Ls7olmU/PpHT/IyNA+ixf7ppAMNDHZXJToEgAXSPwc
         16WP62eSoli8Is7DYucdZmilRRzFA+eA8vWLTUsaEOmfYOF67cNTb6WY3XglJvQSASjc
         4pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955220; x=1784560020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=rTgvVKwEoO6uBwJwR3PeXEA3cdAiI4AgxJDKReJrMY2+a9uOatjnuM9DO4n/l9A1G0
         qtOqz4VnICnfV5aih0njQ4yfZQCc1tZ8hTTCev9tBhnHDirP5QaBqUkHHa9TsurrLvLK
         XvMkm2Orcmzm1m1aC9L/HL/QIP0kJ+7KxWlMiEI3JS05jG1wZmANc5H2nIgxQd2AAD3a
         wpcfhTtBGkwa95c9gpFmQFWdeZeVqd8w8gqYOK9usnSH34ugDuNcpnsr0nkrjmcYqbJB
         3ZmaRF75SJ/DXG5e+RdZuD0QVze+CPls+qGE5EffD/8lMR2DIWm43g3gocRv4fUVqVHJ
         r62A==
X-Forwarded-Encrypted: i=1; AHgh+Ro2sYxwU4pXfW7lmTNADUgXKvVR4arnN5QM60pznBO8Ukov/TmW8AkR5JOgZEXjSy4rL5s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQdAwDerZAp7NVeKjy8ubgWKNvc5apwCQIUarumH0ojjMyrM0C
	fQi1Q05AGaOa3CodZiP9KyE3NKdTS1bkbE9t6AuiI9/R5CUitmmR6bu7
X-Gm-Gg: AfdE7cmlrWZvPht3XDvW7LUh7cFczxdC0hnhRhCkXbHRMgkCftIZSFrlZeSnPHmnAUq
	gN/uBWl9LMQwHX77qR3/eFR8B/ScqwMS3Rr9IajZFVEX+gIvVmYYtSlhr4SIsPFr8kZ20rBDCWT
	jnCTJzIn6UqErSselsMSAFOCe4VexDkce33FVh0KxsBP7go3F+NjzrQe9P7zVfm9I52Hdzubtvl
	5GQdkkUBKLI4IFLSoU6jD7LZ4gy+Pjasxl4lzNwxUnqHA7qOQCkHFYJieyqNh/UtdNaFdCL2Jw9
	PVPvgaHv0GQ4xdXJvuFiirptyQYhrNUioLOUFVaxxgxF+ZyNtxAK3YKd7OMA3Z1knptzNDdtG6c
	8c06uCiCmFc72QJ00piNGOnee9mgBeLQ571TayjF1bgLsAJCc3vQxqqKiz1M20f116ZgIEqbZMc
	mNZAmZ26u2/nFr2WNyccKElSDQGp0oNhXkZx3kb1YojqPpkrqxnQXagYTwrQmEblRIAaq7WAI+D
	howDY8Z+atrV03J
X-Received: by 2002:a05:600c:4e43:b0:495:69c:a262 with SMTP id 5b1f17b1804b1-495069ca31dmr2126545e9.13.1783955219713;
        Mon, 13 Jul 2026 08:06:59 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:58 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:28 +0200
Subject: [PATCH 7/8] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F
 remoteproc
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-7-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
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


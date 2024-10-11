Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2122194A6B
	for <imx@lists.linux.dev>; Fri, 11 Oct 2024 15:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659155; cv=none; b=k8YLLEjVPtGGEfLxdPSxnRUF0TlSd1p44TsPXovgsseZQEQ1Js4bhBGsg0uo71x394klbhcr7iwEFOPwR6I3KjgXNqipicPSHvHKM0ycsKEcvxWeVFKpF4KffnHQiPqVSDATAf9VVwKDWOE8w2klNfFKlmCXSQ7XsCneYYK7cWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659155; c=relaxed/simple;
	bh=LGVhaUUChqajyskYrQm9WHiHcIjADKr0XAo1qvMtYQc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SZXP68gVVB9mE7yBHP4GOiWtwKvhqok05yIIax8JChrHxOyUE3Ws2KauK9V/jowShn86MuzP+k3YUWr1EBzYDyP1eyuMc7dcEz00rLazKpScHe+pkV1rbBvvK1BiLgqPHNAD+ArVTSmBb+f5euQ8U87xceMh1mdfTcAoU1fDY8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Apb6keNp; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Apb6keNp"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a993302fa02so334851066b.0
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 08:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728659152; x=1729263952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9RR/LNdmVk5RE6b8H3OC/NCxgwdW3Avob2obi0lAvg=;
        b=Apb6keNp7ph4vGse1HQ/h9s9LlnCcqeI/s7fQmi5NdrfLfmvRfhxkKfshOzhf8rxSN
         b5LjzBVR1AhEZqWv0eIohRQGPPgQmTIUr+Lg4YVFtm/Ytuvd5msIi8oWo6goff5wcyvQ
         WgqvB39EPt/+AV8RfKCBs37eHP84/gh+q0B+tlyr9ogcCmAbZ/YvEaHU3irpp4K2FdRx
         nuvQQYC9j4mV38Zn2Il41xS95bAB+Fs8H1zJM1Q/ONFe4x9j1tpLGnAnO1cT8TDioqOq
         sjuvSZfryNp/hMTlJjmtvSmvrSD8UvjA/wNtkDSa1j1yV5Kv2DOdmgUgvbht9M5IctUn
         3jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659152; x=1729263952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9RR/LNdmVk5RE6b8H3OC/NCxgwdW3Avob2obi0lAvg=;
        b=iqB9D5LMYNGbHh56I0oonBlNu52qKIstCCKbcVMmFlEqlzGSbO+4m6GxIOg+4my8hV
         E0tOpZV9jTEoqJtewjR59yc3wOCt8kd1bddwmDSFRH9ZwUE3E/eGCSafDsTkzSWKjZiU
         DrokFNoWUphNhLOh2MW/7Y1BusejXovFtH3SzK3Errz/G8Ap4gKJC1rMrTwXt1CdCtB7
         +m4ZgamwddQdz36mvejdnQdeYO7kFbKuA8+14nuksJq/lZWiOAeZ4roSop/HVMO0AQjy
         zMM5o8RUoPzKRBoCoQ1dCpA7XFimShiiB+UqTgSxBmm6SHXneEbtjp074CeN6ICSfpb8
         rm5g==
X-Forwarded-Encrypted: i=1; AJvYcCVwgRB5qw3SRoVQZtEZto3tTwz2T9EsHeW6c1XZ2HDtRV8nTAxf0OaIG6jw60SXe8BgvmI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9BCSvk9K0Zke/cmfMNoqUec8tNFXaUm1JixGjPteo4Ao4/vLS
	ZaSmo74MHjMY9m/IYb5wuQU00R6MG4dygBe8hzaQTtyXhAcntRO+
X-Google-Smtp-Source: AGHT+IHTn+VL0X7tyXuVlxpt/mf2ksJlWhyQf3mF1ncv60BdLFcR+sjHrNcdVKotSY87pp+ieGaa1A==
X-Received: by 2002:a17:906:4788:b0:a99:44ef:5e6c with SMTP id a640c23a62f3a-a99b9585dbemr205597066b.48.1728659151953;
        Fri, 11 Oct 2024 08:05:51 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5b0b5sm220879366b.94.2024.10.11.08.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:05:51 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/6] arm64: dts: imx8-ss-audio: configure dsp node for rproc usage
Date: Fri, 11 Oct 2024 11:04:35 -0400
Message-Id: <20241011150439.4027-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
References: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The 'dsp' node is currently configured for running an
audio firmware. Since the firmware requires that some
audio-related IPs be disabled in Linux, this will clash
with the configurations from the imx8 board DTs
(i.e: imx8qm-mek, imx8qxp-mek, etc...), thus making the
dsp unusable (since the firmware won't function properly).

To avoid this issue, configure the 'dsp' node for rproc.
This way, users will be able to use the dsp alongside the
board-level audio configuration as long as the firmware
doesn't need the audio IPs.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx8-ss-audio.dtsi     | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
index ff5df0fed9e9..a60ebb718789 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
@@ -431,22 +431,19 @@ dsp_ram_lpcg: clock-controller@59590000 {
 	};
 
 	dsp: dsp@596e8000 {
-		compatible = "fsl,imx8qxp-dsp";
+		compatible = "fsl,imx8qxp-hifi4";
 		reg = <0x596e8000 0x88000>;
 		clocks = <&dsp_lpcg IMX_LPCG_CLK_5>,
 			 <&dsp_ram_lpcg IMX_LPCG_CLK_4>,
 			 <&dsp_lpcg IMX_LPCG_CLK_7>;
 		clock-names = "ipg", "ocram", "core";
-		power-domains = <&pd IMX_SC_R_MU_13A>,
-			<&pd IMX_SC_R_MU_13B>,
-			<&pd IMX_SC_R_DSP>,
-			<&pd IMX_SC_R_DSP_RAM>;
-		mbox-names = "txdb0", "txdb1",
-			"rxdb0", "rxdb1";
-		mboxes = <&lsio_mu13 2 0>,
-			<&lsio_mu13 2 1>,
-			<&lsio_mu13 3 0>,
-			<&lsio_mu13 3 1>;
+		power-domains = <&pd IMX_SC_R_MU_13B>,
+				<&pd IMX_SC_R_MU_2A>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&lsio_mu13 0 0>,
+			 <&lsio_mu13 1 0>,
+			 <&lsio_mu13 3 0>;
+		firmware-name = "imx/dsp/hifi4.bin";
 		status = "disabled";
 	};
 
-- 
2.34.1


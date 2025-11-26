Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC15329C6D
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160993; cv=none; b=Q5wDRSET5/RBx1NvuK8yxG+uA3S8NPaFrilRbU9X7N4qu0mE6lW556SqDu2jGhpKnMtgDKQ1yuReFlN7RfBf35teMlJWltF5DOsekmcsoERv6L28tzEpofwky5/PwGmmiO3mady/yjgwwwJC1c93N1qJuH2urePFG5qgwJJZrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160993; c=relaxed/simple;
	bh=v9PIaHoOGqn87lRlESH/AuFgCy5K1+8Bo9hGHBVSeHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDA1jzl5g+d/gefK6kI7nXOJQd7oaRAiFLqyzzaCiMMy548StePJQfQezDh2elQPMCuAAreAHqifucHq3hwjjNlFKTP7bcEPrRSj80xMp8G5qtZQ+Ri0j/1tSppTWrGlUxPn8ixB92EjMFvcuAmNQnjxix/hDQFVb2hLq5Z2n54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaleTQMO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaleTQMO"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so10930028a12.3
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 04:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160990; x=1764765790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=IaleTQMOjjQr5zkuf0mCdqm9sCdq4aXnw7rCRFKB3qHJh95GcHhP350fF3fKjjh34M
         8Kql/zmGw3sWE8nEdE+q7JBqs+f72L1bMf9DU88BgaHfxmfQDLMHAkoK6FjdRz2qFhUO
         2DqU+qaaDNl1B+8iV3mgx8lzW3bgC0+wFRCffFM6M1/+bcuRRGkXYv4kpZKXQpF9h4q8
         SaMgN//vbQGBU2XX/vkdBT4tvVAJ17fUtlHO3QpVhMRjXXajK7hFpKD8DZnLGy0u8Z+t
         GFdkLMFRimnIcXbx9y4wr5T2oh/wJO+zXeqwyGBO2fxPeI1geBzT1aWDVPXIb5Fx9Noe
         UEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160990; x=1764765790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=c/ay7TvhJqrjgdT5/JBMMlA80rxT9WHhiSkxzr0jNbVFrwWvDWJSLVpDzEdPRz8Btc
         J0mPCX4rHUgm2YiGN+uWTW5zwQBSYt4tXDyakAApXhskwxHCHLtDkQs5YsCgz1992rNI
         Kaw188X9vtZajIWAOeb7p0rsJKxy4NcyJWkkNz443+6/9Cph2hzlEL5OgqZo6og/qCBW
         Z59vorxUXwrXGVsj4l2QNXWq27eFWIYFnb3qb/wGLAE6DQe1SUBmpcu9rhjafd1foj9b
         w3e7S2Q4U2YVIWeGMwdVAQO3IEi+OynbokwIqRz5PFDyL/mO2RXzxOXCMoUJNraMk8dV
         OqOg==
X-Forwarded-Encrypted: i=1; AJvYcCU0PwzeXLSzfHMVztuj1ICq3x8REN0mam5jZMDrK01o4QEdyBCWAGFdfjyrMEAoxtAfdzk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw718lIai4rXEoNUw9Nx2DOn8H3IQkcghztp9FQPyNPy8xgCtvy
	lDzbYGqO8m7tSkOqCdt4GK0rVuxdI3cET9tugFqE+TLGyq+459RPxzu5
X-Gm-Gg: ASbGncvzkzJ6doN95zmsTlh5tRyevXVDdD2JMsKEJoTQ/eQSn4EKURmD6WzRGylbC1B
	gLJ1uqWWr41Py+EhVAdX0CRAlFX+dS2K/9m2tg4wkBb4arfqTzUXPJbq0vUL6kQz3snM+LsSXQZ
	s/4nXoGSOiRpqEPSmMH3dz2NPZqEj87ernj/GPil9WDMHMR7QZToD19iHcqAZy+mv6Zw44vrrEi
	H3jK1Z1eov41rtpt7OlZIr8TC/6DdZLgMaKBIqHKuIpmnTs+DY2oux0eSPJ71XT2vTifNNO5xp0
	NaExd0+abmAx9lIEfCds7a1bB+1ngFyhsI0blo6kAp3DrqsYUsLE6hBTQmSQ5kfXKYh3kzpjN0b
	XDU4k6QC2a1ShfzJBrCS684owaze72dUR7by6MrNXBIhcFHcorYxM3c42VwgRYrVNbwMWgx+drD
	AFfPgcfkpfar8Cfvi0REQKwKiBMSQm2veIz1CFJresKB0Z3Dk=
X-Google-Smtp-Source: AGHT+IEK+fAuFi2k4GaxIBNmbHYXMljUxG7zaiQpHjTkWdqeymuPQBHmktEsrElO+iqJPJnEFZWVuA==
X-Received: by 2002:a05:6402:5192:b0:637:ee0d:383d with SMTP id 4fb4d7f45d1cf-645eb223dbemr7038749a12.3.1764160989649;
        Wed, 26 Nov 2025 04:43:09 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:09 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v6 5/5] arm64: dts: imx8ulp: add sim lpav node
Date: Wed, 26 Nov 2025 04:42:18 -0800
Message-ID: <20251126124218.803-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..9b5d98766512 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,23 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "bus", "core", "plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+
+				sim_lpav_mux: mux-controller {
+					compatible = "reg-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.43.0


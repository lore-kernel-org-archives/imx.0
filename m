Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086133C344D
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490714; cv=none; b=i2ycnUyc8YSmylL6ybgCW1b3U4eZqmw/ih1yHiQoIcNhwRZ2ykfQDmge+Io1IOa7I7kZSGtxv+VcC0bLroIbF6o+R/2sZ0tABTt7CGHTHCvgHjGLFHDChjhLwKo9oEJnhbFCvyH91Ywn+6ds1rpJtjD8cELPkgGBYS/7qsjZWOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490714; c=relaxed/simple;
	bh=iazWrLtJH0ZvfQXHNMDmWoeTvLKqPTMtY7iZ5ZxXJzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTmBhy3EZUpGvQTWokmj+fIFJwoC7X8iznGsPGv4nsAy42eccQA7oblu0crD3VJO0sj+xGC2YdzHgCO1UkkcfKE97xUNrjEW5/W0zStJ4ArJqInTCM5LGqp7owxTtE3e5dJBpRblrO13Xj3yT5PXlppUeVqy1rqkQigNIeCBsA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4pchXCq; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4pchXCq"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so1678819b3a.2
        for <imx@lists.linux.dev>; Mon, 11 May 2026 02:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490712; x=1779095512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=E4pchXCqljTDjVJ/zi5+jK/2/r5bqPmDw5IA3pkDx2zH2yvPbtkbFH67KyQYHGc41Y
         6bwpZ94VhOZiTBUmiqlMVA8s5M1V12IAuLPyIormqE803ZYy6Fh4Yaj3Im6HDgKThwqd
         Zcqj539RlKWMm5AsVGlsl3DIfY0lbHf7rhQKW0MSmmFEkAQqTfzcjNt0nfjH1zEOCteC
         a0eevj/pCZm+It/lZ4gisECcvkZPujkErQxCF8diOURFVhV8YsK+S6fq8oflrwoDbN7h
         uAalCwLGOSIn4CiZuv/nhGfGH+23qujDIDU46pRcWONtB+d4nQwBGYmu0cRV/RZNtP7J
         gmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490712; x=1779095512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=QsvjxhOErpBhIoyGucOAzMS/qO1ye4LV+OXqkITKlMEddUdwg0RSJhsSfeMrnKb0BS
         qqSNYAivNy806evUXstVJzSb4DCttzovWMcmomL7cdZC/vzwTRzorlTjGusPCrARdGq1
         I2hc+mOVS1MHNOpKMXxQF5mgmRN5nC+eu+df9Q0Nu3rVEaCHTxs3r2IJ5gTWjrkQtsZo
         28yvev+vp/12XnV9TN3b0WwntoeCILdt8DrSHv1oMUNjWot+etlPGZXfxIQRjTpBye6J
         kp02A2oboHDAxoqSO2MCO7wrUrj+/PckCgBnRWZrgZjlPuX0gkSQdvFGclTMPgPuvNsU
         uu5A==
X-Forwarded-Encrypted: i=1; AFNElJ8CrsRxxyPuq6V6VEideMktr5H7Fm2pv0X3ohT/99N2k8SesVZKuLzj4NQocKlusSYy5gs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo+cLgwb0YSk8RDNNcONtKG0cx01mq+RIPHrSo8VG8YZGkzFIj
	cI7lRgJ0SlbnKB3JIBVUI2Xzctkz5NbMQPd3pxZRvmBjWucjy2kIBYC5
X-Gm-Gg: Acq92OET0zXmnzV2nMxRRG/+8jL2klEuN5PMVjArY2cgw15XRq8v4Zbikh7o97K4ylD
	NmAfUnRaAGtvPwLYOHV9DCca21JUJRX2i6Jmw0VWeGS8X30RIMUtxQda0xt1OcYnid1MUxX8bSh
	SrEwz2mbt2btwd+W7bESLj39wkBlBRs0q0U1cI/Fnt0ImQo6NqKnpFS1bpip9bceXSseL0IqORd
	ymhAkmvpKXkKYxToLWSAVSUSjWE03QTxs0pNnv2uCt0m8RXCW+M/DrVkqk1aBiqeXQ4jrX7cm+B
	XaxCliOdmZYMZP25tGWIObs6TNRIl9jZxZ1kkIn8rzrwGUxW+bMNV4ExoIHh7egFGdpm/fOYjH6
	RFnvX4mYTdrbuQcQ4Xap5BDgqK/lfQXxNeVK6ZNfZAyih0uiIzeAYhaIa50Ct343mG5GTSq+dSY
	QWTj8mYBxvu31vZ54FMWTLnAE=
X-Received: by 2002:a05:6a00:a93:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-83a5bec54f7mr22142513b3a.15.1778490712503;
        Mon, 11 May 2026 02:11:52 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:52 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 11 May 2026 17:09:24 +0800
Message-ID: <20260511090924.269106-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / post_div1 / post_div2 =
25Mhz / 3 * 90 / 1 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0


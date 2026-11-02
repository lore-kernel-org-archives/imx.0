Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645722;
	b=LxV+kod/HU6lXiAK/s5QFpynFxbMg8hI+yuXd5sf+fyK4KS+dG8RPL8Nfm+lna61qYSO
	 9besWoLp1bXzfgr6EOf/HOFnBXPhceHxGBzq18X5gyiwN9ArD1EESTg5aQCc//ANIdar5
	 k4woy1Y6D/HX8qbXGPxFm/Bqr2Yq18UfmsZJiIfB2LQ7pBkh+AIUEXf6eLN50zWrwx2Yw
	 CAN3PUcf78xEZbtMndcsxn+BTkZJH09Kna59cXwlmcTdJ8/9h/JJuVxEtvh7UPbxjHV1o
	 EXE+N5Z3RpW7QTutV6ID7FmIFAxmRg1TWOKC/pOaLpr+2MdnaZ3rvzr9ROok0aucymQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
	b=DKv3WF3NTK2Y/M5Yew6YdZGQFUaE15YSBlNG57Dm8X7jXePOcBIPdhho4iCr8MirWCfo
	 FN0ycHBFXFOl+jPGIKMeqvpd4HrONayhXWaKU6BR8nf+COVe4GBhqVMWMO//Ll5av33rd
	 Co6r+skM7JvkeCPBGa6l7qi7k6FLhYOyhMj75PsTC4lgmH2aOA1y0Dq77sllni7CwDV1t
	 m7PR9pXr26zYFlbyDn2t1mmsAZvu8gw+OPh1RA7Athn9OlhQPSKiyIdN6QF4w49BQcjg0
	 bE6IOhiAttIT6I3jHKuS4xgv56kHg/QuOn31ag9DjKz3YUQRr9yCCYd3En1xhWVL63w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edEjUEco;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF14606A326
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 18:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF14606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edEjUEco
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e4831c028so2967271f8f.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645721; x=1794250521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
        b=edEjUEcoOcRuvetz6onFlE5WbgVS3ei4vocW6l79exjRg8Cz3BVkjelWXt8wxpKz9q
         g1Qinf/nRuVSuam6TsXPv/bFu4gPmfTGDFQUppKbPtSlIbKekFdRpQNMwz5n8kDapjZp
         uFq0momiZtre99+vtGiHnS+pFqrvVC91TWxzrAp3+cL5nbmOdhRuxiu4tFsmlmuekjmW
         fA0Wb4O/SLMa5JbnJrPtCxcaslS1wSSz3dX3w1nPyX7OTa0ZKVgK84OECxPbNvVayNO/
         UF18qS+z8bZ0PtmShvzr4MwMXOoAEP4Aql3mgOVSe/kBaSw7jMjVEjb32goqcNJGAE+u
         QWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645721; x=1794250521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
        b=FrNmOkw/xA0dh1hBQF8dpPuSlHR0716ROspWUQ8wz3wMTKoQYmJPuzFt66Ff8/vpXu
         r69oeZYin7TNWiIm/6dHgGS+CNW+WFXfpbbB9/T7l/wBRUbbVlvM34RYHQKw/2RjhPjt
         i7ajHGqCvtwHDCn9CyQ/p1kL8+TGK/z0HaQim+PEoRPcvbn+BNxOQFLpU4jWeo7uZcaG
         SllyYDvsf19PVTiQVPMax3xSELoQdhysj7WZwx2XCuvAtIfp/brPLYdtCCtZYOEa+TIW
         nov7SW6XOCQMF3hhcjwJI4eFhDncg/Ry4NNxj+2SQoiYWkJ7lN8IS0JEAUioEY8SpHIn
         aPPg==
X-Forwarded-Encrypted: i=1; AKwUvBweoJRzu6yIyWJwgTU8GaUfwRQoFkuUvzf73gOUqnfLHb15Hq9mLOnF0wLsCYGoE4blmug=@lists.linux.dev
X-Gm-Message-State: APuU4Z+s6xSFS1C/7QVnXGn4V/d5cVE99uK/159BPER7fGvvo9aI2hjh
	HDDXn/5edV0i9wgz2RwbNZEg4Z8vFdQYJpglsKJRd9C4WXVDOsQgwvJhJK7PbD8f
X-Gm-Gg: AYBFou3324K+ideDjwDkpxfLSdeRd6fPPAOx16JMSuCDpxj1iw3BGBBsYD/5xwU9pH0
	2A7H415Lp/4ljOBg1KaE61ttKQC18pWJZBxB6OGkyIf+y2zSL0kK0iGK5IZwr2S0AGShttneMiK
	eEedXvdLcrgroNJPRaGqopKLhShrixAMVtA5VhtY2kOYJ4mnbnQHTZuEzfojtMcJrWrpptlenM0
	zEIoDgviE8D6qBFtPXr1BLNqFNElpVSzn8BTZilYaV1Vep9kcBnf8mjXRFmClEOki7ZRYPLJuS/
	1HV/ck9PuBHCRAuvZWj79EEv2JiEaMQYNwL9l3rdK5dU0m0LhjG84vmX4yplRqmQJh9s3M/sjGx
	lHjMyhkAmVyoPohqjDWzxQegklPzUN3O28c2qdLtev7I/AozI5kkq3U5RR0VOal94fgHk0PRF2b
	G0zsVkrqxN+ij+/xA3pAxgu/P9jI6FTfXBP0vtn1Dg63/y9lW19ZaV7SMZqqrZSpIuueVeJ2kpR
	YLJawDE95mGcED3V3HMP3o6iEybJ6zEZ0jnTJcdDOQS/FgXnaPgRTZWrPEJKGVzDJ+uKv584qry
	NB3lMwo8mPkM/9UMv2eNOQjBxaIr1/v4nB8IaApiMbbma56nwB5cCAWEoXjULTVktBgEDqzrc33
	7ngeJl6tetEwn7g/aClLO2vZLBRqD3vgQBmqFKmW6mZ1jaUOByi2h
X-Received: by 2002:adf:edcd:0:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e6e502fa8mr19192373f8f.40.1793645720777;
        Mon, 02 Nov 2026 10:55:20 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:20 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alifer Moraes <alifer.m@variscite.com>
Subject: [PATCH v1 1/2] arm64: dts: imx93-var-dart-sonata: enable UART wakeup
Date: Mon,  2 Nov 2026 19:55:03 +0100
Message-ID: <b51bef917d08b83bd231a4a228fb2d23c19a858b.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the LPUART1 serial console as a wakeup source to allow it to wake
the system from suspend.

Co-developed-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..d368a09dc916 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -385,6 +385,7 @@ can0: can@0 {
 &lpuart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.47.3


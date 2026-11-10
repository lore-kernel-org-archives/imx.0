Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334891;
	b=Fekty3blvyoFKiEHKCBaDbIp7GaWqDCwBPFFCSDy2/5HVEUCvvn8pTdKXOLt7d9NSBsS
	 mbzmRHc1cxBejZs3Zrf1ZXtZABK1MV7lHz82Dmpi6dCT1EVe1F3ju2PQVH5Uo7X2CCpqV
	 xathGP/ID93xH/ljD2q2MmDFNz7ATAG6y6nSWc5zUwoN3O1bRI/nOcOYbHcxnmRqnfcQM
	 P2nycu1vAhgWkw1HifFnSmbJBW+MfF9mPmKTwy9DFVu73y+YvH9KLrTgC21IlzdPalkLB
	 DbcEJKTaKF35qGgHnZ4oUZ0AKHLY5uu7xZ3HHmo4aCFLXU/IzF2Ww6Iulz3VX0FdIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
	b=Oxb3f1SDGtrjfgkDaYVlmw+Y2spbkN3Ny4zy2JJl8/PBtyMfgHJDBBGDlfkdHQ82+3zv
	 8y/ZFqy5+QcIehypIhaqgDWFCL/9DYGp2r8N2wYO4W/q3a84S5hHkydvt/P3d6j/nKDxi
	 Ls4y9Hv2tQbZpC2su2Nn4qjNmrkug/dflKlwm7XQUsbeW4uXZI7HvVRI9BtRgvmH2k3P9
	 60fgqHbfxy7//qpYoJ9cPzfvNp5M0P+VSW6Qi/Cn7GUm78DTAK36AUV6NfnNMpfG6Ucwu
	 hqsDrqDBKC83+Wi698UpHLuO7YNlOSX9qQ69v8dhqK0n/2bmkqVvYE00Y3QEwkOxXrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3ELXr9o;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286BB606A338
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 18:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 286BB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3ELXr9o
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18056775e9.3
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334889; x=1794939689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
        b=m3ELXr9ocHOn96NubNyi+I3sIpvkAvrVFNSpM5eXyGefnVfUP2bebzxW4R3mdU/Pk3
         DWdVBrxYD2dZOge6osnb3ZAcbOzDVJZ9B4LBN+9w8czhssgbfuk2kpaOgDW9spsdiHSb
         BbGy9yfzU8G6yHRkzrbpuHQwBhoVDtMK7lOZmH67huB7s+ELU3xWG3QnYJBA5WD8mJ1D
         xJCOP5Laavh2g6CK7AAsxvZ2WS50mEuh8nGFAUU75eitTxe5a9ROEspj/zEL9zfziJZq
         UjB9DD4tqIT98NQ5RZuH1YzVW54qn6FosHU4fqW0T8fnewcm2Qi0nQuxmW9HKtrTLutW
         HUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334889; x=1794939689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
        b=zaNSa/G24g3ex4SdFB/BG5kxcOKI3onPYK9Kb/UTX8TPiY1k0zHFRedhhF1Tgp3e40
         luHBHIlf8kq1pCpJDSwnILMQkUFnqK2jss+nmLvmEuX+7hxaxHGo4gQBUPNDRBQe2MVA
         9SCp8kUy3J7GVU3magXuY/lNh/EuTYhz35QpFJh52xMV+KJruQUzCOazo7SsaExnZpMC
         7nsyEe6LshgbkZCrH3uoVsMbGeP0fjJgV9DA5k4sYKPOoC5pIEbgQx4j0C/nJNKwgvex
         YjGWHPsiK8d20xCKwAfHsQShjaMtGFDNMcub29khQYSVYPJskm1Gq6NMxeUeiEDHGPrC
         W6qg==
X-Forwarded-Encrypted: i=1; AL+hErEND/kU+A7ktUqcdqk37fF346RdN3l5XIZPIi8sKCvtScAd6IJ4OsaSCHJTQSifjOkKhB4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+BfYpU2GdKa+UK+xBnWglWP3NdlhZhzazV8gh9bqOXZcVNH/vh
	MH74aahUn+X3g5eKWz8BsqqdyksfgeiXr7dU+thwSrnLxv9K1gw/WAta
X-Gm-Gg: AYBFou2x8m+QZW+KRXVlcmFwTIQm8X0TtIiXa9aeX9VGBPBnxuotwlxMxm27w1OVvGH
	gkbJe9/kwYJQ02RIR5b1g4YfdRiKjVffXSA9QOjhkd/IPkw0s27oO9zm8Iyvpk7DjvQY0Ne488L
	wOsbxPd0H1GZqkk1u5CS+g3nbrLJZF7oOhdcL4wTIaEqmafmyCt9KyhruEleya2OlNbPd+exf0m
	pAqwy5dOpvErXOQ+CEsFjsUT02yf+lrhU/dJVUWF+ZW9jq6Ey9DUSVangmQJBwN6xYcOwDPJjRY
	sYYNwGVQ3Rs6H7MFSSoRX5dH4xr1yrzEMVfq0i4XHKCJ+7gOh+HzhrZwTTHBVrtTH8xRZsA0tjQ
	1fxaDOCGsUG/QY38ZUSYUJvcVzJpIN5v9bw22LzFRDvEKF5KgHN3rfiJVZ0BthwOTF+tsxANWjz
	f/tt5glJ9JCe6zKw+sVE3lgVIdY1ouXZ/ifWlkw9XuXqgu/LkUdoXgMDXS5nzN3UeONhCdbuUmx
	t9N8q2jOOVlJRkLHN1B7A28EPQ5lF1aP6GwNNUn4H6ppakxMZZGa1mRDe9Onr/288BNoVTikeO4
	R2e9A3+L1pUgU37zc0fmXROUDqUPC5C1K+s0vPa55lVYjpzOkD7lmSoDcuWVMxp+vpZve+DwTkJ
	xzs1e2KRfW/iZVyPeerKcHSpZXgBbbQ+Edt6+R0hYkuOEHfdGmfByDfI=
X-Received: by 2002:a05:600c:4505:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4ba0234e282mr61882635e9.25.1794334889412;
        Tue, 10 Nov 2026 10:21:29 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm95507825e9.0.2026.11.10.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:21:28 -0800 (PST)
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
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
Date: Tue, 10 Nov 2026 19:18:11 +0100
Message-ID: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794334398.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794334398.git.stefano.r@variscite.com>
References: <cover.1794334398.git.stefano.r@variscite.com>
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

Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
and its Echo development board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d0126f54b387..397e1cae92d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1354,6 +1354,12 @@ properties:
           - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
           - const: fsl,imx8mp
 
+      - description: Variscite VAR-SMARC-MX8M Plus based boards
+        items:
+          - const: variscite,var-smarc-mx8mp-echo
+          - const: variscite,var-smarc-mx8mp
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3


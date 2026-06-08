Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA2B3CD8C1
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929692; cv=none; b=oAhEpbQh6W1hzFygrAQVV7kn4xxHzcEi2uSqPvnAEaqzL1xAiQqXlZLB7eDb+zZDjoYpAYTwLxmjtcUeol/9XOIThCLrILw5f2fowci3WjVhmmgN3immbhYwquNZF71P/PXmh1Ol8IEs/bQUQtwGy8cqHyqcKq9KCgFvO+jmSHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929692; c=relaxed/simple;
	bh=yR1subGJIXoGXaeAkg1FrvhGqEyW1KnUc47RvZ4hgew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6NX6LT02UOPjLzo14pbJYI+0zQBPuY4O8Z9IOzyMPAYNs8VS5Azj3xeBUhKKgv0/U1AU/hr9ADgtgaiG1QpPpeSlUpciJnvAvyF0k9+R4eZCsygNzQS3rNsdAvPR/0zTeFUOZZmHhGy/KzBlfZRTnKuJos8UK8uG6Jgh3aHRd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDnT9qth; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDnT9qth"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so36720985e9.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929688; x=1781534488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQ/hiBGZLbicC+lTnolGRAFjLFtYyNtLXUJyZrvzxug=;
        b=HDnT9qth1WhbAV5Fwwrgh0bo0gYPAq9H9ZzBGLlywB/9c1A8M7LOdhxnrCVREoTK+4
         rC/S69nY7CtFhv8I1+dyvhLNHpIrXiRRcRnMQBwZflemUVoSHSFStbuZxairjmmQaciC
         A60iOWPwZEDEVQ6uos7pUAGS6A1TJyazkg3PtDkzel3aZpxe9n/35yT+bb6N3dkyim1H
         NKHJMYXsmI4pj2JT7YiDBDKhNoMCP2ZTVY62Oarz6sB4lRZMkI1iRta1qlWeWrhF2PwY
         moJZu0IaCZtRWa/ZPi6HSkc0zrm4t0SgYMpQ1pQh0O87rTXtU3E9w0lqVk6yCFuEHUF0
         Rgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929688; x=1781534488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQ/hiBGZLbicC+lTnolGRAFjLFtYyNtLXUJyZrvzxug=;
        b=nygaRyL44Hqv6SBAUJ+mrdiguiMMJW4RBjnk/IrYD6CgcGLEedCS7fPqwtUMB34t1Q
         GBXBW8A2JaviXV99FBDZpyzf0vUgaBdx5AnqdaFqJP5myiM/GsmlbFqwEWqywNufXkpO
         +DGPCOZ5+jQiZPQQ6Foaw/KgBkinslVHi5oMrSUdJuVqfw3cp5Y4MmhMQyG2A2MYsL6i
         UQ729D4G9HbrBfrStjK8tfrEI6P4U/QOzCmPUA4mbwoCXcrelRX1mzYP9knx3QFski0h
         fvKVrjG36qn0E/eYCc8PmY4BWrAiWfwOm4UTutV44VCW9I7DWlDKL6hBFRUB8IGhL+aK
         nxMA==
X-Forwarded-Encrypted: i=1; AFNElJ8VeMZC+ok5wXrcuG1yBZFl+ZuNKPOW01v1wjAPypZbD1idwEhNSOd2iX3fl0BpAxuvqfs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrZ959I+7cfTX04maXO5nSyP/qO/5RdhPzjwrWN0IwDIn5ADcf
	OJ3V06nTdV65Vc55LqtfrpbpNwJUmaKSvkj6cyEblxNbSIl8ePmMcSjG
X-Gm-Gg: Acq92OGWmbkTmLjwX+OVf6kSpVgTo6kZIB6PGe+MB64/DshCoP83vWEnabgzamh6Erv
	Ncqh710dIafxLI2txLerP013skqiaHgZiAz/zMq3qd+rb0cgeADN2JnzKJevTXGbMxl+egLLnVy
	I8pqqwlw6NcS95wMTVQGjBrdBHU/ay0m55Wds+e6zX38BzvUj1JHm9wr+1t9VtOnGr+46IbBnCP
	uiYeHBFCZP/HPrmU3iYCY24l+olRO/dGF0p12Th640qmHge//7oSwKUteqvA5Z263QpUSQrOfcz
	XSYOI+YjrpMxbcOYAO/4AXy4CAtJI0arqDTHcH3sN5i6+LzshkT7GrMv2T9n2dVW4hMynp1pdfz
	Hc2MgraKfwOLXW5v68qPVb/U2/V8rC8mnAk5AAIFSHcakin2+qULEFRMnEg/qBaCf1RE+MmI4mh
	hk4vrLThXf5YuZ5pTaLgO/FPxZoC+EKDEXqclF1OydkmmUI/wgBxqY0DG6n2eyxiXf/1RcTyI2F
	4JSGWS7DfE9hKshj7+I7bpkBvFzfBmnLE0gA4KZu3fdj8kAlKE6az1H/eg=
X-Received: by 2002:a05:600c:3b09:b0:490:b446:fb8 with SMTP id 5b1f17b1804b1-490c25c66d2mr274749095e9.11.1780929687763;
        Mon, 08 Jun 2026 07:41:27 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:27 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Mon,  8 Jun 2026 16:41:05 +0200
Message-ID: <a02c86adc97618fe950c8f2544eb7d981b2cc984.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7cf58198ef14..cb3348aafa07 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


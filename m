Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF820D51F
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522359; cv=none; b=P08IQZX7D8uMIpI7IPJeCK2Xthj8FzkxmTtRuirdkQqxhyyGURIhlK9g66zHQiHiUuVRJ2iMM5PRBgw0heEbjSSCtk/u1VbyQO068qwuJbc6kadOlZ0Z4fEn6vMWfzm78s53cTXsniHSIrJ8HV7xE18AjeXWEP0Pq3Aib1QSXlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522359; c=relaxed/simple;
	bh=J//n3r8L9iNTuOQOL0qo8qCeiMt8RdAvNa9RfQUe4ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k/Rvjxu8atvlvbNpaqNWELN4489xPm3xUQg09cHXslI+H4Dervqc8lWfFkXJzctA80CfLknmroqgMf+RnItkK97nPpH5d3vjwYFmzoaFbE1I3WsIF+3w7fgU2vugsHTCTtpBKGwl0V2z5iOMz2hLIro4SwPz+eRajx5ZXH3XfbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7GZcZDB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7GZcZDB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso38026305e9.3
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522356; x=1744127156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vDwb9HDwdUl0Ebx/4UWYmvDHxD9AeyHufpsAE/MqOc=;
        b=f7GZcZDBJTPlExmcrFymdiYYNe6yQnITd1VfjTP2L/f/jqdhosKsCENVu/pePC9ThU
         VZO3GHTnRYSI1eLE0IRcgmrA7GF9H54xjqZfjH/tix7UvsaRuoWzwbtztadLYpkUcE2T
         g202034SWtkN0f7663LH0+GyQQu6c94ZLkotf6wGspXVVippdNsCJTEMP8zznCV+rQ8m
         JGJgzSfb2PqygGS/1IlO0MnHaQZf/6loestVBK62XP6ovL1gnxVfmnweCQoyX8RQZKPV
         +Z29dXatbgyOZf7MUyRDJc6DvjFRAQI0pvNTGpM+HmLy0D2oLKKN54SxXLGpCB4OMP3k
         uHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522356; x=1744127156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vDwb9HDwdUl0Ebx/4UWYmvDHxD9AeyHufpsAE/MqOc=;
        b=vU823M/35TS2C8zfJZLCchOvLPVF2uOLjZYpUZdzWkObk7KHPu7ktP3PH2RK4fAtfu
         bfn0zQLtmMlGnjCjSnlTGugdUAvVCxM2TCxD2CGEJcfAoX5YSH+DlobuHMhAhiaKTzz+
         nwy2846wmj2r/HvOTTkG5Vfmzz8ltMD0bmRna82Rh+miG2f28xsksL+FGAIY4PAFgNTa
         B+fQKPNgAhRw5uyWE8yg3sg7NI7sytLgzHgKTIJp4EkpsktqB194ED9etzhVifXDa0Ww
         aUq7+8lU0+9DBZxeFvxbtBPb6SnR5c2kT3uIBQ89N/UEM65iD6gbIGbQyjzYlY4P14vu
         8/hw==
X-Forwarded-Encrypted: i=1; AJvYcCUl29qZTbpjYXaM1HeOMikUPVpD88DmHKNogtmQoS31q75sXxtC7ayaoHm89aN+Dz4MJNM=@lists.linux.dev
X-Gm-Message-State: AOJu0YylL1cr2LixN/iDgasoDF3TW7VP0WknpiH6PWol3wV51xg23Ys0
	UvZwEfs9jDXx/4iWmAjG0Q0epPpdHrx6/O5VzrfjdWVCFIL4t4iW
X-Gm-Gg: ASbGncsOJ6rpm3OCB/joLRJT1nESPD/8dX4PK0+iXN4XTBqUil/ySC48DuNDvLIKn+T
	AhC+FRfEbpH9++V93MoTlqHpPnlA2Upcfs7Kq8Qda4jpd5tHFp0DDtnNKhn1eQ715yVjT1LWEfu
	Kk+TWVJA/hXmODP84WWfHUNmGmEmo452dulnSuOM+zkiXPHlK9AWrjq8pQ/WEgXxIxRPOHjml5j
	HTumh/6/f+8hxvyubVR5qWx4fLzT86p9EdA0VXkbAMsJXZJoVvGEKoY36uNFFeQLp/hqNxViwQa
	R2WR+awCsW4Wkti8O7Zk5IMWFUpxq2ksimBMJx3YrYlP15comMVql140EUz5+4rPL29MK1nWyZQ
	3TmdywxI=
X-Google-Smtp-Source: AGHT+IGdYh9AkcbLHhxheKqNkh4lODmhkDXHSRQLhJxdjuV8FbGHRILAROQeiewvtT5pJYBzkuZvJw==
X-Received: by 2002:a05:600c:3d8e:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-43db6228293mr144790085e9.10.1743522355870;
        Tue, 01 Apr 2025 08:45:55 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:55 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue,  1 Apr 2025 11:44:02 -0400
Message-Id: <20250401154404.45932-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..aa7940c65f2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,12 +1399,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.34.1


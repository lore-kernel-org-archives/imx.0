Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA41620E004
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260647; cv=none; b=jVVMc9mr5ZoMD6y02s5oI1P0fDLj75dQ5sPHordDkqE7zdyL46M6UefPYgCm8MH4nyHFOEKoG2SJ4Kcl39/S4Rsh6iU/LExYCDEqet+hehf2XMuhXlSk2mW9zfpx1HXaCpgfbFfo4J0oGUwxLMkJR4YbETGprb1CquBh7MyYFJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260647; c=relaxed/simple;
	bh=EfuJYR878rJ4Cw+YuO97nDjgeWj+F6WJVMj2hzhOd0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MeNu8i8TXKUunlUBppEKkvhdr2NTcewhR4Vw6pNxxE571KQandiRUkjlRGbPYTR9Dw1UBtHSeawB707E509B5kMVLVdTx12KJ+TVhI022bvWx58rYe0vAs6rbxdqWTO6V4n/o37p+1Gnqrv6al7aRf6cPlHG7ovgs23FcPCH2mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=pL9pvDNp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pL9pvDNp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-390f69e71c8so378772f8f.0
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260644; x=1741865444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=pL9pvDNpcNrhua7tg93aGNHu9/jaVmAPer6bFaS0KS9mOfJ/21PvxKgjv8dbmk9Lo0
         PG5U91ccz7CSGPB8GbSWupGtLal/IM4t88t85+hryKZRn0VPUY18aiMbLB43mYzDSvtR
         A4sdOcf8wGHGUR9PcCAY+ZDZVZv9bqxraAWdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260644; x=1741865444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=g4IW642L9WC/BgvieQ4YAqt3py5FsELtAXie1aaV9+LMKtxaaqmtnMjhGJksoWdx0t
         wkB6f0qLctn0aOlSD4qRp0wEPL1+4Br3BOqtsp5lYsQb5XrGr7/8L3NC/7IygDdUVmPx
         ODBNI4id0lO+f+AgPxkACBlZsl8lFrmvCFZ517fl1BDlXcMqQ3Zo6xH7kFoAC26KeTTM
         1fmHb0aRz8dWjz5d2T6ZHiP32Md4o6fB8UdE/zaPMjCMmrlpXQkwHYgn1dbNBOB8iCs5
         mIOI8h8qOKgDywbWwADhudlzihT3n+PIAienxp3zozQG2k8pU2PvvQFqV+xO5JgX+yMT
         NIYw==
X-Forwarded-Encrypted: i=1; AJvYcCWQBJ9jiwi9V+zjFnJkuQuc7vi/FQPpf8hulg4P9q8scC0oqOSD0w+ea92YPekECJ7VWIU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl+P8FxBr9gkBcSBLfd1rKb6rUaUA5fiezq4oMV/Ncbe123PfI
	mTEHcXc4f96ens9pRroQ3hR2wqyyxUG84qUVVx58E0TCS0aL/uNF2CLogam4eRo=
X-Gm-Gg: ASbGncvvdczhLiXhML+usT59eDJ8K8IG+U0bHt4/TCJHkVHNRyBKIHwI29jmXH6SegW
	aY4S42cnCdMQNXBowImXaY1fluHK8YA6D5ZSpO3wqtBkWg3tki2h/J/4lU5+pBkm6TNLKJDzPs8
	M2sODA6VZflHqIH3ptGnaXy+vPji117fImle9HvPGlBuw4zpc+F3/owiCj3t3fUHyWSjATLBaOa
	+n80C/c5VXI2q2o2pdQuTE9xMqLKrJsBFq3J5QfRs/15SxeTdl9djY7pU8v+0L4FAzC5Q9itSBn
	ddSIuBbzXfTzTxhHyZdvc/47XeZvA015VOSvz1iAesLvZUCPuA7mzwEk4VM/AxuKiSVGuPJRhtt
	qFI+pTA==
X-Google-Smtp-Source: AGHT+IF+Uv003+XSltPn5ffM4uC4mlgaqPhLJOFsDdkfqP+MvIZaA9k6d3mtHBYRHEnmB+I/uE5LEw==
X-Received: by 2002:a05:6000:4185:b0:390:feb7:1f69 with SMTP id ffacd0b85a97d-391296d3e2amr2365832f8f.4.1741260644016;
        Thu, 06 Mar 2025 03:30:44 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 08/18] arm64: dts: imx8mp: add anatop clocks
Date: Thu,  6 Mar 2025 12:27:57 +0100
Message-ID: <20250306112959.242131-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


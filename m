Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF8D1991DB
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483845; cv=none; b=pa1sDhsxwM9hhxzPHljuWIsls51Yf52y1GNZ0cGnhvkrzB/1g9EoFkAt1DC6R/ysvyYvEx2W/PTj3PAOv38sTCF0+NIsVK9zJanwW3HvNaP4mU4USP/mbJnmWz48EoDTef/tnWNmnfNzEsCBdOIrkU+L04rxqvlKw93OTirD/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483845; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SR7TcFflMPS5y9SRf50nDCY5ZcX1n9T3kO/ypW+/szeEnIjX6ymH5CsMrdYhjQJBVhPZGU6DP/KrZMyLEYh5t4JIan0KLo4ObbrQkosFtaYhytDpYq268M58B+P7PqayvX0z46yOjy9OMa2Z3rWIEQWHnZ1kWoemcroFHnP8Wto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rMKoXEgV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rMKoXEgV"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso1363785466b.2
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483842; x=1736088642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=rMKoXEgVtYR/xbqrBQww+3BCNBub3kYYZ8kas+l1o68nxMwmHoFGpADBb17cBNxUk1
         3BZx5No/cObsIFH0ZSA3NMIJevgSnv5p1FIRj3qE6bMOMf8So9nFcMv4NbNEtGpgVAAf
         pW3pnDpt2+4wph9n/SKgzHM3rRl9fKSHIHptw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483842; x=1736088642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=F7BNlcGzpdCTl661NJ/Bk5engSFpY81j61SKx+BZKLH9JnU3kyDNbE9VdkOfXMNFaI
         n4WvyXni7LBldpPK6rljAAkm8q+0HYmEpwd6EDQCMpRsG8mTGlSO6cKxCyPoNvtjSS9u
         JjTyQN/4ZYqTk2pCmAjGuUny0QFEq8p+d7llBNqApZlLTAqLEph344dg/aDAlbqYRyrk
         wcB/vV4TpzHE+jWpzoWiPhZfbG3Raq6QRL5Qe9Yo+hhStNjGQjHRwdSHziWSuuB00Dzy
         g7inF4qUNOWbH8mQtuLBSr0Y+n1pWOv3r5rtVt9oSQhIc7ToW5HIR/7XJp4KLYFZN/OE
         66MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkGp91PEhMewOR0i3tMA3aSkvwQn8Mx3KU5Q25gVb0EvKVLhD6TGuYHFevORbIw5KmE3g=@lists.linux.dev
X-Gm-Message-State: AOJu0YydxB1NAXlxY5YkEUPDIp4B2F5JaaRLLJY7YGaq+ZNKGUDJkCuO
	um9ql1qaskOh6Dx5CxsG2pp0GkS8yP7AJo7le8mh8hX68HC9OPCuI7uGwCk5QAw=
X-Gm-Gg: ASbGncvMEj4fNdiWuXk/iloKq3nHLprBP/fwg2wwKfJrZrc/TF7idRTIF7IKkrDO4Cs
	qED2fM0ZR6j3w81QGMaZhMuAG0myPLjvTX6BFfFqSUiP2d16vxKw9BGycq4ef6GrirE2dy5TzwM
	t1Ss4N9zT4C6DDmqtYuxrdFHCxhJ6SQhaWLoA9lTygHv2tn6kcb38lEjZeTbtmiLgWhu3yft8YS
	hKp5Az0+U7X+AWrKdyq+ciRbhVqSyiUIp0f0Y2gQITWogxOU70YEWEtypVCVas1B4MboV3slWRp
	cHJ0rLPelrZveMWwcqF8Bw==
X-Google-Smtp-Source: AGHT+IG8CGrpEMFqA78kdByEQ0DjHHHYHTWphQaqH/VG7Rp9eeX5oN0WentSYeXyG9/fSH2aOKu83Q==
X-Received: by 2002:a17:907:2d2c:b0:aa6:8b38:52a3 with SMTP id a640c23a62f3a-aac33787557mr2382830166b.50.1735483842145;
        Sun, 29 Dec 2024 06:50:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v8 06/18] arm64: dts: imx8mm: add anatop clocks
Date: Sun, 29 Dec 2024 15:49:30 +0100
Message-ID: <20241229145027.3984542-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


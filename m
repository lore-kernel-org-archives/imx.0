Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BD19ADA2
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204068; cv=none; b=EPT55elYoUFKdyJsmc6y0fUctSifcNpB5F1Ax7SHJb5Q92MguKwFarkZywnIYbzdOxeYogoKvIEcbMVs4adZk/pHk7S1NUqgkIO/6xApBrT0C7yHZK+5srp/927muLardjfwWT9FYEgqWIUgYXfVb6dQzNLlKLYJ02n7JtBxBVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204068; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUt5a88bjWxdDjbFfY434Ls+T60ViR3DZQWySO2QVvo1qi+ukwGbUEMxRO5ovMe+1Hv/7cwcCcuZVaKGQrJVPC0Q/OXpFTMxq4bw7d+ZyeaaOGeL20KjYrlYKzLa7AcY49i/D0haqMFLl+XHwIpWMbnuJLrtixwhm/wjFHO3IKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OTvReoTA; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OTvReoTA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so8259144a12.1
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204064; x=1737808864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=OTvReoTAG2UVsqhiyaPICIexJ/ffaDoYc9nyxnqp/DZRZns1uebwFL6FsEuXnmwQhu
         CRja7aDQ+Q1FWLSGcfc3a+u36m5kxSkTQlZioIid2Rr8Xje35uDVQY2A3uvcLy47fzxD
         3VJPHRV5OO4vpzxiZefYX//nke0fnc2RHn2OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204064; x=1737808864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=hB0v8r7Qmd220NTSLf42x2MrFk/1j+2r4Za3pRD3MXYBZlxVLu0gbeHs0vsxXMlks3
         rIF9OBgFqYLlgQ5ynlKSaI3ghUonVqRvy0I8kNYfiKMuvaiMMJqwXk+deywEbRKOTG0P
         lptSwoP0MsFwchk6xCOKwf8j7Ic4/sNzW6lRKfj+50eKJA7pD+5c4eabAqWgmDByeSku
         uafqq2ac3LNT9b9r0dCdrHcQIYonE8fkde0EDsp7aOosy+7Iem/bqK+p0i15TLvaatvc
         m1T8gi+iNcUuzR5/+QQTDwYFfirlkX9bm977Y0i8x/92mpwQDWIu+oZYBXLeQCAVOFLU
         LsNw==
X-Forwarded-Encrypted: i=1; AJvYcCWbJFQBvNKBN8tv+m4DR7n1Dk5+oZ2r9Pq6v65hf0tNSRoLlxYYo4LjeYy2ZxStusGKpbQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUDajVWBYZWyoSAWnYTqtkf5c/rI/xjIv6u5Pxz1XgpW5y2n/x
	1V2HDAjyDAZmNT0JF3xek5LLI5h+z3Gje/Z+sJS9URJcs6Ox/Kl/gjWh9FonD30=
X-Gm-Gg: ASbGncs/h+NtK4vI+rvmS7gy1YxlLy18zqyAMmCPIeo9xyRPiK9w4o/dLUWP3d3F9Lh
	n82tekrBCnY8Vzzlr5M4RCGOFUJFgcNqFh5QFCL2M0WnKH505iBqu96G84X0SRDNSvLQNvQIdYF
	33rJhbOYodDEVtN+vzw70opoUPM8KPRQi1Vy3+cpMQDHwA7WeudiopKwshEm6tp/hcwa8+9Izm5
	Pp0fBbmxSDQa+RESzfvlCxRLiA47ifLZ1NqtLswsDELrSdWA17DmhTMqC0u8erXPxJ8P74VfzMB
	148OfWYx5eqSimIEzud5Je2+mdmdqIzIMBDngboxl2yBp1INUwz76o+y60SGPjqE8HOrOfOBTiT
	ZboIRCUTmkB5UR9UQ+Frx8dJhFv05aO8xjbjT
X-Google-Smtp-Source: AGHT+IFEvHSDZkW32vI1lJpZjzSOLwffU36PPtmj5J6Lh5G22I+ED1NwUpo77gpSUOYpqyDSVZVxSA==
X-Received: by 2002:a17:907:2d9f:b0:aa6:8764:8738 with SMTP id a640c23a62f3a-ab38cd638a0mr569237766b.23.1737204064528;
        Sat, 18 Jan 2025 04:41:04 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:04 -0800 (PST)
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
Subject: [PATCH v9 06/23] arm64: dts: imx8mm: add anatop clocks
Date: Sat, 18 Jan 2025 13:39:49 +0100
Message-ID: <20250118124044.157308-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
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


Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4085520A5F0
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260645; cv=none; b=csFrCqaaRYV8SN9c3ldrfvQgktObZ3WUag+oec1L5W3/Wnhd82WLzkGc0KfWBY7nfh5+N+FFAwnFo0yA774UTr/fWs2MDzQoRaZJ0ihasQMcVcxytnfcJH+B8URBevviZagJithGyvzqTWkeGbEeOSjUULB9/1IgHybts+b73W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260645; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KhMNKRgu1mj59Omx9RS4FBhH0Xfukd+Bdd0ljvq7GSuXG6AyphO5V+72cUKFhf4P7oKssuNI1iZpDvzBRf3UuNxLobzP5U/js8jssIFDMtdiJyiAOz3O5N5R/qeJU7HCETIcYPJpBO1JqizZRiA+ZKmrlDS4EdgciUtyct8esWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iPJUqRk9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iPJUqRk9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390f69f8083so521367f8f.0
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260641; x=1741865441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=iPJUqRk9j1sELeSuCHa0vgS9bELIUrpeJQv3ITGmXTKdLSlklwnbFyIRaNZTLu4SqE
         DoJrHiTs0I/6b2DycMD03dPqyOrtRTCTPMUH4MpNLNAyYi5PYKAOY40E9Nj5sCXcI+xw
         oSlRsPiDiLmWy6bCCtmQwUOpvyym96NcCfy9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260641; x=1741865441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=RyHVPqQwJXcDydn08iIbdtpN2Xssa2egEIa7gmtX5KAzcBNNQBEDwL5kICDPqy2mEp
         wo+jDv3m7Hr5SHs5ieNUcbKlTuR8tBk+895dd6gUozjqBqAKspZTjJ4tZoc+4NfY5EFX
         7tW9R9tviyB3r8B2R+bkk+NKm+dMDrx/IYLhP2mE9wIlRgg11Stw9+9HIKcYAE4FUllo
         uY3o2nGiTG2SOgddoBucrYSTl3KICVSNZYxpaCPywBIxvKQ9Fnst7SMx7Yv5fwyk132Q
         J3yIIEmSTnStQ2QGezd5bp+diEhpuV3LJQ8CubzjtCbv/NYWBbyReTVpotN7QTrbmsP6
         iVhg==
X-Forwarded-Encrypted: i=1; AJvYcCWaUgoCUyD3KlONUOMnHFEpg+g00crPHQy8KZ5ke96z8i+HHoVZg1sZHRcUD5cpFkTWd0Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjSyJ5ivrWH2vlvsDY5AKkdVdrwSJ/k+juxy9HAbuJYxn8YWg1
	GfOKNWzOBGcykeaK2IvlXpDWSQiiFLcYALzQrB2Vi6JUrKgjlPwLqVlb8zTOsyg=
X-Gm-Gg: ASbGnct0Tjrn0qvCw3C/S+bydYFPZgAcAsLQr7Bil8qD83Zkn75Mc+OhuLSxTijByTq
	x8SCji7rrNGeTvpCjViKRCY2Aqq9CqbchuXFYJU0JxEfkwjr74tE+8OdZaGsm1Ua/Cz29teO7hd
	YoGyYwKQ2xFQ3liAbsmQLdlrdojpLJ4Z7+rewMrsPbHoggId9VpFWivWmiA7g6RFb0NHktcl6B+
	zmpBYj9QJqB9kQr+F+4updfW2PrcS/JnuCm/MOKfStoyxPb4ieYGqcYjkyis/kUAkNwkbnyCgTs
	K1eOj/5+noR3yh11ZcP2MUMq1FTKIQ45dxUNM7l39rcA6s/N247OvI3nAKCkF+Wvc0tFJM7ob/K
	M4mZqKQ==
X-Google-Smtp-Source: AGHT+IF9wWpzzMPt0CHbMykHM/8iRPLGJDIu7l0jbjUlhGcWSWneZbVlhN0tXEjKICQJwrYTnSq4zA==
X-Received: by 2002:a5d:59a8:0:b0:391:23e6:f08c with SMTP id ffacd0b85a97d-39123e6f191mr4148028f8f.47.1741260641317;
        Thu, 06 Mar 2025 03:30:41 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:40 -0800 (PST)
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
Subject: [PATCH v10 06/18] arm64: dts: imx8mm: add anatop clocks
Date: Thu,  6 Mar 2025 12:27:55 +0100
Message-ID: <20250306112959.242131-7-dario.binacchi@amarulasolutions.com>
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


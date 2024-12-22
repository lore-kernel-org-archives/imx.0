Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7169A1A0732
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887157; cv=none; b=DUacjpeFQhTmM/Jkgk3yOzvlSX5BE92u8L1FuES/5lmEFeEVb+E6l9ZS8jqky9QRAdpJzwzQrquaj44WHCJmkOYFTqi949DXFADRXSSR3dDeLn9t0W1OhFvbqd9xr+Vyd6V4WZdqWqmjlQAzZUgaSEyZvtPE753dRD1bgP32WBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887157; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrcAXsmZDKrUafystUWqhdPewX0e8PYJNG1YBS+ny0LsPFRwQ/HUrpbdBQeohT/441ns1FIA64v3jZyIJw09HBjSLlS4VMpvp4/B96s1cwkhko9riuPqUGWzwt27Osxskydyj+2aCkjub5oE6mZ3+Ilyzk4WPQ0W5+WPrChlVbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Ot6QCQLu; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Ot6QCQLu"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa67333f7d2so544705366b.0
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887154; x=1735491954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=Ot6QCQLuq8CxRGfj1bwnSfq1yxyKxWuGkeI2LDoBK+qhh29ZCGTRqua9x9hgCe+gps
         GcUp/geXACoemN5K0+0hkWlZaBqhENobR9RrocMVYyz+anSyqprqFvqffOYT4g2/i67C
         +sM5KDT/QKZUmzKWZX6tHugQGvjce5i8tiv3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887154; x=1735491954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=ngwlcPA1uJRvEgvqHQmuwwYbBS83vuO3Vc7fX36Hecjyhe+47Nx8E5/gXwhfTFSDdK
         TGpqnnnoyUGyGiuo9ouE90ShYvQwSGJmY3jh6Xjld/Nlx5/8mgKto5wvmg9PxFGmM9X7
         tvxqMioPhMgVsyI7u0LXWUQIh2UhvdI77q3CfVMDWW5StPHRtDsVmn6bACc7RlUOVRE0
         NcMLGEDN+pqlQMIJt9senQB7ZTY3/GA9CGaEshLUIKsccyYRyA2vpnr4oc/DgsvtTOVi
         86kPhBmN7HhZtr/5V5K7UNpu7lDMoOIVv+IOjlGgJnXjYrYmACICzvsjs5Lcfjdfy8s+
         UNmw==
X-Forwarded-Encrypted: i=1; AJvYcCUJb0zLtpvPWEDnqplfE2KlvYlgtketESBEEuYV0gXAsZTmXHyTRCVm2KO+l1uwRXyn0Rk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHD2/eRLLVuaD3ZqK2JvPUbu2MLWtBeHYCOXXS9y3t7syZw18a
	xz+OKhhXeM9K5En4Fg+Jq14xha+vWjx4Z30Nh/mNBdp6poxVpB7t/oRMwvRbbCE=
X-Gm-Gg: ASbGncsf3Zu+vateKII1pAedBFSX5j4dkxpr/PtZs4X+I0msU6xeEURVAiDP75vog3W
	cHvRSHAvaM3Ul4psaQiDio5i9e7BisWCJIxQ21Y38Q7uOgotGwc6YCEFMJ7iWQCxqEa5eM88s8+
	wPVCDlha/FiFilk2e4mIs2OGv35Rq8rXZzUIuUO4mCnjXqK9663QpjNkSH6R2P6tht1tC2xaZ2P
	9G37/LC7fXa8lJ/S7E+aHs2jKH6OPiC4UbvOlwXAHruUCM2gyklknR7qJZN0YmafzOu3zQKegg5
	dmmiWR0G72mh9oPutK/n+YZ/3t7XLNraN3tquUY6vGxCwg==
X-Google-Smtp-Source: AGHT+IGmc/BFMwzoPcErEXEsdL9IB2KUs9/DBYyOmaS8SczXlODqnRL3cXLq/GR+YIHofpcPL2PYcA==
X-Received: by 2002:a17:906:478f:b0:aa6:6c46:7ca1 with SMTP id a640c23a62f3a-aac27038e93mr909112666b.10.1734887153951;
        Sun, 22 Dec 2024 09:05:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:53 -0800 (PST)
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
Subject: [PATCH v6 09/18] arm64: dts: imx8mq: add anatop clocks
Date: Sun, 22 Dec 2024 18:04:24 +0100
Message-ID: <20241222170534.3621453-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


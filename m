Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8652066E3
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397596; cv=none; b=Y5IMg72z3saGPQgPHsTeprNXdapKqQbDavmcr/TKnyOq9gW5n12MgxYcL18zMTiTN9sI5iukXcZxORwjqu4OKwLhnRtNaQwZLFcmhZHATwkm3c+f16q7rpESrNG5vzkndMmevSgJx87vPV+853j+U3/4cqzTbSHGIaXcPvioqJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397596; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QivakS+zOkEihYpErS6rP74K8fMl10Nq6AK42xAsHGfhbOabmUd2qqPIGfrKu+VnIQ7jFH4Doj34fKkpct+qvPnVR8ToHV4mfuNlWcDk/W09qBXL6IOucgEiBz1PegLjx3mqsu8WB/xGWbOVlGddtATcXCpLko4pP/yi2OyZNRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rWQj6WAe; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rWQj6WAe"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so1138746a12.3
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397593; x=1734002393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=rWQj6WAeqURC/9F5C8PsO3kL/lPJTNvfh/s++0Q5J7fxaWjUU+zGzKMnS7dOQO3EmZ
         oupeaXFkv7wWLNIfmD7x4Q77zd8qWIoWkai+MSrGqA6oFJZsRas71HQ5eAudVDGt/09A
         sLULxBAyvzNsLXBj7YMw2kAhlOSu6tVaV+Jic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397593; x=1734002393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=IjHzZFFIPxSkQOc7hjOTeiaeLU0n1xaZEm3HFzVtsVUMxM0BWJr6Wvjnw+PLMdJOle
         bzUzyrcYCFIAGq3txOWDYxzgx9fy4BxTFyr6bT18kJzuSp+IP/9ldFgXfHFdHFO0+rrI
         ETKajHT4jkJihHrfzBa2SyvNoMfg2C2C1+KQvTRDOIO0mf8pUvGmKPmPoe4mlysSqEzH
         wZcyhQf5k8Xw2rwJqflQuBQaPygy3NbT1ZRuiNh3cTTF17wf3aJiNqHNayvqmlq0ZlmN
         aOWX+zRnhsm7p7kJOLBxXIw9jei2djBmZ/Uxs7yRgqUxZJ+XG/QbCRGUMG0EiIw7b3LY
         TmsA==
X-Forwarded-Encrypted: i=1; AJvYcCVWp+Kjg9OQQL3nLBLnUBNIaqXgRhcwSTGXHtEzk6tUjCCbx6iUJJ9c41WG2r3U0+anmlU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzynSrBuud6WXGyWWE5EzPqP/fP6i95IbofQDAVQzSQQyEww7b5
	PyeehFCDlzAYyoMJyYcgEXFvzsgaaHt32qXsh67qTNme0FsETXbBkmnfHbZ+5MY=
X-Gm-Gg: ASbGncv46mAL6zorpSMJ0Ekkh7ipcvJ/JOksklEn5Komwpu4Fo7Tx167Cb/eRPI3kKs
	iwI9IbQEleRCKjTHwLvjgjHCgo4MRCpZDrSUWhZCggYlUmf1afoGWs8PFEB9FafhKbwNIA/9gyH
	lR1/wS8ApgDBbRftiWJ+E5T81iatT3LljsQq9B8DNVFpKO0FE28t6Wz1hRfsAXTLlNd2/PPCc2+
	u33J1nLA/61lp9dp4ge9GX8JCBDA3zlFoaPx7Hyj3GSpnIM2rbnhnJ7rR4AE7z2CaLoBDsxG7df
	uE/QgEmOb1HvKY6tMUxFI9e4Kef5hiyN+DKIyadGDPN2IA==
X-Google-Smtp-Source: AGHT+IFlIqOIxRQlaaVKv62iWGPtDqL1DgvwbVPP6DdzsmH7KN4sRitNwb9/Z7vHbZdE5W91O5vUFQ==
X-Received: by 2002:a17:906:9c1:b0:aa6:302b:21e4 with SMTP id a640c23a62f3a-aa6302b2e97mr32793966b.16.1733397593185;
        Thu, 05 Dec 2024 03:19:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:52 -0800 (PST)
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
Subject: [PATCH v5 07/20] arm64: dts: imx8mn: add anatop clocks
Date: Thu,  5 Dec 2024 12:17:42 +0100
Message-ID: <20241205111939.1796244-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


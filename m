Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973183C3BE6
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091216; cv=none; b=klXyXDTKn1RTgAXSulZFh0Gjs4I88nYqbfOXhHO3Nr3JoaICljwzkbIKi9sR18AkJt5VTsAZi/UU2qJL4302FYUz94Leiqmz3dbIqYmdd6WDlxzJe7b6YNHDTLLLDGMbXucNDb9vg1FeVoH96b0LQlMI11R3tcJw5AzT3zhV8Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091216; c=relaxed/simple;
	bh=4Hl13iZh1j82GcdaqZI3qwLrftrHP4P1CgqtbfTerR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qsmjpqo54JxJy/d+WE5HbuZVlt8Wts/EooCzMjeK9vxS7LYzy02UXnh/MRZuO16N0GqZVKkBFDIwPrRIHHMorkapumubB0M8LHUZcw1HkMAHcDKmB7fMq1fcQKxrucDmhQJnDdPkcmG7u+YpTWyjCmdpPh0hrrBVcr/zMFQfNqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEs+5/Mw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEs+5/Mw"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47362928f65so660389f8f.2
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783091213; x=1783696013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YKAhBBa9PGx36rHtTdnpndz/n8JA20wp16kInv0jHQ=;
        b=tEs+5/Mwv80utXOIFQ3xMmbDooR5P4TMRpxr9BfP4EJK8858PPT6baJ0kCeVTDhHhK
         azzCFlHn7JeJKASDdMcWzJm2j3Zb2bnxgP36qRLMcfXGqSWzCkuStR9LEnsi8QydW8hv
         jL/rA2W4WwlMH3uR4joUyv1a3PbNOUup2tDPtg3WH1agL+poBCLHO5JpCIUYndLHl/Y6
         MyRuxqj/oJTFuJJihEU2S/mFOAYe/TiEUEKhpyHK2YJRFbSntzCDekJFAMxk75MxlEOO
         W+avPtEDEU+iQ4F6Z2PF0YzRhEBVu5Rw7UvM+vPDymXDPgy+J2RzW6qIvUXvIYfUjLLC
         Gi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091213; x=1783696013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YKAhBBa9PGx36rHtTdnpndz/n8JA20wp16kInv0jHQ=;
        b=a6ZpG26nIgpfZi6Fomw0fIi46GrpnBsgO2IrbX7QiUvG+uy9dt1/KYWO+cKBXg66ao
         gAi4DjLjbfI1QRheNDGizqx1InAmIitWABEe8D25ZmcKLXleLpYswG+SD39GmKgCVzuy
         qkDs/VdGl4vi/fspJztDfeq7iAJginRGjAI/QdhbmrrQmKkHeBcs7sCoF1FSILKO2IWw
         b0hT/ASsC7nTTCB91RY1+iK0WZn+fpFArqNlT5D6UbVxlmsNbY2u6dmQmu4fO89wGB8U
         mGPeBhkM6lAxHT/6Puxupn9tqDkGiKjPOcM7M2tUpjhKbBn4iaz52grD6JIIBO61pBwa
         Jb0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrHix7S5pKXowCXWpOp6TxTdJ0cpy9YrMORiceRYx1PMKGyEHig/Vdjp4SD2puSa2KruoU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEmvH0hdtM+g5thqguI2fOb2AN/oRQ25LE5oIN/j6H1+Nwir+x
	PopoRuRP4BifhuHLiOJ6QXwoCFo//LBikE8OagR6e9uGRPJ7MlhjgCKD
X-Gm-Gg: AfdE7cmlPrCqaVnnCPCFdgKN0XmotzaXKBTfWzlRch3LZhq4m/VW/BRD58M7ffJtPjv
	8nkUek4uS3c8faEPT6vRJV2xudKlK080QKTXSEXXpu4+2zMnWgx8MOppmrvUo+f7SlxYxB+889q
	z6AoWgm1CWuMDakkos1vaRUI2JSxNQNrgwdiONCg/ipO6MZKe+QWgVlgjEj1P58gT6Rb3zB0QSJ
	6wzvhgCZZijeCVmodPp+XNPy0CVN+fODmLzogg2mZu1xKaAY9RGAWDqPJjEvAH4TrRsHBAIfFWd
	2riLKReYDAzqzdeYpRXUwQoY/im6KwNF0DTSRS4391X/Fp6WDlhS5BdShy87kQhzE1/gTs6194O
	41UDQv4E/drFfqs4ElSO+VKjof1ZxcVB15gAhXY8o8jxBoKPw8WovErvwa0I5NqFyFpUo+Y6AzX
	Sd/xprCvW8U+jgzCMdaCjcruD3gujx5HZbFaBu3NATsz4Kkr1/rp/wiOK2YV1Fb/KRXu72AmjKP
	8/z6EWyw18w/bWBzaJAbFbK8Sc=
X-Received: by 2002:a5d:540f:0:b0:475:f0d1:eb70 with SMTP id ffacd0b85a97d-4775d519803mr11861130f8f.61.1783091213061;
        Fri, 03 Jul 2026 08:06:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm9487f8f.2.2026.07.03.08.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:06:52 -0700 (PDT)
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
Subject: [PATCH v2 1/1] arm64: dts: freescale: imx95-var-dart: enable NETC block control
Date: Fri,  3 Jul 2026 17:06:49 +0200
Message-ID: <20260703150649.234680-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the NETC and NETCMIX block control nodes on the DART-MX95 SoM.

These block control nodes are required to enable and use the NETC
Ethernet ports.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Also enable the NETCMIX block control node

 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index d43270a1d907..b4c55bd33858 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -178,6 +178,10 @@ &mu7 {
 	status = "okay";
 };
 
+&netc_blk_ctrl {
+	status = "okay";
+};
+
 &netc_emdio {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
@@ -215,6 +219,10 @@ &netc_timer {
 	status = "okay";
 };
 
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
-- 
2.47.3


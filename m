Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12609206F06
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397597; cv=none; b=Na+farohUVmmt/RW1KUWI3qMY7zztt9F/Q8HUDDFgYHjc8b8itPKl3V1dTh31GGPgoWtZeW668ApzDsXo9dVpFwopTeazzqS2l+dtoBk/VfmlLwE0x8eq/l7E4rqbK4jGfA3JKrwQ/DfUmFPsJuv8u2IQ2/eQL5fZU5WBA7gmh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397597; c=relaxed/simple;
	bh=EfuJYR878rJ4Cw+YuO97nDjgeWj+F6WJVMj2hzhOd0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EORiF5lyaG/klA+MEs5i1Q9P9uvyIPHfYATTu3CGA+z/xT3wmORQ2LxXyIPVSRmLJM041HCaCYmhyCjY6HoxRghR6wc/kdzyQHxywmsqFuJgPIXk0hb9kZ7cYdN4Tx5GcmG5Kj0zI5aKajMIRS1HCIc4fvUnIihgG69wHCWGLWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BYGCrV6/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BYGCrV6/"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa62f1d2b21so27880766b.1
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397594; x=1734002394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=BYGCrV6/aoOkFd/ksVLB/dVL7Z8DfENHHBCL6yzLcwGBdcHIqpKRVoFBF5V/XBt9Dj
         cTNzERuPyHlGqGq6Kf/XcDbPFVaiS5AEpONfgRpuAE9DcLuvIuz97aPQGTs0HBYoUVDn
         d/XrRLwnVYHAWuQ7LApznp2Bvs9TM0J80i4FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397594; x=1734002394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=Cm9US3KI+3WBRWqdGxVXCpLsz9/G+qkMBJjgNpkMSwIn+9nBbvPb3LvaxLemGhkfPs
         Fob5GotbN1KLP/YzH97p+sdQ+lHuRddAtvz85FpMsUTA/DU0StQbr0UIG/VrpqWJ/JKB
         buwMxAKFMy8Cn7+jar+yTwzi9F53lxniYQa+zTjmTthF2pLC0mtbOCrNXQs3DEB8Fs/N
         qlxB7wS1gO6xCzTjt8PbO1o5Y0KG4xw/2rnEQeOMLg+JvtbHUq06EZULhHoP2eiAcbXF
         C/YPGAzG3aIimui7gu5Mlepp+LTeB593r31KoiH1Iqn6FA0Y4gAwa+xtnjoZ9Cu7Dld8
         eNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiuxLFj3tCOtZxDlB87ba4Ze5yLTJHGgOGu+zZSOqce8EtYn+OxqdMuMlZk9rudk5bZOQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNyhzpRTr+mE+ude5RwT2upvncAKFxFPNxZmg3e1ablHANsNP6
	aARWE/QH6bZhjTASDGlapGeA0vaw5LqPOMLPqQ3D8M1vIvHp9+13E5bk/aTk8MwEQanoSUNitqj
	O
X-Gm-Gg: ASbGncs+PnWAZz7/Txs8d7a8GoIpKiHvWvdFNO4BRWqEKa45vMpdIAz6hqo3yjCx84+
	GMiDKHoHtk75mkONt9LNTX0JRCwBQgCsn5HMiNcfYF/+Zi0icEMeyMKzTJQw5GPWbrSD9Au0/P7
	Pug3jHHpmwP5MKjTwA5XkWAq5zjMBi5PILCQ3tDKYf81iMEgo4lhq3zjVEgRE4bupH5a+wSu9hj
	EdfCIV8Fd+9eZWzHT9619kv8zapwL/3HRy0oNAqTzQVgBmCyfsFo4B73gxPNX2ykbJ6fMcfblvU
	enLwjQEzYXTAILDQnodw+8ilMXwoCWuxxCofmuVxgs+W9w==
X-Google-Smtp-Source: AGHT+IHjGH80PYnwy6f3N1dyTyMHBVS5+YcXkhAFmpCzIZW/6EjpsfvTuvDL5MsErchIS1MKSD73VQ==
X-Received: by 2002:a17:906:3097:b0:aa6:1c4b:9c5b with SMTP id a640c23a62f3a-aa61c4ba102mr240616066b.7.1733397594442;
        Thu, 05 Dec 2024 03:19:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:54 -0800 (PST)
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
Subject: [PATCH v5 08/20] arm64: dts: imx8mp: add anatop clocks
Date: Thu,  5 Dec 2024 12:17:43 +0100
Message-ID: <20241205111939.1796244-9-dario.binacchi@amarulasolutions.com>
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


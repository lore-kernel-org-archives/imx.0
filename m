Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CA1898FB
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887155; cv=none; b=C7TuawFB0H7jTiyuzFS/xPN/5MFBj/uMtUKQ4wNzBKxeLpx+AvUYnONUxHusxIXBERJ6QxHo/gwFnqvUpkKpulgzUevZpiAL/4ShkTT4/gnJiB8ZZyhZiCL6C/MZuhj/wd4DXgk7/Tw6T+L707l3AWHltTa32GXCCczh2tITsuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887155; c=relaxed/simple;
	bh=EfuJYR878rJ4Cw+YuO97nDjgeWj+F6WJVMj2hzhOd0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=go5pXRcsuNWfRUzspD5TJzEMVIsvllM7J9N5uWSctGGHdueiaKCEzSGYhC4rZGYrwan7s3EmNengGJUK5GEPwCBPZ9hRSOVPpoWnpJ9j/Bde3AcNP88BRDV+Lhu6xSiiDlI2ArqzLHeUrAGeXeslYuPkp+SWOk1ZFZT6rEY50lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=E29Mcq0B; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="E29Mcq0B"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa66ead88b3so654758266b.0
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887152; x=1735491952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=E29Mcq0BL621seKSe1bOls00Gxuqn/M+BkZAsyQuYx0ekx4apsE6/BlnDN9fkJndnG
         UiMu4c+7exUC5RaE1SNwlvvFf8GaHoLlh568SMgSuO8SfG0uIm8CYuk9Bhr++POlRNX+
         8tR0UraPpzp24TOWsB93cZNptm/3+Iu9WmzsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887152; x=1735491952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=H5FcHdG2dRD6+yu3sbWLaIsazUY1GB4zaalmPuQDaOhyXPX6onPOO3JbWsaPGD2/Qj
         nFoj3f6RjPSUumjvQHEn4StAdHxujTkYzcnxqepAgEcCQWBqq0MXMicW4JrSNveehxcb
         NA9DQ1zKR2nec9GmDskD7GmsNMXiWvHKofqvMPXSxhCfo8pHmdl9k/xgXIwUuJciEGeo
         AFdmOwKoAhpivVSIfN7r0aW5lCHfZ+3KXcJS8aLRHvyIV2yDT4JOI11QyN+SFXj4bAfV
         3JCEUPBGCK8owpOX26/32FJPqETDbYHmgcC9l7EGjy5ba6SNxOpC10iLBUtuzzbJ9Gnx
         R8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxAggZORk+DmA0RMUMEv5wzQ1nsfd1fIZE3WcI5pzbAgSBysWS48GVnw14QIUY+/M/Eiw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3sAVCQkkDxXLeXFpMZEeLDwivmhWPlVLgrSrZHLIE9bXzl1Xf
	Y7UJRaNgnDJLTepSdBeqb8yBg/KkG0hbwIIvIHrWnWX4wv3+FF0TSMbD3n2dPBI=
X-Gm-Gg: ASbGncvewHQqlyQSuhoFKt5hq25uGkDEIq8tktWJjIi4BfulJYfLwdYWVkRe4j4+1Z9
	+ja0gD/kOJsaT0Ra2xGFBl9ChFCjA/7eMF7jKp+VaPCtcXSKrQStLLRgRvAciCtrIIJrjQ8omzZ
	MbuNORBRYkvHONN45/Z0DVIlp2Pg2vHcyfIbEz9UFNvPZMiMdLGiSyze9WZLxFhV0rLHYbqbKrQ
	BO5r3xNBcP7e22pwNyhLfyCQt7eYAGwYEZDNgY69sVd70E3/4mxaAe6/0rJqEOhb7LaxL/F8q1d
	bf5rMRtBXW7B+3aMdlsY1SSS5BsfN7NEwkHvUyarP0OKGQ==
X-Google-Smtp-Source: AGHT+IHe6GuNdSRh18PC5HeAp0opqofzD4zpseD3AeO4DfZzjVRdMz+HjPJqAg5sE4NR302TdU0qlA==
X-Received: by 2002:a17:907:2d1e:b0:aa6:aedb:6030 with SMTP id a640c23a62f3a-aac33666079mr825550966b.52.1734887152318;
        Sun, 22 Dec 2024 09:05:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:52 -0800 (PST)
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
Subject: [PATCH v6 08/18] arm64: dts: imx8mp: add anatop clocks
Date: Sun, 22 Dec 2024 18:04:23 +0100
Message-ID: <20241222170534.3621453-9-dario.binacchi@amarulasolutions.com>
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


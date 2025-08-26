Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39AA36CC6B
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756226303; cv=none; b=L5g3GrXNE8y/Wd8SmbA/VNAqu1nyyUvYVGvXiOC/Y3r+4RQ5ivlv2iv1gTWsjsoMjCP22IBtTE4pQe+EoxYuKObZ+oMA8SqRSzjQ6EjyWjJwFHYGC6vS4SBBsXhsyCPMQJrne13EHusQkqD1xJZKKZ43fk0rA/wVYcvHaXZ+A2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756226303; c=relaxed/simple;
	bh=809NI1CN0NNuV9uuoAaLx43aJ5mdVRKJJ2h/czEopkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlD9Nmv5cehdH2WatzQbap+gPDIMJpbLUVlOkm1b+JL2mKjHnB2n974DqsEmW9Lmkh6ypfmV1kOQ6MVWJoyUGj2Tdx3v2Gb89taTfNRxcPNdxU4DWKJRktvq97xpSjIUpN0tOWVrBq7eVLGa0qrPHdd9LWuFskFwbu/KGcD06Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w97wHO7i; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w97wHO7i"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b6b5ccad6so595245e9.2
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756226299; x=1756831099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gd5/9IeQ4uKOEKZif/xbCKEyzAUuhNyeB7aYV5jW8jw=;
        b=w97wHO7i0rdy2yXv1xwSd7yHAG64/13wp4LdpXMS35K/Of1vR76S2xT9cgEgWyRMxL
         cxh2ULFwq+l7XeSk7av9s8LIf+9U8DRZ3ZEG88LS+q55Hn9ZDbDUf66B0NNMUmqk6nc2
         Nn1+3ddxlQHTHNFkHJb1EXVVuLqfoUp+8feNltFntFAsiAcpcTxTWOsjd6uP42f1GsA9
         5lDZOiavGPLzo1WZEoBLKdPUGm9kUcz4I+7hl7f8ZTBmPs0i174LQvR6/aXxzmuENzhF
         Lf8j8r1yoG0xArf+AkUfftqR94azQ9NcHxewdIRc/Zmkq6MOCycXbmf6XadTGCFBxmmz
         Dg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756226299; x=1756831099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gd5/9IeQ4uKOEKZif/xbCKEyzAUuhNyeB7aYV5jW8jw=;
        b=Es5CPbecAh2axoGxQ67x2hsgtCmnUaGOzfNc5FLYMvj4AWn4Q8ZWqSLEJ4VFng/xNf
         yfdMGSOSeX7wnpfaywCpsxb6Yg6zijBmGXts2mwvJLFhiTQ4KKNfC3iqCkLLSEI1snFK
         4IqN4ph7j5R/YNjxfjc5WVUrNnyXtu02ICsVfV4lcTWXCeiNtssx10Lp8yhhP4dMKfJc
         Q0aHtZUzi9MiwYRM8SKsRbeW369hF4f3Hi6AfwIAYHP7K2Zg7wxIeL/XPh+ctAZ8wbUT
         CG2YaSZf8dsDEIEVDMRz4MZnmo07xbY+n01/tszSzx7iq5AFZRrr0/NonGGJ90wgNNlB
         TYwA==
X-Forwarded-Encrypted: i=1; AJvYcCX4MG4MoZFwfeSoxRpZZydUhZIZX2ha+VN6NLvK/hnRX82ZfULoFcgDJdgsf8wHTEGsjiQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdjX3PpIQOFslb+HSU1KvfwD1Wd5ubaDdrbfWCiUOPsTN3QmRD
	tUgzPdBApCYOJgLtjYp3UHa5HyutMRot+MtfatPQLI3yORy+rIL5imo7i38CrkHdpPY=
X-Gm-Gg: ASbGnctvqs/nSutdeo0O8CMpiGlDdJEgRVtlBPn5pg/v6CauM14rsfIWiNwPKSk/5HW
	P0uAI2/h9qHP5N7dPxWpyJ2TXoyx1sgb4s2p/ylgzLYcqGBcrAMweYTDhf9yh8pDNamfmDi18gw
	OH4YPrG7dZRpIiQuUCZ9MOLoK/04uP+a6izHHBDqsAhUxDyI5k26sMa529oEoLbjRPW7ym/UA3n
	Xs4RwiJuneDDxnZfSH8BIoHXUrkMAnuvCam3ILfNiPpj4pV9wwbZE8R2NNRkGizOIFtfneoI2D5
	BFuRoqWKqqDpcoAJqvPj72s24E/flinANZ5bXRRqKCw43llaOpq5n3YM1EN6T0XRhiMIK7MEb7J
	Wk9rxeIP+vZ43ml0Krr/r0I+WlwU=
X-Google-Smtp-Source: AGHT+IEfMOhKNGsk41+Pcjyd5bE18lIO9+Ehqp0eXFZ34jr9cFr/SUU8ndr/Fb7qeTETY3P4lllXjQ==
X-Received: by 2002:a05:600c:1c13:b0:459:d709:e5d4 with SMTP id 5b1f17b1804b1-45b6baf1aadmr1321925e9.0.1756226298932;
        Tue, 26 Aug 2025 09:38:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6c53e210sm34705e9.20.2025.08.26.09.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 09:38:18 -0700 (PDT)
Date: Tue, 26 Aug 2025 19:38:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: [PATCH V2 3/3] arm64: dts: s32g: Add device tree information for the
 OCOTP driver
Message-ID: <ebb194fc26ee6aa7816f07ea891469ecb780d106.1756219848.git.dan.carpenter@linaro.org>
References: <cover.1756219848.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756219848.git.dan.carpenter@linaro.org>

Add the device tree information for the S32G On Chip One-Time
Programmable Controller (OCOTP) chip.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: change "ocotp: ocotp@400a4000 {" to "ocotp: nvmem@400a4000 {"

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 6a7cc7b33754..e8cfddabfc24 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -701,5 +701,12 @@ gic: interrupt-controller@50800000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 61ee08f0cfdc..8fe1fa35e9ac 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -765,6 +765,13 @@ gic: interrupt-controller@50800000 {
 			      <0x50420000 0x2000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.47.2


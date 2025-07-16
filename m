Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE99C2EE966
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 22:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752705996; cv=none; b=kR4HGqw1DGokaDiVJ1NosqspVMbM22ttx0lqSJ2bxzph6ix8dUql6apH5JlfDbC1pWk458OKzls1Lj4tR898eHfv6rm1wjpJ3Gx0nPhmAJS/eejTJqW0qGq1w3iDrgycYjV0RkojfW/1I9aQ7tDoswRd4q/ROo1E/Y3r/u4ORBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752705996; c=relaxed/simple;
	bh=/e5+cFEH9w4+GZ0QyMKM7a9cjJ6N+Un3FjPHBIJln9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSV52TME4O+M4D3jWknA4xY7oBzyqLCT1jAsU7cckSP+mJxflrHCrG/K1v6qxrTWvQR5L1/cPq8lkiVWQv7Fji+3cgDjVjodF8TcwEuLvyESaP9NQFMaEQugBKPiDJQGiKxMuhB34Um6FxuT1micsCxHFXtSo/Y+lolXCLCk7pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCE7Y7ac; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCE7Y7ac"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2ebb72384dbso179489fac.1
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 15:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705994; x=1753310794; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+9WkLvKxCVNjpjJMT0iDzPKr8AA3uiZWqAZX0UYmVw=;
        b=zCE7Y7ac+xgkjao15U6zvcFI/s7LRqcHxtGtkoSa67XY1+vxR2+ESroWbP+lYy7CYT
         /tPLAW/jLcRjFKYvLbGrft1nscfjLk6GIzyvhRt7Mt3+nPxvXBn8VsLXT4rnLR7Mqb+7
         kadeHiHS7RfgKdXx5CuBCjkHSa9ELWof/9t9mNte4hBojoGOq6DDcnc3peggw1JuvwNv
         jfLtm387oCsZUFcX+kDmfTktjpYk5vivweE1PbZ+nCB28pQ7bVP3OTC8vhCkjXa7gxZK
         ohe6AdenVnu9vC5W4s6IF1e8uZSkQcV53KFKpWWGhZKhDcvdqYWhd87N1Yp6X3/Nk7Rh
         cEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705994; x=1753310794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+9WkLvKxCVNjpjJMT0iDzPKr8AA3uiZWqAZX0UYmVw=;
        b=tsrzi2MBPkT5mzcLGRP/fXwoLJNcfK4mZHSPms+xT3TIT02xsJDAtHu25xw18yf2/x
         sDxjd1TcSlMdIWhNEpcwu0/lrmzoc2gwAWzXWTBxY0vGx2RoGuJBpYPj/zLpfFrBprhw
         o79vtgawwW6uQhX91CYL02etN7nuDmGD5EU0o8mIa2poQR3C4OhjUDSuEd9NxMjvvURA
         lPXvEifbunQkcjscIz0amDOWPT4ZqqDrfKWhWgD2Zpci13RLr4FD9p6BrFVVmuJXG9AO
         925/pu4qLsRlKuCAQ3a/9nSnmKk0bBTXw//xFDbsZLoW8GZp2oyBSQyOrIGf1f7SxbJ+
         Tisg==
X-Forwarded-Encrypted: i=1; AJvYcCUsrBaIoZpabDdW+2bekcVZsV+EbAmHUL/FG5n1t31u6r0CKBzSzNfSSu+B2krDnIDPHiU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwH8/CjM1jKIo74u1hwQyovbkXjVIlmOhOrfJJDj7VXBv2bw8qF
	Ewz0S9cQ8AJg2lWfEuHvRQ7LUVuJSmGxHB3rE6OwXaUvZxZHmQUFgLwskgaKGOSS6nk=
X-Gm-Gg: ASbGnctxBv75m++0nn6cH1Z65RgcIOvtXoIixZm03hvl77ETX3FINY324V9dFEF/Ck/
	BEJB55V6g+iEfUtd4J2aNQ+8bolLw64tzHRtCEaKm82DaI9TZOEmXGdDocdOyVtj1HFjSM8zQkM
	FuOrvXujkdGasbx0aBA8k55h7qxQZwvx5Vznf8TZKaN/zSg41/bIShQ1v2QtXwS95PS1vLzraZ2
	uVCTrc3NEDXI75K5vrRlLE57dHmK7H01mSTL7NU/FxphY+czvQgl4Y/owKnCzOrfNzaUMZArd6x
	+0KCxbkA4bs/IGgeQp33AmZIIViqyYsTD606eDHsoYXG6pI1W5SxJiVVNJNtat4i9gWVubDxr/z
	D3ScalqIsopsqm/kEPz45DIol4CNcrA==
X-Google-Smtp-Source: AGHT+IF0LmgLP0/FrplToo3zBIOwwv/f/5ChaEptepbpq2yLyxK0fU0sEf+7Lt3bCWvy4wpyOrIgrQ==
X-Received: by 2002:a05:6871:60c9:b0:2ef:e245:c65a with SMTP id 586e51a60fabf-2ffaf6002b4mr4420295fac.38.1752705993846;
        Wed, 16 Jul 2025 15:46:33 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff9ff853b8sm1651683fac.23.2025.07.16.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:33 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:31 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: s32g3: Fix whitespace issue in device tree
Message-ID: <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752703107.git.dan.carpenter@linaro.org>

Checkpatch points out that this should use spaces instead of tabs.
"ERROR: code indent should use tabs where possible".

Reported-by: Xu Yang <xu.yang_2@nxp.com>
Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 68c11ebd405f..e80144e33efb 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -489,22 +489,22 @@ usbmisc: usbmisc@44064200 {
 			reg = <0x44064200 0x200>;
 		};
 
-                usbotg: usb@44064000 {
-                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
-                        reg = <0x44064000 0x200>;
-                        interrupt-parent = <&gic>;
-                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
-                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
-                        clocks = <&clks 94>, <&clks 95>;
-                        fsl,usbmisc = <&usbmisc 0>;
-                        ahb-burst-config = <0x3>;
-                        tx-burst-size-dword = <0x10>;
-                        rx-burst-size-dword = <0x10>;
-                        phy_type = "ulpi";
-                        dr_mode = "host";
-                        maximum-speed = "high-speed";
-                        status = "disabled";
-                };
+		usbotg: usb@44064000 {
+			compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
+			reg = <0x44064000 0x200>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+			clocks = <&clks 94>, <&clks 95>;
+			fsl,usbmisc = <&usbmisc 0>;
+			ahb-burst-config = <0x3>;
+			tx-burst-size-dword = <0x10>;
+			rx-burst-size-dword = <0x10>;
+			phy_type = "ulpi";
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
 
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g3-i2c",
-- 
2.47.2

